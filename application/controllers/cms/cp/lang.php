<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class lang extends CP_Controller {
    
    function __construct() {
        parent::__construct('language', 'lang_', 'id');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->assigns->tplConfig = array(
            'controller'   =>'lang',
            'prefix'       =>'lang_',
            'name'         =>'APP',
            'title'        =>'Event',
            'group'        =>'cp',
            'listEntryTitle'=>'Language',
            'addEntryTitle'=>'Add new Language',
            'editEntryTitle'=>'Modify Language',
            'entryListTpl'=>'templates/cms/cp/lang/entryList.tpl'
        );
    }

    public function index(){
        $this->vp();
    }
    function vp($unit='v-',$type=''){
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($lang_set=''){
        $this->assigns->lang_set=$lang_set;
        $key=$this->input->post('Id');
        if($key){
            $this->assigns->item = $this->lang_model->getLangByKey($key, $this->langs);
        }
        $htmlreponse = $this->smarty->view( 'cms/cp/lang/editorPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $this->lang_model->datatables_config=array(
            "table"     =>"language",
            "select"    =>"SELECT SQL_CALC_FOUND_ROWS * ",
            "from"      =>"FROM language",
            "where"     =>"WHERE lang_set = '$type'",
            "group_by"  =>"GROUP BY lang_key",
            "order_by"  =>"ORDER BY `lang_key` ASC",
            "columnmaps"=>array(

            )
        );
        $result = $this->lang_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    function commit(){
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege->aupr_permission == 777) {
            
            $Params = $this->input->post('Params');
            $lang_key = $Params['lang_key'];
            $lang_set = $Params['lang_set'];
            $this->db->trans_begin();
            foreach ($Params['langs'] as $key=>$value) {
                $OnduplicateLang = array(
                    'lang_key'=>$lang_key,
                    'lang_language'=>$value,
                    'lang_set'=>$lang_set,
                    'lang_text'=>$Params['lang_texts'][$key],
                    'lang_insert'=>date('Y-m-d H:i:s'),
                    'lang_update'=>date('Y-m-d H:i:s')
                );
                $this->lang_model->insertOnduplicateUpdate($OnduplicateLang, array('lang_text','lang_update'));
            }
            
            if ($this->db->trans_status() === FALSE){
                $this->db->trans_rollback();
                $output["result"] = -1;
                $output["message"] = ("System rejected your data.<br/>Please check data input and try again.<br/>");
            }else{
                $this->db->trans_commit();
                $output["result"] = 1;
                $output["message"] = ("Success. Data have been save.");
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
}
?>