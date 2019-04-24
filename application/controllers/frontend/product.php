<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class product extends FE_Controller {
    private $view;
	function __construct() {
        parent::__construct();
		$this->view = 'realestate/product';
        $this->country_model = new Core_Model('country','_','id','true');

    }
	public function index(){
        $this->assigns->active_tab='project';
		$this->page(1);
	}
    function page($page = 1){
        $this->cat(416,$page);
        // $perpage = 11;
        // $this->assigns->format_grid = array(6,6,12,4,4,4,4,4,4,6,6);
        // $this->assigns->product_list = $this->product_model->getLatest(null,$page,$perpage);
        // $this->assigns->htmlPager = $this->_getPaging($page,$perpage,'/project/');
        // $this->smarty->view( 'realestate/product', $this->assigns );
    }
	function category($cate_alias='',$page=1){
        $cate_detail = $this->cate_model->onGetByAlias($cate_alias);
        if(!$cate_detail) show_404();
        $this->assigns->cate_detail = $cate_detail;

        $product_list = $this->product_model->getFeature($cate_detail->_value,1,100);
        $this->assigns->product_list = $product_list;
        $this->smarty->view( 'binbon/home', $this->assigns );
	}
    
	function detail($cate_alias='',$alias=''){
        $cate_detail = $this->cate_model->onGetByAlias($cate_alias);
        if(!$cate_detail) show_404();
        $this->assigns->cate_detail = $cate_detail;

        $product_detail = $this->product_model->onGetByAlias($alias);
        $this->assigns->product_detail = $product_detail;
        if($product_detail) {
            $product_detail->colors = $this->line_model->getInIds($product_detail->_data['custom'][$this->assigns->fecog['color']]);
            $product_detail->sizes = $this->line_model->getInIds($product_detail->_data['custom'][$this->assigns->fecog['size']]);
            $product_detail->materias = $this->line_model->getInIds($product_detail->_data['custom'][$this->assigns->fecog['materia']]);
            $this->assigns->relateds = $this->product_model->getRelated($product_detail,1,8);
            $this->_addView('product','_',$product_detail->_id);

            $seo = $this->seo_model->onGetByHead('product',$product_detail->_id);
            if(!$seo){
                $this->assigns->seo = $product_detail;
            }
            $this->assigns->seo = $seo;
        }

		$this->smarty->view( 'binbon/product_detail', $this->assigns );
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