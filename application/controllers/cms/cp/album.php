<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class album extends CP_Controller {
    function __construct() {
        parent::__construct('album', 'album_', 'id');
        $this->load->model('cms/cp/album_model');
        $this->load->model('cms/cp/cate_model');
    }
    public function index(){
        $this->vp();
    }
    function ht(){
        
    }
    function im(){
        
    }
    function htdt($id=''){
        
    }
    function vp($type='',$cate=''){
        $opt = array(
            'conf' => array(
                    'cp'=>  'cms/conf/cms.conf',
                    'album'=>  'cms/conf/cp.conf'
                ),
            'template'  => 'cms/template.tpl'
        );
        $this->smarty->assign('type',$type);
        $this->smarty->assign('cate',$cate);
        $this->renderTpl($opt);
    }
    function editpanel($Type='',$cate=''){
        if($cate!=''){
            $data = $this->cate_model->binding($cate);
            if(isset($data['aaData'])){
                $data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
                $this->assigns->cates=$data['aaData'];
            }
        }
        $this->assigns->type=$Type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->album_model->onGet($Id);
            $dataType = $this->assigns->item->album_type;
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($dataType){
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/album/editorPanel', $this->assigns, true );
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $this->album_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"SELECT SQL_CALC_FOUND_ROWS 
                {$this->table}.{$this->table}_id,
                {$this->table}.{$this->table}_title,
                {$this->table}.{$this->table}_desc,
                {$this->table}.{$this->table}_position,
                {$this->table}.{$this->table}_status,
                {$this->table}.{$this->table}_type,
                {$this->table}.{$this->table}_insert,
                {$this->table}.{$this->table}_update,
                {$this->table}.{$this->table}_thumb,
                {$this->table}.{$this->table}_code,
                {$this->table}.{$this->table}_lock,
                {$this->table}.{$this->table}_owner,
                {$this->table}.{$this->table}_category,
                {$this->table}.{$this->table}_token,
                `cate`.`cat_title`
                ",
            "from"      =>"
                FROM `{$this->table}`
                    LEFT JOIN `cate` ON (`cate`.`cat_id`=`{$this->table}`.`{$this->table}_category`)
                ",
            "where"     =>"WHERE `{$this->table}_type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->table}_insert` ASC",
            "columnmaps"=>array(

            )
        );
        $output = $this->album_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>