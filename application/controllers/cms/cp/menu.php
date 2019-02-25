<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class menu extends CP_Controller {
    function __construct() {
        parent::__construct('menu', 'menu_', 'id');
        $this->load->model('cms/cp/menu_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'menu',
            'prefix'       =>'menu_',
            'name'         =>'_oMenu',
            'title'        =>'Menu',
            'group'        =>'cp',
            'listEntryTitle'=>'Menu Manager',
            'addEntryTitle'=>'Add new Menu',
            'editEntryTitle'=>'Modify Menu',
            'entryListTpl'=>'templates/cms/cp/menu/entryList.tpl'
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
    function editpanel($type=''){
        $this->assigns->type=$type;
        $data = $this->menu_model->binding($type);
        if(isset($data['aaData'])){
            $data['aaData']=$this->menu_model->buildTreeArray($data['aaData']);
            $this->assigns->menus=$data['aaData'];
        }
        $Id=(int)$this->input->post('Id');
        if($Id>0){
            $this->assigns->item = $this->menu_model->onGet($Id);
            $this->assigns->type=$this->assigns->item->menu_type;
        }
        $htmlreponse = $this->smarty->view( 'cms/cp/menu/editorPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $result = $this->menu_model->binding($type);
        $result['aaData']=$this->menu_model->buildTreeArray($result['aaData']);
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    function commit(){
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege->aupr_permission == 777) {
            
            $Params = $this->input->post('Params');
            $Id = (int) $this->input->post('Id');
            if ($Id != 0) {
                $Node=$this->menu_model->onGet($Id);
                if($Node){
                    if(isset($Params['menu_parent'])){
                        $ParentId=(int)$Params['menu_parent'];
                        if($ParentId==$Id){
                            //node cha bang node code::loi
                            $output["result"] = -206;
                            $output["message"] = "[206] Data invalid !";
                            $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit record - Menu['$Id']",'e');
                            $this->output->set_header('Content-type: application/json');
                            $this->output->set_output(json_encode($output));
                            return;
                        }elseif($ParentId>0){
                            $ParentNode=$this->menu_model->onGet($ParentId);
                            if($ParentNode){
                                if($Node->menu_type!=$ParentNode->menu_type){
                                    //2 node khác loai::loi
                                    $output["result"] = -205;
                                    $output["message"] = "[205] Node ko cùng loại.";
                                    $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Update Entry - Menu['$Id']",'e');
                                    $this->output->set_header('Content-type: application/json');
                                    $this->output->set_output(json_encode($output));
                                    return;
                                }else{
                                    if(!$this->checknode($Id,$ParentId,$Node->menu_type)){
                                        //Cau truc loi ::loi
                                        $output["result"] = -207;
                                        $output["message"] = "[207] Data invalid.";
                                        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Update Entry - Menu['$Id']",'e');
                                        $this->output->set_header('Content-type: application/json');
                                        $this->output->set_output(json_encode($output));
                                        return;
                                    }
                                }
                            }else{
                                //node cha khong ton tai::loi
                                $output["result"] = -204;
                                $output["message"] = "[204] Parent Node doesn't exist.";
                                $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Update Entry - Menu['$Id']",'e');
                                $this->output->set_header('Content-type: application/json');
                                $this->output->set_output(json_encode($output));
                                return;
                            }
                        }
                    }
                }else{
                    $output["result"] = -203;
                    $output["message"] = "[203] Node doesn't exist.";
                    $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Update Entry - Menu['$Id']",'e');
                    $this->output->set_header('Content-type: application/json');
                    $this->output->set_output(json_encode($output));
                    return;
                }
                $rs = $this->menu_model->onUpdate($Id, $Params);
                
            } else {
                
                $rs = $this->menu_model->onInsert($Params);
            }
            if ($rs === FALSE){
                $output["result"] = -1;
                $output["message"] = ("System rejected your data.<br/>Please check data input and try again.");
            }else{
                $output["result"] = 1;
                $output["message"] = ("Success. Data have been save.");
            }
        }
        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit Entry - Menu['$Id']",'e');
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
    private function checknode($nodeid,$pnodeid,$type){
        if($nodeid==$pnodeid) return false;
        $data = $this->menu_model->getMenuByType($type);
        $nodes=$this->menu_model->buildTreeArray($data);
        $checking=false;
        $output["message"]='SUCCESS !';
        foreach ($nodes as $node){
            if($checking){
                if($node->cat_level > $nodelevel){
                    if($node->menu_id==$pnodeid){
                        return false;
                        break;
                    }
                }else{
                   $checking=false;
                   break;
                }
            }
            if($node->menu_id==$nodeid){
                $checking=true;
                $nodelevel=$node->menu_level;
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
                $tmp = $this->menu_model->onGet($id);
                if ($tmp) {
                    $this->db->trans_begin();
                    $rs = $this->menu_model->onDelete($id);
                    $this->menu_model->updateNodeByParent($tmp->menu_id,$tmp->menu_parent);
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
        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Delete record - Menu['$id']",'e');
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function menugender(){
        $output["result"] = 1;
        $output["message"] = "Success. Menu have been updated.";
        $output['cms'] = $this->updateCMSMenu();
        $output['sp'] = $this->updateSuperMenu();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    private function updateSuperMenu(){
        $data = $this->menu_model->getMenuByType('supper');
        $data=$this->menu_model->buildTree($data);
        $this->assigns->menus=$data;
        $htmlreponse = $this->smarty->view( 'cms/cp/menu/navimenu', $this->assigns, true );
        return write_file(APPPATH."templates/cms/widget/navimenuAdmin.tpl", $htmlreponse, 'w+');
    }
    private function updateCMSMenu(){
        $data = $this->menu_model->getMenuByType('cms');
        $data=$this->menu_model->buildTree($data);
        $this->assigns->menus=$data;
        $htmlreponse = $this->smarty->view( 'cms/cp/menu/navimenu', $this->assigns, true );
        return write_file(APPPATH."templates/cms/widget/navimenu.tpl", $htmlreponse, 'w+');
    }
}
?>