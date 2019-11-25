package packagesuperrent.controllers;

import javafx.beans.value.ObservableValue;
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
import packagesuperrent.classes.Return;
import packagesuperrent.database.DatabaseConnection;

import java.text.ParseException;

public class ReturnController {

    @FXML
    Label messageText;
    @FXML
    Spinner toHourTime;
    @FXML
    Spinner toMinuteTime;
    @FXML
    Spinner toSecondTime;
    @FXML
    DatePicker toDate;
    @FXML
    TextField rID;
    @FXML
    TextField rOdoMeter;
    @FXML
    TextField rTank;

    Boolean mouseEnered =false;

    public void RetrunMouseEntered(MouseEvent mouseEvent) {
        if(!mouseEnered)
        {
            mouseEnered = true;
            toHourTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,24,0,1));
            toSecondTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,60,0,1));
            toMinuteTime.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0,60,0,1));

        }
    }

    public void ReturnVehicle(ActionEvent actionEvent) {
        String time = toHourTime.getValue().toString()+":"+toMinuteTime.getValue().toString()+":"+toSecondTime.getValue().toString();
        float price = DatabaseConnection.getDatabase().getBilling(rID.getText(),rOdoMeter.getText(), rTank.getText(), toDate.getValue().toString(),time);
        String billing = DatabaseConnection.getDatabase().getBillingString(rID.getText(),rOdoMeter.getText(), rTank.getText(), toDate.getValue().toString(),time);
        messageText.setText(billing);
        try {
            DatabaseConnection.getDatabase().InsertReturn(rID.getText(),rOdoMeter.getText(), rTank.getText(), toDate.getValue().toString(),time, price);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public void ReturnedVehicle(ActionEvent actionEvent) {
        TableView table = new TableView();
        table.setPrefWidth(700);
        Scene scene = new Scene(new Group());
        Stage stage = new Stage();
        stage.setTitle("Return");
        stage.setWidth(750);
        stage.setHeight(500);
        Label label = new Label("Return");

        //  rid int  NOT NULL, rdate DATE, rtime TIMESTAMP,
        //     odometer int, fulltank char(30),
        //valueit float(10)

        TableColumn vT = new TableColumn("Rent Id");
        vT.setCellValueFactory(new PropertyValueFactory<>("rid"));
        TableColumn vT1 = new TableColumn("Return Date");
        vT1.setCellValueFactory(new PropertyValueFactory<>("rdate"));
        TableColumn vT3 = new TableColumn("Return Time");
        vT3.setCellValueFactory(new PropertyValueFactory<>("rtime"));
        TableColumn vT4 = new TableColumn("Odometer");
        vT4.setCellValueFactory(new PropertyValueFactory<>("odometer"));
        TableColumn vT5 = new TableColumn("Fulltank");
        vT5.setCellValueFactory(new PropertyValueFactory<>("fulltank"));
        TableColumn vT6 = new TableColumn("Price");
        vT6.setCellValueFactory(new PropertyValueFactory<>("valueit"));

        table.getColumns().removeAll();
        table.getColumns().addAll(vT,vT1,vT3,vT4,vT5,vT6);
        for (Return object: DatabaseConnection.getDatabase().getReturn()) {
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
