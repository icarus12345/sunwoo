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
                _thumb
                "
            ,false);
    }
    function getByType($type=null){
        if($type!=null)$this->db->where('_type',$type);
        $this->select();
        $query=$this->db
            ->from('_data')
            ->get(); 
        $this->sqlLog('getByHeadId');
        return $this->fixData($query->result());
    }
    function onGet($id){
        $this->select();
        $query=$this->db
            ->from('_data')
            ->where('_id', $id)
            ->get(); 
        $this->sqlLog('getByHeadId');
        return $this->fixData($query->row());
    }
}
?>
