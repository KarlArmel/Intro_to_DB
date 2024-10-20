-- Use the alx_book_store database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,    -- Primary key for Authors table
    author_name VARCHAR(215) NOT NULL            -- Author's name
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,      -- Primary key for Books table
    title VARCHAR(130) NOT NULL,                  -- Book title
    author_id INT,                                -- Foreign key referencing Authors table
    price DOUBLE NOT NULL,                        -- Price of the book
    publication_date DATE NOT NULL,               -- Date the book was published
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)  -- Foreign key relationship to Authors
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,   -- Primary key for Customers table
    customer_name VARCHAR(215) NOT NULL,           -- Customer's name
    email VARCHAR(215) UNIQUE NOT NULL,            -- Customer's email (unique)
    address TEXT NOT NULL                         -- Customer's address
);

-- Create the Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,      -- Primary key for Orders table
    customer_id INT,                              -- Foreign key referencing Customers table
    order_date DATE NOT NULL,                      -- Date the order was placed
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)  -- Foreign key relationship to Customers
);

-- Create the Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,  -- Primary key for Order_Details table
    order_id INT,                                  -- Foreign key referencing Orders table
    book_id INT,                                   -- Foreign key referencing Books table
    quantity DOUBLE NOT NULL,                      -- Quantity of books ordered
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),      -- Foreign key relationship to Orders
    FOREIGN KEY (book_id) REFERENCES Books(book_id)           -- Foreign key relationship to Books
);

-- Optionally, add some indexes for performance optimization
CREATE INDEX IF NOT EXISTS idx_books_author_id ON Books (author_id);
CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON Orders (customer_id);
CREATE INDEX IF NOT EXISTS idx_order_details_order_id ON Order_Details (order_id);
CREATE INDEX IF NOT EXISTS idx_order_details_book_id ON Order_Details (book_id);
