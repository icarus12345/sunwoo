<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class playlist extends VD_Controller {
    function __construct() {
        parent::__construct('_playlist', 'playlist_', 'id');
        $this->load->model('cms/vd/video_model');
        $this->playlist_model = new Core_Model('_playlist', 'playlist_', 'id');
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

    }
    function dropdownPlaylist($video_id=""){
        $video_id = $this->input->post('video_id');
        $playlists = $this->playlist_model->onGets();
        $video = $this->video_model->onGet($video_id);
        echo '<select id="select-picker-playlist" class="form-control" data-size="10" data-live-search="true" -data-actions-box="true">';
        echo '<option value=""></option>';
            foreach ($playlists as $o) {
                $disable = '';
                if(strpos($o->playlist_videos, $video_id)!==false)
                    $disable = 'disabled';
                echo '<option value="'.$o->playlist_id.'" '.$disable.' >'.$o->playlist_title.'</option>';
            }
        echo '</select>';
        if($video){
            echo '<div class="pull-top">';
            echo "Add video '$video->video_title' to selected playlist ?";
            echo '</div>';
        }

    }
    function editpanel($type=''){
        $this->assigns->type=$type;
        $Id=$this->input->post('Id');
        if($Id){
            $this->assigns->item = $this->playlist_model->onGet($Id);
        }else{
            $this->assigns->token = md5(time().strtoupper(random_string('alnum', 8)));
        }
        $htmlreponse = $this->smarty->view( 'cms/vp/video_audio/editorPanelPlaylist', $this->assigns, true );
        $output["result"] = 1;
        $output["message"]='SUCCESS !';
        $output["htmlreponse"]=$htmlreponse;
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
        
    }
    function nestedBinding($id=0){
        $playlist  = $this->playlist_model->onGet($id);
        $where = "WHERE false";
        if($playlist){
            $ids = implode(',',explode(',',$playlist->playlist_videos));
            $where = "WHERE `video_id` IN ($ids)";
        }
        $this->video_model->datatables_config=array(
            "table"     =>"_video",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS video_id,video_title
                ",
            "from"      =>"
                FROM `_video`
                ",
            "where"     =>$where,
            "order_by"  =>"ORDER BY `video_insert` DESC",
            "columnmaps"=>array(
                

            ),
            "filterfields"=>array(
                // "{$this->prefix}title"
            )
        );
        $output = $this->video_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function widgetbinding($type=""){
        $this->playlist_model->datatables_config=array(
            "table"     =>"{$this->table}",
            "select"    =>"
                SELECT SQL_CALC_FOUND_ROWS * 
                ",
            "from"      =>"
                FROM `{$this->table}`
                ",
            // "where"     =>"WHERE `{$this->prefix}type` = '$type'",
            "order_by"  =>"ORDER BY `{$this->prefix}insert` DESC",
            "columnmaps"=>array(
                

            ),
            "filterfields"=>array(
                // "{$this->prefix}title"
            )
        );
        $output = $this->playlist_model->jqxBinding();
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function removeVideo(){
        $playlistId=$this->input->post('playlistId');
        $videoId=$this->input->post('videoId');
        $row = $this->playlist_model->onGet($playlistId);
        if($row){
            $strVideos = str_replace(",$videoId", "", ",{$row->playlist_videos},");
            $strVideos = trim(trim( $strVideos, ','));
            $_POST['Params']['playlist_videos'] = $strVideos;
            $_POST['Id'] = $playlistId;
            $this->oncommit();
        }else{
            $output["result"] = -1;
            $output["message"] = ("Playlist doest exists.");
            $this->output->set_header('Content-type: application/json');
            $this->output->set_output(json_encode($output));
        }
    }
    function addVideoToPlaylist(){
        $playlistId=$this->input->post('playlistId');
        $videoId=$this->input->post('videoId');
        $row = $this->playlist_model->onGet($playlistId);
        if($row){
            $strVideos = str_replace(",$videoId", "", ",{$row->playlist_videos},");
            $strVideos = trim(trim( $row->playlist_videos, ','));
            $_POST['Params']['playlist_videos'] = $strVideos.','.$videoId;
            $_POST['Id'] = $playlistId;
            $this->oncommit();
        }else{
            $output["result"] = -1;
            $output["message"] = ("Playlist doest exists.");
            $this->output->set_header('Content-type: application/json');
            $this->output->set_output(json_encode($output));
        }
    }
}
?>