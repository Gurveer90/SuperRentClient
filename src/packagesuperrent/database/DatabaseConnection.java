package packagesuperrent.database;

public class DatabaseConnection {
    private static DatabaseConnectionHandler databaseConnectionHandler = null;
    private static void  InitializeDatabase()
    {
        databaseConnectionHandler = new DatabaseConnectionHandler();
        databaseConnectionHandler.login(DatabaseKeys.DatabaseUserName, DatabaseKeys.DatabaseUserPassword);
    }
    public static DatabaseConnectionHandler getDatabase()
    {
        if(databaseConnectionHandler == null)
        {
            InitializeDatabase();
        }
        return databaseConnectionHandler;
    }
    public static  void closeConnection()
    {
        databaseConnectionHandler.close();
        databaseConnectionHandler = null;
    }
}
