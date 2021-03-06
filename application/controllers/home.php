<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class home extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		// $this->assigns->sliders = $this->setting_model->onGetByType($this->assigns->fecog['homeslider']);
		// $this->news_model->news_cond();
		// $this->assigns->news_list = $this->news_model->getLatest($this->assigns->fecog['news_cate'],1,4);
		// $this->news_model->news_cond();
		// $this->assigns->noti_list = $this->news_model->getLatest($this->assigns->fecog['noti_cate'],1,4);
		// $this->product_model->type='default';
		$features = $this->product_model->getFeature(null,1,4);
		$this->assigns->features = $features;
		$this->news_model->partner_cond();
		$this->assigns->partners = $this->news_model->getLatest(null,1,4);
        $this->smarty->view( 'realestate/home', $this->assigns );
	}
	function contact(){
		$this->assigns->cate=0;
		$this->assigns->data = $this->data_model->onGet(41);
		$this->smarty->view( 'realestate/contact', $this->assigns );
		
	}
	function cataloue(){
		$this->news_model->about_cond();
		$this->assigns->news_list = $this->news_model->getFeature($this->assigns->fecog['about'],1,40);
		$this->assigns->site = $this->data_model->onGet(40);
		$this->smarty->view( 'realestate/site', $this->assigns );
	}
	function about($news_alias=null){
		
		$this->assigns->sliders = $this->setting_model->onGetByType($this->assigns->fecog['homeslider']);
		$this->news_model->about_cond();
		$this->assigns->news_list = $this->news_model->getAsc(null,1,40);
		// print_r($this->db->last_query());die;
		$this->smarty->view( 'realestate/about', $this->assigns );
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */