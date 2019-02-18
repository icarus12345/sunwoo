<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class task extends CP_Controller {
    function __construct() {
        parent::__construct('configs', 'config_', 'id');
    }
    function defaultweek($taskid=2){
    	$this->assigns->taskid=$taskid;
    	$this->assigns->task=$this->Core_Model->onGet($this->assigns->taskid);
    	$this->assigns->task->config_values=json_decode($this->assigns->task->config_values);
    	$opt = array(
            'conf' => array(
                    'cp'=>  'cms/conf/cms.conf',
                    'weektask'=>  'cms/conf/cp.conf'
                ),
            'template'  => 'cms/template.tpl'
        );
        $this->renderTpl($opt);
    }
    function beforecommit(){
    	$tmp = $this->input->post('data');
    	$id = $this->input->post('Id');
    	$record=$this->Core_Model->onGet($id);
    	if(!$record){
    		$Params['config_id']=$id;
    		unset($_POST['Id']);
    	}
    	for($i=0;$i<count($tmp);$i+=8){
    		if(
    			trim($tmp[$i])!="" ||
    			trim($tmp[$i+1])!="" ||
    			trim($tmp[$i+2])!="" ||
    			trim($tmp[$i+3])!="" ||
    			trim($tmp[$i+4])!="" ||
    			trim($tmp[$i+5])!="" ||
    			trim($tmp[$i+6])!="" ||
    			trim($tmp[$i+7])!=""
			){
    			$data[]=$tmp[$i];
    			$data[]=$tmp[$i+1];
    			$data[]=$tmp[$i+2];
    			$data[]=$tmp[$i+3];
    			$data[]=$tmp[$i+4];
    			$data[]=$tmp[$i+5];
    			$data[]=$tmp[$i+6];
    			$data[]=$tmp[$i+7];
			}
    	}
    	$Params['config_values'] = json_encode($data,true);
    	$_POST['Params'] = $Params;
    }
}