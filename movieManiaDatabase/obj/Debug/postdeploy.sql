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

-- Insert sample records into Customers table
INSERT INTO [dbo].[Customers] ([email], [first_name], [last_name], [date_of_birth], [address])
VALUES
    ('customer1@example.com', 'John', 'Doe', '1990-01-01', '123 Main St'),
    ('customer2@example.com', 'Jane', 'Smith', '1985-05-10', '456 Elm St'),
    ('customer3@example.com', 'Michael', 'Johnson', '1995-09-15', '789 Oak St');

-- Insert sample records into Movies table
INSERT INTO [dbo].[Movies] ([title], [price], [stock])
VALUES
    ('Movie 1', 9.99, 10),
    ('Movie 2', 8.99, 5),
    ('Movie 3', 12.99, 8);

-- Insert sample records into Rentals table
INSERT INTO [dbo].[Rentals] ([rental_date], [return_date], [status], [customer_id])
VALUES
    ('2023-06-01', '2023-07-01', 'Returned', 1),
    ('2023-06-02', '2023-07-02', 'Returned', 2),
    ('2023-06-03', '2023-07-03', 'Returned', 3);

-- Insert sample records into RentalMovies table
INSERT INTO [dbo].[RentalMovies] ([rental_id], [movie_id], [individualstatus])
VALUES
    (1, 1, 'Returned'),
    (1, 2, 'Returned'),
    (2, 1, 'Returned'),
    (3, 3, 'Returned');











GO
