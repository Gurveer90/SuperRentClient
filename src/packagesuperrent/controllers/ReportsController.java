package packagesuperrent.controllers;

import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import packagesuperrent.classes.Report;
import packagesuperrent.classes.Return;
import packagesuperrent.classes.ReturnReport;
import packagesuperrent.database.DatabaseConnection;

public class ReportsController {

    @FXML
    ChoiceBox city;
    @FXML
    ChoiceBox locationt;
    @FXML
    ChoiceBox choice;
    @FXML
    DatePicker toDate;

    Boolean mouseEnered =false;


    public void ReportsControllerMouseEntered(MouseEvent mouseEvent) {
        if(!mouseEnered)
        {
            mouseEnered = true;
            for(String s: FXCollections.observableArrayList(
                    "Rental", "Return"))
            {
                choice.getItems().add(s);
            }
            if(city.getItems().isEmpty())
            {
                for (String object: DatabaseConnection.getDatabase().getCities()) {
                    city.getItems().add(object);
                }
            }

            city.getSelectionModel()
                    .selectedItemProperty()
                    .addListener((ObservableValue observable, Object oldValue, Object newValue)->{
                        locationt.getItems().clear();
                        for (String object: DatabaseConnection.getDatabase().getLocations(newValue.toString())) {
                            locationt.getItems().add(object);
                        }
                    });
        }
    }

    public void GenerateReport(MouseEvent mouseEvent) {
        String location = "";
        if(locationt.getValue()!= null)
        {
            location = locationt.getValue().toString();
        }
        String cityValue = "";
        if(city.getValue()!= null)
        {
            cityValue = city.getValue().toString();
        }

        if(choice.getValue().toString().equals("Rental"))
        {
            TableView table = new TableView();
            table.setPrefWidth(700);
            Scene scene = new Scene(new Group());
            Stage stage = new Stage();
            stage.setTitle("Report");
            stage.setWidth(750);
            stage.setHeight(500);
            Label label = new Label("Report");

            TableColumn vT = new TableColumn("Date");
            vT.setCellValueFactory(new PropertyValueFactory<>("date"));
            TableColumn vT1 = new TableColumn("Location");
            vT1.setCellValueFactory(new PropertyValueFactory<>("location"));
            TableColumn vT3 = new TableColumn("Vehicle Type");
            vT3.setCellValueFactory(new PropertyValueFactory<>("vehicletype"));
            TableColumn vT4 = new TableColumn("TOTAL RENTALS AT BRANCH");
            vT4.setCellValueFactory(new PropertyValueFactory<>("c1"));
            TableColumn vT5 = new TableColumn("NUMBER RENTED OUT");
            vT5.setCellValueFactory(new PropertyValueFactory<>("c2"));

            table.getColumns().addAll(vT,vT1,vT3,vT4,vT5);

            for (Report object: DatabaseConnection.getDatabase().getReports(choice.getValue().toString(), cityValue, location,
                    toDate.getValue().toString())) {
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
        else
        {

            TableView table = new TableView();
            table.setPrefWidth(700);
            Scene scene = new Scene(new Group());
            Stage stage = new Stage();
            stage.setTitle("Report");
            stage.setWidth(750);
            stage.setHeight(500);
            Label label = new Label("Report");

            TableColumn vT = new TableColumn("Date");
            vT.setCellValueFactory(new PropertyValueFactory<>("date"));
            TableColumn vT1 = new TableColumn("Location");
            vT1.setCellValueFactory(new PropertyValueFactory<>("location"));
            TableColumn vT3 = new TableColumn("Vehicle Type");
            vT3.setCellValueFactory(new PropertyValueFactory<>("vehicletype"));
            TableColumn vT4 = new TableColumn("TOTAL RENTALS AT BRANCH");
            vT4.setCellValueFactory(new PropertyValueFactory<>("c1"));
            TableColumn vT5 = new TableColumn("NUMBER RENTED OUT");
            vT5.setCellValueFactory(new PropertyValueFactory<>("c2"));
            TableColumn vT6 = new TableColumn("Total Revenue");
            vT6.setCellValueFactory(new PropertyValueFactory<>("tr"));
            TableColumn vT7 = new TableColumn("Total Revenue of Branch");
            vT7.setCellValueFactory(new PropertyValueFactory<>("trb"));


            table.getColumns().addAll(vT,vT1,vT3,vT4,vT5,vT6,vT7);

            for (ReturnReport object: DatabaseConnection.getDatabase().getReturnReports(choice.getValue().toString(), cityValue, location,
                    toDate.getValue().toString())) {
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
    }

    public void UnselectCity(MouseEvent mouseEvent) {
        locationt.getSelectionModel().clearSelection();
        city.getSelectionModel().clearSelection();
    }
}
