package packagesuperrent.controllers;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.InputMethodEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.converter.LocalTimeStringConverter;
import packagesuperrent.classes.Reservation;
import packagesuperrent.classes.Vehicle;
import packagesuperrent.classes.VehicleType;
import packagesuperrent.database.DatabaseConnection;
import packagesuperrent.database.DatabaseConnectionHandler;

import java.text.ParseException;
import java.time.format.DateTimeFormatter;
import static packagesuperrent.database.DatabaseConnectionHandler.*;

public class ReservationController {
    @FXML
    Spinner fromHourTime;
    @FXML
    Spinner fromMinuteTime;
    @FXML
    Spinner fromSecondTime;
    @FXML
    Spinner toHourTime;
    @FXML
    Spinner toMinuteTime;
    @FXML
    Spinner toSecondTime;
    @FXML
    ChoiceBox city;
    @FXML
    ChoiceBox locationType;
    @FXML
    ChoiceBox vehicleType;
    @FXML
    DatePicker fromDate;
    @FXML
    DatePicker toDate;
    @FXML
    Label messageText;
    @FXML
    TableView viewTable;
    @FXML
    TextField dl;
    @FXML
    TextField confNo;
    @FXML
    TextArea resrTextArea;

    Boolean mouseEnered =false;

    public void ReservationMouseEntered(MouseEvent mouseEvent) {
        if(!mouseEnered)
        {
            mouseEnered = true;
            if(city.getItems().isEmpty())
            {
                for (String object: DatabaseConnection.getDatabase().getCities()) {
                    city.getItems().add(object);
                }
            }
            city.getSelectionModel()
                    .selectedItemProperty()
                    .addListener((ObservableValue observable, Object oldValue, Object newValue)->{
                        locationType.getItems().clear();
                        for (String object: DatabaseConnection.getDatabase().getLocations(newValue.toString())) {
                            locationType.getItems().add(object);
                        }
                    });

            locationType.getSelectionModel()
                    .selectedItemProperty()
                    .addListener((ObservableValue observable, Object oldValue, Object newValue)->{
                        vehicleType.getItems().clear();
                        for (String object: DatabaseConnection.getDatabase().getVehicleTypes(newValue.toString())) {
                            vehicleType.getItems().add(object);
                        }
                    });
            fromHourTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,24,0,1));
            fromSecondTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,60,0,1));
            fromMinuteTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,60,0,1));
            toHourTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,24,0,1));
            toSecondTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,60,0,1));
            toMinuteTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,60,0,1));
            TableView table =viewTable;
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
        }
    }

    public void SearchButtonClicked(ActionEvent actionEvent) {
        int vehicleCount = 0;
        TableView table =viewTable;

        try {
            vehicleCount = DatabaseConnection.getDatabase().getVehicleCounts(city.getValue().toString(),
                    locationType.getValue().toString()
            ,vehicleType.getValue().toString(),fromDate.getValue().toString(),
                    fromHourTime.getValue().toString(),fromMinuteTime.getValue().toString(), fromSecondTime.getValue().toString()
                    ,toDate.getValue().toString(), toHourTime.getValue().toString(),
                    toMinuteTime.getValue().toString(), toSecondTime.getValue().toString());
            messageText.setText(vehicleCount + " Vehicles found!");
        } catch (ParseException e) {
            e.printStackTrace();
        }



        try {
            table.getItems().clear();
            for (Vehicle object: DatabaseConnection.getDatabase().getAvailableVehicles(city.getValue().toString(),
                    locationType.getValue().toString()
                    ,vehicleType.getValue().toString(),fromDate.getValue().toString(),
                    fromHourTime.getValue().toString(),fromMinuteTime.getValue().toString(), fromSecondTime.getValue().toString()
                    ,toDate.getValue().toString(), toHourTime.getValue().toString(),
                    toMinuteTime.getValue().toString(), toSecondTime.getValue().toString())) {
                table.getItems().add(object);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    public void ReserveVehicle(ActionEvent actionEvent) {
        TableView table =viewTable;
        if(table.getSelectionModel().getSelectedItem() != null)
        {
            Vehicle vehicle =  (Vehicle)table.getSelectionModel().getSelectedItem();
            int ConfirmationNumer = 0;
            try {
                ConfirmationNumer = DatabaseConnection.getDatabase().ReserveVehicle(vehicle, dl.getText(),
                        fromDate.getValue().toString(),
                        fromHourTime.getValue().toString(),fromMinuteTime.getValue().toString(), fromSecondTime.getValue().toString()
                        ,toDate.getValue().toString(), toHourTime.getValue().toString(),
                        toMinuteTime.getValue().toString(), toSecondTime.getValue().toString());
                messageText.setText(" Confirmation Number is "+ ConfirmationNumer );
            } catch (ParseException e) {
                messageText.setText(e.getMessage() );
            }
        }
        else
        {
            messageText.setText(" No Vehicles is selected!");
        }
    }

    public void DeleteReservation(ActionEvent actionEvent) {
        DatabaseConnection.getDatabase().DeleteReservation(Integer.parseInt(confNo.getText()));
    }

    public void DisplayReservation(ActionEvent actionEvent) {
        TableView table = new TableView();
        table.setPrefWidth(700);
        Scene scene = new Scene(new Group());
        Stage stage = new Stage();
        stage.setTitle("Reservation");
        stage.setWidth(750);
        stage.setHeight(500);
        Label label = new Label("Reservation");
        TableColumn vT = new TableColumn("Conf No");
        vT.setCellValueFactory(new PropertyValueFactory<>("confNo"));
        TableColumn vT1 = new TableColumn("Vehicle Type");
        vT1.setCellValueFactory(new PropertyValueFactory<>("vtname"));
        TableColumn vT2 = new TableColumn("Customer License");
        vT2.setCellValueFactory(new PropertyValueFactory<>("dlicense"));
        TableColumn vT3 = new TableColumn("From Date");
        vT3.setCellValueFactory(new PropertyValueFactory<>("fromDate"));
        TableColumn vT4 = new TableColumn("To Date");
        vT4.setCellValueFactory(new PropertyValueFactory<>("toDate"));
        TableColumn vT51 = new TableColumn("From Time");
        vT51.setCellValueFactory(new PropertyValueFactory<>("fromTime"));
        TableColumn vT5 = new TableColumn("To Time");
        vT5.setCellValueFactory(new PropertyValueFactory<>("toTime"));

        table.getColumns().removeAll();
        table.getColumns().addAll(vT,vT1,vT2,vT3,vT51,vT4,vT5);
        for (Reservation object: DatabaseConnection.getDatabase().getReservations()) {
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

    public void SelectReservation(ActionEvent actionEvent) {
        String textArea = DatabaseConnection.getDatabase().getReservation(Integer.parseInt(confNo.getText()));
        resrTextArea.setText(textArea);
    }

    public void UpdateReservation(ActionEvent actionEvent) {
        DatabaseConnection.getDatabase().upDateReservation(Integer.parseInt(confNo.getText()),resrTextArea.getText());
    }
}
