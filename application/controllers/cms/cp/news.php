<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class news extends VD_Controller {
    function __construct() {
        parent::__construct('_news', 'news_', 'id');
        $this->load->model('cms/cp/cate_model');
        $this->news_model = new Core_Model('_news', 'news_', 'id');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->assigns->tplConfig = array(
            'controller'   =>'news',
            'prefix'       =>'news_',
            'name'         =>'_oNews',
            'title'        =>'News',
            'group'        =>'cp',
            'listEntryTitle'=>'News Manager',
            'addEntryTitle'=>'Add new News',
            'editEntryTitle'=>'Modify News',
            'entryListTpl'=>'templates/cms/cp/news/entryList.tpl'
        );
    }

    public function index(){
        $this->vp();
    }
    function widget($unit='v-',$type=''){
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/cp/news/widget.tpl';
        // $this->db->order_by('cat_value','ASC');
        // $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/jqxtemplate', $this->assigns );
    }
    function beforecommit(){
        $Id = $this->input->post('Id');
        $Params = $this->input->post('Params');

        // if(!empty($Params['news_alias_vi'])){
        //     $alias = $Params['news_alias_vi'];
        //     if($Id) $this->db->where('news_id <>',$Id);
        //     $item = $this->news_model->onGetByAlias($alias);
        //     if($item){
        //         $output["result"] = -1;
        //         $output["message"] = ("Alias exists, please use another alias.");
        //         echo json_encode($output);
        //         die;
        //     }
        // }
    }
    function beforedelete(){
        
    }
    function vp($unit='v-',$type=''){
        switch ($type) {
            case 'about':
                $this->assigns->tplConfig['title'] = 'About';
                $this->assigns->tplConfig['listEntryTitle'] = 'About Page';
                $this->assigns->tplConfig['addEntryTitle'] = 'Add new Page';
                $this->assigns->tplConfig['editEntryTitle'] = 'Edit Page';
                break;
            case 'service':
                $this->assigns->tplConfig['title'] = 'Service';
                $this->assigns->tplConfig['listEntryTitle'] = 'Service Page';
                $this->assigns->tplConfig['addEntryTitle'] = 'Add new Service';
                $this->assigns->tplConfig['editEntryTitle'] = 'Edit Service';
                break;
            case 'event':
                $this->assigns->tplConfig['title'] = 'Events';
                $this->assigns->tplConfig['listEntryTitle'] = 'Events';
                $this->assigns->tplConfig['addEntryTitle'] = 'Add new Event';
                $this->assigns->tplConfig['editEntryTitle'] = 'Edit Event';
                break;
            default:

                break;
        }
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function dropdownnews(){
        
    }
    function editpanel($type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType($type);
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->news_model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($type) {
            case 'about':
            case 'service':
                $htmlreponse = $this->smarty->view( 'cms/cp/news/editPanelAbout', $this->assigns, true );
                break;
            
            default:
                $htmlreponse = $this->smarty->view( 'cms/cp/news/editPanel', $this->assigns, true );
                break;
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function widgetbinding($type=""){
        $this->news_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title_vi,
                    {$this->table}.{$this->prefix}thumb,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status,
                    cat_title_vi
                ",
            "from"      =>"
                FROM `{$this->table}`
                    LEFT JOIN cate ON cat_id = news_category
                ",
            "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}position` ASC,`{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                
            ),
            "filterfields"=>array(
                
            )
        );
        $output = $this->news_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingbytype($type=""){
        $this->widgetbinding($type);
    }
    
}
?>