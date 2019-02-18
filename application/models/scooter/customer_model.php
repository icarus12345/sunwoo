<?php

class customer_model extends Core_Model {

    function __construct(){
        parent::__construct('customer','','Id');
    }
    function getByName($name=''){
        $query=$this->db
            ->from($this->table)
            ->where('Name',$name)
            ->get(); 
        return $query->row();
    }
    function getByType($type=''){
        $query=$this->db
            ->from($this->table)
            ->where('Type',$type)
            ->get(); 
        $tmp = $query->result();
        return $tmp;
    }
    function checkExists($params){
        $this->db->where('Email',$params['Email']);
        $this->db->where('Type',$params['Type']);
        $query = $this->db->get($this->table);
        if ($query->num_rows() > 0){
            return true;
        }
        else{
            return false;
        }
    }
    function onGetByEmail($params){
        $this->db->where('Email',$params['Email']);
        $this->db->where('Type',$params['Type']);
        $query = $this->db->get($this->table);
        return $query->row();
    }
}
?>
