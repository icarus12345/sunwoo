<?php

class cate_model extends Core_Model {

    function __construct(){
        parent::__construct('_cate', '_', 'id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `{$this->prefix}id`, 
                `{$this->prefix}title_{$this->lang}` as {$this->prefix}title,
                `{$this->prefix}desc_{$this->lang}` as {$this->prefix}desc, 
                `{$this->prefix}parent_id`, 
                `{$this->prefix}status`, 
                `{$this->prefix}ordering`, 
                `{$this->prefix}type`, 
                `{$this->prefix}created_at`, 
                `{$this->prefix}modified_at`, 
                `{$this->prefix}readobly`, 
                `{$this->prefix}value`, 
                `{$this->prefix}image`, 
                `{$this->prefix}alias_{$this->lang}` as {$this->prefix}alias, 
                `{$this->prefix}cover`
                "
            ,false);
    }
    function getCategoryByType($type=null){
        $this->select();
        if($type!=null)$this->db->where('type',$type);
        $query=$this->db
            ->from($this->table)
            ->order_by('_parent_id','ASC')
            ->order_by('_ordering','ASC')
            ->order_by('_created_at','ASC')
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
    function buildTreeArray(array $elements, $parentId = 0,$level=0,$parent_title='',$path='',$new_value='') {
        if($parentId==0){
            for ($i=0;$i<count($elements);$i++) {
                $f=false;
                
                for ($j=0;$j<count($elements);$j++) {
                    if( 
                        $elements[$i]->_parent_id==$elements[$j]->_id &&
                        $elements[$i]->_type==$elements[$j]->_type
                    ){
                        $f=true;
                        break;
                    }
                }
                if($f==false){
                    $elements[$i]->_parent_id=0;
                    $elements[$i]->_parent_title='';
                    $elements[$i]->new_value='';
                    $elements[$i]->error='parent not exist';
                    $elements[$i]->path='';
                }
                if($elements[$i]->_parent_id==$elements[$i]->id){
                    $elements[$i]->_parent_id=0;
                    $elements[$i]->_parent_title='';
                    $elements[$i]->new_value='';
                    $elements[$i]->path='';
                    $elements[$i]->error=2;
                }
            }
        }
        $branch = array();
        foreach ($elements as $element) {
            if ($element->_parent_id == $parentId) {
                $element->_level=$level;$element->_parent_title=$parent_title;
                $element->display=repeater('----',$level).$element->_title;
                $element->display=$path."/".$element->_title;
                $element->new_value=$new_value.">".$element->_id;
                $element->isparent = 0;
                $children = $this->buildTreeArray($elements, $element->_id,$level+1,$element->_title,$path.'/'.$element->_title,$element->new_value);
                if (!empty($children)) $element->isparent = 1;
                $branch[] = $element;
                if (!empty($children)){

                    foreach ($children as $ch){
                        $branch[] = $ch;
                    }
                }
            }
        }
        return $branch;
    }
    function binding($type=null,$lang='en'){
        $where = "WHERE TRUE";
        if ($type!==null)
            $where = "WHERE `_type` = '$type'";
        
        $this->datatables_config = array(
            "table" => "`_cate`",
            "select" => "SELECT SQL_CALC_FOUND_ROWS _id, _title_{$this->lang} as _title,_value,_parent_id,_status",
            "from" => "FROM `_cate`",
            "where" => "$where",
            "order_by" => "ORDER BY `_parent_id` ASC, `_ordering` ASC, `_created_at` ASC",
            "filterfields"=>array('_title'),
            "columnmaps" => array(
                '_title'=>"_title_{$this->lang}"
            )
        );
        return $this->databinding();
    }
    function updateNodeByParent($Parent=0,$NewParent=0){
        $this->db->set('_modified_at', 'NOW()', FALSE);
        $this->db->where('_parent_id', $Parent);
        @$this->db->update('_cate', array('_parent_id'=>$NewParent));
        $this->sqlLog('updateNodeByParent');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count > 0)
            return true;
        return false;
    }
}
?>
