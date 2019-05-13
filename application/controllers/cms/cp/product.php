<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class product extends CP_Controller {
    function __construct() {
        parent::__construct('product', '_', 'id');
        $this->load->model('cms/cp/cate_model');
        $this->load->model('cms/cp/product_model');
        $this->load->model('cms/cp/head_model');
        $this->load->model('cms/cp/line_model');
        $this->load->model('cms/cp/supplier_model');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->assigns->tplConfig = array(
            'controller'   =>'product',
            'prefix'       =>'_',
            'name'         =>'_oProduct',
            'title'        =>'Product',
            'group'        =>'cp',
            'listEntryTitle'=>'Product Manager',
            'addEntryTitle'=>'Add new Product',
            'editEntryTitle'=>'Modify Product',
            'entryListTpl'=>'templates/cms/cp/product/entryList.tpl'
        );
        // $this->country_model = new Core_Model('country','_','id','true');
    }
    public function index(){
        $this->vp();
    }
    function beforeinsert(){
        $_POST['Params']['_owner'] = $_SESSION["auth"]["user"]->ause_name;
    }
    function beforecommit(){
        $Id = $this->input->post('Id');
        $Params = $this->input->post('Params');
        if(!empty($Params['_alias'])){
            $alias = $Params['_alias'];
            if($Id) $this->db->where('id <>',$Id);
            $item = $this->product_model->onGetByAlias($alias);
            if($item){
                $output["result"] = -1;
                $output["message"] = ("Alias exists, please use another alias.");
                echo json_encode($output);
                die;
            }
        }
        if(!empty($Params['_code'])){
            $code = $Params['_code'];
            if($Id) $this->db->where('_id <>',$Id);
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
        $suppliers = $this->supplier_model->onGetByType($type);
        $this->assigns->suppliers=$suppliers;
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

        // $countries = $this->country_model->onGets();
        // $this->assigns->countries=$countries;

        $head_data = $this->head_model->onGetByType($type);
        $this->assigns->head_data=$head_data;
        $line_data = $this->line_model->onGetByType($type);
        $this->assigns->line_data=$line_data;
        $supplier_data = $this->supplier_model->onGetByType($type);
        $this->assigns->supplier_data=$supplier_data;


        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $dataType="";
        if($Id){
            $this->assigns->item = $this->product_model->onGet($Id);
            $dataType = $this->assigns->item->_type;
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        switch ($dataType){
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/product/editPanel', $this->assigns, true );
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
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title_{$this->lang} as {$this->prefix}title,
                    {$this->table}.{$this->prefix}desc_{$this->lang} as {$this->prefix}desc,
                    {$this->table}.{$this->prefix}ordering,
                    {$this->table}.{$this->prefix}status,
                    {$this->table}.{$this->prefix}type,
                    {$this->table}.{$this->prefix}created_at,
                    {$this->table}.{$this->prefix}modified_at,
                    {$this->table}.{$this->prefix}image,
                    {$this->table}.{$this->prefix}code,
                    {$this->table}.{$this->prefix}readonly,
                    {$this->table}.{$this->prefix}owner,
                    {$this->table}.{$this->prefix}discount,
                    {$this->table}.{$this->prefix}category_id,
                    {$this->table}.{$this->prefix}token,
                    {$this->table}.{$this->prefix}label,
                    {$this->table}.{$this->prefix}price,
                    _cate._title_{$this->lang} as cat_title,
                    _supplier._title_{$this->lang} as supplier_title
                ",
            "from"      =>"
                FROM `{$this->table}` 
                    LEFT JOIN `_cate` ON `{$this->prefix}category_id` = `_cate`.`_id`
                    LEFT JOIN `_supplier` ON `{$this->prefix}supplier_id` = `_supplier`.`_id`
                ",
            //"where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY {$this->table}.`{$this->prefix}ordering` DESC,{$this->table}.`{$this->prefix}created_at` DESC",
            "columnmaps"=>array(
                "cat_title"=>"_cate._value",
                "supplier_title"=>"_supplier._id",
                "_title"=>"{$this->table}.{$this->prefix}title_{$this->lang}",
                "_desc"=>"{$this->table}.{$this->prefix}desc_{$this->lang}",
                "_status"=>"{$this->table}.{$this->prefix}status",
            ),
            "filterfields"=>array(
                'cat_title',
                '_title',
                '_status'
            )
        );
        $output = $this->product_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}
?>