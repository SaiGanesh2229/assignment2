import pyodbc


class DBConnUtil:
    @staticmethod
    def get_connection(connection_string):
        try:
            conn = pyodbc.connect(connection_string)
            return conn
        except pyodbc.Error as e:
            print(f"Error connecting to database: {str(e)}")
            return None
