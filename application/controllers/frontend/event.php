<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class event extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		
	}
	function cat($cate_alias='all',$page=1){
		$perpage = 10;
		if($cate_alias == 'all') $cate_alias = null;
		if($cate_alias){
			$cat = $this->cate_model->onGetByAlias($cate_alias);
			if(!$cat){
				show_404();
			}
			$cat_value = $cat->cat_value;
			$this->assigns->cat = $cat;
		}
		$this->news_model->event_cond();
        $this->assigns->event_list = $this->news_model->getLatest($cat_value,$page,$perpage);
        $url = '/event/' . ($cate_alias?"$cate_alias/":'').'page/';
        $this->assigns->paging = $this->_getPaging($page,$perpage,$url);
		$this->smarty->view( 'lawyer/event', $this->assigns );

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
		$this->assigns->event = $this->news_model->onGetByAlias($news_alias);
		if($this->assigns->event)
			$this->_addView('_news','news_',$this->assigns->event->news_id);
		$this->news_model->event_cond();
		$this->assigns->event_relate = $this->news_model->getRelated($this->assigns->event,1,10);
		$this->smarty->view( 'lawyer/eventdetail', $this->assigns );
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