<?php

use JetBrains\PhpStorm\ArrayShape;

class Car_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    #[ArrayShape(['message' => "string", "status" => "string"])] function add_car_type(): array
    {
        $car_type = trim($this->inputs->post("type"));
        $fees = trim($this->inputs->post("fees"));
        if (empty($car_type) or empty($fees))
            return ['message' => "Missing fields", "status" => "ERROR"];
        $car_type = strtoupper($car_type);
        $this->db->where("type", $car_type);
        $id = $this->db->getValue("car_types", "id");
        if ($id)
            return ['message' => $car_type . " Record exists", "status" => "ERROR"];
        $this->db->insert("car_types", ['type' => $car_type, "rate" => $fees]);
        return ['message' => $car_type . " Successfully added", "status" => "SUCCESS"];
    }

    /**
     * @throws Exception
     */
    function get_car_types(): MysqliDb|array|string
    {
        $this->db->orderBy("type", "asc");
        return $this->db->get("car_types", null, "type, deleted, rate, id");
    }

    /**
     * @throws Exception
     */
    #[ArrayShape(['message' => "string", "status" => "string"])] function delete_car_type($type): array
    {
        $this->db->where("id", $type);
        $data = $this->db->getOne("car_types", "id, deleted");
        if (empty($data))
            return ['message' => "Car type doesn't exist", "status" => "ERROR"];
        $deleted = $data['deleted'] == 0 ? 1 : 0;
        $this->db->where("id", $data['id']);
        $this->db->update("car_types", ['deleted' => $deleted]);
        return ['message' => " Car type successfully updated.", "status" => "SUCCESS"];
    }

    /**
     * @throws Exception
     */
    function get_cars($reg = false): MysqliDb|array|string
    {
        if ($reg)
            $this->db->where("reg_no",         strtoupper(str_replace(" ", "", trim($reg))));
        $this->db->join("car_types", "car_types.id = cars.car_type", 'left');
        $data = $this->db->get("cars", null, "cars.id, description, reg_no,cars.date_added, car_types.id as type,rate, car_types.type as car_type");
        return empty($data) ? false : $data;
    }
}