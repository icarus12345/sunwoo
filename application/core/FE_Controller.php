<?php
class FE_Controller extends CI_Controller {
    public $assigns;
    public function __construct() {
        parent::__construct();
        $lang = $this->input->get('lang');
        if($lang){
            $_SESSION["lang"] = $lang;
        }
        $this->assigns->lang = isset($_SESSION["lang"])?$_SESSION["lang"]:'en';

        $this->smarty->caching = false;
        $this->assigns = new stdClass();
        $this->load->library('pagination');
        $this->load->model('cms/cp/menu_model');
        $this->load->model('scooter/cate_model');
        $this->load->model('cms/cp/data_model');
        $this->load->model('cms/cp/site_model');
        $this->load->model('cms/cp/setting_model');
        $this->load->model('scooter/product_model');
        $this->load->model('scooter/news_model');
        $this->load->model('lawyer/advisory_model');
        $this->load->model('scooter/opt_model');
        $this->load->model('scooter/line_model');
        $this->load->model('scooter/province_model');
        $this->load->model('scooter/district_model');
        $this->load->model('scooter/ward_model');
        $this->news_model->status = 'true';
        $this->opt_model->status = 'true';
        $this->cate_model->status = 'true';
        $this->menu_model->status = 'true';
        $this->setting_model->status = 'true';
        $this->assigns->fecog = array(
            'utilities'=> '2',
            'furniture'=> '3',
            'acreage'=> '4',
            'price'=> '5',
            'menu'=> 'menu',
            'cate'=> 'sunwoo',
            'event_cate'=>'event',
            'news_cate'=>'>406',
            'noti_cate'=>'>407',
            'about_type'=>'about',
            'advertise'=>'advertise',
            'advertise2'=>'advertise2',
            'homeslider'=>'slider',
        );
        // if(!$this->input->is_ajax_request()){
            $this->loadWebSetting();
            $this->_loadCategory();
            
        // }
        
        $this->iLanguage =new CI_Language();
        $this->assigns->languages = $this->iLanguage->load('all',$this->assigns->lang,true);
        $this->assigns->acreage_arr = array(
            array('title'=>'Dưới 50m2','condition'=>'product_acreage <=50'),
            array('title'=>'Từ 50m2 đến 100m2','condition'=>'product_acreage >50 and product_acreage <=100'),
            array('title'=>'Từ 100m2 đến 150m2','condition'=>'product_acreage >100 and product_acreage <=150'),
            array('title'=>'Từ 150m2 đến 200m2','condition'=>'product_acreage >150 and product_acreage <=200'),
            array('title'=>'Từ 200m2 đến 300m2','condition'=>'product_acreage >200 and product_acreage <=300'),
            array('title'=>'Trên 300m2','condition'=>'product_acreage >300'),
        );
    }
    function loadWebSetting(){
        $query = $this->db->where('setting_id',1)->get('_setting');
        $row = $query->row();
        $this->assigns->info = json_decode($row->setting_value,true);

        $utilities  = $this->line_model->getByHeadId($this->assigns->fecog['utilities']);
        $acreages  = $this->line_model->getByHeadId($this->assigns->fecog['acreage']);
        $prices  = $this->line_model->getByHeadId($this->assigns->fecog['price']);
        $this->assigns->utilities = $utilities;
        $this->assigns->acreages = $acreages;
        $this->assigns->prices = $prices;

    }
    function _loadCategory(){
        $this->db->order_by('cat_value','ASC');
        $categories = $this->cate_model->getCategoryByType($this->assigns->fecog['cate']);
        $this->assigns->categories = $categories;

    }
    function _loadHomeMenu(){
        $this->db->order_by('menu_position','ASC');
        $this->db->order_by('menu_insert','ASC');
        $this->assigns->homeMenu = $this->menu_model->onGetByType($this->assigns->fecog['menu']);
    }
    function renderTpl($opt){
        foreach ($opt as $key=>$value){
            $this->smarty->assign( $key, $value );
        }
        $this->smarty->view( $opt['template'], $this->assigns );
    }
    function nothing(){}
    function _addView($table='',$prefix='',$id){
        if($_SESSION["addviews"][date('Y-m-d H')]["$table$id"]) return;
        $_SESSION["addviews"][date('Y-m-d H')]["$table$id"] = 1;
        $this->db->set($prefix.'view',$prefix."view +1",false)
            ->where($prefix.'id',$id)
            ->update($table);
    }
    function _getPaging($page=1,$perpage=10,$function=''){
        $query = $this->db->query('SELECT FOUND_ROWS() AS `found_rows`;');
        $tmp = $query->row_array();
        $total_rows = $tmp['found_rows'];
        // $config['is_ajax_paging'] = $this->input->is_ajax_request();
        $config['paging_function'] = $function;
        $config['base_url'] = $function;
        $config['first_url'] = "";
        $config['suffix'] = '';
        $config['total_rows'] = $this->assigns->total_rows = $total_rows;
        $config['per_page'] = $perpage;
        $config['cur_page'] = $page;
        $config['num_links'] = 5;
        $config['use_page_numbers'] = true;
        // $config['uri_segment'] = 4;
        $config['full_tag_open'] = '<ul class="pagination">';
        $config['full_tag_close'] = '</ul>';

        $config['first_link'] = '«';
        // $config['first_link'] = false;
        $config['first_tag_open'] = '<li class="page first">';
        $config['first_tag_close'] = '</li>';

        $config['last_link'] = '»';
        // $config['last_link'] = false;
        $config['last_tag_open'] = '<li class="page last">';
        $config['last_tag_close'] = '</li>';

        $config['next_link'] = '›';
        $config['next_tag_open'] = '<li class="page prev">';
        $config['next_tag_close'] = '</li>';

        $config['prev_link'] = '‹';
        $config['prev_tag_open'] = '<li class="page next">';
        $config['prev_tag_close'] = '</li>';

        $config['cur_tag_open'] = '<li class="active">';
        $config['cur_tag_close'] = '</li>';

        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';

        $this->pagination->initialize($config);
        return $this->pagination->create_links();
    }
}
?>