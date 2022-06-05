<?php

class Bookings extends Controller
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

    function reserve() {
        $this->model->Accounts_model->is_logged_in();
        $response = $this->model->Parking_model->reserve();
        $this->redirect("/dashboard?m=" . str_replace(" ", "%20", $response['message']) . "&s=" . $response['status']);
    }

    function checkout($slot) {
        $this->model->Accounts_model->is_logged_in();
        $response = $this->model->Parking_model->checkout($slot);
        $this->redirect("/dashboard?m=" . str_replace(" ", "%20", $response['message']) . "&s=" . $response['status']);
    }

}