<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class video extends VD_Controller {
    function __construct() {
        parent::__construct('_video', 'video_', 'id');
        $this->load->model('cms/co/topic_model');
        $this->load->model('cms/vd/author_model');
        $this->load->model('cms/cp/cate_model');
        $this->load->model('cms/vd/video_model');
        $this->assigns->tplConfig = array(
            'controller'   =>'video',
            'prefix'       =>'video_',
            'name'         =>'_oVideo',
            'title'        =>'Video',
            'group'        =>'vp',
            'listEntryTitle'=>'Video Manager',
            'addEntryTitle'=>'Add new Video',
            'editEntryTitle'=>'Modify Video',
            'entryListTpl'=>'templates/cms/vp/video/entryList.tpl'
        );
    }

    public function index(){
        $this->vp();
    }
    function widget($unit='v-',$type='',$action=''){
        $this->assigns->tplConfig['entryListTpl'] = 'templates/cms/vp/video_audio/widget.tpl';
        // $this->db->order_by('cat_value','ASC');
        // $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->assigns->action = $action;
        $this->smarty->view( 'cms/000/jqxtemplate', $this->assigns );
    }
    function searchtoken(){
        $q= $this->input->post('q');
        $query = $this->db
            ->select('video_id,video_title,video_type,video_sourceid')
            ->like('video_title',$q)
            ->limit(10)
            ->get('_video');
        $output = $query->result();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    function onGetVideoInfo() {
         $video_type = $this->input->post('video_type');
        $video_id = $this->input->post('video_id');
        if($video_type == 'vimeo')
            $video_array = $this->_vimeo($video_id);
        if($video_type == 'youtube')
            $video_array = $this->_youtube($video_id);
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["video"] = $video_array;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }

    function _vimeo($video_id){
        
        $url = "http://vimeo.com/api/v2/video/$video_id.php";
        $contents = file_get_contents($url);
        // echo $contents;
        $array = unserialize(trim($contents));
        return array(
            'title'=>$array[0]['title'],
            'thumbnail'=>$array[0]['thumbnail_large'],
            'description' => $array[0]['description'],
            'src' => $array[0]['url'],
            'tag' => $array[0]['tags'],
            'duration' => $array[0]['duration'],
            'upload_date' => $array[0]['upload_date']
        );
    }
    function _youtube($video_id){
        $json_output = file_get_contents("http://gdata.youtube.com/feeds/api/videos/$video_id?v=2&alt=json");
        $json = json_decode($json_output, true);
        //This gives you the video description
        $video_description = $json['entry']['media$group']['media$description']['$t'];

        //This gives you the video views count
        $view_count = $json['entry']['yt$statistics']['viewCount'];

        //This gives you the video title
        $video_title = $json['entry']['title']['$t'];
        //echo $video_title;
        return array(
            'title'         => $json['entry']['media$group']['media$title']['$t'],
            'thumbnail'     => "http://img.youtube.com/vi/$video_id/0.jpg",
            //'thumbnail'     => $json['entry']['media$group']['media$thumbnail'][0]['url'],
            'description'   => $json['entry']['media$group']['media$description']['$t'],
            'src'           => $json['entry']['content']['src'],
            'tag'          => '',
            'duration'      => $json['entry']['media$group']['yt$duration']['seconds'],
            'upload_date'   => $json['entry']['media$group']['yt$uploaded']['$t']
        );
    }
    
    function vp($unit='v-',$type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->unit = $unit;
        $this->assigns->type = $type;
        $this->smarty->view( 'cms/000/template', $this->assigns );
    }
    function dropdownTopic($type='video',$author=''){
        if($author) $this->db->where("( topic_author is null or topic_author = '' or topic_author = '$author' )", null, false);
        $data = $this->topic_model->onGetByType($type);
        foreach ($data as $o) {
            $topics[$o->author_id.""][] = $o;
        }
        $this->assigns->topics = $topics;
        $this->smarty->view( 'cms/vp/video_audio/topicDropdown', $this->assigns );
    }
    function editpanel($type=''){
        $this->db->order_by('cat_value','ASC');
        $this->assigns->cates = $this->cate_model->onGetByType('video');
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        $this->assigns->authors = $this->author_model->onGets();
        if($Id){
            $this->assigns->item = $this->video_model->onGet($Id);
            $author = $this->assigns->item->video_author;
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        if($author) $this->db->where("( topic_author is null or topic_author = '' or topic_author = '$author' )", null, false);
        $data = $this->topic_model->onGetByType($type);
        foreach ($data as $o) {
            $topics[$o->author_id.""][] = $o;
        }
        $this->assigns->topics = $topics;
        $htmlreponse = $this->smarty->view( 'cms/vp/video_audio/editorPanel', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function widgetbinding($type=""){
        $this->video_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status,
                    {$this->table}.{$this->prefix}special,
                    {$this->table}.{$this->prefix}link,
                    {$this->table}.{$this->prefix}sourceid,
                    {$this->table}.{$this->prefix}type,
                    {$this->table}.{$this->prefix}view,
                    {$this->table}.{$this->prefix}author,
                    {$this->table}.{$this->prefix}thumb,
                    {$this->table}.{$this->prefix}publicday,
                    {$this->table}.{$this->prefix}category,
                    cat_title,author_name,topic_title
                ",
            "from"      =>"
                FROM `{$this->table}` 
                    LEFT JOIN cate ON cat_id = video_category
                    LEFT JOIN _topic ON topic_id = video_topic
                    LEFT JOIN _author ON author_id = video_author
                ",
            // "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                "video_author"=>'author_name',
                "video_category"=>'cat_title',
            ),
            "filterfields"=>array(
                // "{$this->prefix}title"
            )
        );
        $output = $this->video_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function bindingbytype($type=""){
        $this->video_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS 
                    {$this->table}.{$this->prefix}id,
                    {$this->table}.{$this->prefix}title,
                    {$this->table}.{$this->prefix}desc,
                    {$this->table}.{$this->prefix}insert,
                    {$this->table}.{$this->prefix}update,
                    {$this->table}.{$this->prefix}status,
                    {$this->table}.{$this->prefix}author,
                    {$this->table}.{$this->prefix}thumb,
                    {$this->table}.{$this->prefix}publicday,
                    {$this->table}.{$this->prefix}category,
                    cate.cat_title,
                    _author.author_name,
                    _author.author_name as label
                ",
            "from"      =>"
                FROM `{$this->table}` 
                    LEFT JOIN cate ON cate.cat_id = _video.video_category
                    LEFT JOIN _author ON _author.author_id = _video.video_author
                ",
            // "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                "{$this->prefix}title"=>"{$this->prefix}title",
                "author_name"=>"author_name",
                "label"=>"author_name",
            ),
            "filterfields"=>array(
                "{$this->prefix}title"
            )
        );
        $output = $this->video_model->datatableBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function beforecommit(){
        $Id = $this->input->post('Id');
        $Params = $this->input->post('Params');

        if(!empty($Params['video_alias'])){
            $alias = $Params['video_alias'];
            if($Id) $this->db->where('video_id <>',$Id);
            $item = $this->video_model->onGetByAlias($alias);
            if($item){
                $output["result"] = -1;
                $output["message"] = ("Alias exists, please use another alias.");
                echo json_encode($output);
                die;
            }
        }
    }
    function beforedelete(){
        $Id = $this->input->post('Id');
        $this->db
            ->where("CONCAT(',',playlist_videos,',') like '%,$Id,%'",null,false)
            ->from('_playlist');
        $count = $this->db->count_all_results();
        $this->db->last_query();
        if($count>0){
            $output["result"] = -1;
            $output["message"] = ("Cant delete this video. Because video have been add to other playlist");
            echo json_encode($output);
            die;
        }
    }
}
?>