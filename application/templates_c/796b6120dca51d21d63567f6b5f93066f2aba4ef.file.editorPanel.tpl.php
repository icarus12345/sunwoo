<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 15:24:12
         compiled from "application\templates\cms\cp\opt\editorPanel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5240459135c6a6bac79b3b7-74492715%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '796b6120dca51d21d63567f6b5f93066f2aba4ef' => 
    array (
      0 => 'application\\templates\\cms\\cp\\opt\\editorPanel.tpl',
      1 => 1433860058,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5240459135c6a6bac79b3b7-74492715',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'item' => 1,
    'token' => 1,
    'prices' => 1,
    'c' => 1,
    'colors' => 1,
    'divid' => 1,
    'sizes' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a6bac927923_43117605',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a6bac927923_43117605')) {function content_5c6a6bac927923_43117605($_smarty_tpl) {?>
<div class="row-fluid">
    <div class="widget full">
        <div class="-pull-top -pull-bottom -container">
            <input 
                type="hidden" 
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->opt_id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="EntryOptId"
                />
            <form name="entryOptForm" id="entryOptForm" target="integration_asynchronous">
                <input type="hidden" name="opt_token" 
                    value="<?php echo (($tmp = @(($tmp = @$_smarty_tpl->tpl_vars['item']->value->opt_token)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['token']->value : $tmp))===null||$tmp==='' ? '' : $tmp);?>
"/>
                <div class="control-group">
                    <div>Name :(*)</div>
                    <input type="text" 
                        class="form-control validate[required,minSize[2],maxSize[255]]" 
                        data-prompt-position="topLeft:0,20"
                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->opt_name, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                        name="opt_name"
                        >
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Price :(*)</div>
                            <div <?php if ((($tmp = @$_smarty_tpl->tpl_vars['prices']->value)===null||$tmp==='' ? null : $tmp)) {?>class="input-append"<?php }?>>
                                <input type="text" 
                                    class="form-control validate[required,custom[number]]" 
                                    data-prompt-position="topLeft:0,20"
                                    data-errormessage-custom-error="Numbers only"
                                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->opt_price, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                    min="0"
                                    name="opt_price"
                                    >
                                <?php if ((($tmp = @$_smarty_tpl->tpl_vars['prices']->value)===null||$tmp==='' ? null : $tmp)) {?>
                                <div class="add-on dropdown" 
                                    title="Choose Image"
                                    style="padding:0" 
                                    onclick="">
                                    <i  class="fa fa-angle-down dropdown-toggle" 
                                        data-toggle="dropdown"
                                        title="Choose Price"
                                        style="padding:4px 8px" 
                                        ></i>
                                    <ul class="dropdown-menu pull-right" role="menu" 
                                        style="max-height:180px;overflow-y: auto;"
                                        >
                                            <?php  $_smarty_tpl->tpl_vars['c'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['c']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['prices']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['c']->key => $_smarty_tpl->tpl_vars['c']->value) {
$_smarty_tpl->tpl_vars['c']->_loop = true;
?>
                                            <?php if (trim($_smarty_tpl->tpl_vars['c']->value->opt_price)) {?>
                                            <li>
                                                <a href="JavaScript:" onclick="document.entryOptForm.opt_price.value='<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_price, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
'">
                                                    
                                                    <?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_price, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>

                                                </a>
                                            </li>
                                            <?php }?>
                                            <?php } ?>
                                    </ul>
                                </div>
                                <?php }?>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Amount :(*)</div>
                            <input type="number" 
                                class="form-control validate[required,custom[integer],min[0],max[9999]]"
                                data-prompt-position="topLeft:0,20" 
                                value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->opt_amount, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"
                                min="0" max="9999"
                                name="opt_amount"
                                >
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Color :</div>
                            <div <?php if ((($tmp = @$_smarty_tpl->tpl_vars['colors']->value)===null||$tmp==='' ? null : $tmp)) {?>class="input-append"<?php }?>>
                                <input type="text" 
                                    class="form-control colorpicker" 
                                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->opt_color, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="opt_color"
                                    >
                                <?php if ((($tmp = @$_smarty_tpl->tpl_vars['colors']->value)===null||$tmp==='' ? null : $tmp)) {?>
                                <div class="add-on dropdown" 
                                    style="padding: 0" 
                                    title="Choose Color" >
                                    <i  class="fa fa-angle-down dropdown-toggle" 
                                        data-toggle="dropdown" 
                                        style="padding:4px 8px" ></i>
                                    <ul class="dropdown-menu pull-right" role="menu" 
                                        style="max-height:180px;overflow-y: auto;"
                                        >
                                        <?php if (isset($_smarty_tpl->tpl_vars["divid"])) {$_smarty_tpl->tpl_vars["divid"] = clone $_smarty_tpl->tpl_vars["divid"];
$_smarty_tpl->tpl_vars["divid"]->value = -1; $_smarty_tpl->tpl_vars["divid"]->nocache = true; $_smarty_tpl->tpl_vars["divid"]->scope = 0;
} else $_smarty_tpl->tpl_vars["divid"] = new Smarty_variable(-1, true, 0);?>
                                        <?php  $_smarty_tpl->tpl_vars['c'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['c']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['colors']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['c']->key => $_smarty_tpl->tpl_vars['c']->value) {
$_smarty_tpl->tpl_vars['c']->_loop = true;
?>
                                        <?php if (trim($_smarty_tpl->tpl_vars['c']->value->opt_color)) {?>
                                            <?php if ($_smarty_tpl->tpl_vars['divid']->value==1&&$_smarty_tpl->tpl_vars['c']->value->active==0) {?>
                                                <?php if (isset($_smarty_tpl->tpl_vars["divid"])) {$_smarty_tpl->tpl_vars["divid"] = clone $_smarty_tpl->tpl_vars["divid"];
$_smarty_tpl->tpl_vars["divid"]->value = 0; $_smarty_tpl->tpl_vars["divid"]->nocache = true; $_smarty_tpl->tpl_vars["divid"]->scope = 0;
} else $_smarty_tpl->tpl_vars["divid"] = new Smarty_variable(0, true, 0);?>
                                                <li class="divider"></li>
                                            <?php }?>
                                            <li>
                                                <a href="JavaScript:" onclick="document.entryOptForm.opt_color.value='<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_color, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
'">
                                                    <div class="opt-color" 
                                                        style="background:<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_color, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
">
                                                    </div>
                                                    <?php if ($_smarty_tpl->tpl_vars['c']->value->active>=1) {?>
                                                        <?php if ($_smarty_tpl->tpl_vars['divid']->value==-1) {?>
                                                            <?php if (isset($_smarty_tpl->tpl_vars["divid"])) {$_smarty_tpl->tpl_vars["divid"] = clone $_smarty_tpl->tpl_vars["divid"];
$_smarty_tpl->tpl_vars["divid"]->value = 1; $_smarty_tpl->tpl_vars["divid"]->nocache = true; $_smarty_tpl->tpl_vars["divid"]->scope = 0;
} else $_smarty_tpl->tpl_vars["divid"] = new Smarty_variable(1, true, 0);?>
                                                        <?php }?>
                                                        <b><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_color, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</b>
                                                    <?php } else { ?>
                                                        <?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_color, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>

                                                    <?php }?>
                                                    <div class="clearfix"></div>
                                                </a>
                                            </li>
                                        <?php }?>
                                        <?php } ?>
                                        
                                    </ul>
                                </div>
                                <?php }?>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">        
                        <div class="control-group pull-top">
                            <div>Size :</div>
                            <div <?php if ((($tmp = @$_smarty_tpl->tpl_vars['sizes']->value)===null||$tmp==='' ? null : $tmp)) {?>class="input-append"<?php }?>>
                                <input type="text" 
                                    class="form-control" 
                                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->opt_size, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="opt_size"
                                    >
                                <?php if ((($tmp = @$_smarty_tpl->tpl_vars['sizes']->value)===null||$tmp==='' ? null : $tmp)) {?>
                                <div class="add-on dropdown" 
                                    title="Choose Size"
                                    style="padding: 0" >
                                    <i  class="fa fa-angle-down dropdown-toggle" 
                                        style="padding:4px 8px"
                                        data-toggle="dropdown"></i>
                                    <ul class="dropdown-menu pull-right" role="menu" 
                                        style="max-height:180px;overflow-y: auto;"
                                        >
                                        <?php if (isset($_smarty_tpl->tpl_vars["divid"])) {$_smarty_tpl->tpl_vars["divid"] = clone $_smarty_tpl->tpl_vars["divid"];
$_smarty_tpl->tpl_vars["divid"]->value = -1; $_smarty_tpl->tpl_vars["divid"]->nocache = true; $_smarty_tpl->tpl_vars["divid"]->scope = 0;
} else $_smarty_tpl->tpl_vars["divid"] = new Smarty_variable(-1, true, 0);?>
                                        <?php  $_smarty_tpl->tpl_vars['c'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['c']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['sizes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['c']->key => $_smarty_tpl->tpl_vars['c']->value) {
$_smarty_tpl->tpl_vars['c']->_loop = true;
?>
                                        <?php if (trim($_smarty_tpl->tpl_vars['c']->value->opt_size)) {?>
                                            <?php if ($_smarty_tpl->tpl_vars['divid']->value==1&&$_smarty_tpl->tpl_vars['c']->value->active==0) {?>
                                                <?php if (isset($_smarty_tpl->tpl_vars["divid"])) {$_smarty_tpl->tpl_vars["divid"] = clone $_smarty_tpl->tpl_vars["divid"];
$_smarty_tpl->tpl_vars["divid"]->value = 0; $_smarty_tpl->tpl_vars["divid"]->nocache = true; $_smarty_tpl->tpl_vars["divid"]->scope = 0;
} else $_smarty_tpl->tpl_vars["divid"] = new Smarty_variable(0, true, 0);?>
                                                <li class="divider"></li>
                                            <?php }?>
                                        <li>
                                            <a href="JavaScript:" onclick="document.entryOptForm.opt_size.value='<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_size, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
'">
                                                <?php if ($_smarty_tpl->tpl_vars['c']->value->active>=1) {?>
                                                    <?php if ($_smarty_tpl->tpl_vars['divid']->value==-1) {?>
                                                        <?php if (isset($_smarty_tpl->tpl_vars["divid"])) {$_smarty_tpl->tpl_vars["divid"] = clone $_smarty_tpl->tpl_vars["divid"];
$_smarty_tpl->tpl_vars["divid"]->value = 1; $_smarty_tpl->tpl_vars["divid"]->nocache = true; $_smarty_tpl->tpl_vars["divid"]->scope = 0;
} else $_smarty_tpl->tpl_vars["divid"] = new Smarty_variable(1, true, 0);?>
                                                    <?php }?>
                                                    <b><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_size, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</b>
                                                <?php } else { ?>
                                                    <?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->opt_size, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>

                                                <?php }?>
                                            </a>
                                        </li>
                                        <?php }?>
                                        <?php } ?>
                                    </ul>
                                </div>
                                <?php }?>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<?php }} ?>
