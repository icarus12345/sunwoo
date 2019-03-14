<?php

class cate_model extends Core_Model {

    function __construct(){
        parent::__construct('cate', 'cat_', 'id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `cat_id`, 
                `cat_title_{$this->lang}` as cat_title, 
                `cat_thumb`, 
                `cat_desc_{$this->lang}` as cat_desc, 
                `cat_parent`, 
                `cat_status`, 
                `cat_position`, 
                `cat_link`, 
                `cat_type`, 
                `cat_insert`, 
                `cat_update`, 
                `cat_lock`, 
                `cat_value`, 
                `cat_image`, 
                `cat_alias_{$this->lang}` as cat_alias, 
                `cat_cover`
                "
            ,false);
    }
    function onGetByAlias($alias){
        $this->select();
        return parent::onGetByAlias($alias);
    }
    function onGet($id){
        $this->select();
        return parent::onGet($id);
    }
    function getCategoryByType($type=null){
        if($type!=null)$this->db->where('cat_type',$type);
        $this->select();
        $query=$this->db
            ->from('cate')
            ->order_by('cat_parent','ASC')
            ->order_by('cat_position','ASC')
            ->order_by('cat_insert','ASC')
            ->get(); 
        $this->sqlLog('getCategoryByType');
        return $query->result();
    }
}
?>
