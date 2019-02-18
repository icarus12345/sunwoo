<?php

class image_model extends Core_Model {

    function __construct(){
        parent::__construct('image','image_','id');
    }
    function getByAlbum($album=null){
        if($album!=null)$this->db->where('image_album_id',$album);
        $query=$this->db
                ->select("SQL_CALC_FOUND_ROWS *",false)
                ->from('image')
                ->where('image_status','true')
                ->order_by('image_position','ASC')
                ->order_by('image_insert','ASC')
                ->get();
        return $query->result();
    }
}
?>
