CREATE TABLE [dbo].[Rentals]
(
	[rental_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,  
    [rental_date] DATE NULL, 
    [status] VARCHAR(MAX) NULL,
    [customer_id] INT NOT NULL,
    [total_price] DECIMAL NULL,
    FOREIGN KEY (customer_id) REFERENCES [dbo].[Customers]([customer_id]) ON DELETE CASCADE
)