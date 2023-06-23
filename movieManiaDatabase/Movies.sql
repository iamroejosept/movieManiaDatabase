CREATE TABLE [dbo].[Movies]
(
	[movie_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [title] VARCHAR(MAX) NULL, 
    [price] DECIMAL NULL, 
    [stock] INT NULL
)
