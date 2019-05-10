<?php

class setting_model extends Core_Model {

    function __construct(){
        parent::__construct('setting','_','id');
    }
    function getByName($name=''){
        $query=$this->db
            ->from($this->table)
            ->where('_name',$name)
            ->get(); 
        return $query->row();
    }
    function getByType($type=''){
        $query=$this->db
            ->from($this->table)
            ->where('_type',$type)
            ->get(); 
        $tmp = $query->result();
        foreach ($tmp as $r){
            $data[$r->name] = $r;
        }
        return $data;
    }
}
?>
