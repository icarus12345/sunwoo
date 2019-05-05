<?php

class cate_model extends Core_Model {

    function __construct(){
        parent::__construct('_cate', '_', 'id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `_id`, 
                `_title_{$this->lang}` as _title, 
                `_desc_{$this->lang}` as _desc, 
                `_value`, 
                `_alias_{$this->lang}` as _alias, 
                `_parent_id`,
                _image,
                _cover
                "
            ,false);
    }
    function onGetByAlias($alias=''){
        $this->select();
        $query = $this->db
            ->from('_cate')
            ->where('_status', '1')
            ->where("`_alias_{$this->lang}`", $alias)
            ->get();
        $this->sqlLog('onGetByAlias');

        return $query->row();
    }
    function onGet($id){
        $this->select();
        return parent::onGet($id);
    }
    function getCategoryByType($type=null){
        if($type!=null)$this->db->where('_type',$type);
        $this->select();
        $query=$this->db
            ->from('_cate')
            ->order_by('_parent_id','ASC')
            ->order_by('_ordering','ASC')
            ->order_by('_created_at','ASC')
            ->get(); 
        $this->sqlLog('getCategoryByType');
        return $query->result();
    }
    function getCategoryByParrent($pid=null,$type = 'default'){
        if($type!==null) $this->db->where('_type',$type);
        if($pid!==null)$this->db->where('_parent_id',$pid);
        $this->select();
        $query=$this->db
            ->from('_cate')
            // ->order_by('_parent_id','ASC ')
            ->order_by('_ordering','DESC')
            // ->order_by('_created_at','ASC')
            ->get(); 
        $this->sqlLog('getCategoryByType');
        return $query->result();
    }
    function buildTree(array $elements, $parentId = 0,$parents=array(0)) {
        $branch = array();
        foreach ($elements as $element) {
            if ($element->_parent_id == $parentId) {
                $tmp=$parents;$tmp[]=$element->_id;
                $children = $this->buildTree($elements, $element->_id,$tmp);
                if ($children) {
                    $element->children = $children;
                }
                $element->parents=$parents;
                $branch[] = $element;
            }
        }
        return $branch;
    }
}
?>
