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
        return $this->db->get("parking_slots", null, "date_added, label, deleted, id, (select status from bookings where slot = parking_slots.id and status = 1) as slot_state");
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

        $user_id = $this->inputs->post("user_id");
        $car_id = $this->inputs->post("car_id");
        if ($user_id) {
            $client = $user_id;
            $names = true;
        }
        if (empty($phone) or empty($names) or empty($car_reg))
            return ['message' => "Phone number or client names or Car registration number should be left out", "status" => "ERROR"];
        $this->db->where("slot", $slot);
        $this->db->where("status", 1);
        if ($this->db->getValue("bookings", 'id'))
            return ['message' => "Parking slot occupied already", "status" => "ERROR"];

        if (empty($car_id))
            $car = $this->db->insert("cars", ['reg_no' => $car_reg, 'date_added' => $date, "car_type" => $type, "description" => $description]);
        else
            $car = $car_id;
        if (empty($user_id))
        $client = $this->db->insert("driver", ['names' => $names, 'phone_number' => $phone, 'email' => $email, 'residence' => $address, 'date_added' => $date, 'gender' => $gender]);

        $this->db->insert("bookings", [
            'slot' => $slot,
            'car' => $car,
            'user' => $client,
            'date_added' => $date,
            'on_time' => date("Y-m-d H:i:s"),
            'off_time' => date("Y-m-d H:i:s"),
            'status' => 1
        ]);
        return ['message' => "Parking record successfully added", "status" => "SUCCESS"];
    }

    /**
     * @throws Exception
     */
    function get_bookings($id = false): MysqliDb|array|string
    {
        if ($id)
            $this->db->where("bookings.id", $id);
        $this->db->orderBy("bookings.id", 'desc');
        $this->db->orderBy("bookings.status", 'desc');
        $this->db->orderBy("bookings.date_added", 'desc');
        $this->db->join("cars", "cars.id = bookings.car", 'left');
        $this->db->join("car_types", "car_types.id = cars.car_type", 'left');
        $this->db->join("driver", "driver.id = bookings.user", "left");
        return $this->db->get("bookings", null, "bookings.id, bookings.status, bookings.date_added, bookings.on_time,
        bookings.off_time, cars.description, hours, cars.reg_no,(select label from parking_slots where id = bookings.slot) as slot,  car_types.type, car_types.rate, names, phone_number, residence, gender");
    }

    /**
     * @throws Exception
     */
    #[ArrayShape(['message' => "string", "status" => "string"])] function checkout($slot): array
    {
        $this->db->where("id", $slot);
        $on_time = strtotime($this->db->getValue("bookings", 'on_time'));
        $off_time = strtotime(date("Y-m-d H:i:s"));
        $hours = round((($off_time - $on_time) / 3600), 4);
        $this->db->update("bookings", ["status" => 0, 'off_time' => $off_time, "hours" => $hours]);
        return ['message' => "Checkout Successful", "status" => "SUCCESS"];
    }

    /**
     * @throws Exception
     */
    #[ArrayShape(['cars' => "array|mixed|null", 'slots' => "array|null|string", 'users' => "array|mixed|null", "amount" => "float|int"])] function get_statics(): array
    {
        $all_cars = $this->db->getValue("bookings", "count(id)");
        /*
         * ALl parking slots
         */
        $this->db->where("deleted", 0);
        $slots = $this->db->getOne("parking_slots", "count(id) as slots, (select count(id) from bookings where status = 1) as booked");
        /*
         * Users
         */
        $users = $this->db->getValue("driver", "count(id)");
        /*
         * Costs
         */
        $this->db->where("status", 0);
        $amount = $this->db->get("bookings",null, "(hours * (select rate from car_types where id = (select car_type from cars where id = bookings.car))) as cost");
        $cost = 0;
        foreach($amount as $i)
            $cost += round($i['cost'],2);
        return ['cars' => $all_cars, 'slots' => $slots, 'users' => $users, "amount" => number_format($cost, 2)];
    }
}