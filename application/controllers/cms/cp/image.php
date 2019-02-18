<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class image extends CP_Controller {
    function __construct() {
        parent::__construct('image', 'image_', 'id');
        $this->load->model('cms/cp/image_model');
    }
    public function index(){
        $this->vp();
    }
    function vp($album=''){
        $opt = array(
            'conf' => array(
                    'cp'=>  'cms/conf/cms.conf',
                    'image'=>  'cms/conf/cp.conf'
                ),
            'template'  => 'cms/template.tpl'
        );
        $this->smarty->assign('album',$album);
        $this->renderTpl($opt);
    }
    function editpanel($album=''){
        $this->assigns->album=$album;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->image_model->onGet($Id);
            $dataType = $this->assigns->item->DataType;
        }
        switch ($dataType){
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/image/editorPanel', $this->assigns, true );
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($album=""){
        $this->image_model->datatables_config=array(
            "table"     =>"image",
            "select"    =>"SELECT SQL_CALC_FOUND_ROWS * ",
            "from"      =>"FROM `image`",
            "where"     =>"WHERE `image_album_id` = '$album'",
            // "order_by"  =>"ORDER BY `Name` ASC",
            "columnmaps"=>array(

            )
        );
        $result = $this->image_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    
}
?>