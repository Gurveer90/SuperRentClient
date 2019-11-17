package packagesuperrent.ui;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import packagesuperrent.database.DatabaseConnectionHandler;
import packagesuperrent.database.DatabaseKeys;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
        primaryStage.setTitle("Hello World");
        primaryStage.setScene(new Scene(root, 300, 275));
        primaryStage.show();
        DatabaseConnectionHandler databaseConnectionHandler = new DatabaseConnectionHandler();
        databaseConnectionHandler.login(DatabaseKeys.DatabaseUserName, DatabaseKeys.DatabaseUserPassword);
        databaseConnectionHandler.insert();
        databaseConnectionHandler.read();
        databaseConnectionHandler.update();
        databaseConnectionHandler.delete();
        databaseConnectionHandler.close();

    }


    public static void main(String[] args) {
        launch(args);
    }
}
