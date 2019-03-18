<?php

class line_model extends Core_Model {

    function __construct(){
        parent::__construct('_line','_','id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `_id`, 
                _title_{$this->lang} as _title,
                _desc_{$this->lang} as _desc,
                "
            ,false);
    }
    function getByHeadId($head_id=null){
        if($head_id!=null)$this->db->where('_head_id',$head_id);
        $this->select();
        $query=$this->db
            ->from('_line')
            ->get(); 
        $this->sqlLog('getByHeadId');
        return $query->result();
    }
}
?>
