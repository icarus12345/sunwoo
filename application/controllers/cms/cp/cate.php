<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class cate extends CP_Controller {
    function __construct() {
        parent::__construct('_cate', '_', 'id');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/lang_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
        $this->load->model('cms/cp/cate_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'cate',
            'prefix'       =>'_',
            'name'         =>'_oCate',
            'title'        =>'Category',
            'group'        =>'cp',
            'listEntryTitle'=>'Category Manager',
            'addEntryTitle'=>'Add new entry',
            'editEntryTitle'=>'Modify entry',
            'entryListTpl'=>'templates/cms/cp/cate/entryList.tpl'
        );
    }
    public function index(){
        $this->vp();
    }
    function event($unit='v-',$type=''){
        $this->assigns->tplConfig = array(
            'controller'   =>'cate',
            'prefix'       =>'',
            'name'         =>'_oCate',
            'title'        =>'Event',
            'group'        =>'cp',
            'listEntryTitle'=>'Event Manager',
            'addEntryTitle'=>'Add new Event',
            'editEntryTitle'=>'Modify Event',
            'entryListTpl'=>'templates/cms/cp/cate/entryList.tpl'
        );
        $this->vp($unit,$type);
    }
    function vp($unit='v-',$type=''){
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function editpanel($type=''){
        $this->assigns->type=$type;
        $data = $this->cate_model->binding($type);
        $output["cdata"] = $data;
        if(isset($data['aaData'])){
            $data['aaData']=$this->cate_model->buildTreeArray($data['aaData']);
            $this->assigns->cates=$data['aaData'];
        }
        $Id=(int)$this->input->post('Id');
        if($Id>0){
            $this->assigns->item = $this->cate_model->onGet($Id);
            $this->assigns->type=$this->assigns->item->_type;
        }
        switch ($this->assigns->type){
            // case 'property':
            // // case 'sunwoo':
            // case 'real':
            // case 'tintuc':
            // case 'advisory':
            //     $htmlreponse = $this->smarty->view( 'cms/cp/cate/editorPanelList', $this->assigns, true );
            //     break;
            // case 'default':
            //     $htmlreponse = $this->smarty->view( 'cms/cp/cate/editorPanelSunwoo', $this->assigns, true );
            //     break;
            default :
                $htmlreponse = $this->smarty->view( 'cms/cp/cate/editorPanel', $this->assigns, true );
        }
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function widgetbinding($type=''){
        $this->cate_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title{$this->lang} as {$this->prefix}title,
                    {$this->table}.{$this->prefix}created_at,
                    {$this->table}.{$this->prefix}modified_at,
                    {$this->table}.{$this->prefix}status
                ",
            "from"      =>" FROM `{$this->table}` ",
            "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}value` ASC",
            "columnmaps"=>array(
                
            ),
            "filterfields"=>array(
                "{$this->prefix}title"=>"{$this->table}.{$this->prefix}title{$this->lang}"
            )
        );
        $output = $this->cate_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingbytype($type=""){
        $result = $this->cate_model->binding($type);
        $result['aaData']=$this->cate_model->buildTreeArray($result['aaData']);
        $this->updateBatch($result['aaData']);
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    function updateBatch($aaData){
        if(!empty($aaData)) foreach ($aaData as $c){
            if($c->_value!=$c->new_value){
                $this->cate_model->onUpdate($c->_id,array('_value'=>$c->new_value));
            }
        }
    }
    function commit(){
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege->aupr_permission == 777) {
            
            $Params = $this->input->post('Params');
            $Id = (int) $this->input->post('Id');
            if ($Id != 0) {
                $Node=$this->cate_model->onGet($Id);
                if($Node){
                    if(isset($Params['_parent_id'])){
                        $ParentId=(int)$Params['_parent_id'];
                        if($ParentId==$Id){
                            //node cha bang node code::loi
                            $output["result"] = -206;
                            $output["message"] = "[206] Data invalid !";
                            $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit record - Category['$Id']",'e');
                            $this->output->set_header('Content-type: application/json');
                            $this->output->set_output(json_encode($output));
                            return;
                        }elseif($ParentId>0){
                            $ParentNode=$this->cate_model->onGet($ParentId);
                            if($ParentNode){
                                if($Node->cate_type!=$ParentNode->cate_type){
                                    //2 node khác loai::loi
                                    $output["result"] = -205;
                                    $output["message"] = "[205] Node ko cùng loại.";
                                    $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit record - Category['$Id']",'e');
                                    $this->output->set_header('Content-type: application/json');
                                    $this->output->set_output(json_encode($output));
                                    return;
                                }else{
                                    if(!$this->checknode($Id,$ParentId,$Node->cate_type)){
                                        //Cau truc loi ::loi
                                        $output["result"] = -207;
                                        $output["message"] = "[207] Data invalid.";
                                        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit record - Category['$Id']",'e');
                                        $this->output->set_header('Content-type: application/json');
                                        $this->output->set_output(json_encode($output));
                                        return;
                                    }
                                }
                            }else{
                                //node cha khong ton tai::loi
                                $output["result"] = -204;
                                $output["message"] = "[204] Parent Node doesn't exist.";
                                $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit record - Category['$Id']",'e');
                                $this->output->set_header('Content-type: application/json');
                                $this->output->set_output(json_encode($output));
                                return;
                            }
                        }
                    }
                }else{
                    $output["result"] = -203;
                    $output["message"] = "[203] Node doesn't exist.";
                    $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit record - Category['$Id']",'e');
                    $this->output->set_header('Content-type: application/json');
                    $this->output->set_output(json_encode($output));
                    return;
                }
                $rs = $this->cate_model->onUpdate($Id, $Params);
                
            } else {
                
                $rs = $this->cate_model->onInsert($Params);
            }
            if ($rs === FALSE){
                $output["result"] = -1;
                $output["message"] = ("System rejected your data.<br/>Please check data input and try again.");
            }else{
                $output["result"] = 1;
                $output["message"] = ("Success. Data have been save.");
            }
        }
        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit record - Category['$Id']",'e');
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
    private function checknode($nodeid,$pnodeid,$type){
        if($nodeid==$pnodeid) return false;
        $data = $this->cate_model->getCategoryByType($type);
        $nodes=$this->cate_model->buildTreeArray($data);
        $checking=false;
        $output["message"]='SUCCESS !';
        foreach ($nodes as $node){
            if($checking){
                if($node->_level > $nodelevel){
                    if($node->_id==$pnodeid){
                        return false;
                        break;
                    }
                }else{
                   $checking=false;
                   break;
                }
            }
            if($node->_id==$nodeid){
                $checking=true;
                $nodelevel=$node->_level;
            }
        }
        return true;
    }
            
    function delete() {
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege->aupr_permission == 777) {
            $id = (int) $this->input->post('Id');
            if ($id > 0) {
                $tmp = $this->cate_model->onGet($id);
                if ($tmp) {
                    $this->db->trans_begin();
                    $rs = $this->cate_model->onDelete($id);
                    $this->cate_model->updateNodeByParent($tmp->_id,$tmp->_parent_id);
                    if($this->db->trans_status() === FALSE || $rs === false){
                        $this->db->trans_rollback();
                        $output["result"] = -1;
                        $output["message"] = ("Fail. Please check data input and try again.");
                    }else{
                        $this->db->trans_commit();
                        $output["result"] = 1;
                        $output["message"] = ("Success. Record have been deleted.");
                    }
                }else {
                    $output["message"] = ("Record does't exist.");
                }
            } else {
                $output["message"] = ("Id invalid.");
            }
        }
        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Delete record - Category['$id']",'e');
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
}
?>