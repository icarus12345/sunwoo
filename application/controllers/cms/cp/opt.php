<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class opt extends CP_Controller {
    function __construct() {
        parent::__construct('opt', 'opt_', 'id');
        $this->load->model('cms/cp/opt_model');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
    }
    
    function editpanel($token=''){
        $this->assigns->token=$token;
        $this->assigns->colors = $this->opt_model->getColors($token);
        $this->assigns->sizes = $this->opt_model->getSizes($token);
        $this->assigns->prices = $this->opt_model->getPrices($token);
        $Id=$this->input->post('Id');
        if($Id){
            $this->assigns->item = $this->opt_model->onGet($Id);
        }
        $htmlreponse = $this->smarty->view( 'cms/cp/opt/editorPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function editpanelbasic($token=''){
        $this->assigns->token=$token;
        $Id=$this->input->post('Id');
        if($Id){
            $this->assigns->item = $this->opt_model->onGet($Id);
        }
        $htmlreponse = $this->smarty->view( 'cms/cp/opt/editorPanelBasic', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($token=""){
        $this->opt_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                    SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.*
                ",
            "from"      =>"FROM `{$this->table}`",
            "where"     =>"WHERE `{$this->table}_token` = '$token'",
            "order_by"  =>"ORDER BY `{$this->table}_insert` ASC",
            "columnmaps"=>array(

            )
        );
        $output = $this->opt_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function clearOpt(){
        
    }
}
?>