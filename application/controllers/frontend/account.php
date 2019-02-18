<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class account extends FE_Controller {

    function __construct() {
        parent::__construct();
        $this->load->library('encrypt');
        $this->load->model('scooter/customer_model');
        $this->load->model('scooter/order_model');
    }

    public function index() {
        if(empty($_SESSION['accountInfo'])) redirect('/');
        $this->smarty->view( 'scooter/account', $this->assigns );
    }
    function orders(){
        if(empty($_SESSION['accountInfo'])) redirect('/');
        $id = $_SESSION['accountInfo']->Id;
        $this->assigns->orders = $this->order_model->getOrderByCustomer($id);
        $this->smarty->view( 'scooter/orders', $this->assigns );
    }
    function onUpdate2(){
        $output["result"] = -1;
        $output["message"] = "Access is denied - Request invalid .";
        $params = $this->input->post('params');
        $params['Password'] = md5($params['Password']);
        $id = $_SESSION['accountInfo']->Id;
        $rs = $this->customer_model->onUpdate($id, $params);
        if ($rs === FALSE) {
            $output["result"] = -1;
            $output["message"] = "Can't update your account.<br/>Please check data input and try again.";
        } else {
            $output["result"] = 1;
            $output["message"] = "Success. Your account have been updated.";
            $accountInfo = $this->customer_model->onGetByEmail($params);
            $accountInfo->data = json_decode($accountInfo->data,true);
            $_SESSION['accountInfo'] = $accountInfo;
        }
        
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function onUpdate(){
        $output["result"] = -1;
        $output["message"] = "Access is denied - Request invalid .";
        $params = $this->input->post('params');
        if(!empty($params['data']))$params['data'] = json_encode($params['data'],true);
        $id = $_SESSION['accountInfo']->Id;
        $rs = $this->customer_model->onUpdate($id,$params);
        if ($rs === FALSE) {
            $output["result"] = -1;
            $output["message"] = "Can't create your account.<br/>Please check data input and try again.";
        } else {
            $output["result"] = 1;
            $output["message"] = "Success. Your account have been updated.";
            $_SESSION['accountInfo']->data = $params['data'];
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    public function onRegister() {
        $output["result"] = -1;
        $output["message"] = "Access is denied - Request invalid .";
        $params = $this->input->post('params');
        $params['Password'] = md5($params['Password']);
        $params['Type'] = '';
        $params['Status'] = 'true';
        if ($this->customer_model->checkExists($params)) {
            $output["message"] = 'Someone already has that email. Try another? !';
        } else {
            $rs = $this->customer_model->onInsert($params);
            if ($rs === FALSE) {
                $output["result"] = -1;
                $output["message"] = "Can't create your account.<br/>Please check data input and try again.";
            } else {
                $output["result"] = 1;
                $output["message"] = "Success. Your account have been created.";
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function logout(){
        unset($_SESSION['accountInfo']);
    }
    public function onLogout(){
        unset($_SESSION['accountInfo']);
        $output["result"] = 1;
        $output["message"] = 'Logout success !';
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    public function onLogin() {
        $output["result"] = -1;
        $output["message"] = 'Data invalid !';
        $params = $this->input->post('params');
        $params['Type'] = '';
        if (!isset($_SESSION["logintry"]))
            $_SESSION["logintry"] = 0;
        $_SESSION["logintry"]++;
        if ($_SESSION["logintry"] > 4) {
            if (!isset($_SESSION["logintrytime"]))
                $_SESSION["logintrytime"] = time();
            $timedelay = 60 * 15 - (time("now") - $_SESSION["logintrytime"]);
            if ($timedelay <= 0) {
                $_SESSION["logintry"] = 0;
                unset($_SESSION["logintrytime"]);
            } else {
                $p = floor($timedelay / 60);
                $p = $p > 0 ? "$p minute " : "";
                $s = $timedelay % 60;
                $output["result"] = -999;
                $output["message"] = "[Access Denied] Sorry, there have been more than 5 failed login<br/>attempts for this account.<br/>
                    It is temporarily blocked in 15 minutes.<br/>
                    Remaining time : $p$s second.
                    ";
            }
        } else {
            $accountInfo = $this->customer_model->onGetByEmail($params);
            if ($accountInfo) {
                if (md5($params['Password']) != ($accountInfo->Password)) {
                    $fullname = $accountInfo->FirstName . ' ' . $accountInfo->LastName;
                    $output["result"] = -906;
                    $output["message"] = "Login failed for user '$fullname'.";
                } elseif ($accountInfo->Lock !== null) {
                    $output["result"] = -901;
                    $output["message"] = "Valid login but user have been deleted.";
                } elseif ($accountInfo->Status === "true") {
                    unset($accountInfo->Password);
                    $accountInfo->data = json_decode($accountInfo->data,true);
                    $_SESSION['accountInfo'] = $accountInfo;
                    $output["result"] = 1;
                    $output["message"] = "Valid login.";
                    $output["accountInfo"] = $accountInfo;
                    $_SESSION["logintry"] = 0;
                } else {
                    $output["result"] = -902;
                    $output["message"] = "Valid login but user is not active.";
                }
            } else {
                $output["message"] = 'Account is not exists. Try another? !';
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

}