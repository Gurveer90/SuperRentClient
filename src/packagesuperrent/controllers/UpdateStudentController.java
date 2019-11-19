package packagesuperrent.controllers;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.scene.input.InputMethodEvent;
import packagesuperrent.database.DatabaseConnectionHandler;
import packagesuperrent.database.DatabaseKeys;
public class UpdateStudentController {
    @FXML
    TextField SNameIdFieldID;
    @FXML
    TextField StuIdFieldID;

    public void UpdateStudent(ActionEvent actionEvent) {
        System.out.println(SNameIdFieldID.getText());

        DatabaseConnectionHandler databaseConnectionHandler = new DatabaseConnectionHandler();
        databaseConnectionHandler.login(DatabaseKeys.DatabaseUserName, DatabaseKeys.DatabaseUserPassword);
        databaseConnectionHandler.update(SNameIdFieldID.getText(), StuIdFieldID.getText());
        databaseConnectionHandler.close();
    }
}
