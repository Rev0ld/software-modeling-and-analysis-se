CREATE FUNCTION dbo.GetTagsForVideo
(
    @VideoID INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Tags NVARCHAR(MAX);

    SELECT @Tags = STRING_AGG(t.Name, ', ')
    FROM dbo.VideoTags vt
    INNER JOIN dbo.Tags t ON vt.TagID = t.ID
    WHERE vt.VideoID = @VideoID AND vt.FlagDeleted = 0;

    RETURN ISNULL(@Tags, '');
END
GO
