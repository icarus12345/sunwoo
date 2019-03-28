<?php

class data_model extends Core_Model {

    function __construct(){
        parent::__construct('_data','data_','id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `data_id`, 
                data_title_{$this->lang} as data_title,
                data_desc_{$this->lang} as data_desc,
                data_content_{$this->lang} as data_content,
                
                "
            ,false);
    }
    function onGet($id){
        $this->select();
        return parent::onGet($id);
    }
}
?>
