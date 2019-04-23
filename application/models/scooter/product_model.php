<?php

class product_model extends Core_Model {

    function __construct(){
        parent::__construct('_product','_','id');
        $this->status='true';
        $this->type = 'default';
    }
    
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                product._id, 
                product._title_{$this->lang} as _title,
                product._desc_{$this->lang} as _desc,
                product.`_alias_{$this->lang}` as _alias,
                product.`_tag_{$this->lang}` as _tag,
                product.`_image`, 
                product.`_code`, 
                product.`_owner`, 
                product.`_category_id`, 
                product.`_price`, 
                product.`_discount`, 
                product.`_view`, 
                product.`_cover`, 
                product.`_data`, 
                product.`_label`,
                product.`_supplier_id`,

                _supplier._title_{$this->lang} as supplier_title,
                _cate._title_{$this->lang} as cat_title,
                _cate._alias_{$this->lang} as cat_alias,
                _cate._value
                "
            ,false);
    }
    function selectAll(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                product._id, 
                product._title_{$this->lang} as _title,
                product._desc_{$this->lang} as _desc,
                product._content_{$this->lang} as _content,
                product.`_alias_{$this->lang}` as _alias,
                product.`_tag_{$this->lang}` as _tag,
                product.`_image`, 
                product.`_code`, 
                product.`_owner`, 
                product.`_category_id`, 
                product.`_price`, 
                product.`_discount`, 
                product.`_view`, 
                product.`_cover`, 
                product.`_data`, 
                product.`_label`, 

                _supplier._title_{$this->lang} as supplier_title,
                _cate._title_{$this->lang} as cat_title,
                _cate._alias_{$this->lang} as cat_alias,
                _cate._value
                "
            ,false);
    }
    function onGetByAlias($alias=''){
        $this->selectAll();
        $query = $this->db
            ->from('product')
            ->join('_cate', '_category_id = _cate._id', 'left')
            ->join('_supplier', '_supplier_id = _supplier._id', 'left')
            ->where('product._status', '1')
            ->where("product.`_alias_{$this->lang}`", $alias)
            ->get();
        $this->sqlLog('onGetByAlias');
        $row = $query->row();
        $this->fixData($row);
        // if($row) $row->color = $this->db
        //         ->from('_line')
        //         // ->where('_status', '1')
        //         ->where_in('_id', $row->_data['custom'][3])
        //         ->get()
        //         ->result();
        return $row;
    }
    function onGet($id){
        $this->selectAll();
        $query = $this->db
        ->from('product')
        ->join('_supplier', '_supplier_id = _supplier._id', 'left')
        ->join('_cate', '_category_id = _cate._id', 'left')
        ->where('product._id', $id)
        ->where('product._status', '1')
        //->where('product_insert <= ', date('Y-m-d H:i:s'))
        ->get();
        $row = $query->row();
        return $this->fixData($row);
    }
    function getFeature($cat_value, $page = 1, $perpage = 10){
        $this->select();
        $this->db
            ->order_by('product._ordering','ASC')
            ->order_by('product._view','DESC')
            ->order_by('product._created_at','DESC');
        return $this->getInCategories($cat_value, $page, $perpage); 
    }
    function getLatest($cat_value = null, $page = 1, $perpage = 10){
        $this->select();
        $this->db
            //->order_by('product_position','ASC');
            ->order_by('product._created_at','DESC');
        return $this->getInCategories($cat_value, $page, $perpage);
    }
    
    function getInCategories($cat_value = null, $page = 1, $perpage = 10) {
        // if($this->type)$this->db->where('product_type', $this->type);
        if($cat_value)
            $this->db->like('_value', $cat_value,'after');
        $query = $this->db
            ->from('product')
            ->join('_supplier', '_supplier_id = _supplier._id', 'left')
            ->join('_cate', '_category_id = _cate._id', 'left')
            ->where('product._status', '1')
            
            //->where('product_insert <= ', date('Y-m-d H:i:s'))
            ->limit($perpage, ($page - 1) * $perpage)
            ->get();
        $this->sqlLog('getInCategories');
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