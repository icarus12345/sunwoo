<?php

class supplier_model extends Core_Model {

    function __construct(){
        parent::__construct('_supplier','_','id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `_id`, 
                _title_{$this->lang} as _title,
                _desc_{$this->lang} as _desc,
                _alias_{$this->lang} as _alias,
                _image
                "
            ,false);
    }
    function getByType($type=null){
        if($type!=null)$this->db->where('_type',$type);
        $this->select();
        $query=$this->db
            ->from('_supplier')
            ->get(); 
        $this->sqlLog('getByType');
        return $this->fixData($query->result());
    }
    function onGet($id){
        $this->select();
        $query=$this->db
            ->from('_supplier')
            ->where('_id', $id)
            ->get(); 
        $this->sqlLog('onGet');
        return $this->fixData($query->row());
    }
}
?>
