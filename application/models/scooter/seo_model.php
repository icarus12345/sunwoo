<?php

class seo_model extends Core_Model {

    function __construct(){
        parent::__construct('_seo','_','id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `_id`, 
                `_title_{$this->lang}` as _title, 
                `_desc_{$this->lang}` as _desc, 
                `_keyword_{$this->lang}` as _keyword, 
                `_image`, 
                `_created_at`, 
                `_modified_at`
                "
            ,false);
    }
    function onGetByType($type){
        $this->select();
        return parent::onGetByType($type);
    }
    function onGetByHead($type,$head_id){
        $this->select();
        $query = $this->db
                ->where("{$this->prefix}type", $type)
                ->where("{$this->prefix}head_id", $head_id)
                ->get($this->table);
        $this->sqlLog('Get Entry');
        return $query->row();
    }
    function onInsert($params) {
        
        @$this->db->insert($this->table, $params);
        $this->sqlLog('Insert Entry');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
    function onUpdate($id, $params) {
        $this->db->where("$this->prefix$this->colid", $id);
        @$this->db->update($this->table, $params);
        $this->sqlLog('Update Entry');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count == 1)
            return true;
        return false;
    }
}
?>
