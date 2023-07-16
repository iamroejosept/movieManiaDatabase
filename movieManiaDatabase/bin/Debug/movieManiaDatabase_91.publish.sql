﻿/*
Deployment script for movieManiaDatabase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "movieManiaDatabase"
:setvar DefaultFilePrefix "movieManiaDatabase"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER03\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER03\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
-- Drop tables if they exist
IF OBJECT_ID('[dbo].[RentalMovies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RentalMovies]

IF OBJECT_ID('[dbo].[Rentals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rentals]

IF OBJECT_ID('[dbo].[Movies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Movies]

IF OBJECT_ID('[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers]
GO

GO
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
INSERT INTO [dbo].[Customers] ([email], [first_name], [last_name], [date_of_birth], [address], [contact_number])
VALUES
('customer1@example.com', 'John', 'Doe', '1990-01-01', '123 Main St', 12345678901),
('customer2@example.com', 'Jane', 'Smith', '1985-05-10', '456 Elm St', 98765432102),
('customer3@example.com', 'Michael', 'Johnson', '1995-09-15', '789 Oak St', 55555555503);

-- Insert sample records into Movies table
INSERT INTO [dbo].[Movies] ([title], [release_date], [genre], [director], [actors], [price], [stock])
VALUES
('The Shawshank Redemption', '1994-09-23', 'Drama', 'Frank Darabont', 'Tim Robbins, Morgan Freeman', 10, 10),
('The Godfather', '1972-03-24', 'Crime, Drama', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino', 8, 5),
('Pulp Fiction', '1994-10-14', 'Crime, Drama', 'Quentin Tarantino', 'John Travolta, Uma Thurman', 12, 8);

-- Insert sample records into Rentals table
INSERT INTO [dbo].[Rentals] ([rental_date], [return_date], [status], [customer_id], [total_price])
VALUES
    ('2023-06-01', '2023-07-01', 'Returned', 1, 18),
    ('2023-06-02', '2023-07-02', 'Returned', 2, 10),
    ('2023-06-03', '2023-07-03', 'Returned', 3, 12);

-- Insert sample records into RentalMovies table
INSERT INTO [dbo].[RentalMovies] ([rental_id], [movie_id], [individualstatus], [price])
VALUES
    (1, 1, 'Returned', 10),
    (1, 2, 'Returned', 8),
    (2, 1, 'Returned', 10),
    (3, 3, 'Returned', 12);











GO

GO
PRINT N'Update complete.';


GO