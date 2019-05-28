<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class excution extends FE_Controller {
    function __construct() {
        parent::__construct();
        $this->load->helper('captcha');
        $this->advisory_model = new Core_Model('_advisory','advisory_','id');
    }
    function addAdvisory(){
        $params = $this->input->post('params');
        $output["result"] = -1;
        $output["message"]='Data invalid !';
        // if($params['captcha']==$_SESSION['captcha']['word']){
            unset($params['captcha']);
            if($this->advisory_model->onInsert($params)){
                $output["result"] = 1;
                
                $output["message"]='Thông tin đã được gửi đi. Chúng tôi sẽ trả lời trong thời gian sớm nhất.';
                $this->sendMail();
            }else{
                $output["message"]='Gửi thông tin thất bại, vui lòng kiểm tra lại.';
            }
        // }else{
        //    $output["message"]="Captcha does't match !";
        // }
        // $cap_parm = array(
        //     'length'  => 4,
        //     'img_path'  => APPPATH.'../captcha/',
        //     'img_url'   => '/captcha/',
        //     'img_width' => 80,
        //     'img_height' => 28,
        //     'expiration' => 7200
        // );
        // $_SESSION['captcha'] = create_captcha($cap_parm);
        // $output["captcha"] = $_SESSION['captcha']['image'];
        $output["dd"] = $_SESSION['captcha'];
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    private function sendMail(){
        // $this->load->model('front/setting_model');
        $this->load->library('CI_Phpmailer');
        $mailer = new CI_Phpmailer();
        $mailer->prm = $this->setting_model->getByType('mailer');
        if($mailer->prm['Send Message']->_value=='true'){
            $this->assigns->item = $this->input->post('params');
            $subject = "You have new request at ". date('d/m/Y');
            $body = $this->smarty->view( 'mailbody', $this->assigns, true );
            $mailer->send_mail($mailer->prm['To']->_value,$subject,$body);
        }
    }
}
?>