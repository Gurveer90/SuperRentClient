package packagesuperrent.controllers;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
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
import packagesuperrent.classes.Rent;
import packagesuperrent.classes.Reservation;
import packagesuperrent.classes.Vehicle;
import packagesuperrent.database.DatabaseConnection;

import java.text.ParseException;

public class RentController {

    @FXML
    ChoiceBox CardName;
    @FXML
    ChoiceBox clerkCity;
    @FXML
    ChoiceBox clerkLocation;
    @FXML
    TextField ConfNo;
    @FXML
    TextField CardNo;
    @FXML
    TextField ExpDate;
    @FXML
    TableView viewTable;
    @FXML
    Label messageText;
    @FXML
    Label calculation;
    @FXML
    TextField rentNo;

    Boolean mouseEntered =false;

    public void addChoices(MouseEvent mouseEvent) {
        if(!mouseEntered)
        {
            mouseEntered = true;
            TableView table = viewTable;
            viewTable.getItems().clear();
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
            if(clerkCity.getItems().isEmpty())
            {
                for (String object: DatabaseConnection.getDatabase().getCities()) {
                    clerkCity.getItems().add(object);
                }
            }
            clerkCity.getSelectionModel()
                    .selectedItemProperty()
                    .addListener((ObservableValue observable, Object oldValue, Object newValue)->{
                        clerkLocation.getItems().clear();
                        for (String object: DatabaseConnection.getDatabase().getLocations(newValue.toString())) {
                            clerkLocation.getItems().add(object);
                        }
                    });
            for(String s:FXCollections.observableArrayList(
                    "Master Card", "Visa Card"))
            {
                CardName.getItems().add(s);
            }

            viewTable.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
                if (newSelection != null) {
                    Vehicle vehicle =  (Vehicle) newSelection;
                    calculation.setText("");
                    System.out.println("Updating vehicle");
                    calculation.setText(DatabaseConnection.getDatabase().getBilling(ConfNo.getText(),vehicle));
                }
            });

        }
    }

    public void SearchButtonClicked(ActionEvent actionEvent) {
        TableView table = viewTable;

        for (Vehicle object: DatabaseConnection.getDatabase().getAvailableVehiclesFromConfirmation(ConfNo.getText(),
                clerkCity.getValue().toString(),
                clerkLocation.getValue().toString())) {
            table.getItems().add(object);
        }
    }

    public void rentButtonClicked(ActionEvent actionEvent) {
        TableView table =viewTable;
        if(table.getSelectionModel().getSelectedItem() != null)
        {
            Vehicle vehicle =  (Vehicle)table.getSelectionModel().getSelectedItem();


            int rid = 0;
            try {
                rid = DatabaseConnection.getDatabase().insertRent(vehicle, ConfNo.getText(), CardName.getValue().toString(),
                    CardNo.getText().toString(), ExpDate.getText().toString()  );
                messageText.setText("Rent ID " + rid);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        else
        {
            messageText.setText(" No Vehicles is selected!");
        }
    }

    public void DisplayRentals(ActionEvent actionEvent) {
            TableView table = new TableView();
            table.setPrefWidth(700);
            Scene scene = new Scene(new Group());
            Stage stage = new Stage();
            stage.setTitle("Rent");
            stage.setWidth(750);
            stage.setHeight(500);
            Label label = new Label("Rent");
            TableColumn vT = new TableColumn("Rent Id");
            vT.setCellValueFactory(new PropertyValueFactory<>("rid"));
            TableColumn vT1 = new TableColumn("Vehicle License");
            vT1.setCellValueFactory(new PropertyValueFactory<>("vlicense"));
            TableColumn vT2 = new TableColumn("Customer License");
            vT2.setCellValueFactory(new PropertyValueFactory<>("dlicense"));
            TableColumn vT3 = new TableColumn("From Date");
            vT3.setCellValueFactory(new PropertyValueFactory<>("fromDate"));
            TableColumn vT4 = new TableColumn("From Time");
            vT4.setCellValueFactory(new PropertyValueFactory<>("fromTime"));
            TableColumn vT5 = new TableColumn("To Date");
            vT5.setCellValueFactory(new PropertyValueFactory<>("toDate"));
            TableColumn vT6 = new TableColumn("To Time");
            vT6.setCellValueFactory(new PropertyValueFactory<>("toTime"));
            TableColumn vT7 = new TableColumn("Odometer");
            vT7.setCellValueFactory(new PropertyValueFactory<>("odometer"));
            TableColumn vT8 = new TableColumn("Card Name");
            vT8.setCellValueFactory(new PropertyValueFactory<>("cardName"));
            TableColumn vT9 = new TableColumn("Card Number");
            vT9.setCellValueFactory(new PropertyValueFactory<>("CardNo"));
            TableColumn vT10 = new TableColumn("Exp. Date");
            vT10.setCellValueFactory(new PropertyValueFactory<>("expDate"));
            TableColumn vT11 = new TableColumn("Confirmation Number");
            vT11.setCellValueFactory(new PropertyValueFactory<>("confNo"));

            table.getColumns().removeAll();
            table.getColumns().addAll(vT,vT1,vT2,vT3,vT4,vT5,vT6,vT7,vT8,vT9,vT10,vT11);
            for (Rent object: DatabaseConnection.getDatabase().getRentals()) {
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

    public void deleteButtonClicked(ActionEvent actionEvent) {
        DatabaseConnection.getDatabase().DeleteRent(Integer.parseInt(rentNo.getText()));
    }
}

