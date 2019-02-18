<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class home extends VD_Controller {
    public function index(){
        $this->assigns->tplConfig = array(
            'controller'   =>'fm',
            'prefix'       =>'fm_',
            'name'         =>'_oFm',
            'title'        =>'CMS',
            'group'        =>'CMS',
            'listEntryTitle'=>'CMS'
        );
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/home/help.tpl';
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    
    
}
?>