<?php

class advisory_model extends Core_Model {

    function __construct(){
        parent::__construct('_advisory','advisory_','id');
        $this->status='true';
        $this->type='advisory';
    }
    
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                advisory_id,
                advisory_title,
                advisory_name,
                advisory_insert,
                advisory_update,
                advisory_publicday,
                advisory_by,
                advisory_desc,
                advisory_view,
                advisory_category,
                cat_id,
                cat_title,
                cat_alias
                "
            ,false);
    }
    function onGet($id){
        $query = $this->db
        ->from('_advisory')
        ->join('cate', 'advisory_category = cat_id', 'left')
        ->where('advisory_id', $id)
        ->where('advisory_status', 'true')
        ->where('advisory_publicday <= ', date('Y-m-d H:i:s'))
        ->get();
        return $query->row();
    }
    function getFeature($cate_value, $page = 1, $perpage = 10){
        $this->select();
        $this->db
            ->order_by('advisory_view','DESC')
            ->order_by('advisory_publicday','DESC');
        return $this->getInCategories($cate_value, $page, $perpage); 
    }
    function getLatest($cate_value = null, $page = 1, $perpage = 10){
        $this->select();
        $this->db
            ->order_by('advisory_publicday','DESC');
        return $this->getInCategories($cate_value, $page, $perpage);
    }
    function getAsc($cate_value = null, $page = 1, $perpage = 10){
        $this->select();
        return $this->getInCategories($cate_value, $page, $perpage);
    }
    function getRelated($advisory, $page = 1, $perpage = 10){
        if($advisory){
            $cat_value = $advisory->cat_value;
            $this->select();
            $this->db->where('advisory_publicday <', $advisory->advisory_publicday);
            $this->db->where('advisory_id <>', $advisory->advisory_id)
                ->order_by("cat_value like '$cat_value%'",'DESC',false);
            $this->db
                ->order_by('advisory_publicday','DESC');
            return $this->getInCategories(null, $page, $perpage);
        }
    }
    function getFeeds($start = null, $end = null){
        if($start) $this->db->where('advisory_publicday >=',"$start 00:00:01");
        if($end) $this->db->where('advisory_publicday <=',"$end 23:59:59");
        $this->select();
        $this->db
            //->select("advisory_id as 'id', advisory_title as 'title', DATE_FORMAT(advisory_publicday,'%Y-%m-%d') as 'start'",false)
            ->order_by('advisory_publicday','DESC');
        return $this->getInCategories(null, 1, 200);
    }
    function getInCategories($cate_value = null, $page = 1, $perpage = 10) {
        if($cate_value)
            $this->db->like('cat_value', $cate_value,'after');
        $query = $this->db
            ->from('_advisory')
            ->join('cate', 'advisory_category = cat_id', 'left')
            ->where('advisory_status', 'true')
            // ->where('advisory_type', $this->type)
            ->where('advisory_publicday <= ', date('Y-m-d H:i:s'))
            ->limit($perpage, ($page - 1) * $perpage)
            ->get();
        return $query->result();
    }
}
?>