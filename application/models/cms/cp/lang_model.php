<?php

class lang_model extends Core_Model {

    function __construct(){
        parent::__construct('language','lang_');
    }
    function getLangByType($type){
        $query = $this->db
                ->select('lang_key,lang_text ')
                ->where("lang_set",$type)
                ->from($this->table)
                ->group_by('lang_key')
                ->order_by('lang_key', 'ASC')
                ->get();
        return $query->result();
    }
    function getLangByKey($key,$langs){
        $query = $this->db
                ->where("lang_key",$key)
                ->where_in('lang_language',$langs)
                ->get('language');
        $this->sqlLog('getLangByKey');
        $data = $query->result();
        return array(
            'lang'=>$langs,
            'data'=>$this->ArrayToList($data,'lang_language')
        );
    }
    function getByKey($key){
        $query = $this->db
                ->where("lang_key",$key)
                ->get('language');
        $this->sqlLog('getLangByKey');
        $data = $query->result();
        return array(
            'lang'=>$langs,
            'data'=>$this->ArrayToList($data,'lang_language')
        );
    }
    function onDelete($key){
        $where = array("{$this->prefix}key" => $key);
        $this->db->delete($this->table, $where);
        $this->sqlLog('Delete Entry');
        $count = $this->db->affected_rows(); //should return the number of rows affected by the last query
        if ($count >= 1)
            return true;
        return false;
    }
}
?>
