<?php

class data_model extends Core_Model {

    function __construct(){
        parent::__construct('_data','_','id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `_id`, 
                _title_{$this->lang} as _title,
                _desc_{$this->lang} as _desc,
                _content_{$this->lang} as _content,
                
                "
            ,false);
    }
    function onGet($id){
        $this->select();
        return parent::onGet($id);
    }
}
?>
