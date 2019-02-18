<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class data extends Core_Controller {
    function __construct() {
        parent::__construct('_data', 'data_', 'id');
        $this->assigns->tplConfig = array(
            'controller'   =>'data',
            'prefix'       =>'data_',
            'name'         =>'APP',
            'title'        =>'Event',
            'group'        =>'cp',
            'listEntryTitle'=>'Event',
            'addEntryTitle'=>'Add new Entry',
            'editEntryTitle'=>'Modify Entry',
            'entryListTpl'=>'templates/cms/cp/data/entryList.tpl'
        );
    }

    public function index(){
        $this->vp();
    }
    
    function beforedelete(){
        
    }
    function privateevent(){
        $this->assigns->tplConfig['title'] = 'Private Event';
        $this->vp('.e.','pri-event');
    }
    function foodmenu(){
        $this->assigns->tplConfig['title'] = 'Food Menu';
        $this->vp('.a.d.e.','foodmenu');
    }
    function membership(){
        $this->assigns->tplConfig['title'] = 'Membership';
        $this->vp('.a.d.e.','member');
    }
    function vp($unit='v-',$type=''){
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($type=''){
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        if($Id){
            $this->assigns->item = $this->Core_Model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($type) {
            case 'pri-event':
                $htmlreponse = $this->smarty->view( 'cms/cp/data/editPanelEvent', $this->assigns, true );
                break;
            case 'member':
                $htmlreponse = $this->smarty->view( 'cms/cp/data/editPanelMember', $this->assigns, true );
                break;
            case 'foodmenu':
                $htmlreponse = $this->smarty->view( 'cms/cp/data/editPanelFoodMenu', $this->assigns, true );
                break;
            default:
                $htmlreponse = $this->smarty->view( 'cms/cp/data/editPanel', $this->assigns, true );
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
                    {$this->prefix}name,
                    {$this->prefix}title,
                    {$this->prefix}thumb,
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