package packagesuperrent.controllers;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import packagesuperrent.classes.Customer;
import packagesuperrent.database.DatabaseConnection;

import javax.swing.*;
import java.io.IOException;
import java.util.ArrayList;

public class mainController {

    public void ManageVehicleTypeButtonClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/ManageVehicleType.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 800, 400);
            Stage stage = new Stage();
            stage.setTitle("Manage Vehicle Types");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void ManageVehicleButtonClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/ManageVehicle.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 800, 400);
            Stage stage = new Stage();
            stage.setTitle("Manage Vehicles");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void ManageCustomerButtonClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/ManageCustomer.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 800, 400);
            Stage stage = new Stage();
            stage.setTitle("Manage Customers");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void ReservationButtonClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/ReservationUI.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 920, 500);
            Stage stage = new Stage();
            stage.setTitle("Reservation");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void RentalButtonClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/RentUI.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 920, 500);
            Stage stage = new Stage();
            stage.setTitle("Rent");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void DirectRentalClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/DirectRent.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 920, 500);
            Stage stage = new Stage();
            stage.setTitle("Rent");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void ReturnButtonClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/Return.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 920, 500);
            Stage stage = new Stage();
            stage.setTitle("Return");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void ReportsClick(ActionEvent actionEvent) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader();
            fxmlLoader.setLocation(getClass().getResource("../ui/ReportUI.fxml"));
            Scene scene = new Scene(fxmlLoader.load(), 920, 500);
            Stage stage = new Stage();
            stage.setTitle("Reports");
            stage.setScene(scene);
            stage.show();
        }
        catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void ListofTablesClicked(ActionEvent actionEvent) {
         ArrayList<String> tables = DatabaseConnection.getDatabase().getListOfTables();
         String tablesName = "";

        for (String object: tables) {
            tablesName+= object+"\n";
        }

        TextArea l = new TextArea();
        l.setPrefWidth(300);
        l.setPrefHeight(400);
        l.setText(tablesName);
        Scene scene = new Scene(new Group());
        Stage stage = new Stage();
        stage.setTitle("Tables");
        stage.setWidth(350);
        stage.setHeight(500);
        Label label = new Label("Tables");
        TableColumn vT = new TableColumn("Table");

        VBox vbox = new VBox();
        vbox.setSpacing(5);
        vbox.setPadding(new Insets(10, 10, 10, 10));
        vbox.getChildren().addAll(label, l);
        ((Group) scene.getRoot()).getChildren().addAll(vbox);
        stage.setScene(scene);
        stage.show();

    }
}
