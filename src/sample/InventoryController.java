package sample;

import javafx.beans.property.StringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import sample.model.Billing;
import sample.model.Client;
import sample.model.Postgresql;
import sample.model.Pumpcrete;

import javax.swing.*;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ResourceBundle;

public class InventoryController extends Controller implements Initializable {
    private Stage stage;
    private Parent root;
    private Scene scene;
    private FXMLLoader loader;
    public Postgresql postgresql;
    public static Connection con;
    public Controller Controller;
    public static long selectedID =0;
    @FXML
    private TableView inventory_tb;
    @FXML
    private TableView inventory_tb1;

    @FXML
    private TableColumn<Pumpcrete, Long> p_idColumn;
    @FXML
    private TableColumn<Pumpcrete, String> descColumn;
    @FXML
    private TableColumn<Pumpcrete, String> plateColumn;
    @FXML
    private TableColumn<Pumpcrete, String> cidColumn;

    @FXML
    private TableColumn<Pumpcrete, Long> p_idColumn1;
    @FXML
    private TableColumn<Pumpcrete, Boolean> statusColumn1;
    @FXML
    private TableColumn<Pumpcrete, LocalDate> dateColumn1;
    @FXML
    private TableColumn<Pumpcrete, String> descColumn1;
    @FXML
    private TableColumn<Pumpcrete, String> cidColumn1;
    @FXML
    private TableColumn<Pumpcrete, String> plateColumn1;
    @FXML
    private TableColumn<Pumpcrete, String> fuelColumn1;
    @FXML
    private TableColumn<Pumpcrete, Long> crColumn1;
    @FXML
    private TableColumn<Pumpcrete, Long> orColumn1;
    @FXML
    private TableColumn<Pumpcrete, Integer> tiresColumn1;

    @FXML
    private Button inventory_create_btn;
    @FXML
    private Button inventory_back_btn;
    @FXML
    private Button inventory_edit_btn;
    @FXML
    private Button inventory_delete_btn;

    @FXML
    private ImageView inventory_2img;

    @FXML
    private JOptionPane optionPane;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        postgresql = new Postgresql();

        inventory_tb.setItems(postgresql.getAllinventory(Controller.con));
        
        p_idColumn.setCellValueFactory(new PropertyValueFactory<Pumpcrete, Long>("id"));
        descColumn.setCellValueFactory(new PropertyValueFactory<Pumpcrete, String >("description"));
        plateColumn.setCellValueFactory(new PropertyValueFactory<Pumpcrete, String>("plate_no"));

        inventory_tb.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
    }

    @FXML
    private void handleAction(ActionEvent e) throws IOException, SQLException {
        postgresql = new Postgresql();
        Alert errorAlert = new Alert(Alert.AlertType.ERROR);

        //edit
        if (e.getSource() == inventory_edit_btn) {
            stage = (Stage) inventory_edit_btn.getScene().getWindow();
            loader = new FXMLLoader(getClass().getResource("inventoryEdit.fxml"));
            root = loader.load();
            scene = new Scene(root);
            stage.setScene(scene);
            stage.setResizable(false);
            stage.show();
        }

        //delete selected rows
        if (e.getSource() == inventory_delete_btn) {
            ObservableList<Pumpcrete> p = FXCollections.observableArrayList();
            p = inventory_tb.getSelectionModel().getSelectedItems();
            int i = 0;
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION, "Do you want to delete selected items?", ButtonType.YES, ButtonType.NO);
            alert.showAndWait();

            if (alert.getResult() == ButtonType.YES) {
                while (i < p.size()) {
                    postgresql.deletePumpcrete(Controller.con, p.get(i++).getId());
                }

                inventory_tb.getItems().removeAll(inventory_tb.getSelectionModel().getSelectedItems());

            }
        }

        //add billing
        if (e.getSource() == inventory_create_btn) {
            stage = (Stage) inventory_create_btn.getScene().getWindow();
            loader = new FXMLLoader(getClass().getResource("inventoryCreate.fxml"));
            root = loader.load();
            scene = new Scene(root);
            stage.setScene(scene);
            stage.setResizable(false);
            stage.show();
        }

        //back to dashboard
        if (e.getSource() == inventory_back_btn) {
            switch (postgresql.getRole(Controller.con)) {
                case "Staff":
                case "staff":
                    stage = (Stage) inventory_back_btn.getScene().getWindow();
                    loader = new FXMLLoader(getClass().getResource("homeStaff.fxml"));
                    root = loader.load();
                    scene = new Scene(root);
                    stage.setScene(scene);
                    stage.setResizable(false);
                    stage.show();
                    break;
                case "Admin":
                case "admin":
                    stage = (Stage) inventory_back_btn.getScene().getWindow();
                    FXMLLoader loader = new FXMLLoader(getClass().getResource("homeAdmin.fxml"));
                    root = loader.load();
                    scene = new Scene(root);
                    stage.setScene(scene);
                    stage.setResizable(false);
                    stage.show();
                    break;
                case "Supervisor":
                case "supervisor":
                    stage = (Stage) inventory_back_btn.getScene().getWindow();
                    loader = new FXMLLoader(getClass().getResource("homeStaff.fxml"));
                    root = loader.load();
                    scene = new Scene(root);
                    stage.setScene(scene);
                    stage.setResizable(false);
                    stage.show();
                    break;
                default:
                    errorAlert.setHeaderText("Input not valid");
                    errorAlert.setContentText("Invalid Role.");
                    errorAlert.showAndWait();
                    break;

            }
        }
    }


    @FXML
    private void handleMouseAction(MouseEvent e) throws IOException, SQLException {

        inventory_tb.setOnMouseClicked((MouseEvent event) -> {
            if (event.getButton().equals(MouseButton.PRIMARY)) {
                Pumpcrete p = (Pumpcrete) inventory_tb.getSelectionModel().getSelectedItem();
                selectedID = p.getId();
                System.out.println(selectedID); //test
                inventory_2img.setVisible(true);
                inventory_edit_btn.setVisible(true);
                inventory_delete_btn.setVisible(true);

                inventory_tb1.setItems(inventory_tb.getSelectionModel().getSelectedItems());
                p_idColumn1.setCellValueFactory(new PropertyValueFactory<Pumpcrete, Long>("id"));
                descColumn1.setCellValueFactory(new PropertyValueFactory<Pumpcrete, String >("description"));
                plateColumn1.setCellValueFactory(new PropertyValueFactory<Pumpcrete, String>("plate_no"));
                fuelColumn1.setCellValueFactory(new PropertyValueFactory<Pumpcrete, String>("fuel_type"));
                dateColumn1.setCellValueFactory(new PropertyValueFactory<Pumpcrete, LocalDate>("purchase_date"));
                crColumn1.setCellValueFactory(new PropertyValueFactory<Pumpcrete, Long>("cr_no"));
                orColumn1.setCellValueFactory(new PropertyValueFactory<Pumpcrete, Long>("or_no"));
                tiresColumn1.setCellValueFactory(new PropertyValueFactory<Pumpcrete, Integer>("tires"));
            }
        });

        inventory_tb.setOnMouseExited((MouseEvent event) -> {
            if (event.getButton().equals(MouseButton.PRIMARY)) {
                Pumpcrete p = (Pumpcrete) inventory_tb.getSelectionModel().getSelectedItem();
                System.out.println(inventory_tb.getSelectionModel().getSelectedItem()); //test
                selectedID =0;
                inventory_tb.getItems().removeAll();
                inventory_2img.setVisible(false);
                inventory_edit_btn.setVisible(false);
            }
        });
    }
    public static long getSelectedID() {
        return selectedID;
    }
}

