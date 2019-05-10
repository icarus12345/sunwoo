<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class setting extends CP_Controller {
    function __construct() {
        parent::__construct('setting', '_', 'id');
        $this->load->model('cms/cp/setting_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'setting',
            'prefix'       =>'_',
            'name'         =>'_oSetting',
            'title'        =>'Setting',
            'group'        =>'cp',
            'listEntryTitle'=>'Setting',
            'addEntryTitle'=>'Add new entry',
            'editEntryTitle'=>'Modify entry',
            'entryListTpl'=>'templates/cms/cp/settingvpe/entryList.tpl'
        );
    }
    public function index(){
        $this->vp();
    }
    function vp($unit='v-',$type='',$layout='e'){
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/cp/setting/EntryList.tpl';
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->assigns->layout = $layout;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function vpi($unit='v-',$type='',$layout='e'){
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/cp/setting/iEntryList.tpl';
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->assigns->layout = $layout;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function vpg($type=''){
        $opt = array(
            'conf' => array(
                    'cp'=>  'cms/conf/cms.conf',
                    'setting2'=>  'cms/conf/cp.conf'
                ),
            'template'  => 'cms/template.tpl'
        );
        $this->smarty->assign('type',$type);
        $this->renderTpl($opt);
    }
    function vpe($unit='v-',$type='',$layout='e'){
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/cp/settingvpe/entryList.tpl';
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->assigns->layout = $layout;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($Type=''){
        $this->assigns->type=$Type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->setting_model->onGet($Id);
            $dataType = $this->assigns->item->_data_type;
        }
        $layout = $this->input->post('layout');
        if(!empty($layout)){
            switch ($layout){
                case 'menu':
                    $htmlreponse = $this->smarty->view( 'cms/cp/setting2/editPanel', $this->assigns, true );
                    break;
                case 'i':
                    $htmlreponse = $this->smarty->view( 'cms/cp/setting2/editPanelImg', $this->assigns, true );
                    break;
                case 'e':
                    $htmlreponse = $this->smarty->view( 'cms/cp/settingvpe/editPanel', $this->assigns, true );
                    break;
                default :
                    $htmlreponse = $this->smarty->view( 'cms/cp/setting2/editPanel', $this->assigns, true );
            }
        }else switch ($dataType){
            case 'text':
                $htmlreponse = $this->smarty->view( 'cms/cp/setting/editorPanelText', $this->assigns, true );
                break;
            case 'html':
                $htmlreponse = $this->smarty->view( 'cms/cp/setting/editorPanelHtml', $this->assigns, true );
                break;
            case 'image':
                $htmlreponse = $this->smarty->view( 'cms/cp/setting/editorPanelImage', $this->assigns, true );
                break;
            case 'video':
                $htmlreponse = $this->smarty->view( 'cms/cp/setting/editorPanelVideo', $this->assigns, true );
                break;
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/setting/editorPanel', $this->assigns, true );
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $this->setting_model->datatables_config=array(
            "table"     =>"setting",
            "select"    =>"SELECT SQL_CALC_FOUND_ROWS * ",
            "from"      =>"FROM `setting`",
            "where"     =>"WHERE `_type` = '$type'",
            "order_by"  =>"ORDER BY `_created_at` ASC",
            "columnmaps"=>array(

            )
        );
        $result = $this->setting_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    
}
?>