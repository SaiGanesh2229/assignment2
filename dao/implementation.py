from dao.service_provider import ServiceProvider


class DAOImplementation(ServiceProvider):
    def __init__(self, conn):
        self.conn = conn

    def insert_data(self, table_name, data):
        try:
            cursor = self.conn.cursor()
            columns = ", ".join(data.keys())
            placeholders = ", ".join(["?" for _ in data])
            values = tuple(data.values())
            query = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
            cursor.execute(query, values)
            self.conn.commit()
            print(f"Data inserted into {table_name} successfully.")
        except Exception as e:
            print(f"Error inserting data into {table_name}: {str(e)}")

    def update_data(self, table_name, data, condition):
        try:
            cursor = self.conn.cursor()
            set_clause = ", ".join([f"{key} = ?" for key in data])
            condition_clause = " AND ".join([f"{key} = ?" for key in condition])
            values = tuple(data.values()) + tuple(condition.values())
            query = f"UPDATE {table_name} SET {set_clause} WHERE {condition_clause}"
            cursor.execute(query, values)
            self.conn.commit()
            print(f"Data updated in {table_name} successfully.")
        except Exception as e:
            print(f"Error updating data in {table_name}: {str(e)}")

    def delete_data(self, table_name, condition):
        try:
            cursor = self.conn.cursor()
            condition_clause = " AND ".join([f"{key} = ?" for key in condition])
            values = tuple(condition.values())
            query = f"DELETE FROM {table_name} WHERE {condition_clause}"
            cursor.execute(query, values)
            self.conn.commit()
            print(f"Data deleted from {table_name} successfully.")
        except Exception as e:
            print(f"Error deleting data from {table_name}: {str(e)}")

    def retrieve_data(self, table_name, columns="*", condition=None):
        try:
            cursor = self.conn.cursor()
            if condition:
                condition_clause = " AND ".join([f"{key} = ?" for key in condition])
                values = tuple(condition.values())
                query = f"SELECT {columns} FROM {table_name} WHERE {condition_clause}"
                cursor.execute(query, values)
            else:
                query = f"SELECT {columns} FROM {table_name}"
                cursor.execute(query)
            rows = cursor.fetchall()
            print(f"Data retrieved from {table_name} successfully.")
            return rows
        except Exception as e:
            print(f"Error retrieving data from {table_name}: {str(e)}")
            return []
