CREATE OR ALTER PROCEDURE dbo.usp_GetVideosByAuthor
    @AuthorName NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        v.ID,
        v.VideoUUID,
        v.Title,
        v.Size,
        v.Description,
        v.YearOfPublishing,
        v.FormatID,
        v.FlagDeleted
    FROM dbo.Videos v
    INNER JOIN dbo.VideoAuthors va ON v.ID = va.VideoID
    INNER JOIN dbo.Authors a ON va.AuthorID = a.ID
    WHERE 
        (ISNULL(a.FirstName, '') + ' ' + ISNULL(a.MiddleName + ' ', '') + ISNULL(a.LastName, '')) LIKE '%' + @AuthorName + '%'
        AND a.FlagDeleted = 0
        AND v.FlagDeleted = 0
    ORDER BY v.Title;
END
GO

