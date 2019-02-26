<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class news extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		
	}
	function cat($cate_alias='all',$page=1){
        $this->assigns->format_grid = array(8,4,4,8,4,4,4,4,4,4,8,4);
		$perpage = count($this->assigns->format_grid);
		if($cate_alias == 'all') $cate_alias = null;
		if($cate_alias){
			$cat = $this->cate_model->onGetByAlias($cate_alias);
			if(!$cat){
				show_404();
			}
			$cat_value = $cat->cat_value;
			$this->assigns->cat = $cat;
			$this->assigns->cate = $cat->cat_id;
		}
		$this->news_model->news_cond();
        $this->assigns->news_list = $this->news_model->getLatest($cat_value,$page,$perpage);
        $url = '/'.$cate_alias. '/page/';
        $this->assigns->paging = $this->_getPaging($page,$perpage,$url);
        $this->assigns->sliders = $this->setting_model->onGetByType($this->assigns->fecog['homeslider']);

		$this->smarty->view( 'realestate/news', $this->assigns );

	}
	function partner($page=1){
		$perpage = 6;
		$this->news_model->partner_cond();
        $this->assigns->news_list = $this->news_model->getLatest(null,$page,$perpage);
        $url = '/page/';
        $this->assigns->paging = $this->_getPaging($page,$perpage,$url);

        $this->assigns->sliders = $this->setting_model->onGetByType($this->assigns->fecog['homeslider']);
		$this->smarty->view( 'realestate/partner', $this->assigns );
	}
	function partner_detail($id){
        $this->assigns->sliders = $this->setting_model->onGetByType($this->assigns->fecog['homeslider']);
		
		$this->assigns->news = $this->news_model->onGet($id);
		if($this->assigns->news)
			$this->_addView('_news','news_',$this->assigns->news->news_id);
		$this->news_model->partner_cond();
		$this->assigns->news_list = $this->news_model->getRelated($this->assigns->news,1,4);
		$this->smarty->view( 'realestate/partner-detail', $this->assigns );
	}
	function detail($id){
        $this->assigns->sliders = $this->setting_model->onGetByType($this->assigns->fecog['homeslider']);

		$this->assigns->news = $this->news_model->onGet($id);
		if($this->assigns->news)
			$this->_addView('_news','news_',$this->assigns->news->news_id);
		$this->news_model->partner_cond();
		$this->assigns->news_list = $this->news_model->getRelated($this->assigns->news,1,4);
		$this->smarty->view( 'realestate/news_detail', $this->assigns );
	}
	function feed(){
		$this->news_model->news_cond();
		$start = $this->input->post('start');
		$end = $this->input->post('end');
		$data = $this->news_model->getFeeds($start, $end);
		foreach ($data as $o) {
			$feed = new stdClass();
			$feed->id = $o->news_id;
			$feed->title = $o->news_title;
			$feed->start = date('Y-m-d',strtotime($o->news_publicday));
			$feed->url = "/news/$o->cat_alias/$o->news_alias";
			$feeds[] = $feed;
		}
		echo json_encode($feeds);
	}
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */