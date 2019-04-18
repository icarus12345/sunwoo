<?php

class supplier_model extends Core_Model {

    function __construct(){
        parent::__construct('_supplier','_','id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `_id`, 
                `_title_{$this->lang}` as _title, 
                `_desc_{$this->lang}` as _desc, 
                `_status`, 
                `_ordering`, 
                `_created_at`, 
                `_modified_at`
                "
            ,false);
    }
    function onGetByType($type){
        $this->select();
        return parent::onGetByType($type);
    }
}
?>
