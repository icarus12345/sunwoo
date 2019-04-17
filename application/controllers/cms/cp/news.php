<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class news extends VD_Controller {
    function __construct() {
        parent::__construct('_news', '_', 'id');
        $this->load->model('cms/cp/cate_model');
        $this->news_model = new Core_Model('_news', '_', 'id');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->assigns->tplConfig = array(
            'controller'   =>'news',
            'prefix'       =>'_',
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
            case 'helper':
                $this->assigns->tplConfig['title'] = 'Content';
                $this->assigns->tplConfig['listEntryTitle'] = 'Content Page';
                $this->assigns->tplConfig['addEntryTitle'] = 'Add new Content';
                $this->assigns->tplConfig['editEntryTitle'] = 'Edit Content';
                break;
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
        $data = $this->cate_model->binding($type);
        if(isset($data['aaData'])){
            $data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
            $this->assigns->cates=$data['aaData'];
        }
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function dropdownnews(){
        
    }
    function editpanel($type=''){
        $data = $this->cate_model->binding($type);
        if(isset($data['aaData'])){
            $data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
            $this->assigns->cates=$data['aaData'];
        }
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->news_model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($type) {
            case 'helper':
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
                    {$this->table}.{$this->prefix}title_{$this->lang} as {$this->prefix}title,
                    {$this->table}.{$this->prefix}thumb,
                    {$this->table}.{$this->prefix}created_at,
                    {$this->table}.{$this->prefix}modified_at,
                    {$this->table}.{$this->prefix}status,
                    _cate._title_{$this->lang} as cat_title
                ",
            "from"      =>"
                FROM `{$this->table}`
                    LEFT JOIN _cate ON _cate._id = _category_id
                ",
            "where"     =>"WHERE {$this->table}.`{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY {$this->table}.`{$this->prefix}ordering` DESC,{$this->table}.`{$this->prefix}created_at` DESC",
            "columnmaps"=>array(
                "cat_title"=>"_cate._value",
                "{$this->prefix}title"=>"{$this->prefix}title_{$this->lang}",
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