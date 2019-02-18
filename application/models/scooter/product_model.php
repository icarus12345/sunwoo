<?php

class product_model extends Core_Model {

    function __construct(){
        parent::__construct('_product','product_','id');
        $this->status='true';
        $this->type = 'real';
    }
    
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                product_id,
                product_title,
                product_title_en,
                product_alias,
                product_desc,
                product_desc_en,
                product_content,
                product_content_en,
                product_position,
                product_status,
                product_type,
                product_insert,
                product_update,
                product_thumb,
                product_cover,
                product_images,
                product_code,
                product_lock,
                product_owner,
                product_category,
                product_token,
                product_price,
                cat_id,
                cat_title,
                cat_alias,
                cat_value
                "
            ,false);
    }
    function onGetByAlias($alias=''){
        $query = $this->db
            ->from('_product')
            ->join('cate', 'product_category = cat_id', 'left')
            ->where('product_status', 'true')
            ->where('product_alias', $alias)
            ->get();
        return $query->row();
    }
    function onGet($id){
        $query = $this->db
        ->from('_product')
        ->join('cate', 'product_category = cat_id', 'left')
        ->where('product_id', $id)
        ->where('product_status', 'true')
        //->where('product_insert <= ', date('Y-m-d H:i:s'))
        ->get();
        return $query->row();
    }
    function getFeature($cat_value, $page = 1, $perpage = 10){
        $this->select();
        $this->db
            ->order_by('product_position','ASC')
            ->order_by('product_view','DESC')
            ->order_by('product_insert','DESC');
        return $this->getInCategories($cat_value, $page, $perpage); 
    }
    function getLatest($cat_value = null, $page = 1, $perpage = 10){
        $this->select();
        $this->db
            //->order_by('product_position','ASC');
            ->order_by('product_insert','DESC');
        return $this->getInCategories($cat_value, $page, $perpage);
    }
    
    function getInCategories($cat_value = null, $page = 1, $perpage = 10) {
        if($this->type)$this->db->where('product_type', $this->type);
        if($cat_value)
            $this->db->like('cat_value', $cat_value,'after');
        $query = $this->db
            ->from('_product')
            ->join('cate', 'product_category = cat_id', 'left')
            ->where('product_status', 'true')
            
            //->where('product_insert <= ', date('Y-m-d H:i:s'))
            ->limit($perpage, ($page - 1) * $perpage)
            ->get();
        return $query->result();
    }
}
?>