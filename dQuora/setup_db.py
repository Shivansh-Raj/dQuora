import os

def import_database():
    db_name = "dquora"
    sql_file = "dquora_dump.sql"
    
    # Create the database
    create_db_command = f"mysql -u root -p -e 'CREATE DATABASE IF NOT EXISTS {db_name};'"
    os.system(create_db_command)

    # Import the SQL dump into the database
    import_command = f"mysql -u root -p {db_name} < {sql_file}"
    os.system(import_command)

if __name__ == "__main__":
    import_database()