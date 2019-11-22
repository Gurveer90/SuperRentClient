package packagesuperrent.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import packagesuperrent.classes.VehicleType;
import packagesuperrent.database.DatabaseConnection;

public class ManageVehicleTypeController {

    @FXML
    TextField krate;
    @FXML
    TextField hirate;
    @FXML
    TextField dirate;
    @FXML
    TextField wirate;
    @FXML
    TextField hrate;
    @FXML
    TextField drate;
    @FXML
    TextField wrate;
    @FXML
    TextField features;
    @FXML
    TextField vtname;
    @FXML
    TextField dvtype;

    public void AddVehicleType(ActionEvent actionEvent) {
            VehicleType obj = new VehicleType(vtname.getText(), features.getText(), Float.parseFloat(wrate.getText()),
                    Float.parseFloat(drate.getText()), Float.parseFloat(hrate.getText()),
                    Float.parseFloat(wirate.getText()), Float.parseFloat(dirate.getText()),
                    Float.parseFloat(hirate.getText()), Float.parseFloat(krate.getText()));
            DatabaseConnection.getDatabase().insertVehicleType(obj);
    }

    public void DisplayVehicleType(ActionEvent actionEvent) {
        TableView table = new TableView();
        Scene scene = new Scene(new Group());
        Stage stage = new Stage();
        stage.setTitle("Vehicle Type");
        stage.setWidth(900);
        stage.setHeight(500);
        Label label = new Label("VehicleType");
        TableColumn vT = new TableColumn("Vehicle Type");
        vT.setCellValueFactory(new PropertyValueFactory<>("vtname"));
        TableColumn vT1 = new TableColumn("Features");
        vT1.setCellValueFactory(new PropertyValueFactory<>("features"));
        TableColumn vT2 = new TableColumn("Weekly Rate");
        vT2.setCellValueFactory(new PropertyValueFactory<>("wrate"));
        TableColumn vT3 = new TableColumn("Daily Rate");
        vT3.setCellValueFactory(new PropertyValueFactory<>("drate"));
        TableColumn vT4 = new TableColumn("Hourly rate");
        vT4.setCellValueFactory(new PropertyValueFactory<>("hrate"));
        TableColumn vT5 = new TableColumn("Weekly Insurance");
        vT5.setCellValueFactory(new PropertyValueFactory<>("wirate"));
        TableColumn vT6 = new TableColumn("Daily Insurance");
        vT6.setCellValueFactory(new PropertyValueFactory<>("dirate"));
        TableColumn vT7 = new TableColumn("Hourly Insurance");
        vT7.setCellValueFactory(new PropertyValueFactory<>("hirate"));
        TableColumn vT8 = new TableColumn("Km Rate");
        vT8.setCellValueFactory(new PropertyValueFactory<>("krate"));

        table.getColumns().removeAll();
        table.getColumns().addAll(vT,vT1,vT2,vT3,vT4,vT5,vT6,vT7,vT8);
        for (VehicleType object: DatabaseConnection.getDatabase().getVehicleTypes()) {
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

    public void DeleteVehicleType(ActionEvent actionEvent) {
        DatabaseConnection.getDatabase().deleteVehicleType(dvtype.getText());

    }
}
