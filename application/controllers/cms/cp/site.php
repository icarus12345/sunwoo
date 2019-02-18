<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class site extends CP_Controller {
    function __construct() {
        parent::__construct('site', 'site_', 'id');
        $this->load->model('cms/cp/site_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'site',
            'prefix'       =>'site_',
            'name'         =>'_oSite',
            'title'        =>'Page',
            'group'        =>'cp',
            'listEntryTitle'=>'Page',
            'addEntryTitle'=>'Add new Page',
            'editEntryTitle'=>'Modify Page',
            'entryListTpl'=>'templates/cms/cp/site/entryList.tpl'
        );
    }
    public function index(){
        $this->vp();
    }
    
    function ed($Id=''){
        if($Id){
            $this->assigns->item = $this->site_model->onGet($Id);
            $dataType = $this->assigns->item->site_type;
        }
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/cp/site/entryOnly.tpl';
        // $this->assigns->unit = $unit;
        // $this->assigns->type = $type;
        // $this->assigns->layout = $layout;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function vp($unit='v-',$type=''){
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($Type=''){
        $this->assigns->type=$Type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->site_model->onGet($Id);
            $dataType = $this->assigns->item->site_type;
        }
        switch ($dataType){
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/site/editorPanel', $this->assigns, true );
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $this->site_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"SELECT SQL_CALC_FOUND_ROWS 
                {$this->table}.{$this->table}_id,
                {$this->table}.{$this->table}_title,
                {$this->table}.{$this->table}_desc,
                {$this->table}.{$this->table}_status,
                {$this->table}.{$this->table}_type,
                {$this->table}.{$this->table}_insert,
                {$this->table}.{$this->table}_update,
                {$this->table}.{$this->table}_image,
                {$this->table}.{$this->table}_lock
                ",
            "from"      =>"FROM `{$this->table}`",
            "where"     =>"WHERE `{$this->table}_type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->table}_insert` ASC",
            "columnmaps"=>array(

            )
        );
        $output = $this->site_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>