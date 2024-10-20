-- Query the INFORMATION_SCHEMA to get detailed information about the books table
SELECT 
    COLUMN_NAME, 
    COLUMN_TYPE, 
    IS_NULLABLE, 
    COLUMN_DEFAULT, 
    EXTRA
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = DATABASE()  -- This ensures we are querying the current database
    AND TABLE_NAME = 'Books';  -- Specify the table name as 'Books'
