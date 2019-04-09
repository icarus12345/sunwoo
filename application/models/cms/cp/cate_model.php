<?php

class cate_model extends Core_Model {

    function __construct(){
        parent::__construct('cate', '', 'id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `id`, 
                `title_{$this->lang}` as title, 
                `thumb`, 
                `description_{$this->lang}` as description, 
                `parent`, 
                `status`, 
                `ordering`, 
                `link`, 
                `type`, 
                `created_at`, 
                `modified_at`, 
                `readobly`, 
                `value`, 
                `image`, 
                `alias_{$this->lang}` as alias, 
                `cover`
                "
            ,false);
    }
    function getCategoryByType($type=null){
        $this->select();
        if($type!=null)$this->db->where('type',$type);
        $query=$this->db
            ->from('cate')
            ->order_by('parent_id','ASC')
            ->order_by('ordering','ASC')
            ->order_by('created_at','ASC')
            ->get(); 
        $this->sqlLog('getCategoryByType');
        return $query->result();
    }
    function buildTree(array $elements, $parentId = 0,$parents=array(0)) {
        $branch = array();
        foreach ($elements as $element) {
            if ($element->parent_id == $parentId) {
                $tmp=$parents;$tmp[]=$element->id;
                $children = $this->buildTree($elements, $element->id,$tmp);
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
                        $elements[$i]->parent_id==$elements[$j]->id &&
                        $elements[$i]->type==$elements[$j]->type
                    ){
                        $f=true;
                        break;
                    }
                }
                if($f==false){
                    $elements[$i]->parent_id=0;
                    $elements[$i]->parent_title='';
                    $elements[$i]->new_value='';
                    $elements[$i]->error='parent not exist';
                    $elements[$i]->path='';
                }
                if($elements[$i]->parent_id==$elements[$i]->id){
                    $elements[$i]->parent_id=0;
                    $elements[$i]->parent_title='';
                    $elements[$i]->new_value='';
                    $elements[$i]->path='';
                    $elements[$i]->error=2;
                }
            }
        }
        $branch = array();
        foreach ($elements as $element) {
            if ($element->parent_id == $parentId) {
                $element->level=$level;$element->parent_title=$parent_title;
                $element->display=repeater('----',$level).$element->title;
                $element->display=$path."/".$element->title;
                $element->new_value=$new_value.">".$element->id;
                $element->isparent = 0;
                $children = $this->buildTreeArray($elements, $element->id,$level+1,$element->title,$path.'/'.$element->title,$element->new_value);
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
            $where = "WHERE `type` = '$type'";
        
        $this->datatables_config = array(
            "table" => "`cate`",
            "select" => "SELECT SQL_CALC_FOUND_ROWS id, title_{$this->lang} as title,value,parent_id,status",
            "from" => "FROM `cate`",
            "where" => "$where",
            "order_by" => "ORDER BY `parent_id` ASC, `ordering` ASC, `created_at` ASC",
            "filterfields"=>array('title'),
            "columnmaps" => array(
                'title'=>"title_{$this->lang}"
            )
        );
        return $this->databinding();
    }
    function updateNodeByParent($Parent=0,$NewParent=0){
        $this->db->set('modified_at', 'NOW()', FALSE);
        $this->db->where('parent_id', $Parent);
        @$this->db->update('cate', array('parent_id'=>$NewParent));
        $this->sqlLog('updateNodeByParent');
        @$count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count > 0)
            return true;
        return false;
    }
}
?>
