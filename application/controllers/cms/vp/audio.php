<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class audio extends VD_Controller {
    function __construct() {
        parent::__construct('_audio', 'audio_', 'id');
        $this->load->model('cms/vd/audio_model');
        $this->load->model('cms/co/topic_model');
        $this->assigns->tplConfig = array(
        	'controller'   =>'audio',
        	'prefix'       =>'audio_',
        	'name'         =>'_oAudio',
        	'title'        =>'Audio',
            'group'        =>'vp',
        	'listEntryTitle'=>'Audio Manager',
        	'addEntryTitle'=>'Add new audio',
        	'editEntryTitle'=>'Modify audio',
            'entryListTpl'=>'templates/cms/vp/audio/entryList.tpl'
    	);
    }
    public function index(){
        $this->vp();
    }
    function beforedelete(){
        
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
        $data = $this->topic_model->onGetByType('video');
        foreach ($data as $o) {
            $topics[$o->author_id][] = $o;
        }
        $this->assigns->topics = $topics;
        if($Id){
            $this->assigns->item = $this->audio_model->onGet($Id);
            $dataType = $this->assigns->item->audio_type;
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($dataType){
            default :
                $htmlreponse = $this->smarty->view( 'cms/vp/audio/editPanel', $this->assigns, true );
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function widgetbinding(){
        $this->audio_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title,
                    {$this->table}.{$this->prefix}video,
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
        $output = $this->audio_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingbytype($type=""){
        $this->audio_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    _audio.audio_id,
    				_audio.audio_title,
    				_audio.audio_insert,
    				_audio.audio_update,
    				_audio.audio_status,
                    topic_title
                ",
            "from"      =>"
                FROM `{$this->table}`
                    LEFT JOIN _topic ON (topic_id = audio_topic)
            ",
            "where"     =>"WHERE true",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` ASC",
            "columnmaps"=>array(

            )
        );
        $output = $this->audio_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>