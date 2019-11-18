package packagesuperrent.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.scene.input.InputMethodEvent;
import packagesuperrent.database.DatabaseConnectionHandler;
import packagesuperrent.database.DatabaseKeys;

public class AddStudentController {

    @FXML
    TextField NameFieldID;
    @FXML
    TextField SidFieldID;

    public void AddStudent(ActionEvent actionEvent) {
        System.out.println(NameFieldID.getText());

        DatabaseConnectionHandler databaseConnectionHandler = new DatabaseConnectionHandler();
        databaseConnectionHandler.login(DatabaseKeys.DatabaseUserName, DatabaseKeys.DatabaseUserPassword);
        databaseConnectionHandler.insert(NameFieldID.getText(),SidFieldID.getText());
        databaseConnectionHandler.read();
        databaseConnectionHandler.close();
    }

}
