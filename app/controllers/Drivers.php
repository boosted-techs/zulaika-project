<?php

class Drivers extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Accounts_model");
        $this->model("Parking_model");
        $this->model("Car_model");
        $this->model("Drivers_model");
    }

    function index() {

    }

    function driver_look_up() {
        $this->model->Accounts_model->is_logged_in();
        echo json_encode($this->model->Drivers_model->get_driver_phone($this->inputs->get->no));
    }
}