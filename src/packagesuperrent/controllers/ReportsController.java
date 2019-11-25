package packagesuperrent.controllers;

import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import packagesuperrent.classes.Report;
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
    @FXML
    TableView tableReport;
    @FXML
    TableView tableReturn;

    Boolean mouseEnered =false;


    public void ReportsControllerMouseEntered(MouseEvent mouseEvent) {
        if(!mouseEnered)
        {
            mouseEnered = true;
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
            tableReport.getColumns().addAll(vT,vT1,vT3,vT4,vT5);
            tableReturn.getColumns().addAll(vT,vT1,vT3,vT4,vT5,vT6,vT7);

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
            tableReport.setVisible(false);
            tableReturn.setVisible(false);
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
        tableReport.setVisible(false);
        tableReturn.setVisible(false);


        if(choice.getValue().toString().equals("Rental"))
        {
            tableReport.setVisible(true);
            tableReport.getItems().clear();
            for (Report object: DatabaseConnection.getDatabase().getReports(choice.getValue().toString(), cityValue, location,
                    toDate.getValue().toString())) {
                tableReport.getItems().add(object);
            }
        }
        else
        {
            tableReturn.setVisible(true);
            tableReturn.getItems().clear();
            for (ReturnReport object: DatabaseConnection.getDatabase().getReturnReports(choice.getValue().toString(), cityValue, location,
                    toDate.getValue().toString())) {
                tableReturn.getItems().add(object);
            }
        }
    }

    public void UnselectCity(MouseEvent mouseEvent) {
        locationt.getSelectionModel().clearSelection();
        city.getSelectionModel().clearSelection();
    }
}
