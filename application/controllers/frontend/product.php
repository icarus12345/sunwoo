<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class product extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		$this->cat('408');
	}
	function cat($cate=''){
		$this->assigns->cate = $cate;
		if($cate=='408') $this->assigns->site = $this->data_model->onGet(32);
		if($cate=='409') $this->assigns->site = $this->data_model->onGet(31);
		if($cate=='410') $this->assigns->site = $this->data_model->onGet(30);
		$this->assigns->cate_detail = $this->cate_model->onGet($cate);
		$this->smarty->view( 'realestate/product', $this->assigns );
	}
	function noithat(){
		$this->assigns->cate = '410';
		$this->product_model->type='noithat';
		$tmp = $this->product_model->getFeature(null,1,1);
		if($tmp && count($tmp)==1)
			$this->assigns->tkProduct = $tmp[0];
		$this->smarty->view( 'realestate/noithat', $this->assigns );
	}
	function detail($alias=''){
		$this->assigns->product_detail = $this->product_model->onGetByAlias($alias);
		$this->assigns->cate = $this->assigns->product_detail->product_category;
		$this->assigns->cate_detail = $this->cate_model->onGet($this->assigns->product_detail->product_category);
		$this->smarty->view( 'realestate/product_detail', $this->assigns );
	}
	function loadProduct($page){
		$this->assigns->catealias = array(
			'408'=>'cong-trinh',
			'409'=>'quan-tam',
			'410'=>'thiet-ke'
			);
		if (!is_numeric($page))
            $page = 1;
        $perpage = 8;
        $cate = '408';//$this->input->post('cat');
        $this->assigns->cate = $cate;
        $this->assigns->product_list = $this->product_model->getLatest('>'.$cate,$page,$perpage);
        $this->assigns->htmlPager = $this->_getPaging($page,$perpage,"loadProduct('%d')",true);
        $this->smarty->view('realestate/widget/product_list', $this->assigns);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */