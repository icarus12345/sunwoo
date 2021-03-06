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
    function real_estate($page = 1){
        $this->assigns->active_tab='real-estate';
        $this->view = 'realestate/real-estate';
        $this->cat(420,$page);

    }
    function rent($page = 1){
        $this->assigns->active_tab='rent';
        $this->view = 'realestate/rent';
        $this->cat(415,$page);

    }
    function selling($page = 1){
        $this->assigns->active_tab='selling';
        $this->view = 'realestate/selling';
        $this->cat(414,$page);

    }
    function invest($page = 1){
        $this->assigns->active_tab='invest';
        $this->view = 'realestate/invest';
        $countries = $this->country_model->onGets();
        $this->assigns->countries=$countries;
        $this->cat(413,$page);
    }
	function cat($cate_id='',$page=1){
        $this->assigns->cate_id = $cate_id;
        // if($cate=='408') $this->assigns->site = $this->data_model->onGet(32);
        // if($cate=='409') $this->assigns->site = $this->data_model->onGet(31);
        // if($cate=='410') $this->assigns->site = $this->data_model->onGet(30);
        $this->assigns->format_grid = array(6,6,12,4,4,4,4,4,4,6,6);
        $perpage = count($this->assigns->format_grid);
		$cate_detail = $this->cate_model->onGet($cate_id);
        if(!$cate_detail) show_404();
        $this->assigns->cate_detail = $cate_detail;
        $this->search();
        $this->assigns->product_list = $this->product_model->getLatest($cate_detail->cat_value,$page,$perpage);
        // echo '<pre>',$this->db->last_query();die;
        $this->assigns->htmlPager = $this->_getPaging($page,$perpage,'/project/');
		$this->smarty->view( $this->view, $this->assigns );
	}
    function search(){
        $keyword = $this->input->get('keyword');
        $category = $this->input->get('category');
        $acreage = $this->input->get('acreage');
        $price = $this->input->get('price');
        $floor = $this->input->get('floor');
        $bedroom = $this->input->get('bedroom');
        $bathroom = $this->input->get('bathroom');
        $utilities = $this->input->get('utilities');
        $province = $this->input->get('province');
        $district = $this->input->get('district');
        $ward = $this->input->get('ward');
        if($category){
            $cat = $this->cate_model->onGet($category);
        }
        if($acreage){
            $acreage = $this->line_model->onGet($acreage);
        }
        if($price){
            $price = $this->line_model->onGet($price);
        }
        if($keyword){
            $this->db->like("product_title_{$this->assigns->lang}", $keyword);
        }
        if($floor){
        }
        if($category){
            $this->db->where("product_type", $category);
        }
        if($acreage){
            $this->db->where($acreage->{"_desc_{$this->assigns->lang}"});
        }
        if($price){
            $this->db->where($price->{"_desc_{$this->assigns->lang}"});
        }
        if($bedroom){
            $this->db->where('product_bedroom',$bedroom);
        }
        if($bathroom){
            $this->db->where('product_bathroom',$bathroom);
        }
    }
	function noithat(){
		$this->assigns->cate = '410';
		$this->product_model->type='noithat';
		$tmp = $this->product_model->getFeature(null,1,1);
		if($tmp && count($tmp)==1)
			$this->assigns->tkProduct = $tmp[0];
		$this->smarty->view( 'realestate/noithat', $this->assigns );
	}
	function detail($id=''){
        $p = $this->product_model->onGet($id);
        $this->assigns->product_detail = $p;
		if($p) {
            $this->assigns->relateds = $this->product_model->getNearLatLng(null,$p,1,8);
            $cate_detail = $this->cate_model->onGet($p->product_category);
            if(!$cate_detail) show_404();
            $this->assigns->cate_detail = $cate_detail;
            $this->assigns->seo = array(
                'title'=>$p->product_title,
                'desc'=>$p->product_desc,
                'keyword'=>$p->product_tag,
                'image'=>$p->product_thumb,
            );
        }

		$this->smarty->view( 'realestate/product_detail', $this->assigns );
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