<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class content extends CP_Controller {
    function __construct() {
        parent::__construct('content', 'content_', 'id');
        $this->load->model('cms/cp/content_model');
        $this->load->model('cms/cp/cate_model');
    }
    public function index(){
        $this->vp();
    }
    function ht(){
        
    }
    function im(){
        
    }
    function htdt($id=''){
        
    }
    function vp($type='',$catetype=''){
        $opt = array(
            'conf' => array(
                    'cp'=>  'cms/conf/cms.conf',
                    'content'=>  'cms/conf/cp.conf'
                ),
            'template'  => 'cms/template.tpl'
        );
        $this->smarty->assign('type',$type);
        $this->smarty->assign('catetype',$catetype);
        $this->renderTpl($opt);
    }
    function editpanel($type='',$catetype=''){
        if($catetype!=''){
            $data = $this->cate_model->binding($catetype);
            if(isset($data['aaData'])){
                //$data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
                $this->assigns->cates=$data['aaData'];
            }
        }
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->content_model->onGet($Id);
            $dataType = $this->assigns->item->DataType;
        }
        switch ($dataType){
            case 'vietthang-news':
                $htmlreponse = $this->smarty->view( 'cms/cp/content/editorPanel', $this->assigns, true );
                break;
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/content/editorPanel', $this->assigns, true );
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type="",$catetype=''){
        $this->content_model->datatables_config=array(
            "table"     =>"content",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    content.content_id,
                    content.content_title,
                    content.content_desc,
                    content.content_position,
                    content.content_thumb,
                    content.content_insert,
                    content.content_update,
                    content.content_status,
                    content.content_lock,
                    content.content_category,
                    cate.cat_title
                ",
            "from"      =>"FROM `content` LEFT JOIN cate ON (content.content_category = cate.cat_id) ",
            "where"     =>"WHERE `content_type` = '$type'",
            "order_by"  =>"ORDER BY `content_insert` ASC",
            "columnmaps"=>array(

            )
        );
        $output = $this->content_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>