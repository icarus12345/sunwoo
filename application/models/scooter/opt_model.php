<?php

class opt_model extends Core_Model {

    function __construct() {
        parent::__construct('opt', 'opt_', 'id');
    }
    function select(){
        $this->db->select("
            SQL_CALC_FOUND_ROWS
                `opt_id`, 
                `opt_name_vi`, 
                `opt_name_en`, 
                `opt_desc_vi`, 
                `opt_desc_en`, 
                `opt_name`, 
                `opt_price`, 
                `opt_old_price`, 
                `opt_desc`, 
                `opt_insert`, 
                `opt_update`, 
                `opt_p_id`, 
                `opt_status`, 
                `opt_color`, 
                `opt_token`, 
                `opt_amount`, 
                `opt_size``
                "
            ,false);
    }
    function onGetByAlias($alias){
        $this->select();
        return parent::onGetByAlias($alias);
    }
    function onGet($id){
        $this->select();
        return parent::onGet($id);
    }
    function getColors($token = '') {
        $this->select();
        $query = $this->db
                //->distinct('opt_color')
                ->select("opt_color, sum(opt_token ='$token') as active", false)
                ->from($this->table)
                ->where('opt_color <>', '')
                ->group_by('opt_color')
                ->order_by('active', 'DESC')
                ->order_by('opt_id', 'ASC')
                ->get();
        $this->sqlLog('getColors');
        return $query->result();
    }

    function getSizes($token = '') {
        $this->select();
        $query = $this->db
                //->distinct()
                ->select("opt_size, sum(opt_token ='$token') as active", false)
                ->from($this->table)
                ->group_by('opt_size')
                ->where('opt_size <>', '')
                ->order_by('active', 'DESC')
                ->order_by('opt_id', 'ASC')
                ->get();
        $this->sqlLog('getSizes');
        return $query->result();
    }

    function getPrices($token = '') {
        $this->select();
        $query = $this->db
                //->distinct()
                ->select("opt_price")
                ->from($this->table)
                ->where('opt_token', $token)
                ->where('opt_price <>', '')
                ->group_by('opt_price')
                ->order_by('opt_id', 'ASC')
                ->get();
        $this->sqlLog('getPrices');
        return $query->result();
    }

}

?>
