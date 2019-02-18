<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class customer extends CP_Controller {
    function __construct() {
        parent::__construct('customer', '', 'Id');
        $this->co_model = new Core_Model('customer', '', 'Id');
        $this->assigns->tplConfig = array(
            'controller'   =>'customer',
            'prefix'       =>'',
            'name'         =>'_oCustomer',
            'title'        =>'Customer',
            'group'        =>'co',
            'listEntryTitle'=>'Customer Manager',
            'addEntryTitle'=>'Add new Customer',
            'editEntryTitle'=>'Modify Customer',
            'entryListTpl'=>'templates/cms/co/customer/entryList.tpl'
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
        $htmlreponse = $this->smarty->view( 'cms/co/customer/editPanel', $this->assigns, true );
        
        
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
            "order_by"  =>"ORDER BY `Insert` DESC",
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