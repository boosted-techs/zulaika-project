<?php

class Dashboard extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Accounts_model");
        $this->model("Parking_model");
        $this->model("Car_model");
    }

    /**
     * @throws SmartyException
     */
    function index() {
        $this->model->Accounts_model->is_logged_in();
        $this->smarty->assign("car_types", $this->model->Car_model->get_car_types());
        $this->smarty->assign("slots", $this->model->Parking_model->get_slots());
        $this->smarty->assign("bookings", $this->model->Parking_model->get_bookings());
        $this->smarty->display("home.tpl");
    }

    /**
     * @throws SmartyException
     */
    function parking_slots() {
        $this->model->Accounts_model->is_logged_in();
        $this->smarty->assign("slots", $this->model->Parking_model->get_slots());
        $this->smarty->display("slots.tpl");
    }

    /**
     * @throws SmartyException
     */
    function clients() {
        $this->model->Accounts_model->is_logged_in();
        $this->smarty->display("clients.tpl");
    }

    /**
     * @throws SmartyException
     */
    function cars() {
        $this->model->Accounts_model->is_logged_in();
        $this->smarty->assign("car_types", $this->model->Car_model->get_car_types());
        $this->smarty->display("cars.tpl");
    }

    function add_slot() {
        $this->model->Accounts_model->is_logged_in();
        $response = $this->model->Parking_model->add_slot();
        $this->redirect("/parking-slots?m=" . str_replace(" ", "%20", $response['message']) . "&s=" . $response['status']);
    }

    function delete_slot($slot) {
        $this->model->Accounts_model->is_logged_in();
        $response = $this->model->Parking_model->delete_slot($slot);
        $this->redirect("/parking-slots?m=" . str_replace(" ", "%20", $response['message']) . "&s=" . $response['status']);
    }

    function add_car_type() {
        $this->model->Accounts_model->is_logged_in();
        $response = $this->model->Car_model->add_car_type();
        $this->redirect("/cars?m=" . str_replace(" ", "%20", $response['message']) . "&s=" . $response['status']);
    }

    function delete_car_type($type) {
        $this->model->Accounts_model->is_logged_in();
        $response = $this->model->Car_model->delete_car_type($type);
        $this->redirect("/cars?m=" . str_replace(" ", "%20", $response['message']) . "&s=" . $response['status']);
    }
}