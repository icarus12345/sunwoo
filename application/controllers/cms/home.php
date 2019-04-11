<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class home extends VD_Controller {
    public function index(){
        $this->news_model = new Core_Model('_news', '_', 'id');

        $this->assigns->tplConfig = array(
            'controller'   =>'fm',
            'prefix'       =>'fm_',
            'name'         =>'_oFm',
            'title'        =>'CMS',
            'group'        =>'CMS',
            'listEntryTitle'=>'CMS'
        );
        $this->db->select("_id,_title_{$this->lang} as _title,_content_{$this->lang} as _content");
        $this->assigns->helpers = $this->news_model->onGetByType('helper');
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/home/help.tpl';
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    
    
}
?>