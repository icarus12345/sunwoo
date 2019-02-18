<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class fm extends Core_Controller {
    function __construct() {
        parent::__construct('auth_users', 'ause_', 'id');
        $this->assigns->tplConfig = array(
            'controller'   =>'fm',
            'prefix'       =>'fm_',
            'name'         =>'_oFm',
            'title'        =>'File Managerment',
            'group'        =>'',
            'listEntryTitle'=>'File Managerment'
        );
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/fm/audio.tpl';
    }
    public function index(){
        $this->file('audio');
    }
    function file($type=''){
        // $this->db->order_by('cat_value','ASC');
        // $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/fm/fmtemplate', $this->assigns );
    }
    protected function privilege() {
        $this->privilege->aupr_permission = 0;
        if (
                !!array_intersect(array('Administrator', 'Admin','User'), $this->authoritys)
        ) {
            $this->privilege->aupr_permission = 777;
            return true;
        }
        return false;
    }

    function privilege_view() {
        $this->privilege->aupr_permission = 0;
        if (
                !!array_intersect(array('View'), $this->authoritys)
        ) {
            $this->privilege->aupr_permission = 755;
            return true;
        }
        if (
                !!array_intersect(array('Administrator', 'Admin','User'), $this->authoritys)
        ) {
            $this->privilege->aupr_permission = 777;
            return true;
        }
        return false;
    }
    function vp($type=''){
        $opt = array(
            'conf' => array(
                    'kcfinder'=>  'cms/conf/cms.conf'
                ),
            'template'  => 'cms/itemplate.tpl'
        );
        $this->smarty->assign('type',$type);
        $this->renderTpl($opt);
    }
    
}
?>