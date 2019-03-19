<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class address extends FE_Controller {
    private $view;
	function __construct() {
        parent::__construct();
    }
	public function index(){
	}
    public function province(){
        $output["result"] = 1;
        $output["data"] = $this->province_model->onGets();;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    public function district($province_id=null){
        $output["result"] = 1;
        $output["data"] = $this->district_model->get_by_province_id($province_id);;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    public function ward($district_id=null){
        $output["result"] = 1;
        $output["data"] = $this->ward_model->get_by_district_id($district_id);;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */