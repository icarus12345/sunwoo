<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class news extends FE_Controller {
	function __construct() {
        parent::__construct();
		
    }
	public function index(){
		$this->cat();
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
			$this->assigns->cate = $cat->cat_id;
		}
		$this->news_model->news_cond();
        $this->assigns->news_list = $this->news_model->getLatest($cat_value,$page,$perpage);
        $url = '/blogs/page/';
        $this->assigns->paging = $this->_getPaging($page,$perpage,$url);


		$this->smarty->view( 'binbon/blogs', $this->assigns );

	}
	
	function detail($alias){

		$this->assigns->news_detail = $this->news_model->onGetByAlias($alias);
		if($this->assigns->news_detail){
			$this->_addView('_news','_',$this->assigns->news_detail->_id);
			$seo = $this->seo_model->onGetByHead('news',$this->assigns->news_detail->_id);
            if(!$seo){
                $seo = $this->assigns->news_detail;
            }
            $this->assigns->seo = $seo;
			
		}
		// $this->news_model->news_cond();
		// $this->assigns->relateds = $this->news_model->getRelated($this->assigns->news,1,6);
		$this->smarty->view( 'binbon/blog_detail', $this->assigns );
	}
	// function feed(){
	// 	$this->news_model->news_cond();
	// 	$start = $this->input->post('start');
	// 	$end = $this->input->post('end');
	// 	$data = $this->news_model->getFeeds($start, $end);
	// 	foreach ($data as $o) {
	// 		$feed = new stdClass();
	// 		$feed->id = $o->news_id;
	// 		$feed->title = $o->news_title;
	// 		$feed->start = date('Y-m-d',strtotime($o->news_publicday));
	// 		$feed->url = "/news/$o->cat_alias/$o->news_alias";
	// 		$feeds[] = $feed;
	// 	}
	// 	echo json_encode($feeds);
	// }
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */