<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class file extends Core_Controller {
    function __construct() {
        parent::__construct('auth_users', 'ause_', 'id');
        $this->load->model('cms/account_model');
    }
    public function index(){
        $this->vp();
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