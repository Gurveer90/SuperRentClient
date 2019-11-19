package packagesuperrent.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import packagesuperrent.classes.*;
import packagesuperrent.database.DatabaseConnectionHandler;
import packagesuperrent.database.DatabaseKeys;

import java.io.IOException;

public class mainController {
    public void AddButtonClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/AddStudent.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 600, 400);
            Stage stage = new Stage();
            stage.setTitle("Add Student");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void EditButtonClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/updateStudent.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 600, 400);
            Stage stage = new Stage();
            stage.setTitle("Update Student");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void DisplayButtonClick(ActionEvent actionEvent) {
        TableView table = new TableView();

        Scene scene = new Scene(new Group());
        Stage stage = new Stage();
        stage.setTitle("Table View Sample");
        stage.setWidth(300);
        stage.setHeight(500);

        Label label = new Label("Students");
        TableColumn sNameCol = new TableColumn("SName");
        sNameCol.setCellValueFactory(new PropertyValueFactory<>("name"));

        TableColumn sIDCol = new TableColumn("Sid");
        sIDCol.setCellValueFactory(new PropertyValueFactory<>("id"));

        table.getColumns().removeAll();
        table.getColumns().addAll(sNameCol, sIDCol );

        DatabaseConnectionHandler databaseConnectionHandler = new DatabaseConnectionHandler();
        databaseConnectionHandler.login(DatabaseKeys.DatabaseUserName, DatabaseKeys.DatabaseUserPassword);


        for (Student object: databaseConnectionHandler.read()) {
            table.getItems().add(object);

        }
        databaseConnectionHandler.close();



        final VBox vbox = new VBox();
        vbox.setSpacing(5);
        vbox.setPadding(new Insets(10, 10, 10, 10));
        vbox.getChildren().addAll(label, table);

        ((Group) scene.getRoot()).getChildren().addAll(vbox);

        stage.setScene(scene);
        stage.show();

    }
}
