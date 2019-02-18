<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class advisory extends Core_Controller {
    function __construct() {
        parent::__construct('_advisory', 'advisory_', 'id');
        $this->load->model('cms/cp/cate_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'advisory',
            'prefix'       =>'advisory_',
            'name'         =>'APP',
            'title'        =>'advisory',
            'group'        =>'cp',
            'listEntryTitle'=>'advisory',
            'addEntryTitle'=>'Add new Entry',
            'editEntryTitle'=>'Modify Entry',
            'entryListTpl'=>'templates/cms/cp/advisory/entryList.tpl'
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
    function editpanel($type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType($type);
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        if($Id){
            $this->assigns->item = $this->Core_Model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($type) {
            
            default:
                $htmlreponse = $this->smarty->view( 'cms/cp/advisory/editPanel', $this->assigns, true );
                break;
        }
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $this->Core_Model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->prefix}id,
                    {$this->prefix}title,
                    {$this->prefix}insert,
                    {$this->prefix}update,
                    {$this->prefix}status
                ",
            "from"      =>"
                FROM `{$this->table}`
                ",
            "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                
            ),
            "filterfields"=>array(
                
            )
        );
        $output = $this->Core_Model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
    
}
?>