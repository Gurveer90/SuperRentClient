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
import packagesuperrent.classes.Customer;
import packagesuperrent.classes.VehicleType;
import packagesuperrent.database.DatabaseConnection;
public class ManageCustomerController {
    @FXML
    TextField dlicense;
    @FXML
    TextField cellphone;
    @FXML
    TextField cname;
    @FXML
    TextField caddress;
    @FXML
    TextField cdlicense;
    public void AddCustomer(ActionEvent actionEvent) {
       Customer obj = new Customer(dlicense.getText(), cellphone.getText(), cname.getText(), caddress.getText());
        DatabaseConnection.getDatabase().insertCustomer(obj);
    }

    public void DisplayCustomer(ActionEvent actionEvent) {
        TableView table = new TableView();
        Scene scene = new Scene(new Group());
        Stage stage = new Stage();
        stage.setTitle("Customers");
        stage.setWidth(900);
        stage.setHeight(500);
        Label label = new Label("Customer");
        TableColumn vT = new TableColumn("Driver License");
        vT.setCellValueFactory(new PropertyValueFactory<>("dlicense"));
        TableColumn vT1 = new TableColumn("Cellphone");
        vT1.setCellValueFactory(new PropertyValueFactory<>("cellphone"));
        TableColumn vT2 = new TableColumn("Customer Name");
        vT2.setCellValueFactory(new PropertyValueFactory<>("cname"));
        TableColumn vT3 = new TableColumn("Customer Address");
        vT3.setCellValueFactory(new PropertyValueFactory<>("caddress"));
        table.getColumns().removeAll();
        table.getColumns().addAll(vT,vT1,vT2,vT3);
        for (Customer object: DatabaseConnection.getDatabase().getCustomer()) {
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

    public void DeleteCustomer(ActionEvent actionEvent) {
        DatabaseConnection.getDatabase().deleteCustomer(cdlicense.getText());

    }
}
