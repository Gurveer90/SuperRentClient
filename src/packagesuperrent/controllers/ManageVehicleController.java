package packagesuperrent.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import packagesuperrent.classes.Vehicle;
import packagesuperrent.classes.VehicleType;
import packagesuperrent.database.DatabaseConnection;

public class ManageVehicleController {
    @FXML
    TextField vlicense;
    @FXML
    TextField make;
    @FXML
    TextField model;
    @FXML
    TextField vyear;
    @FXML
    TextField color;
    @FXML
    TextField odometer;
    @FXML
    TextField vstatus;
    @FXML
    ChoiceBox vtypename;
    @FXML
    TextField vlocation;
    @FXML
    TextField city;
    @FXML
    TextField vdlicense;
    @FXML
    TextField vL;
    @FXML
    TextField vC;
    @FXML
    TextField vCV;

    public void AddVehicle(ActionEvent actionEvent) {
        Vehicle obj = new Vehicle(Integer.parseInt(vlicense.getText()), make.getText(), model.getText(),
                Integer.parseInt(vyear.getText()), color.getText(),
                Integer.parseInt(odometer.getText()), vstatus.getText(),
                vtypename.getValue().toString(), vlocation.getText(),city.getText());
        DatabaseConnection.getDatabase().insertVehicle(obj);
    }

    public void DisplayVehicle(ActionEvent actionEvent) {
        TableView table = new TableView();
        Scene scene = new Scene(new Group());
        Stage stage = new Stage();
        stage.setTitle("Vehicle");
        stage.setWidth(900);
        stage.setHeight(500);
        Label label = new Label("Vehicle");
        TableColumn vT = new TableColumn("License");
        vT.setCellValueFactory(new PropertyValueFactory<>("vlicense"));
        TableColumn vT1 = new TableColumn("Make");
        vT1.setCellValueFactory(new PropertyValueFactory<>("make"));
        TableColumn vT2 = new TableColumn("Model");
        vT2.setCellValueFactory(new PropertyValueFactory<>("model"));
        TableColumn vT3 = new TableColumn("Yyear");
        vT3.setCellValueFactory(new PropertyValueFactory<>("vyear"));
        TableColumn vT4 = new TableColumn("Color");
        vT4.setCellValueFactory(new PropertyValueFactory<>("color"));
        TableColumn vT5 = new TableColumn("Odometer");
        vT5.setCellValueFactory(new PropertyValueFactory<>("odometer"));
        TableColumn vT6 = new TableColumn("Status");
        vT6.setCellValueFactory(new PropertyValueFactory<>("vstatus"));
        TableColumn vT7 = new TableColumn("Vehicle Type");
        vT7.setCellValueFactory(new PropertyValueFactory<>("vtname"));
        TableColumn vT8 = new TableColumn("Location");
        vT8.setCellValueFactory(new PropertyValueFactory<>("vlocation"));
        TableColumn vT9 = new TableColumn("City");
        vT9.setCellValueFactory(new PropertyValueFactory<>("city"));

        table.getColumns().removeAll();
        table.getColumns().addAll(vT,vT1,vT2,vT3,vT4,vT5,vT6,vT7,vT8,vT9);
        for (Vehicle object: DatabaseConnection.getDatabase().getVehicles()) {
            table.getItems().add(object);
        }
        final VBox vbox = new VBox();
        vbox.setSpacing(5);
        vbox.setPadding(new Insets(10, 10, 10, 10));
        vbox.getChildren().addAll(label, table);
        ((Group) scene.getRoot()).getChildren().addAll(vbox);
        stage.setScene(scene);
        stage.show();
    }

    public void DeleteVehicle(ActionEvent actionEvent) {
        DatabaseConnection.getDatabase().deleteVehicle(Integer.parseInt(vdlicense.getText()));
    }

    public void mouseEntered(MouseEvent mouseEvent) {
       if(vtypename.getItems().isEmpty())
       {
           for (VehicleType object: DatabaseConnection.getDatabase().getVehicleTypes()) {
               vtypename.getItems().add(object.getVtname());
           }
       }
    }

    public void UpdateVehicle(ActionEvent actionEvent) {
        DatabaseConnection.getDatabase().updateVehicle(vL.getText(), vC.getText(), vCV.getText());
    }
}
