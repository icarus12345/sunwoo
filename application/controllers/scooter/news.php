<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class news extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		
	}
	function cat($cate_alias='all',$page=1){
		$perpage = 6;
		$this->news_model->news_cond();
        $this->assigns->newss = $this->news_model->getLatest($cat_value,$page,$perpage);
        $url = '/story/page/';
        $this->assigns->paging = $this->_getPaging($page,$perpage,$url);
		$this->smarty->view( 'scooter/story', $this->assigns );

	}
	function detail($cate_alias='all',$news_alias=''){
		$this->assigns->news = $this->news_model->onGetByAlias($news_alias);
		if($this->assigns->news)
			$this->_addView('_news','news_',$this->assigns->news->news_id);
		$this->news_model->news_cond();
		$this->assigns->news_relate = $this->news_model->getRelated($this->assigns->news,1,10);
		$this->smarty->view( 'scooter/storydetail', $this->assigns );
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