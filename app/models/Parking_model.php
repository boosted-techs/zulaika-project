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
    #[ArrayShape(['message' => "string", "status" => "string"])] function add_slot(): array
    {
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

    /**
     * @throws Exception
     */
    #[ArrayShape(['message' => "string", "status" => "string"])] function reserve(): array
    {
        $phone = trim($this->inputs->post("phone"));
        $names = trim($this->inputs->post("names"));
        $email = trim($this->inputs->post("email"));
        $address= trim($this->inputs->post("address"));
        $gender = trim($this->inputs->post("gender"));
        $car_reg = strtoupper(str_replace(" ", "", trim($this->inputs->post(("car")))));
        $type = trim($this->inputs->post("type"));
        $description = trim($this->inputs->post("description"));
        $slot = trim($this->inputs->post("slot"));
        $date = date("Y-m-d");
        if (empty($phone) or empty($names) or empty($car_reg))
            return ['message' => "Phone number or client names or Car registration number should be left out", "status" => "ERROR"];
        $this->db->where("slot", $slot);
        $this->db->where("status", 1);
        if ($this->db->getValue("bookings", 'id'))
            return ['message' => "Parking slot occupied already", "status" => "ERROR"];

        $car = $this->db->insert("cars", ['reg_no' => $car_reg, 'date_added' => $date, "car_type" => $type, "description" => $description]);
        $client = $this->db->insert("driver", ['names' => $names, 'phone_number' => $phone, 'email' => $email, 'residence' => $address, 'date_added' => $date, 'gender' => $gender]);
        $this->db->insert("bookings", [
            'slot' => $slot,
            'car' => $car,
            'user' => $client,
            'date_added' => $date,
            'on_time' => date("H:i:s"),
            'off_time' => date("H:i:s"),
            'status' => 1
        ]);
        return ['message' => "Parking record successfully added", "status" => "SUCCESS"];
    }

    /**
     * @throws Exception
     */
    function get_bookings(): MysqliDb|array|string
    {
        $this->db->orderBy("bookings.id", 'desc');
        $this->db->orderBy("bookings.status", 'desc');
        $this->db->orderBy("bookings.date_added", 'desc');
        $this->db->join("cars", "cars.id = bookings.car", 'left');
        $this->db->join("car_types", "car_types.id = cars.car_type", 'left');
        $this->db->join("driver", "driver.id = bookings.user", "left");
        return $this->db->get("bookings", null, "bookings.id, bookings.status, bookings.date_added, bookings.on_time,
        bookings.off_time, cars.description, cars.reg_no,(select label from parking_slots where id = bookings.slot) as slot,  car_types.type, car_types.rate, names, phone_number, residence, gender");
    }
}