<?php

class cate_model extends Core_Model {

    function __construct(){
        parent::__construct('cate', 'cat_', 'id');
    }
    function getCategoryByType($type=null){
        if($type!=null)$this->db->where('cat_type',$type);
        $query=$this->db
            ->from('cate')
            ->order_by('cat_parent','ASC')
            ->order_by('cat_position','ASC')
            ->order_by('cat_insert','ASC')
            ->get(); 
        $this->sqlLog('getCategoryByType');
        return $query->result();
    }
    function buildTree(array $elements, $parentId = 0,$parents=array(0)) {
        $branch = array();
        foreach ($elements as $element) {
            if ($element->cat_parent == $parentId) {
                $tmp=$parents;$tmp[]=$element->cat_id;
                $children = $this->buildTree($elements, $element->cat_id,$tmp);
                if ($children) {
                    $element->cat_children = $children;
                }
                $element->cat_parents=$parents;
                $branch[] = $element;
            }
        }
        return $branch;
    }
    function buildTreeArray(array $elements, $parentId = 0,$level=0,$parent_title='',$path='',$value='') {
        if($parentId==0){
            for ($i=0;$i<count($elements);$i++) {
                $f=false;
                
                for ($j=0;$j<count($elements);$j++) {
                    if( 
                        $elements[$i]->cat_parent==$elements[$j]->cat_id &&
                        $elements[$i]->cat_type==$elements[$j]->cat_type
                    ){
                        $f=true;
                        break;
                    }
                }
                if($f==false){
                    $elements[$i]->cat_parent=0;
                    $elements[$i]->cat_parent_title='';
                    $elements[$i]->value='';
                    $elements[$i]->cat_error='parent not exist';
                    $elements[$i]->cat_path='';
                }
                if($elements[$i]->cat_parent==$elements[$i]->cat_id){
                    $elements[$i]->cat_parent=0;
                    $elements[$i]->cat_parent_title='';
                    $elements[$i]->value='';
                    $elements[$i]->cat_path='';
                    $elements[$i]->cat_error=2;
                }
            }
        }
        $branch = array();
        foreach ($elements as $element) {
            if ($element->cat_parent == $parentId) {
                $element->cat_level=$level;$element->cat_parent_title=$parent_title;
                $element->cat_display=repeater('----',$level).$element->cat_title;
                $element->cat_display=$path."/".$element->cat_title;
                $element->value=$value.">".$element->cat_id;
                $element->isparent = 0;
                $children = $this->buildTreeArray($elements, $element->cat_id,$level+1,$element->cat_title,$path.'/'.$element->cat_title,$element->value);
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
            $where = "WHERE `cat_type` = '$type'";
        
        $this->datatables_config = array(
            "table" => "`cate`",
            "select" => "SELECT SQL_CALC_FOUND_ROWS `cate`.*",
            "from" => "FROM `cate`",
            "where" => "$where",
            "order_by" => "ORDER BY `cat_parent` ASC, `cat_position` ASC, `cat_insert` ASC",
            "filterfields"=>array('cat_title'),
            "columnmaps" => array()
        );
        return $this->databinding();
    }
    function updateNodeByParent($Parent=0,$NewParent=0){
        $this->db->set('cat_update', 'NOW()', FALSE);
        $this->db->where('cat_parent', $Parent);
        @$this->db->update('cate', array('cat_parent'=>$NewParent));
        $this->sqlLog('updateNodeByParent');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count > 0)
            return true;
        return false;
    }
}
?>
