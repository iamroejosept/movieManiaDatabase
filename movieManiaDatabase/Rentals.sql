CREATE TABLE [dbo].[Rentals]
(
	[rental_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [customer_id] INT NULL, 
    [movie_id] INT NULL, 
    [rental_date] DATE NULL, 
    [return_date] DATE NULL, 
    [status] VARCHAR(MAX) NULL,
    FOREIGN KEY ([customer_id]) REFERENCES [dbo].[Customers]([customer_id]) ON DELETE CASCADE,
    FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies]([movie_id]) ON DELETE CASCADE
)
