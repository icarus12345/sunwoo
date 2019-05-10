<?php
class FE_Controller extends CI_Controller {
    public $assigns;
    public function __construct() {
        parent::__construct();
        $this->assigns = new stdClass();
        $lang = $this->input->get('lang');
        if($lang){
            $_SESSION["lang"] = $lang;
        }
        $this->assigns->lang = isset($_SESSION["lang"])?$_SESSION["lang"]:'en';

        $this->smarty->caching = false;
        $this->load->library('pagination');
        $this->load->model('cms/cp/menu_model');
        $this->load->model('scooter/cate_model');
        $this->load->model('scooter/data_model');
        $this->load->model('cms/cp/site_model');
        $this->load->model('cms/cp/setting_model');
        $this->load->model('scooter/seo_model');
        $this->load->model('scooter/product_model');
        $this->load->model('scooter/news_model');
        $this->load->model('lawyer/advisory_model');
        $this->load->model('scooter/opt_model');
        $this->load->model('scooter/line_model');
        $this->load->model('scooter/province_model');
        $this->load->model('scooter/district_model');
        $this->load->model('scooter/ward_model');
        $this->load->model('scooter/supplier_model');
        $this->news_model->status = '1';
        $this->opt_model->status = '1';
        $this->cate_model->status = '1';
        $this->menu_model->status = '1';
        $this->setting_model->status = '1';
        $this->assigns->fecog = array(
            'color'=> '3',
            'size'=> '2',
            'materia'=> '9',

            'our-services'=>'service',

            'price'=> '5',
            'menu'=> 'menu',
            'cate'=> 'default',
            'supplier'=> 'default',
            'event_cate'=>'event',
            'news_cate'=>'>406',
            'noti_cate'=>'>407',
            'about'=>'about',
            'advertise'=>'advertise',
            'advertise2'=>'advertise2',
            'homeslider'=>'slider',
        );
        // if(!$this->input->is_ajax_request()){
            $this->loadWebSetting();
            $this->_loadCategory();
            
        // }
        $this->iLanguage =new CI_Language();
        $this->assigns->languages = $this->iLanguage->load('default',$this->assigns->lang,true);
    }
    function loadWebSetting(){
        $query = $this->db->where('setting_id',1)->get('_setting');
        $row = $query->row();
        $this->assigns->info = json_decode($row->setting_value,true);
        $this->assigns->setting = $this->setting_model->getByType('other');

        $colors  = $this->line_model->getByHeadId($this->assigns->fecog['color']);
        $sizes  = $this->line_model->getByHeadId($this->assigns->fecog['size']);
        $materias  = $this->line_model->getByHeadId($this->assigns->fecog['materia']);
        $this->assigns->colors = $colors;
        $this->assigns->sizes = $sizes;
        $this->assigns->materias = $materias;

    }
    function _loadCategory(){
        $this->db->order_by('_value','ASC');
        $categories = $this->cate_model->getCategoryByType($this->assigns->fecog['cate']);
        $this->assigns->tree_categories = $this->cate_model->buildTree($categories);

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
        // if($_SESSION["addviews"][date('Y-m-d H')]["$table$id"]) return;
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