<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:44
         compiled from "application\templates\cms\widget\message.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18713741555bed3904c61d30-15698130%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1e47f412c9096550bd526cf044134c9e52e5b1ea' => 
    array (
      0 => 'application\\templates\\cms\\widget\\message.tpl',
      1 => 1433860006,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18713741555bed3904c61d30-15698130',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed3904c7e318_12352401',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed3904c7e318_12352401')) {function content_5bed3904c7e318_12352401($_smarty_tpl) {?><div class="message-dropdown transition" role="menu" aria-labelledby="dLabel">
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
