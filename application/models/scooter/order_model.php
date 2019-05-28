<?php
class order_model extends Core_Model {

    function __construct(){
        parent::__construct('_order','_','id');
    }
}