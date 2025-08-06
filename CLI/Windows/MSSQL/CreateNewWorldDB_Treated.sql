-- Drop the target database if it already exists
IF DB_ID('NewWorldDB_Treated') IS NOT NULL
BEGIN
    ALTER DATABASE NewWorldDB_Treated SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE NewWorldDB_Treated;
END
GO

-- Create a cloned database (schema + statistics only, no data)
DBCC CLONEDATABASE('NewWorldDB', 'NewWorldDB_Treated');
GO

-- Ensure the cloned database is not read-only
ALTER DATABASE NewWorldDB_Treated SET READ_WRITE;
GO
