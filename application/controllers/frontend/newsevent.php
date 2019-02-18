<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class newsevent extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		
	}
	function feed(){
		$this->news_model->news_event_cond();
		$start = $this->input->post('start');
		$end = $this->input->post('end');
		$data = $this->news_model->getFeeds($start, $end);
		foreach ($data as $o) {
			$feed = new stdClass();
			$feed->id = $o->news_id;
			$feed->title = $o->news_title;
			$feed->start = date('Y-m-d',strtotime($o->news_publicday));
			// $feed->url = "/event/$o->cat_alias/$o->news_alias";
			$feeds[] = $feed;
		}
		echo json_encode($feeds);
	}
	function feedNews(){
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
	function feedEvent(){
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