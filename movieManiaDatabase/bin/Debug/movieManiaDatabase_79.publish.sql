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
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Disable foreign key constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

-- Drop existing tables
EXEC sp_MSforeachtable 'DROP TABLE ?'

-- Enable foreign key constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT all'

-- Drop existing views
EXEC sp_MSforeachtable 'IF OBJECT_ID(''?'', ''V'') IS NOT NULL DROP VIEW ?'

-- Drop existing stored procedures
EXEC sp_MSforeachtable 'IF OBJECT_ID(''?'', ''P'') IS NOT NULL DROP PROCEDURE ?'

-- Drop existing functions
EXEC sp_MSforeachtable 'IF OBJECT_ID(''?'', ''FN'') IS NOT NULL DROP FUNCTION ?'

GO

GO
PRINT N'Rename refactoring operation with key 7655655c-3e95-4d58-8991-bfd9e2d2cae5 is skipped, element [dbo].[Customers].[Id] (SqlSimpleColumn) will not be renamed to customer_id';


GO
PRINT N'Rename refactoring operation with key 2c31a661-6ad7-4e12-ad6e-15c45231a8f7 is skipped, element [dbo].[Movies].[Id] (SqlSimpleColumn) will not be renamed to movie_id';


GO
PRINT N'Rename refactoring operation with key ef2f23ba-6395-4c56-a5ce-19262ab1c367 is skipped, element [dbo].[Rentals].[Id] (SqlSimpleColumn) will not be renamed to rental_id';


GO
PRINT N'Creating Table [dbo].[RentalMovies]...';


GO
CREATE TABLE [dbo].[RentalMovies] (
    [rental_id]        INT           NOT NULL,
    [movie_id]         INT           NOT NULL,
    [individualstatus] VARCHAR (MAX) NULL,
    [price]            DECIMAL (18)  NULL,
    PRIMARY KEY CLUSTERED ([rental_id] ASC, [movie_id] ASC)
);


GO
PRINT N'Creating Table [dbo].[Rentals]...';


GO
CREATE TABLE [dbo].[Rentals] (
    [rental_id]   INT           IDENTITY (1, 1) NOT NULL,
    [rental_date] DATE          NULL,
    [return_date] DATE          NULL,
    [status]      VARCHAR (MAX) NULL,
    [customer_id] INT           NOT NULL,
    [total_price] DECIMAL (18)  NULL,
    PRIMARY KEY CLUSTERED ([rental_id] ASC)
);


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[RentalMovies]...';


GO
ALTER TABLE [dbo].[RentalMovies] WITH NOCHECK
    ADD FOREIGN KEY ([rental_id]) REFERENCES [dbo].[Rentals] ([rental_id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[RentalMovies]...';


GO
ALTER TABLE [dbo].[RentalMovies] WITH NOCHECK
    ADD FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([movie_id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[Rentals]...';


GO
ALTER TABLE [dbo].[Rentals] WITH NOCHECK
    ADD FOREIGN KEY ([customer_id]) REFERENCES [dbo].[Customers] ([customer_id]) ON DELETE CASCADE;


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7655655c-3e95-4d58-8991-bfd9e2d2cae5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7655655c-3e95-4d58-8991-bfd9e2d2cae5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2c31a661-6ad7-4e12-ad6e-15c45231a8f7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2c31a661-6ad7-4e12-ad6e-15c45231a8f7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ef2f23ba-6395-4c56-a5ce-19262ab1c367')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ef2f23ba-6395-4c56-a5ce-19262ab1c367')

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
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.RentalMovies'), OBJECT_ID(N'dbo.Rentals'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Checking constraint: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Constraint verification failed:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'An error occurred while verifying constraints', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Update complete.';


GO
