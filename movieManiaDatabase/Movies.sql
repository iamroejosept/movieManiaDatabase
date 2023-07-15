CREATE TABLE [dbo].[Movies]
(
    [movie_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [title] VARCHAR(MAX) NULL,
    [release_date] DATE NULL,
    [genre] VARCHAR(MAX) NULL,
    [director] VARCHAR(MAX) NULL,
    [actors] VARCHAR(MAX) NULL,
    [price] DECIMAL NULL,
    [stock] INT NULL
)
