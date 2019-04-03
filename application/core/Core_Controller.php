<?php
class Core_Controller extends CI_Controller {
    public $assigns;
    public function __construct($table = '', $prefix = '', $colid = 'id') {
        parent::__construct();
        $this->table = $table;
        $this->prefix = $prefix;
        $this->colid = $colid;
        $this->privilege = new stdClass();
        $this->assigns = new stdClass();
        $this->lang = isset($_SESSION["lang"])?$_SESSION["lang"]:'en';
        $this->langs = array('en','vi');
        $this->isAjax = $this->input->is_ajax_request();
        $this->load->model("cms/auth_model");
        $this->checklogin();
        $this->checkaccessdenie();
        $this->Core_Model = new Core_Model($this->table, $this->prefix, $this->colid);
        $this->smarty->caching = 0;
    }

    function renderTpl($opt){
        foreach ($opt as $key=>$value){
            $this->smarty->assign( $key, $value );
        }
        $this->smarty->view( $opt['template'], $this->assigns );
    }
    
    function checklogin() {

        if ($this->input->get_post('action') === "login") {
            $this->onlogin();
        }
        if (!isset($_SESSION["auth"]["user"])) {
            if ($this->isAjax) {
                $output["result"] = -903;
                $output["message"] = "You must be login.";
                echo json_encode($output);
                die;
            } else {
                $state=uri_string();
                if($this->input->get())
                    $query = urlencode(http_build_query($this->input->get(),'', '&'));
                redirect("cms/auth/login?state=$state&query=$query");
            }
        }else{
            $this->authority = $_SESSION["auth"]["user"]->ause_authority;
            $this->authoritys = explode(',', $_SESSION["auth"]["user"]->ause_authority);
        }
    }

    function checkaccessdenie() {
        if (!$this->privilege_view()) {
            if ($this->isAjax) {
                $output["result"] = -903;
                $output["message"] = "Access id denied.";
                echo json_encode($output);die;
            } else {
                $this->accessdenied();
            }
        }
    }
    function accessdenied(){
            $opt = array(
                'conf' => array(
                        'auth'=>  'cms/conf/auth.conf'
                ),
                'template'  => 'cms/auth/accessdenied.tpl'
            );
            $this->renderTpl($opt);
            $this->output->_display();die;
    }
    protected function privilege() {
        $this->privilege->aupr_permission = 755;
        return true;
    }

    function privilege_view() {
        $this->privilege->aupr_permission = 755;
        return true;
    }

    protected function beforeinsert() {
    }

    protected function beforeupdate() {
    }

    protected function beforecommit() {
    }

    protected function beforedelete() {
    }

    function oncommit() {
        $this->beforecommit();
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege()) {
            $Id = $this->input->post('Id');
            if (!empty($Id)) {
                $this->onupdate();
            } else {
                $this->oninsert();
            }
        }else{
            $this->output->set_header('Content-type: application/json');
            $this->output->set_output(json_encode($output));
        }
    }

    function onupdate() {
        $this->beforeupdate();
        $output["result"] = -1;
        $output["message"] = "Data invalid.";
        $Params = $this->input->get_post('Params');
        if (!empty($Params)) {
            $Id = $this->input->post('Id');
            if (!empty($Id)) {
                $record = $this->Core_Model->onGet($Id);
                if ($record) {
                    $rs = $this->Core_Model->onUpdate($Id, $Params);
                    if ($rs === true) {
                        $output["result"] = 1;
                        $output["message"] = ("Success. Data have been save.");
                    } else {
                        $output["result"] = -1;
                        $output["message"] = ("System rejected your data. Please check data input and try again.<br/>");
                    }
                } else {
                    $output["result"] = -203;
                    $output["message"] = "Record doesn't exist.";
                }
            }
            $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Update entry - $this->table[$Id]",'e');
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    function putontop() {
        $output["result"] = -1;
        $output["message"] = "Data invalid.";
        $Id = $this->input->post('Id');
        if (!empty($Id)) {
            $record = $this->Core_Model->onGet($Id);
            if ($record) {
                $rs = $this->Core_Model->putOnTop($Id);
                if ($rs === true) {
                    $output["result"] = 1;
                    $output["message"] = ("Success. Data have been save.");
                } else {
                    $output["result"] = -1;
                    $output["message"] = ("System rejected your data. Please check data input and try again.<br/>");
                }
            } else {
                $output["result"] = -203;
                $output["message"] = "Record doesn't exist.";
            }
        }
        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Update entry - $this->table[$Id]",'e');
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function putup() {
        $output["result"] = -1;
        $output["message"] = "Data invalid.";
        $Id = $this->input->post('Id');
        if (!empty($Id)) {
            $record = $this->Core_Model->onGet($Id);
            if ($record) {
                $rs = $this->Core_Model->putUp($Id);
                if ($rs === true) {
                    $output["result"] = 1;
                    $output["message"] = ("Success. Data have been save.");
                } else {
                    $output["result"] = -1;
                    $output["message"] = ("System rejected your data. Please check data input and try again.<br/>");
                }
            } else {
                $output["result"] = -203;
                $output["message"] = "Record doesn't exist.";
            }
        }
        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Update entry - $this->table[$Id]",'e');
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function putdown() {
        $output["result"] = -1;
        $output["message"] = "Data invalid.";
        $Id = $this->input->post('Id');
        if (!empty($Id)) {
            $record = $this->Core_Model->onGet($Id);
            if ($record) {
                $rs = $this->Core_Model->putDown($Id);
                if ($rs === true) {
                    $output["result"] = 1;
                    $output["message"] = ("Success. Data have been save.");
                } else {
                    $output["result"] = -1;
                    $output["message"] = ("System rejected your data. Please check data input and try again.<br/>");
                }
            } else {
                $output["result"] = -203;
                $output["message"] = "Record doesn't exist.";
            }
        }
        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Update entry - $this->table[$Id]",'e');
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    function oninsert() {
        $this->beforeinsert();
        $output["result"] = -1;
        $output["message"] = "Data invalid.";
        $Params = $this->input->get_post('Params');
        if (!empty($Params)) {
            $rs = $this->Core_Model->onInsert($Params);
            if ($rs === true) {
                $output["result"] = 1;
                $output["message"] = ("Success. Data have been save.");
            } else {
                $output["result"] = -1;
                $output["message"] = ("System rejected your data. Please check data input and try again.<br/>");
            }
            $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Insert new entry - $this->table",'e');
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    function ondelete() {
        $this->beforedelete();
        $output["result"] = -1;
        $output["message"] = ("This function to requires an administrative account.<br/>Please check your authority, and try again.");
        if ($this->privilege()) {
            $id = $this->input->post('Id');
            if (!empty($id)) {
                $tmp = $this->Core_Model->onGet($id);
                if ($tmp) {
                    if (
                            (
                            isset($tmp->{$this->prefix . "lock"}) &&
                            $tmp->{$this->prefix . "lock"} == 'true'
                            ) ||
                            (
                            isset($tmp->{$this->prefix . "Lock"}) &&
                            $tmp->{$this->prefix . "Lock"} == 'true'
                            )
                    ) {
                        $output["message"] = ("Can't delete 'System' record. Record have been locked.");
                    } else {
                        $rs = false;
                        $rs = $this->Core_Model->onDelete($id);
                        if ($rs === true) {
                            $output["result"] = 1;
                            $output["message"] = ("Success. Record have been deleted.");
                        } else {
                            $output["result"] = -1;
                            $output["error_number"] = $this->Core_Model->db->_error_number();
                            $output["error_message"] = $this->Core_Model->db->_error_message();
                            $output["message"] = ("Fail. Please check data input and try again.");
                        }
                    }
                }else {
                    $output["message"] = ("Record does't exist.");
                }
            } else {
                $output["message"] = ("Id invalid.");
            }
        }
        $this->writelog("<div class='sql-query'>".$output["message"]."</div>","Delete record - $this->table['$id']",'e');
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    function bindingdata() {
        
        $result = $this->Core_Model->databinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($result));
    }
    function sqlLog($name=''){
        $_error_number = $this->db->_error_number();
        if($_error_number!=0){
            $_error_message =  $this->db->_error_message();
            $sQuery = $this->db->last_query();
            $log="<div class='sql-message'>$_error_number - $_error_message</div>";
            $log.="<div class='sql-query'>$sQuery</div>";
            $this->writelog($log,$name);
        }
    }
    function writelog($data,$title='',$file=''){
        // $username = 'Unknown';
        // if(isset($_SESSION["auth"]["user"])){
        //     $username = $_SESSION["auth"]["user"]->ause_name;
        // }
        // $logtime = date('Y/m/d');
        // $time=  date('Y-m-d H:i:s');
        // $log = "
        //     <div class=\"inbox-item clearfix\">
        //         <div class=\"media\"> 
        //             <div class=\"media-body\">
        //                 <div class=\"media-heading name\">$title</div>
        //                 <div class=\"text\">$data</div>
        //                 <span class=\"timestamp\">$time - $username</span> 
        //             </div>
        //         </div> 
        //     </div>";
        // write_file(APPPATH."logs/$logtime$file.txt", $log, 'a+');
    }

}

include 'FE_Controller.php';
include 'CP_Controller.php';
include 'VD_Controller.php';
//include 'GM_Controller.php';
//include 'GO_Controller.php';
//include 'EP_Controller.php';
//include 'SM_Controller.php';
#include 'Frontend_Controller.php';