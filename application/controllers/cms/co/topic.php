<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class topic extends VD_Controller {
    function __construct() {
        parent::__construct('_topic', 'topic_', 'id');
        $this->load->model('cms/vd/author_model');
        $this->load->model('cms/cp/cate_model');
        $this->topic_model = new Core_Model('_topic', 'topic_', 'id');
        $this->assigns->tplConfig = array(
            'controller'   =>'topic',
            'prefix'       =>'topic_',
            'name'         =>'_oTopic',
            'title'        =>'Topic',
            'group'        =>'co',
            'listEntryTitle'=>'Topic Manager',
            'addEntryTitle'=>'Add new Topic',
            'editEntryTitle'=>'Modify Topic',
            'entryListTpl'=>'templates/cms/co/topic/entryList.tpl'
        );
    }

    public function index(){
        $this->vp();
    }
    function widget($unit='v-',$type=''){
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/cp/topic/widget.tpl';
        // $this->db->order_by('cat_value','ASC');
        // $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/jqxtemplate', $this->assigns );
    }
    function beforecommit(){
        $Id = $this->input->post('Id');
        $Params = $this->input->post('Params');

        if(!empty($Params['topic_alias'])){
            $alias = $Params['topic_alias'];
            if($Id) $this->db->where('topic_id <>',$Id);
            $item = $this->topic_model->onGetByAlias($alias);
            if($item){
                $output["result"] = -1;
                $output["message"] = ("Alias exists, please use another alias.");
                echo json_encode($output);
                die;
            }
        }
    }
    function beforedelete(){
        $Id = $this->input->post('Id');
        $this->db
            ->where('video_topic',$Id)
            ->from('_video');
        $count = $this->db->count_all_results();
        $this->db
            ->where('post_topic',$Id)
            ->from('_post');
        $count += $this->db->count_all_results();
        $this->db
            ->where('audio_topic',$Id)
            ->from('_audio');
        $count += $this->db->count_all_results();$this->db
            ->where('post_topic',$Id)
            ->from('_post');
        $count += $this->db->count_all_results();
        if($count>0){
            $output["result"] = -1;
            $output["message"] = ("Cant delete this Topic. because this topic have the videos or the daily");
            echo json_encode($output);
            die;
        }
    }
    function vp($unit='v-',$type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function dropdownTopic(){
        
    }
    function editpanel($type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $this->assigns->aAuthors = $this->author_model->onGets();
        $dataType="";
        if($Id){
            $this->assigns->item = $this->topic_model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        $htmlreponse = $this->smarty->view( 'cms/co/topic/editPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function widgetbinding($type=""){
        $this->topic_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status,
                    {$this->prefix}author,
                    author_name
                ",
            "from"      =>"
                FROM `{$this->table}`
                    LEFT JOIN _author ON author_id = topic_author
                ",
            "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                
            ),
            "filterfields"=>array(
                
            )
        );
        $output = $this->topic_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingbytype($type=""){
        $this->topic_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status,
                    _author.author_name
                ",
            "from"      =>"
                FROM `{$this->table}` 
                    LEFT JOIN _author ON _author.author_id = _topic.topic_author
                ",
            "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(

            ),
            "filterfields"=>array(
            )
        );
        $output = $this->topic_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>