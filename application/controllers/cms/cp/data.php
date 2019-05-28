<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class data extends Core_Controller {
    function __construct() {
        parent::__construct('_data', '_', 'id');
        $this->load->model('cms/cp/cate_model');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->assigns->tplConfig = array(
            'controller'   =>'data',
            'prefix'       =>'_',
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

        $this->assigns->unit = $this->input->get('unit');
        $this->assigns->type = $this->input->get('type');
        $this->assigns->layout = $this->input->get('layout');
        $this->smarty->view( 'cms/000/template', $this->assigns );
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
    function layout($layout='',$unit='v-',$type=''){
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->assigns->layout = $layout;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($type=''){
        $Id=$this->input->post('Id');
        $segments=$this->input->post('segments');
        $layout=$segments['layout'];
        $type=$segments['type'];
        $cate_type=$segments['cate']??$type;

        $this->assigns->type=$type;
        $data = $this->cate_model->binding($cate_type);
        if(isset($data['aaData'])){
            $data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
            $this->assigns->cates=$data['aaData'];
        }
        if($Id){
            $this->assigns->item = $this->Core_Model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($layout) {
            case 'pri-event':
                $htmlreponse = $this->smarty->view( 'cms/cp/data/editPanelEvent', $this->assigns, true );
                break;
            case 'member':
                $htmlreponse = $this->smarty->view( 'cms/cp/data/editPanelMember', $this->assigns, true );
                break;
            case 'advert':
                $htmlreponse = $this->smarty->view( 'cms/cp/data/editPanelAdvert', $this->assigns, true );
                break;
            default:
                $htmlreponse = $this->smarty->view( 'cms/cp/data/editPanel', $this->assigns, true );
                break;
        }
        $output["result"] = 1;
        $output["segments"] = $segments;
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
                    {$this->prefix}title_{$this->lang} as {$this->prefix}title,
                    {$this->prefix}thumb,
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
                "{$this->prefix}title"=>"{$this->prefix}title_{$this->lang}"
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