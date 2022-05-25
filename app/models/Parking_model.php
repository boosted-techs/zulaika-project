<?php

use JetBrains\PhpStorm\ArrayShape;

class Parking_model extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     * @throws Exception
     */
    #[ArrayShape(['message' => "string", "status" => "string"])] function add_slot() {
        $label = trim($this->inputs->post("label"));
        if (empty($label))
            return ['message' => "Empty field", "status" => "ERROR"];
        $label = strtoupper($label);
        $this->db->where("label", $label);
        $id = $this->db->getValue("parking_slots", "id");
        if ($id)
            return ['message' => "Parking slot exists", "status" => "ERROR"];
        $this->db->insert("parking_slots", ['label' => $label, "date_added" => date("Y-m-d")]);
        return ['message' => $label . " Slot successfully added.", "status" => "SUCCESS"];
    }

    /**
     * @throws Exception
     */
    function get_slots(): MysqliDb|array|string
    {
        return $this->db->get("parking_slots", null, "date_added, label, deleted, id");
    }

    /**
     * @throws Exception
     */
    #[ArrayShape(['message' => "string", "status" => "string"])] function delete_slot($slot): array
    {
        $this->db->where("id", $slot);
        $slot = $this->db->getOne("parking_slots", "id, deleted");
        if (empty($slot))
            return ['message' => "Parking slot exists", "status" => "ERROR"];
        $deleted = $slot['deleted'] == 0 ? 1 : 0;
        $this->db->where("id", $slot['id']);
        $this->db->update("parking_slots", ['deleted' => $deleted]);
        return ['message' => " Slot successfully updated.", "status" => "SUCCESS"];
    }
}