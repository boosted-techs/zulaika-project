<?php

class Drivers_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    function get_driver_phone($phone): array|string|null
    {
        if (empty($phone))
            return false;
        $this->db->where("phone_number", $phone);
        return $this->db->getOne("driver", "id, names, phone_number, email, gender, residence");
    }

}