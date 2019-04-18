<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class supplier extends CP_Controller {
    function __construct() {
        parent::__construct('_supplier', '_', 'id');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->load->model('cms/cp/supplier_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'supplier',
            'prefix'       =>'_',
            'name'         =>'_oHead',
            'title'        =>'Supplier',
            'group'        =>'cp',
            'listEntryTitle'=>'Supplier Manager',
            'addEntryTitle'=>'Add new Supplier',
            'editEntryTitle'=>'Modify Supplier',
            'entryListTpl'=>'templates/cms/cp/supplier/entryList.tpl'
        );
    }
    public function index(){
        $this->vp();
    }
    
    function vp($unit='v-',$type=''){
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($type=''){
        $this->assigns->type=$type;
        
        $Id=(int)$this->input->post('Id');
        if($Id>0){
            $this->assigns->item = $this->supplier_model->onGet($Id);
            $this->assigns->type=$this->assigns->item->_type;
        }
        switch ($this->assigns->type){
            
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/supplier/editorPanel', $this->assigns, true );
        }
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    
    function bindingbytype($type=""){
         $this->supplier_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->prefix}id,
                    {$this->prefix}title_{$this->lang} as _title,
                    {$this->prefix}created_at,
                    {$this->prefix}modified_at,
                    {$this->prefix}status
                ",
            "from"      =>"
                FROM `{$this->table}`
                ",
            "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}created_at` DESC",
            "columnmaps"=>array(
                
            ),
            "filterfields"=>array(
                
            )
        );
        $result = $this->supplier_model->datatableBinding($type);
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));


    }
}
?>