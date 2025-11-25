CREATE OR ALTER TRIGGER dbo.trg_Authors_Audit
ON dbo.Authors
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableID INT;
    DECLARE @UserID INT;

    SELECT @TableID = ID 
    FROM dbo.DBSchema
    WHERE TableName = 'Authors';

    SELECT @UserID = 1;

    IF EXISTS(SELECT 1 FROM inserted WHERE ID NOT IN (SELECT ID FROM deleted))
    BEGIN
        INSERT INTO dbo.UserActions (TableID, RecordID, ChangedData, ChangeAction, UserID, FlagDeleted, ChagngeDate)
        SELECT
            @TableID,
            i.ID,
            NULL,
            'Author created',
            @UserID,
            0,
            GETDATE()
        FROM inserted i;
    END
    IF EXISTS(SELECT 1 FROM inserted i INNER JOIN deleted d ON i.ID = d.ID)
    BEGIN
        INSERT INTO dbo.UserActions (TableID, RecordID, ChangedData, ChangeAction, UserID, FlagDeleted, ChagngeDate)
        SELECT
            @TableID,
            i.ID,
            NULL,
            'Author deleted',
            @UserID,
            0,
            GETDATE()
        FROM inserted i
        JOIN deleted d ON i.ID = d.ID
        WHERE d.FlagDeleted = 0 AND i.FlagDeleted = 1;


        DECLARE @Changes NVARCHAR(MAX);

        SELECT @Changes = STRING_AGG(ChangeLine, '; ')
        FROM
        (
            SELECT 
                CASE 
                    WHEN d.FirstName <> i.FirstName THEN 
                        'FirstName: ' + ISNULL(d.FirstName,'NULL') + ' -> ' + ISNULL(i.FirstName,'NULL') + CHAR(13) + CHAR(10)
                END AS ChangeLine
            FROM inserted i
            JOIN deleted d ON i.ID = d.ID
            WHERE NOT (d.FlagDeleted = 0 AND i.FlagDeleted = 1)

            UNION ALL
            SELECT 
                CASE 
                    WHEN d.MiddleName <> i.MiddleName THEN 
                        'MiddleName: ' + ISNULL(d.MiddleName,'NULL') + ' -> ' + ISNULL(i.MiddleName,'NULL')+ CHAR(13) + CHAR(10)
                END
            FROM inserted i
            JOIN deleted d ON i.ID = d.ID
            WHERE NOT (d.FlagDeleted = 0 AND i.FlagDeleted = 1)

            UNION ALL
            SELECT 
                CASE 
                    WHEN d.LastName <> i.LastName THEN 
                        'LastName: ' + ISNULL(d.LastName,'NULL') + ' -> ' + ISNULL(i.LastName,'NULL')+ CHAR(13) + CHAR(10)
                END
            FROM inserted i
            JOIN deleted d ON i.ID = d.ID
            WHERE NOT (d.FlagDeleted = 0 AND i.FlagDeleted = 1)

            UNION ALL
            SELECT 
                CASE 
                    WHEN d.Biography <> i.Biography THEN 
                        'Biography changed' + CHAR(13) + CHAR(10)
                END
            FROM inserted i
            JOIN deleted d ON i.ID = d.ID
            WHERE NOT (d.FlagDeleted = 0 AND i.FlagDeleted = 1)

            UNION ALL
            SELECT 
                CASE 
                    WHEN d.FlagDeleted <> i.FlagDeleted THEN 
                        'FlagDeleted: ' + CAST(d.FlagDeleted AS NVARCHAR) + ' -> ' + CAST(i.FlagDeleted AS NVARCHAR)+ CHAR(13) + CHAR(10)
                END
            FROM inserted i
            JOIN deleted d ON i.ID = d.ID
            WHERE NOT (d.FlagDeleted = 0 AND i.FlagDeleted = 1)
        ) AS Changes
        WHERE ChangeLine IS NOT NULL;
        IF @Changes IS NOT NULL AND @Changes <> ''
        BEGIN
            INSERT INTO dbo.UserActions (TableID, RecordID, ChangedData, ChangeAction, UserID, FlagDeleted, ChagngeDate)
            SELECT
                @TableID,
                i.ID,
                @Changes,
                'Author updated',
                @UserID,
                0,
                GETDATE()
            FROM inserted i
            JOIN deleted d ON i.ID = d.ID
            WHERE NOT (d.FlagDeleted = 0 AND i.FlagDeleted = 1);
        END
    END
END
GO
