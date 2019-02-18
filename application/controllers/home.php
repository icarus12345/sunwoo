<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class home extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		$this->assigns->sliders = $this->setting_model->onGetByType($this->assigns->fecog['homeslider']);
		$this->news_model->news_cond();
		$this->assigns->news_list = $this->news_model->getLatest($this->assigns->fecog['news_cate'],1,4);
		$this->news_model->news_cond();
		$this->assigns->noti_list = $this->news_model->getLatest($this->assigns->fecog['noti_cate'],1,4);
		$this->product_model->type='homeblock';
		$tmp = $this->product_model->getFeature(null,1,3);
		//if($tmp && count($tmp)==1)
			$this->assigns->ctProduct = $tmp[0];
		//$tmp = $this->product_model->getFeature('>409',1,1);
		//if($tmp && count($tmp)==1)
			$this->assigns->khProduct = $tmp[1];
		//$tmp = $this->product_model->getFeature('>410',1,1);
		//if($tmp && count($tmp)==1)
			$this->assigns->tkProduct = $tmp[2];


        $this->smarty->view( 'realestate/home', $this->assigns );
	}
	function contact(){
		$this->assigns->cate=0;
		$this->assigns->site = $this->data_model->onGet(39);
		$this->smarty->view( 'realestate/contact', $this->assigns );
		
	}
	function cataloue(){
		$this->news_model->about_cond();
		$this->assigns->news_list = $this->news_model->getFeature($this->assigns->fecog['about'],1,40);
		$this->assigns->site = $this->data_model->onGet(40);
		$this->smarty->view( 'realestate/site', $this->assigns );
	}
	function about($news_alias=null){
		$this->news_model->about_cond();
		$this->assigns->news_list = $this->news_model->getFeature($this->assigns->fecog['about'],1,40);
		if($news_alias)
			$this->assigns->news_detail = $this->news_model->onGetByAlias($news_alias);
		elseif($this->assigns->news_list) $this->assigns->news_detail = $this->news_model->onGet($this->assigns->news_list[0]->news_id);
		$this->smarty->view( 'realestate/about', $this->assigns );
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */