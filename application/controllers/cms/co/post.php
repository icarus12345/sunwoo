<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class post extends VD_Controller {
    function __construct() {
        parent::__construct('_post', 'post_', 'id');
        $this->post_model = new Core_Model('_post', 'post_', 'id');
        $this->load->model('cms/co/topic_model');
        $this->load->model('cms/vd/author_model');
        $this->load->model('cms/cp/cate_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'post',
            'prefix'       =>'post_',
            'name'         =>'_oPost',
            'title'        =>'Post',
            'group'        =>'co',
            'listEntryTitle'=>'Post Manager',
            'addEntryTitle'=>'Add new Post',
            'editEntryTitle'=>'Modify Post',
            'entryListTpl'=>''
        );
    }

    public function index(){
        $this->vp();
    }
    function widget($unit='v-',$type=''){
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/co/post/widget.tpl';
        // $this->db->order_by('cat_value','ASC');
        // $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/jqxtemplate', $this->assigns );
    }
    
    function vp($unit='v-',$type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function dropdownTopic($type='daily',$author=''){
        if($author) $this->db->where("( topic_author is null or topic_author = '' or topic_author = '$author' )", null, false);
        $data = $this->topic_model->onGetByType($type);
        foreach ($data as $o) {
            $topics[$o->author_id.""][] = $o;
        }
        $this->assigns->topics = $topics;
        $this->smarty->view( 'cms/co/post/topicDropdown', $this->assigns );
    }
    function editpanel($type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $this->assigns->authors = $this->author_model->onGets();

        
        $dataType="";
        if($Id){
            $this->assigns->item = $this->post_model->onGet($Id);
            $author = $this->assigns->item->post_author;
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        if($author) $this->db->where("( topic_author is null or topic_author = '' or topic_author = '$author' )", null, false);
        $data = $this->topic_model->onGetByType($type);
        foreach ($data as $o) {
            $topics[$o->author_id][] = $o;
        }
        $this->assigns->topics = $topics;

        $htmlreponse = $this->smarty->view( 'cms/co/post/editorPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function beforecommit(){
        if($this->input->post('Id')>0)
            $_POST['Params']['post_by'] = $_SESSION['auth']['user']->ause_name;
        $Id = $this->input->post('Id');
        $Params = $this->input->post('Params');

        if(!empty($Params['post_alias'])){
            $alias = $Params['post_alias'];
            if($Id) $this->db->where('post_id <>',$Id);
            $item = $this->post_model->onGetByAlias($alias);
            if($item){
                $output["result"] = -1;
                $output["message"] = ("Alias exists, please use another alias.");
                echo json_encode($output);
                die;
            }
        }
    }
    function widgetbinding($type=""){
        $this->post_model->datatables_config=array(
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
                    {$this->table}.{$this->prefix}publicday,
                    topic_title,author_name
                ",
            "from"      =>"
                FROM `{$this->table}` 
                    LEFT JOIN _topic ON topic_id = post_topic
                    LEFT JOIN _author ON author_id = post_author
                ",
            //  "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                "topic_title"=>'topic_title',
            ),
            "filterfields"=>array(
                // "{$this->prefix}title"
            )
        );
        $output = $this->post_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingbytype($type=""){
        $this->video_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title,
                    {$this->table}.{$this->prefix}desc,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status,
                    {$this->table}.{$this->prefix}author,
                    {$this->table}.{$this->prefix}thumb,
                    {$this->table}.{$this->prefix}publicday,
                    {$this->table}.{$this->prefix}category,
                    cate.cat_title,
                    _author.author_name,
                    _author.author_name as label
                ",
            "from"      =>"
                FROM `{$this->table}` 
                    LEFT JOIN cate ON cate.cat_id = _video.video_category
                    LEFT JOIN _author ON _author.author_id = _video.video_author
                ",
            // "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                "{$this->prefix}title"=>"{$this->prefix}title",
                "author_name"=>"author_name",
                "label"=>"author_name",
            ),
            "filterfields"=>array(
                "{$this->prefix}title"
            )
        );
        $output = $this->video_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>