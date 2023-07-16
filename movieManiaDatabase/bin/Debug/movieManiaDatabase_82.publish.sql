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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating database $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


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

GO

GO
PRINT N'Creating Table [dbo].[Customers]...';


GO
CREATE TABLE [dbo].[Customers] (
    [customer_id]    INT           IDENTITY (1, 1) NOT NULL,
    [email]          VARCHAR (MAX) NULL,
    [first_name]     VARCHAR (MAX) NULL,
    [last_name]      VARCHAR (MAX) NULL,
    [date_of_birth]  DATE          NULL,
    [address]        VARCHAR (MAX) NULL,
    [contact_number] VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([customer_id] ASC)
);


GO
PRINT N'Creating Table [dbo].[Movies]...';


GO
CREATE TABLE [dbo].[Movies] (
    [movie_id]     INT           IDENTITY (1, 1) NOT NULL,
    [title]        VARCHAR (MAX) NULL,
    [release_date] DATE          NULL,
    [genre]        VARCHAR (MAX) NULL,
    [director]     VARCHAR (MAX) NULL,
    [actors]       VARCHAR (MAX) NULL,
    [price]        DECIMAL (18)  NULL,
    [stock]        INT           NULL,
    PRIMARY KEY CLUSTERED ([movie_id] ASC)
);


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
ALTER TABLE [dbo].[RentalMovies]
    ADD FOREIGN KEY ([rental_id]) REFERENCES [dbo].[Rentals] ([rental_id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[RentalMovies]...';


GO
ALTER TABLE [dbo].[RentalMovies]
    ADD FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([movie_id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key unnamed constraint on [dbo].[Rentals]...';


GO
ALTER TABLE [dbo].[Rentals]
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
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
