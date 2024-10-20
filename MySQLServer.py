import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish connection to the MySQL server
        connection = mysql.connector.connect(
            host='localhost',          # MySQL server host
            user='root',               # MySQL username (adjust as needed)
            password='your_password'   # MySQL password (adjust as needed)
        )
        
        # Check if the connection is successful
        if connection.is_connected():
            print("Connected to MySQL server")

            # Create a cursor object
            cursor = connection.cursor()

            # Check if the database already exists
            cursor.execute("SHOW DATABASES LIKE 'alx_book_store'")

            # If the database does not exist, create it
            if cursor.fetchone():
                print("Database 'alx_book_store' already exists!")
            else:
                # Create the 'alx_book_store' database
                cursor.execute("CREATE DATABASE alx_book_store")
                print("Database 'alx_book_store' created successfully!")

    except Error as e:
        # Print error message if there's an issue
        print(f"Error: {e}")
    
    finally:
        # Close the cursor and the connection to MySQL server
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

# Call the function to create the database
if __name__ == "__main__":
    create_database()
