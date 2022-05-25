<?php
/**
 * Created by PhpStorm.
 * User: Ashiraff
 * Company: Boosted Technologies LTD
 * Date: 7/19/21
 * Time: 9:29 AM
 */

class Model extends Controller {
    public MysqliDb $db;

    function __construct(){
        parent::__construct();
        //Db config
        global $database_config;
        $this->db = new MysqliDb($database_config['host'], $database_config['username'], $database_config['password'], $database_config['database']);
    }

    public function password_hash($string): bool|string
    {
        return hash('sha256', $string);
    }

    /**
     * @throws Exception
     */
    function check_url_for_duplicates($url, $table, $column) {
        $this->db->where($column,  $url);
        //$this->db->orderBy($column, 'desc');
        $query = $this->db->getOne($table, array($column));
        if (empty($query))
            $url = $url;
        else{
            $url_string = explode("-", $url);
            $url_counter = end($url_string);
            if (is_numeric($url_counter))
                $url_counter++;
            else
                $url_counter = $url_counter."-1";
            array_pop($url_string);
            $url_string[] = $url_counter;
            $url = implode("-", $url_string);
            echo 1;
            $url = $this->check_url_for_duplicates($url, $table, $column);
        }
        return $url;
    }

    /**
     * @throws Exception
     */
    function is_value_exists($table, $column, $data) {
        $this->db->where($column, $data);
        return $this->db->getValue($table, $column);
    }
}