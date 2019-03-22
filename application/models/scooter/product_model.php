<?php

class product_model extends Core_Model {

    function __construct(){
        parent::__construct('_product','product_','id');
        $this->status='true';
        $this->type = 'default';
    }
    
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `product_id`, 
                _product.product_title_{$this->lang} as product_title,
                _product.product_desc_{$this->lang} as product_desc,
                `product_alias_{$this->lang}` as product_alias,
                `product_position`, 
                `product_status`, 
                `product_type`, 
                `product_insert`, 
                `product_update`, 
                `product_thumb`, 
                `product_code`, 
                `product_lock`, 
                `product_owner`, 
                `product_category`, 
                `product_images`, 
                `product_token`, 
                `product_price`, 
                `product_alias`, 
                `product_publicday`, 
                `product_view`, 
                `product_cover`, 
                `product_data`, 
                `product_features`, 
                `product_lat`, 
                `product_lng`, 
                `product_acreage`, 
                `product_width`, 
                `product_height`, 
                `product_bedroom`, 
                `product_bathroom`, 
                `product_furniture_{$this->lang}` as product_furniture, 
                `product_utilities_{$this->lang}` as product_utilities, 
                `product_address`, 
                `product_country_id`, 
                `product_is_hot`,

                cat_id,
                cat_title_{$this->lang} as cat_title,
                cat_alias_{$this->lang} as cat_alias,
                cat_unit_{$this->lang} as cat_unit,
                cat_value
                "
            ,false);
    }
    function selectAll(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `product_id`, 
                _product.product_title_{$this->lang} as product_title,
                _product.product_desc_{$this->lang} as product_desc,
                _product.product_content_{$this->lang} as product_content,
                `product_alias_{$this->lang}` as product_alias,
                `product_position`, 
                `product_status`, 
                `product_type`, 
                `product_insert`, 
                `product_update`, 
                `product_thumb`, 
                `product_code`, 
                `product_lock`, 
                `product_owner`, 
                `product_category`, 
                `product_images`, 
                `product_token`, 
                `product_price`, 
                `product_alias`, 
                `product_publicday`, 
                `product_view`, 
                `product_cover`, 
                `product_data`, 
                `product_features`, 
                `product_lat`, 
                `product_lng`, 
                `product_acreage`, 
                `product_width`, 
                `product_height`, 
                `product_bedroom`, 
                `product_bathroom`, 
                `product_furniture_{$this->lang}` as product_furniture, 
                `product_utilities_{$this->lang}` as product_utilities, 
                `product_address`, 
                `product_country_id`, 
                `product_is_hot`,

                cat_id,
                cat_title_{$this->lang} as cat_title,
                cat_alias_{$this->lang} as cat_alias,
                cat_unit_{$this->lang} as cat_unit,
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
        $this->selectAll();
        $query = $this->db
        ->from('_product')
        ->join('cate', 'product_category = cat_id', 'left')
        ->where('product_id', $id)
        ->where('product_status', 'true')
        //->where('product_insert <= ', date('Y-m-d H:i:s'))
        ->get();
        $row = $query->row();
        $row->general_informations = $this->db
            ->select("opt_id,opt_name_{$this->lang} as opt_name, opt_desc_{$this->lang} as opt_desc")
            ->from('opt')
            // ->where('opt_status', 'true')
            ->where('opt_token', $row->product_token)
            ->get()
            ->result();
        $row->features = $this->db
            ->select("_id,_head_id,_title_{$this->lang} as _title, _desc_{$this->lang} as _desc")
            ->from('_line')
            // ->where('opt_status', 'true')
            ->where_in('_id', explode(',', $row->product_features))
            ->get()
            ->result();
        return $row;
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
    function getNearLatLng($cat_value = null,$p, $page = 1, $perpage = 10){
        $lat = $p->product_lat;
        $lng = $p->product_lng;
        $id = $p->product_id;
        $this->select();
        $this->db->select("product_lat - $lat + product_lng - $lng as disc")
            ->where('product_id !=',$id)
            //->order_by('product_position','ASC');
            ->order_by("disc",'asc');
        return $this->getInCategories($cat_value, $page, $perpage);
    }
    
    function getInCategories($cat_value = null, $page = 1, $perpage = 10) {
        // if($this->type)$this->db->where('product_type', $this->type);
        if($cat_value)
            $this->db->like('cat_value', $cat_value,'after');
        $query = $this->db
            ->from('_product')
            ->join('cate', 'product_category = cat_id', 'left')
            ->where('product_status', 'true')
            
            //->where('product_insert <= ', date('Y-m-d H:i:s'))
            ->limit($perpage, ($page - 1) * $perpage)
            ->get();
        $result = $query->result();
        foreach ($result as &$row) {
            // $row->general_informations = $this->db
            //     ->from('opt')
            //     // ->where('opt_status', 'true')
            //     ->where('opt_token', $row->product_token)
            //     ->get()
            //     ->result();
            // $row->features = $this->db
            //     ->from('_line')
            //     // ->where('opt_status', 'true')
            //     ->where_in('_id', explode(',', $row->product_features))
            //     ->get()
            //     ->result();
        }
        return $result;
    }
}
?>