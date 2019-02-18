<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 16:57:11
         compiled from "application\templates\cms\cp\product\entryOpt.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14476272105c6a6b3183fa39-85783290%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd8f94facaf0659194e23ec262fabf6962d9ddaba' => 
    array (
      0 => 'application\\templates\\cms\\cp\\product\\entryOpt.tpl',
      1 => 1550483828,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14476272105c6a6b3183fa39-85783290',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a6b31952af3_37195115',
  'variables' => 
  array (
    'item' => 0,
    'token' => 0,
    'data' => 0,
    'foo' => 0,
    'row' => 0,
    'name' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a6b31952af3_37195115')) {function content_5c6a6b31952af3_37195115($_smarty_tpl) {?><input type="hidden" name="product_token" id="product_token"
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
            <th>Price</th>
            <th>Amount</th>
            <th>Color</th>
            <th>Size</th>
        </tr>
    </thead>
<tbody></tbody>
</table>
<?php if (isset($_smarty_tpl->tpl_vars['data'])) {$_smarty_tpl->tpl_vars['data'] = clone $_smarty_tpl->tpl_vars['data'];
$_smarty_tpl->tpl_vars['data']->value = json_decode($_smarty_tpl->tpl_vars['item']->value->product_data,'true'); $_smarty_tpl->tpl_vars['data']->nocache = null; $_smarty_tpl->tpl_vars['data']->scope = 0;
} else $_smarty_tpl->tpl_vars['data'] = new Smarty_variable(json_decode($_smarty_tpl->tpl_vars['item']->value->product_data,'true'), null, 0);?>
<!-- <div class="space-line" style="height:10px;"></div>
<table class="calendar colors">
    <tr>
        <td class="title-cell" colspan="4" style="padding: 5px;background: #ebebeb;">
            COLOR
            <span class="code cursor pull-right"
                title="Add new Color"
                onclick="addColors()">
                <i class="fa-plus"></i>&nbsp;Add
            </span>
        </td>
    </tr>
    <?php if (count($_smarty_tpl->tpl_vars['data']->value['color'])==0) {?>
    <tr>
        <?php $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['row']->step = 1;$_smarty_tpl->tpl_vars['row']->total = (int) ceil(($_smarty_tpl->tpl_vars['row']->step > 0 ? 3+1 - (0) : 0-(3)+1)/abs($_smarty_tpl->tpl_vars['row']->step));
if ($_smarty_tpl->tpl_vars['row']->total > 0) {
for ($_smarty_tpl->tpl_vars['row']->value = 0, $_smarty_tpl->tpl_vars['row']->iteration = 1;$_smarty_tpl->tpl_vars['row']->iteration <= $_smarty_tpl->tpl_vars['row']->total;$_smarty_tpl->tpl_vars['row']->value += $_smarty_tpl->tpl_vars['row']->step, $_smarty_tpl->tpl_vars['row']->iteration++) {
$_smarty_tpl->tpl_vars['row']->first = $_smarty_tpl->tpl_vars['row']->iteration == 1;$_smarty_tpl->tpl_vars['row']->last = $_smarty_tpl->tpl_vars['row']->iteration == $_smarty_tpl->tpl_vars['row']->total;?>
        <td><input type="text" value="" class="i-v"></td>
        <?php }} ?>
    </tr>
    <?php }?>
    <?php $_smarty_tpl->tpl_vars['foo'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['foo']->step = 4;$_smarty_tpl->tpl_vars['foo']->total = (int) ceil(($_smarty_tpl->tpl_vars['foo']->step > 0 ? count($_smarty_tpl->tpl_vars['data']->value['color'])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['data']->value['color'])-1)+1)/abs($_smarty_tpl->tpl_vars['foo']->step));
if ($_smarty_tpl->tpl_vars['foo']->total > 0) {
for ($_smarty_tpl->tpl_vars['foo']->value = 0, $_smarty_tpl->tpl_vars['foo']->iteration = 1;$_smarty_tpl->tpl_vars['foo']->iteration <= $_smarty_tpl->tpl_vars['foo']->total;$_smarty_tpl->tpl_vars['foo']->value += $_smarty_tpl->tpl_vars['foo']->step, $_smarty_tpl->tpl_vars['foo']->iteration++) {
$_smarty_tpl->tpl_vars['foo']->first = $_smarty_tpl->tpl_vars['foo']->iteration == 1;$_smarty_tpl->tpl_vars['foo']->last = $_smarty_tpl->tpl_vars['foo']->iteration == $_smarty_tpl->tpl_vars['foo']->total;?>
    <tr>
        <?php $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['row']->step = 1;$_smarty_tpl->tpl_vars['row']->total = (int) ceil(($_smarty_tpl->tpl_vars['row']->step > 0 ? 3+1 - (0) : 0-(3)+1)/abs($_smarty_tpl->tpl_vars['row']->step));
if ($_smarty_tpl->tpl_vars['row']->total > 0) {
for ($_smarty_tpl->tpl_vars['row']->value = 0, $_smarty_tpl->tpl_vars['row']->iteration = 1;$_smarty_tpl->tpl_vars['row']->iteration <= $_smarty_tpl->tpl_vars['row']->total;$_smarty_tpl->tpl_vars['row']->value += $_smarty_tpl->tpl_vars['row']->step, $_smarty_tpl->tpl_vars['row']->iteration++) {
$_smarty_tpl->tpl_vars['row']->first = $_smarty_tpl->tpl_vars['row']->iteration == 1;$_smarty_tpl->tpl_vars['row']->last = $_smarty_tpl->tpl_vars['row']->iteration == $_smarty_tpl->tpl_vars['row']->total;?>
        <td><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['data']->value['color'][$_smarty_tpl->tpl_vars['foo']->value+$_smarty_tpl->tpl_vars['row']->value];?>
" class="i-v"></td>
        <?php }} ?>
    </tr>
    <?php }} ?>
    <tr class="last" style="display:none">
        <td colspan="8" class="title-cell">
            
        </td>
    </tr>
</table>
<div class="space-line" style="height:10px;"></div> -->
<!-- <div class="properties">
    <?php  $_smarty_tpl->tpl_vars['pro'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['pro']->_loop = false;
 $_smarty_tpl->tpl_vars['name'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['data']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['pro']->key => $_smarty_tpl->tpl_vars['pro']->value) {
$_smarty_tpl->tpl_vars['pro']->_loop = true;
 $_smarty_tpl->tpl_vars['name']->value = $_smarty_tpl->tpl_vars['pro']->key;
?>
        <?php if ($_smarty_tpl->tpl_vars['name']->value!='color') {?>
        <table class="calendar">
            <tr>
                <td colspan="4"><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['name']->value;?>
" class="text-center i-n" placeholder="Option Name"></td>
            </tr>
            <?php $_smarty_tpl->tpl_vars['foo'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['foo']->step = 4;$_smarty_tpl->tpl_vars['foo']->total = (int) ceil(($_smarty_tpl->tpl_vars['foo']->step > 0 ? count($_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->tpl_vars['name']->value])-1+1 - (0) : 0-(count($_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->tpl_vars['name']->value])-1)+1)/abs($_smarty_tpl->tpl_vars['foo']->step));
if ($_smarty_tpl->tpl_vars['foo']->total > 0) {
for ($_smarty_tpl->tpl_vars['foo']->value = 0, $_smarty_tpl->tpl_vars['foo']->iteration = 1;$_smarty_tpl->tpl_vars['foo']->iteration <= $_smarty_tpl->tpl_vars['foo']->total;$_smarty_tpl->tpl_vars['foo']->value += $_smarty_tpl->tpl_vars['foo']->step, $_smarty_tpl->tpl_vars['foo']->iteration++) {
$_smarty_tpl->tpl_vars['foo']->first = $_smarty_tpl->tpl_vars['foo']->iteration == 1;$_smarty_tpl->tpl_vars['foo']->last = $_smarty_tpl->tpl_vars['foo']->iteration == $_smarty_tpl->tpl_vars['foo']->total;?>
            <tr>
                <?php $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable;$_smarty_tpl->tpl_vars['row']->step = 1;$_smarty_tpl->tpl_vars['row']->total = (int) ceil(($_smarty_tpl->tpl_vars['row']->step > 0 ? 3+1 - (0) : 0-(3)+1)/abs($_smarty_tpl->tpl_vars['row']->step));
if ($_smarty_tpl->tpl_vars['row']->total > 0) {
for ($_smarty_tpl->tpl_vars['row']->value = 0, $_smarty_tpl->tpl_vars['row']->iteration = 1;$_smarty_tpl->tpl_vars['row']->iteration <= $_smarty_tpl->tpl_vars['row']->total;$_smarty_tpl->tpl_vars['row']->value += $_smarty_tpl->tpl_vars['row']->step, $_smarty_tpl->tpl_vars['row']->iteration++) {
$_smarty_tpl->tpl_vars['row']->first = $_smarty_tpl->tpl_vars['row']->iteration == 1;$_smarty_tpl->tpl_vars['row']->last = $_smarty_tpl->tpl_vars['row']->iteration == $_smarty_tpl->tpl_vars['row']->total;?>
                <td><input type="text" value="<?php echo $_smarty_tpl->tpl_vars['data']->value[$_smarty_tpl->tpl_vars['name']->value][$_smarty_tpl->tpl_vars['foo']->value+$_smarty_tpl->tpl_vars['row']->value];?>
" class="i-v"></td>
                <?php }} ?>
            </tr>
            <?php }} ?>
            <tr class="last">
                <td colspan="8" class="title-cell">
                    <button type="button" class="btn btn-default" onclick="addPropetyItem(this)">ADD</button>
                </td>
            </tr>
        </table>
        
        <?php }?>
    <?php } ?>
</div>
<button type="button" class="btn btn-default" onclick="addProperty()">Add New Property</button> -->
<?php echo '<script'; ?>
 type="text/javascript">
    // $('.colors .colorpicker').colorpicker();
    function addColors(){
        $('table.colors .last').before('<tr>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
        </tr>');
        // $('.colors .colorpicker').colorpicker();
    }
    function addProperty(){
        $('.properties').append('<table class="calendar">\
            <tr>\
                <td colspan="4"><input type="text" value="" class="text-center i-n" placeholder="Option Name"></td>\
            </tr>\
            <tr>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
            </tr>\
            <tr>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
                <td><input class="i-v" type="text" value=""></td>\
            </tr>\
            <tr class="last">\
                <td colspan="8" class="title-cell">\
                    <button type="button" class="btn btn-default" onclick="addPropetyItem(this)">ADD</button>\
                </td>\
            </tr>\
        </table><div class="space-line" style="height:10px;"></div>');
    }
    function addPropetyItem(elm){
        $(elm).parents('tr.last').before('<tr>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
            <td><input type="text" class="i-v"></td>\
        </tr>');
    }
    function cleanArray(actual){
      var newArray = new Array();
      for(var i = 0; i<actual.length; i++){
          if (actual[i]){
            newArray.push(actual[i]);
        }
      }
      return newArray;
    }
    function getProperties(){
        var color = $('.colors .i-v').map(function(){return this.value});
        var properties = $('.properties .calendar').map(function(){
            var name = $(this).find('.i-n').val();
            var values = $(this).find('.i-v').map(function(){
                return this.value;
            });
            return {name:name,values:values.get()}
        });
        var data = {};
        data['color'] = cleanArray($('.colors .i-v').map(function(){return this.value}).get());
        for(var i = 0; i < properties.length ; i++){
            if(properties[i].name){
                if(data[properties[i].name])
                    data[properties[i].name].push(cleanArray(properties[i].values));
                else
                    data[properties[i].name] = cleanArray(properties[i].values);
                
            }
        }
        return data;
    }
<?php echo '</script'; ?>
>
<style type="text/css">
    .calendar{
        border: 1px solid #ddd;
        width: 100%;
    }
    .calendar td{ 
        border: 1px solid #ddd;text-align: center;
        
    }
    
    .calendar td.title-cell{padding: 10px;}
    .calendar td input{
        border: 0;width: 100%;
        line-height: 30px;
        padding: 0 10px;
    }
</style><?php }} ?>
