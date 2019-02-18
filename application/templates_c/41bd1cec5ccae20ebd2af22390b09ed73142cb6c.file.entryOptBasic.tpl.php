<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:16:58
         compiled from "application/templates/cms/cp/product/entryOptBasic.tpl" */ ?>
<?php /*%%SmartyHeaderCode:15793517755c6aa23ae1d1f7-01669612%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '41bd1cec5ccae20ebd2af22390b09ed73142cb6c' => 
    array (
      0 => 'application/templates/cms/cp/product/entryOptBasic.tpl',
      1 => 1550485952,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15793517755c6aa23ae1d1f7-01669612',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'item' => 0,
    'token' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa23ae22003_59625911',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa23ae22003_59625911')) {function content_5c6aa23ae22003_59625911($_smarty_tpl) {?><input type="hidden" name="product_token" id="product_token"
value="<?php echo (($tmp = @(($tmp = @$_smarty_tpl->tpl_vars['item']->value->product_token)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['token']->value : $tmp))===null||$tmp==='' ? '' : $tmp);?>
"/>
<div class="pull-bottom pull-top">
    <span class="code cursor"
        title="Add new Photo"
        onclick="productopt.onAddItem()">
        <i class="fa-plus"></i>&nbsp;Add Option
    </span>
    &nbsp;&nbsp;
    <span class="code cursor"
        title="Delete all"
        onclick="productopt.deleteAll()">
        <i class="fa fa-trash-o"></i>&nbsp;Delete all
    </span>
</div>
<table id="entryOptDatatable" class="table table-bordered table-striped message-table" style="width: 100%">
    <thead>
        <tr>
            <th><span class="fa fa-key"></span></th>
            <th><span class="fa fa-circle-thin"></span></th>
            <th>Name</th>
            <th>Desc</th>
            <th>Value</th>
        </tr>
    </thead>
<tbody></tbody>
</table>
<?php if (isset($_smarty_tpl->tpl_vars['data'])) {$_smarty_tpl->tpl_vars['data'] = clone $_smarty_tpl->tpl_vars['data'];
$_smarty_tpl->tpl_vars['data']->value = json_decode($_smarty_tpl->tpl_vars['item']->value->product_data,'true'); $_smarty_tpl->tpl_vars['data']->nocache = null; $_smarty_tpl->tpl_vars['data']->scope = 0;
} else $_smarty_tpl->tpl_vars['data'] = new Smarty_variable(json_decode($_smarty_tpl->tpl_vars['item']->value->product_data,'true'), null, 0);?><?php }} ?>
