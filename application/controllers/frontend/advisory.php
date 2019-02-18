<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class advisory extends FE_Controller {
	function __construct() {
        parent::__construct();
		$this->load->helper('captcha');
    }
    function _captcha($re=false){
    	if($_SESSION['captcha'] && !$re)return;
    	$cap_parm = array(
            'length'  => 4,
            'img_path'  => APPPATH.'../captcha/',
            'img_url'   => '/captcha/',
            //'font_path' => './path/to/fonts/texb.ttf',
            'img_width' => 80,
            'img_height' => 28,
            'expiration' => 7200
            );

        $_SESSION['captcha'] = create_captcha($cap_parm);
    }
	public function index(){
		$this->cat(null,1);
	}
	function cat($cate_alias='all',$page=1){
		if($cate_alias == 'all') $cate_alias = null;
		if($cate_alias){
			$cat = $this->cate_model->onGetByAlias($cate_alias);
			if(!$cat){
				show_404();
			}
			$cat_value = $cat->cat_value;
			$this->assigns->cat = $cat;
		}

		$perpage = 6;
		$this->_captcha();
		$this->assigns->advisory_latest = $this->advisory_model->getLatest($cat_value,$page,$perpage);
		$url = '/advisory/' . ($cate_alias?"$cate_alias/":'') .'/page/';
		$this->assigns->paging = $this->_getPaging($page,$perpage,$url);
		$this->smarty->view( 'lawyer/advisory', $this->assigns );
	}
	function detail($cat_alias='',$id=''){
		if($cat_alias == 'all') $cat_alias = null;
		if($cat_alias){
			$cat = $this->cate_model->onGetByAlias($cat_alias);
			if(!$cat){
				show_404();
			}
			$cat_value = $cat->cat_value;
			$this->assigns->cat = $cat;
		}
		$this->assigns->advisory = $this->advisory_model->onGet($id);
		if($this->assigns->advisory)
			$this->_addView('_advisory','advisory_',$this->assigns->advisory->advisory_id);
		$this->assigns->advisory_relate = $this->advisory_model->getRelated($this->assigns->advisory,1,8);
		$this->smarty->view( 'lawyer/advisorydetail', $this->assigns );
	}
	function feed(){
		$start = $this->input->post('start');
		$end = $this->input->post('end');
		$data = $this->advisory_model->getFeeds($start, $end);
		foreach ($data as $o) {
			$feed = new stdClass();
			$feed->id = $o->advisory_id;
			$feed->title = $o->advisory_title;
			$feed->start = date('Y-m-d',strtotime($o->advisory_publicday));
			$feed->url = "/advisory/$o->cat_alias/$o->advisory_id";
			$feeds[] = $feed;
		}
		echo json_encode($feeds);
	}
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */