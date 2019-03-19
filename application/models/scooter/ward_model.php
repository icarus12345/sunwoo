<?php

class ward_model extends Core_Model {

    function __construct(){
        parent::__construct('ward','','');
    }
    function get_by_district_id($district_id){
        $this->db->where('district_id',$district_id);
        return $this->onGets();
    }
}
?>
