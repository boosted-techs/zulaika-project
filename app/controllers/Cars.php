<?php

class Cars extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Accounts_model");
        $this->model("Parking_model");
        $this->model("Car_model");
        $this->model("Drivers_model");
    }

    function car_look_up() {
        $this->model->Accounts_model->is_logged_in();
        $reg = $this->inputs->get("no") ?? 11;
        echo json_encode($this->model->Car_model->get_cars(reg : $reg));
    }

}