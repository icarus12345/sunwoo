<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class category extends CP_Controller {
    function __construct() {
        parent::__construct('category', 'cat_', 'id');
        $this->langs = array('en','vi');
        $this->load->model('cms/cp/category_model');
        $this->assigns->langs = $this->language_model->getLangIn($this->langs);
    }
    public function index(){
        $this->vp();
    }
    function vp($type=''){
        $opt = array(
            'conf' => array(
                    'cp'=>  'cms/conf/cms.conf',
                    'category'=>  'cms/conf/cp.conf'
                ),
            'template'  => 'cms/000/template.tpl'
        );
        $this->smarty->assign('type',$type);
        $this->renderTpl($opt);
    }
    function editpanel($type=''){
        $this->assigns->type=$type;
        $data = $this->category_model->binding($type);
        $this->assigns->token = md5('cat'.time().strtoupper(random_string('alnum', 8)));
        $langs = array_map(create_function('$o', 'return $o->lang_short;'), $this->assigns->langs);
        if(isset($data['aaData'])){
            $data['aaData']=$this->category_model->buildTreeArray($data['aaData']);
            $this->assigns->cates=$data['aaData'];
        }
        $key=$this->input->post('key');
        if($key){
            $this->assigns->item = $this->lang_model->getLangByKey($key, $this->langs);
        }
        $Id=(int)$this->input->post('Id');
        if($Id>0){
            $this->assigns->item = $this->category_model->getCategoryById($Id, $langs);
            $this->assigns->type=$this->assigns->item->cate_type;
        }
        $htmlreponse = $this->smarty->view( 'cms/cp/category/editorPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function bindingbytype($type=""){
        $result = $this->category_model->binding($type);
        $result['aaData']=$this->category_model->buildTreeArray($result['aaData']);
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    function commit(){
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege->aupr_permission == 777) {
            
            $Params = $this->input->post('Params');
            $Id = (int) $this->input->post('Id');
            $aInfo = $Params['info'];
            $aLang = $Params['lang'];
            $aTitle = $Params['title'];
            $aDesc = $Params['desc'];
            if ($Id != 0) {
                $Node=$this->category_model->onGet($Id);
                if($Node){
                    if(isset($Params['info']['cate_parent'])){
                        $ParentId=(int)$Params['info']['cate_parent'];
                        if($ParentId==$Id){
                            //node cha bang node code::loi
                            $output["result"] = -206;
                            $output["message"] = "[206] Data invalid !";
                            $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Commit record - Category['$Id']",'e');
                            $this->output->set_header('Content-type: application/json');
                            $this->output->set_output(json_encode($output));
                            return;
                        }elseif($ParentId>0){
                            $ParentNode=$this->category_model->onGet($ParentId);
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
                $this->db->trans_begin();
                $rs = $this->category_model->onUpdate($Id, $aInfo);
                foreach ($aLang as $key=>$value) {
                    $OnduplicateTitle = array(
                        'ti_title'=>$aTitle[$key],
                        'ti_lang'=>$value,
                        'ti_token'=>$aInfo['cat_token'],
                        'ti_type'=>'category',
                        'ti_insert'=>date('Y-m-d H:i:s'),
                        'ti_update'=>date('Y-m-d H:i:s')
                    );
                    $this->language_model->insertOnduplicateUpdateTitle($OnduplicateTitle, array('ti_title','ti_update'));
                    $Onduplicatedesc = array(
                        'de_desc'=>$aDesc[$key],
                        'de_lang'=>$value,
                        'de_token'=>$aInfo['cat_token'],
                        'de_type'=>'category',
                        'de_insert'=>date('Y-m-d H:i:s'),
                        'de_update'=>date('Y-m-d H:i:s')
                    );
                    $this->language_model->insertOnduplicateUpdateDesc($Onduplicatedesc, array('de_desc','de_update'));
                }
            } else {
                foreach ($aLang as $key=>$value) {
                    $batchTitles[] = array(
                        'ti_title'=>$aTitle[$key],
                        'ti_lang'=>$value,
                        'ti_token'=>$aInfo['cat_token'],
                        'ti_type'=>'category',
                        'ti_insert'=>date('Y-m-d H:i:s')
                    );
                    $batchDescs[] = array(
                        'de_desc'=>$aDesc[$key],
                        'de_lang'=>$value,
                        'de_token'=>$aInfo['cat_token'],
                        'de_type'=>'category',
                        'de_insert'=>date('Y-m-d H:i:s')
                    );
                }
                $this->db->trans_begin();
                $rs = $this->category_model->onInsert($aInfo);
                $this->language_model->insertBatchTitle($batchTitles);
                $this->language_model->insertBatchDesc($batchDescs);
            }
            if ($this->db->trans_status() === FALSE){
                $this->db->trans_rollback();
                $output["result"] = -1;
                $output["message"] = ("System rejected your data.<br/>Please check data input and try again.");
            }else{
                $this->db->trans_commit();
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
        $data = $this->category_model->getCategoryByType($type);
        $nodes=$this->category_model->buildTreeArray($data);
        $checking=false;
        $output["message"]='SUCCESS !';
        foreach ($nodes as $node){
            if($checking){
                if($node->cat_level > $nodelevel){
                    if($node->cate_id==$pnodeid){
                        return false;
                        break;
                    }
                }else{
                   $checking=false;
                   break;
                }
            }
            if($node->cate_id==$nodeid){
                $checking=true;
                $nodelevel=$node->cate_level;
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
                $tmp = $this->category_model->onGet($id);
                if ($tmp) {
                    $this->db->trans_begin();
                    $rs = $this->category_model->onDelete($id);
                    $this->language_model->deleteTitleByToken($tmp->cat_token,'category');
                    $this->language_model->deleteDescByToken($tmp->cat_token,'category');
                    $this->category_model->updateNodeByParent($tmp->cate_id,$tmp->cate_parent);
                    if($this->db->trans_status() === FALSE || $rs === false){
                        $this->db->trans_rollback();
                        $output["result"] = -1;
                        $output["error_number"] = $this->db->_error_number();
                        $output["error_message"] = $this->db->_error_message();
                        $output["message"] = ("Fail. Please check data input and try again.<br/>");
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