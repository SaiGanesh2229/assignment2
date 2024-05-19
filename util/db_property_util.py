class DBPropertyUtil:
    @staticmethod
    def get_connection_string():
        # Example connection string for MS SQL Server
        return (
            "DRIVER={ODBC Driver 17 for SQL Server}; SERVER=SaiGanesh; DATABASE=SISDB"
        )
