<?php

class Home extends Controller
{
    function __construct()
    {
        parent::__construct();
        $this->model("Accounts_model");
    }

    function index() {
        $this->smarty->display("login.tpl");
    }

    function forgot_password() {

    }

    function sign_in() {
        //echo hash("sha256", "123456");

        $data = $this->model->Accounts_model->auth_user();
        if (empty($data))
            $this->redirect("/?error=1&email=" . trim($this->inputs->post("email")));
        else {
            $this->session->set_user_data("user", $data['id']);
            $this->session->set_user_data("names", $data['names']);
            $this->session->set_user_data("mail", $data['email']);
            $this->redirect("/dashboard");
        }
    }

    function logout() {
        $this->session->destroy();
        $this->redirect("/");
    }

}