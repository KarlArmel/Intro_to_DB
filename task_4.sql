-- Query the INFORMATION_SCHEMA to get detailed information about the Books table
SELECT 
    COLUMN_NAME, 
    COLUMN_TYPE, 
    IS_NULLABLE, 
    COLUMN_DEFAULT, 
    EXTRA
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'alx_book_store'  -- Specify the database schema
    AND TABLE_NAME = 'Books';        -- Specify the table name as 'Books'
