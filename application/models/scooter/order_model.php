<?php
class order_model extends Core_Model {

    function __construct(){
        parent::__construct('_order','order_','id');
    }
    function addOrder($params){

    }
    function getOrderByCustomer($id){
    	
        $query = $this->db
            ->from('_order')
            ->where('order_customer_id', $id)
            ->get();
        return $query->result();
    }
}