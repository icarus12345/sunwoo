<?php

class news_model extends Core_Model {

    function __construct(){
        parent::__construct('_news','news_','id');
        $this->status='true';
    }
    
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS _news.*,
                _news._title_{$this->lang} as _title,
                _news._desc_{$this->lang} as _desc,
                _news._content_{$this->lang} as _content,
                _category_id,
                _cate._title_{$this->lang} as cat_title,
                _cate._alias_{$this->lang} as cat_alias,
                _cate._value
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
            ->where("( _news._type in ('news','event') )",null,false);
    }
    function partner_cond(){
        $this->db
            ->where("_news._type",'partner');
    }
    function blog_cond(){
        $this->db
            ->where("_news._type",'blog');
    }
    function news_cond(){
        $this->db
            ->where("_news._type",'tintuc');
    }
    function event_cond(){
        $this->db
            ->where("_news._type",'event');
    }
    function about_cond(){
        $this->db
            ->where("_news._type",'about');
    }
    function service_cond(){
        $this->db
            ->where("_news._type",'service');
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
            ->order_by('news_position','DESC')
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
            $this->db->like('_cate._value', $cat_value,'after');
        $query = $this->db
            ->from('_news')
            ->join('_cate', '_category_id = _cate._id', 'left')
            ->where('_news._status', '1')
            // ->where('news_type', $this->type)
            // ->where('news_publicday <= ', date('Y-m-d H:i:s'))
            ->limit($perpage, ($page - 1) * $perpage)
            ->get();
        return $query->result();
    }
    function addView($id){
        $this->db->set('_view', '_view+1', FALSE);
        @$this->db->update($this->table);
    }
}
?>