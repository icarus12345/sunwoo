<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class contactus extends CP_Controller {
    function __construct() {
        parent::__construct('contactus', 'contact_', 'id');
        //$this->load->model('cms/cp/contact_model');
    }
    public function index(){
        $this->vp();
    }
    function vp(){
        $opt = array(
            'conf' => array(
                    'cp'=>  'cms/conf/cms.conf',
                    'contactus'=>  'cms/conf/cp.conf'
                ),
            'template'  => 'cms/template.tpl'
        );
        $this->smarty->assign('album',$album);
        $this->renderTpl($opt);
    }
    function editpanel(){
        $Id=$this->input->post('Id');
        $this->assigns->item = $this->Core_Model->onGet($Id);
        $htmlreponse = $this->smarty->view( 'cms/cp/contact/editorPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype(){
        $this->Core_Model->datatables_config=array(
            "table"     =>"contactus",
            "select"    =>"SELECT SQL_CALC_FOUND_ROWS * ",
            "from"      =>"FROM `contactus`",
            "order_by"  =>"ORDER BY `contact_insert` DESC",
            "columnmaps"=>array(

            )
        );
        $result = $this->Core_Model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    
}
?>