<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class advisory extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		
	}
	function detail($id=''){
		$this->assigns->cate=0;
		$this->assigns->site = $this->data_model->onGet(39);
		$this->assigns->advisory = $this->advisory_model->onGet($id);
		$this->smarty->view( 'realestate/advisory_detail', $this->assigns );
	}
	function loadAdvisory($page=1){
		if (!is_numeric($page))
            $page = 1;
        $perpage = 10;
        $q = $this->input->post('q');
        if(!empty($q)) $this->db->like('advisory_title',$q);
        $cate = $this->input->post('cat');
        $this->assigns->cate = $cate;
        $this->assigns->advisory_list = $this->advisory_model->getLatest('>'.$cate,$page,$perpage);
        $this->assigns->htmlPager = $this->_getPaging($page,$perpage,"loadAdvisory('%d')",true);
        $this->smarty->view('realestate/widget/advisory_list', $this->assigns);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */