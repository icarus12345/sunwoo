<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class order extends CP_Controller {
    function __construct() {
        parent::__construct('_order', 'order_', 'id');
        $this->co_model = new Core_Model('_order', 'order_', 'id');
        $this->assigns->tplConfig = array(
            'controller'   =>'order',
            'prefix'       =>'',
            'name'         =>'_oOrder',
            'title'        =>'Order',
            'group'        =>'co',
            'listEntryTitle'=>'Order Manager',
            'addEntryTitle'=>'Add new Order',
            'editEntryTitle'=>'Modify Order',
            'entryListTpl'=>'templates/cms/co/order/entryList.tpl'
        );
    }

    public function index(){
        $this->vp();
    }
    
    function beforedelete(){
        
    }
    function vp($unit='v-',$type=''){
        
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function dropdownnews(){
        
    }
    function editpanel($type=''){
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->co_model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        $htmlreponse = $this->smarty->view( 'cms/co/order/editPanel', $this->assigns, true );
        
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function widgetbinding($type=""){
        $this->co_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS *
                ",
            "from"      =>"
                FROM `{$this->table}`
                ",
            "where"     =>"WHERE true",
            "order_by"  =>"ORDER BY `order_insert` DESC",
            "columnmaps"=>array(
                
            ),
            "filterfields"=>array(
                
            )
        );
        $output = $this->co_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingbytype($type=""){
        $this->widgetbinding($type);
    }
    
}
?>