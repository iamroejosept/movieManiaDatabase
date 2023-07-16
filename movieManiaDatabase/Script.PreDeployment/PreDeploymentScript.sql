DECLARE @BackupPath NVARCHAR(500);
DECLARE @BackupFileName NVARCHAR(500);

-- Specify the backup path
SET @BackupPath = 'C:\DB Backup\';

-- Generate the backup filename with the current date
SET @BackupFileName = @BackupPath + 'movieMania_' + CONVERT(NVARCHAR(20), GETDATE(), 112) + '.bak';

-- Perform the backup
BACKUP DATABASE movieManiaDatabase TO DISK = @BackupFileName;
