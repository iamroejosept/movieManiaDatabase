CREATE TABLE [dbo].[Customers]
(
	[customer_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [email] VARCHAR(MAX) NULL, 
    [first_name] VARCHAR(MAX) NULL, 
    [last_name] VARCHAR(MAX) NULL, 
    [date_of_birth] DATE NULL, 
    [address] VARCHAR(MAX) NULL
)
