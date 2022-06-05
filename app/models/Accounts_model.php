<?php

class Accounts_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function auth_user(): array|string|null
    {
//        print_r($_POST);
        //echo $this->password_hash("!tnionline@2020");
        $this->db->where("email", trim($this->inputs->post("email")));
        $this->db->where("password", $this->password_hash($this->inputs->post("password")));
        return $this->db->getOne("users", "id, names, email");
    }

    function is_logged_in(): bool
    {
        if (empty($this->session->data("user")))
            $this->redirect("/");
        return true;
    }

    /**
     * @throws Exception
     */
    function get_clients(): MysqliDb|array|string
    {
        return $this->db->get("driver", null, "names, email, phone_number, date_added, residence, gender, (select count(id) from bookings where user = driver.id) as bookings");
    }
}