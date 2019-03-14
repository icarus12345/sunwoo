<?php

class news_model extends Core_Model {

    function __construct(){
        parent::__construct('_news','news_','id');
        $this->status='true';
    }
    
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS _news.*,
                _news.news_title_vi as news_title,
                _news.news_desc_vi as news_desc,
                _news.news_content_vi as news_content,
                cat_id,
                cat_title_vi as cat_title,
                cat_alias_vi,
                cat_value
                "
            ,false);
    }
    function onGetByAlias($alias=''){
        $query = $this->db
            ->from('_news')
            ->join('cate', 'news_category = cat_id', 'left')
            ->where('news_status', 'true')
            ->where('news_alias_vi', $alias)
            ->get();
        return $query->row();
    }
    function news_event_cond(){
        $this->db
            ->where("( news_type in ('news','event') )",null,false);
    }
    function partner_cond(){
        $this->db
            ->where("news_type",'partner');
    }
    function blog_cond(){
        $this->db
            ->where("news_type",'blog');
    }
    function news_cond(){
        $this->db
            ->where("news_type",'tintuc');
    }
    function event_cond(){
        $this->db
            ->where("news_type",'event');
    }
    function about_cond(){
        $this->db
            ->where("news_type",'about');
    }
    function service_cond(){
        $this->db
            ->where("news_type",'service');
    }
    function onGet($id){
        $this->select();

        $query = $this->db
        ->from('_news')
        ->join('cate', 'news_category = cat_id', 'left')
        ->where('news_id', $id)
        ->where('news_status', 'true')
        ->where('news_publicday <= ', date('Y-m-d H:i:s'))
        ->get();
        return $query->row();
    }
    function getFeature($cat_value, $page = 1, $perpage = 10){
        $this->select();
        $this->db
            ->order_by('news_position','ASC')
            ->order_by('news_view','DESC')
            ->order_by('news_publicday','DESC');
        return $this->getInCategories($cat_value, $page, $perpage); 
    }
    function getLatest($cat_value = null, $page = 1, $perpage = 10){
        $this->select();
        $this->db
            ->order_by('news_publicday','DESC');
        return $this->getInCategories($cat_value, $page, $perpage);
    }
    function getAsc($cat_value = null, $page = 1, $perpage = 10){
        $this->select();
        return $this->getInCategories($cat_value, $page, $perpage);
    }
    function getFeeds($start = null, $end = null){
        if($start) $this->db->where('news_publicday >=',"$start 00:00:01");
        if($end) $this->db->where('news_publicday <=',"$end 23:59:59");
        $this->select();
        $this->db
            //->select("news_id as 'id', news_title as 'title', DATE_FORMAT(news_publicday,'%Y-%m-%d') as 'start'",false)
            ->order_by('news_publicday','DESC');
        return $this->getInCategories(null, 1, 200);
    }
    function getRelated($news, $page = 1, $perpage = 10){
        if($news){
            $cat_value = $news->cat_value;
            $this->select();
            $this->db->where('news_publicday <', $news->news_publicday);
            $this->db->where('news_id <>', $news->news_id)
                ->order_by("cat_value like '$cat_value%'",'DESC',false);
            $this->db
                ->order_by('news_publicday','DESC');
            return $this->getInCategories(null, $page, $perpage);
        }
    }
    function getRelatedNodate($news, $page = 1, $perpage = 10){
        if($news){
            $cat_value = $news->cat_value;
            $this->select();
            $this->db->where('news_id <>', $news->news_id)
                ->order_by("cat_value like '$cat_value%'",'DESC',false);
            $this->db
                ->order_by('news_publicday','DESC');
            return $this->getInCategories(null, $page, $perpage);
        }
    }
    function getInCategories($cat_value = null, $page = 1, $perpage = 10) {
        if($cat_value)
            $this->db->like('cat_value', $cat_value,'after');
        $query = $this->db
            ->from('_news')
            ->join('cate', 'news_category = cat_id', 'left')
            ->where('news_status', 'true')
            // ->where('news_type', $this->type)
            ->where('news_publicday <= ', date('Y-m-d H:i:s'))
            ->limit($perpage, ($page - 1) * $perpage)
            ->get();
        return $query->result();
    }
}
?>