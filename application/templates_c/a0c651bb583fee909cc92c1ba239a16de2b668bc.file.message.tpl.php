<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:16:38
         compiled from "application/templates/cms/widget/message.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20052415635c6aa22619a481-20680469%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a0c651bb583fee909cc92c1ba239a16de2b668bc' => 
    array (
      0 => 'application/templates/cms/widget/message.tpl',
      1 => 1433860006,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20052415635c6aa22619a481-20680469',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa2261a41d9_55821311',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa2261a41d9_55821311')) {function content_5c6aa2261a41d9_55821311($_smarty_tpl) {?><div class="message-dropdown transition" role="menu" aria-labelledby="dLabel">
    <div class="fill-search-control">
        <div class="pull-top">
            <div class="col-xs-6">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="glyphicon glyphicon-th-list"></i>
                    </span>
                    <select class="selectpicker form-control" id="e_type">
                        <option value="e">Message</option>
                        <option value="">Error</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-6">
                <div class='input-group date' id='datetimepicker'>
                    <input type='text' class="form-control"
                            value="<?php echo date('Y/m/d');?>
"
                            data-date-format="YYYY/MM/DD"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="iMessage">
        <div class="log-errors"></div>
    </div>
</div>
<div class="mark-body"></div><?php }} ?>
