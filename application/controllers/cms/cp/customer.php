<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class customer extends CP_Controller {
    function __construct() {
        parent::__construct('customer', '', 'Id');
        $this->load->model('cms/cp/customer_model');
    }
    public function index(){
        $this->vp();
    }
    function op($id=''){
        
    }
    function vp($type=''){
        $opt = array(
            'conf' => array(
                    'cp'=>  'cms/conf/cms.conf',
                    'customer'=>  'cms/conf/cp.conf'
                ),
            'template'  => 'cms/template.tpl'
        );
        $this->smarty->assign('type',$type);
        $this->renderTpl($opt);
    }
    function editpanel($Type=''){
        $this->assigns->type=$Type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->customer_model->onGet($Id);
        }
        $htmlreponse = $this->smarty->view( 'cms/cp/customer/editorPanel', $this->assigns, true );
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $this->customer_model->datatables_config=array(
            "table"     =>"customer",
            "select"    =>"SELECT SQL_CALC_FOUND_ROWS * ",
            "from"      =>"FROM `customer`",
            "where"     =>"WHERE `Type` = '$type'",
            "order_by"  =>"ORDER BY `Name` ASC",
            "columnmaps"=>array(

            )
        );
        $result = $this->customer_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    
}
?>