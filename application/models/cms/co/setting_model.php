<?php

class setting_model extends Core_Model {

    function __construct(){
        parent::__construct('_setting','setting_','id');
    }
    function onGetByName($name=''){
        $query=$this->db
            ->from('_setting')
            ->where('setting_name',$name)
            ->get();
        return $query->row();
    }
}
?>