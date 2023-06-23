/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Insert initial data into Customers table
INSERT INTO [dbo].[Customers] ([email], [first_name], [last_name], [date_of_birth], [address])
VALUES ('john.smith@example.com', 'John', 'Smith', '1980-01-01', '123 Main St'),
       ('jane.doe@example.com', 'Jane', 'Doe', '1990-05-15', '456 Elm St');

-- Insert initial data into Movies table
INSERT INTO [dbo].[Movies] ([title], [price], [stock])
VALUES ('The Matrix', 9.99, 10),
       ('Inception', 8.99, 5);

-- Insert initial data into Rentals table
INSERT INTO [dbo].[Rentals] ([customer_id], [movie_id], [rental_date], [return_date], [status])
VALUES (1, 1, '2023-06-01', '2023-06-08', 'Returned'),
       (2, 2, '2023-06-02', '2023-06-09', 'Returned');

GO
