<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class product extends CP_Controller {
    function __construct() {
        parent::__construct('_product', 'product_', 'id');
        $this->load->model('cms/cp/cate_model');
        $this->load->model('cms/cp/product_model');
        $this->load->model('cms/cp/head_model');
        $this->load->model('cms/cp/line_model');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->assigns->tplConfig = array(
            'controller'   =>'product',
            'prefix'       =>'product_',
            'name'         =>'_oProduct',
            'title'        =>'Product',
            'group'        =>'cp',
            'listEntryTitle'=>'Product Manager',
            'addEntryTitle'=>'Add new Product',
            'editEntryTitle'=>'Modify Product',
            'entryListTpl'=>'templates/cms/cp/product/entryList.tpl'
        );
        $this->country_model = new Core_Model('country','_','id','true');
    }
    public function index(){
        $this->vp();
    }
    function beforecommit(){
        $Id = $this->input->post('Id');
        $Params = $this->input->post('Params');
        if(!empty($Params['product_alias'])){
            $alias = $Params['product_alias'];
            if($Id) $this->db->where('product_id <>',$Id);
            $item = $this->product_model->onGetByAlias($alias);
            if($item){
                $output["result"] = -1;
                $output["message"] = ("Alias exists, please use another alias.");
                echo json_encode($output);
                die;
            }
        }
        if(!empty($Params['product_code'])){
            $code = $Params['product_code'];
            if($Id) $this->db->where('product_id <>',$Id);
            $item = $this->product_model->onGetByCode($code);
            if($item){
                $output["result"] = -1;
                $output["message"] = ("CODE '<b>$code</b>' exists, please use another CODE.");
                echo json_encode($output);
                die;
            }
        }
    }
    function vp($unit='v-',$type=''){
        
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $data = $this->cate_model->binding($type);
        if(isset($data['aaData'])){
            $data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
            $this->assigns->cates=$data['aaData'];
        }
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($type=''){
        $data = $this->cate_model->binding($type);
        if(isset($data['aaData'])){
            $data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
            $this->assigns->cates=$data['aaData'];
        }
        $data = $this->cate_model->binding('sunwoo');
        if(isset($data['aaData'])){
            $data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
            $this->assigns->sub_cates=$data['aaData'];
        }

        $countries = $this->country_model->onGets();
        $this->assigns->countries=$countries;

        $head_data = $this->head_model->onGetByType($type);
        $this->assigns->head_data=$head_data;
        $line_data = $this->line_model->onGetByType($type);
        $this->assigns->line_data=$line_data;

        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->product_model->onGet($Id);
            $dataType = $this->assigns->item->product_type;
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($dataType){
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/product/editPanel2', $this->assigns, true );
        }
        
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $this->product_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    product_id,
                    product_title_{$this->lang} as {$this->prefix}title,
                    product_desc_{$this->lang} as {$this->prefix}desc,
                    product_position,
                    product_status,
                    product_type,
                    product_insert,
                    product_update,
                    product_thumb,
                    product_code,
                    product_lock,
                    product_owner,
                    product_category,
                    product_token,
                    product_price,
                    cat_title_{$this->lang} as cat_title
                ",
            "from"      =>"
                FROM `{$this->table}` 
                    LEFT JOIN `cate` 
                    ON `{$this->prefix}category` = `cate`.`cat_id`",
            //"where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}position` DESC,`{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                "cat_title"=>"cat_value",
                "product_title"=>"product_title_{$this->lang}",
                "product_desc"=>"product_desc_{$this->lang}",
            ),
            "filterfields"=>array(
                // 'product_title_vi','cat_title_vi'
            )
        );
        $output = $this->product_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>