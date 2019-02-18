<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class setting extends CP_Controller {
    function __construct() {
        parent::__construct('_setting', 'setting_', 'id');
        $this->assigns->tplConfig = array(
            'controller'   =>'setting',
            'prefix'       =>'setting_',
            'name'         =>'_oSetting',
            'title'        =>'Setting',
            'group'        =>'co',
            'listEntryTitle'=>'Setting',
            'addEntryTitle'=>'Add new Page',
            'editEntryTitle'=>'Modify Page',
            'entryListTpl'=>'templates/cms/co/setting/entryList.tpl'
        );
    }
    public function index(){
        $this->vp();
    }
    function beforecommit(){
        $values = json_encode($_POST['Params'],true);
        $_POST['Params'] = array(
            'setting_value'=>$values
        );
    }
    function ed($Id=0){
        if($Id){
            $this->assigns->item = $this->Core_Model->onGet($Id);
            $this->assigns->item->values = json_decode($this->assigns->item->setting_value,true);
        }
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/co/setting/entryOnly.tpl';
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    
    
}
?>