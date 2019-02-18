<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class author extends VD_Controller {
    function __construct() {
        parent::__construct('_author', 'author_', 'id');
        $this->load->model('cms/vd/author_model');
        $this->assigns->tplConfig = array(
        	'controller'   =>'author',
        	'prefix'       =>'author_',
        	'name'         =>'_oAuthor',
        	'title'        =>'Author',
            'group'        =>'vp',
        	'listEntryTitle'=>'Author Manager',
        	'addEntryTitle'=>'Add new author',
        	'editEntryTitle'=>'Modify author',
            'entryListTpl'=>'templates/cms/vp/author/entryList.tpl'
    	);
    }
    public function index(){
        $this->vp();
    }
    function beforecommit(){
        $Id = $this->input->post('Id');
        $Params = $this->input->post('Params');

        if(!empty($Params['author_alias'])){
            $alias = $Params['author_alias'];
            if($Id) $this->db->where('author_id <>',$Id);
            $item = $this->author_model->onGetByAlias($alias);
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
            ->where("topic_author",$Id)
            ->from('_topic');
        $count = $this->db->count_all_results();
        $this->db->last_query();
        if($count>0){
            $output["result"] = -1;
            $output["message"] = ("Cant delete this Author, because this author have topics.");
            echo json_encode($output);
            die;
        }
    }
    function vp($unit='v-',$type=''){
    	$this->assigns->unit = $unit;
    	$this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($type=''){
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->author_model->onGet($Id);
            $dataType = $this->assigns->item->author_type;
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($dataType){
            default :
                $htmlreponse = $this->smarty->view( 'cms/vp/author/editorPanel', $this->assigns, true );
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function widgetbinding(){
        $this->author_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}name,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status
                ",
            "from"      =>" FROM `{$this->table}` ",
            // "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                
            ),
            "filterfields"=>array(

            )
        );
        $output = $this->author_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingbytype($type=""){
        $this->author_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"SELECT SQL_CALC_FOUND_ROWS 
                _author.author_id,
				_author.author_name,
				_author.author_insert,
				_author.author_update,
				_author.author_status,
				_author.author_desc,
				_author.author_face,
				_author.author_twit,
				_author.author_goog,
				_author.author_yotu,
				_author.author_thumb,
				_author.author_cover
                ",
            "from"      =>"FROM `{$this->table}`",
            "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` ASC",
            "columnmaps"=>array(

            )
        );
        $output = $this->author_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>