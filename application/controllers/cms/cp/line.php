<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class line extends CP_Controller {
    function __construct() {
        parent::__construct('_line', '_', 'id');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->load->model('cms/cp/head_model');
        $this->load->model('cms/cp/line_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'line',
            'prefix'       =>'_',
            'name'         =>'_oLine',
            'title'        =>'Line',
            'group'        =>'cp',
            'listEntryTitle'=>'line Manager',
            'addEntryTitle'=>'Add new entry',
            'editEntryTitle'=>'Modify entry',
            'entryListTpl'=>'templates/cms/cp/line/entryList.tpl'
        );
    }
    public function index(){
        $this->vp();
    }
    function event($unit='v-',$type=''){
        $this->assigns->tplConfig = array(
            'controller'   =>'cate',
            'prefix'       =>'cat_',
            'name'         =>'_oCate',
            'title'        =>'Event',
            'group'        =>'cp',
            'listEntryTitle'=>'Event Manager',
            'addEntryTitle'=>'Add new Event',
            'editEntryTitle'=>'Modify Event',
            'entryListTpl'=>'templates/cms/cp/line/entryList.tpl'
        );
        $this->vp($unit,$type);
    }
    function vp($unit='v-',$type=''){
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($type=''){
        $this->assigns->type=$type;
        $head_data = $this->head_model->onGetByType($type);
        $this->assigns->head_data=$head_data;
        $Id=(int)$this->input->post('Id');
        if($Id>0){
            $this->assigns->item = $this->line_model->onGet($Id);
            $this->assigns->type=$this->assigns->item->cat_type;
        }
        switch ($this->assigns->type){
            
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/line/editorPanel', $this->assigns, true );
        }
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    // function widgetbinding($type=''){
    //     $this->line_model->datatables_config=array(
    //         "table"     =>"{$this->table}",
    //         "select"    =>"
    //             SELECT SQL_CALC_FOUND_ROWS 
    //                 {$this->table}.{$this->prefix}id,
    //                 {$this->table}.{$this->prefix}title,
    //                 {$this->table}.{$this->prefix}insert,
    //                 {$this->table}.{$this->prefix}update,
    //                 {$this->table}.{$this->prefix}status
    //             ",
    //         "from"      =>" FROM `{$this->table}` ",
    //         "where"     =>"WHERE `{$this->prefix}type` = '$type'",
    //         "order_by"  =>"ORDER BY `{$this->prefix}value` ASC",
    //         "columnmaps"=>array(
                
    //         ),
    //         "filterfields"=>array(

    //         )
    //     );
    //     $output = $this->line_model->jqxBinding();
    //     $this->output->set_header('Content-type: application/json');
    //     $this->output->set_output(json_encode($output));
    // }
    function bindingbytype($type=""){
         $this->line_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title_vi,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status,
                    _header._title_vi as header_title_vi
                ",
            "from"      =>"
                FROM `{$this->table}` 
                LEFT JOIN _header ON (_line._head_id = _header._id)
                ",
            "where"     =>"WHERE {$this->table}.`{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY {$this->table}.`{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                "_title_vi"=>"{$this->table}.{$this->prefix}title_vi",
                "_title_en"=>"{$this->table}.{$this->prefix}title_en",
            ),
            "filterfields"=>array(
                "{$this->prefix}title_vi",
                "{$this->prefix}title_en",
            )
        );
        $result = $this->line_model->datatableBinding($type);
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));


    }
}
?>