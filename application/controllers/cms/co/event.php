<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class event extends VD_Controller {
    function __construct() {
        parent::__construct('_story', 'story_', 'id');
        $this->story_model = new Core_Model('_story', 'story_', 'id');
        $this->load->model('cms/co/topic_model');
        $this->load->model('cms/vd/author_model');
        $this->load->model('cms/cp/cate_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'event',
            'prefix'       =>'story_',
            'name'         =>'_oStory',
            'title'        =>'Event',
            'group'        =>'co',
            'listEntryTitle'=>'Event Manager',
            'addEntryTitle'=>'Add new Event',
            'editEntryTitle'=>'Modify Event',
            'entryListTpl'=>''
        );
    }

    public function index(){
        
    }

    function widget($unit='v-',$type=''){
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/co/event/widget.tpl';
        // $this->db->order_by('cat_value','ASC');
        // $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/jqxtemplate', $this->assigns );
    }
    
    function beforecommit(){
        $Id = $this->input->post('Id');
        $Params = $this->input->post('Params');

        if(!empty($Params['story_alias'])){
            $alias = $Params['story_alias'];
            if($Id) $this->db->where('story_id <>',$Id);
            $item = $this->story_model->onGetByAlias($alias);
            if($item){
                $output["result"] = -1;
                $output["message"] = ("Alias exists, please use another alias.");
                echo json_encode($output);
                die;
            }
        }
    }
    function editpanel($type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType('event');
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');

        $dataType="";
        if($Id){
            $this->assigns->item = $this->story_model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        $htmlreponse = $this->smarty->view( 'cms/co/event/editorPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function widgetbinding($type=""){
        $this->story_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status,
                    {$this->table}.{$this->prefix}thumb,
                    {$this->table}.{$this->prefix}topic,
                    {$this->table}.{$this->prefix}publicday
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
        $output = $this->story_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>