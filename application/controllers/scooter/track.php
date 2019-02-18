<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class track extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index($page){
		$this->smarty->view( 'scooter/category', $this->assigns );
	}
	function cat($cate_alias='all',$page=1){
		$perpage = 6;
		if($cate_alias == 'all') $cate_alias = null;
		if($cate_alias){
			$cat = $this->cate_model->onGetByAlias($cate_alias);
			if(!$cat){
				show_404();
			}
			$cat_value = $cat->cat_value;
			$this->assigns->cat = $cat;
		}
        $this->assigns->products = $this->product_model->getLatest($cat_value,$page,$perpage);
        $url = '/track/' . ($cate_alias?"$cate_alias/":'').'page/';
        $this->assigns->paging = $this->_getPaging($page,$perpage,$url);
		$this->smarty->view( 'scooter/category', $this->assigns );

	}
	function detail($cate_alias='all',$news_alias=''){
		if($cate_alias == 'all') $cate_alias = null;
		if($cate_alias){
			$cat = $this->cate_model->onGetByAlias($cate_alias);
			if(!$cat){
				show_404();
			}
			$cat_value = $cat->cat_value;
			$this->assigns->cat = $cat;
		}
		$this->assigns->product = $this->product_model->onGetByAlias($news_alias);
		if($this->assigns->product)
			$this->_addView('_product','product_',$this->assigns->product->product_id);
		//$this->assigns->event_relate = $this->news_model->getRelated($this->assigns->event,1,10);
		$this->smarty->view( 'scooter/productdetail', $this->assigns );
	}
	function feed(){
		$this->news_model->event_cond();
		$start = $this->input->post('start');
		$end = $this->input->post('end');
		$data = $this->news_model->getFeeds($start, $end);
		foreach ($data as $o) {
			$feed = new stdClass();
			$feed->id = $o->news_id;
			$feed->title = $o->news_title;
			$feed->start = date('Y-m-d',strtotime($o->news_publicday));
			$feed->url = "/event/$o->cat_alias/$o->news_alias";
			$feeds[] = $feed;
		}
		echo json_encode($feeds);
	}
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */