<?php

class district_model extends Core_Model {

    function __construct(){
        parent::__construct('district','','');
    }
    function get_by_province_id($province_id){
        $this->db->where('province_id',$province_id);
        return $this->onGets();
    }
}
?>
