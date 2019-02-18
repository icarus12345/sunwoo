<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 17:33:08
         compiled from "application\templates\cms\cp\opt\editorPanelBasic.tpl" */ ?>
<?php /*%%SmartyHeaderCode:118998635c6a870f951914-49030772%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a8732b07d85cc70a4d3f5ce1ddcef478456c2735' => 
    array (
      0 => 'application\\templates\\cms\\cp\\opt\\editorPanelBasic.tpl',
      1 => 1550485979,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '118998635c6a870f951914-49030772',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a870f9818e8_64312376',
  'variables' => 
  array (
    'item' => 1,
    'token' => 1,
    'langs' => 1,
    'f' => 1,
    'la' => 1,
    'attr' => 1,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a870f9818e8_64312376')) {function content_5c6a870f9818e8_64312376($_smarty_tpl) {?>
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
                <div class="lang-tabs default" style="z-index: 11;position: relative;margin-left: 10px">
                    <ul class="nav-tabs">
                        <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = "active"; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable("active", true, 0);?>
                        <?php  $_smarty_tpl->tpl_vars['la'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['la']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['langs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['la']->key => $_smarty_tpl->tpl_vars['la']->value) {
$_smarty_tpl->tpl_vars['la']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['la']->key;
?>
                            <li class="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['f']->value)===null||$tmp==='' ? '' : $tmp);?>
">
                                <a  title="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"
                                    href="#tab_lang_content_opt_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"  
                                    data-toggle="tab" 
                                    >
                                        <?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>

                                </a>
                            </li>
                            <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = ''; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable('', true, 0);?>
                        <?php }
if (!$_smarty_tpl->tpl_vars['la']->_loop) {
?>
                            
                        <?php } ?>
                    </ul>
                </div>
                <div class="controls tab-content" style="border-top: 1px solid #ddd;float: left;width: 100%;">
                    <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = "active"; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable("active", true, 0);?>
                    <?php  $_smarty_tpl->tpl_vars['la'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['la']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['langs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['la']->key => $_smarty_tpl->tpl_vars['la']->value) {
$_smarty_tpl->tpl_vars['la']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['la']->key;
?>
                        <div id="tab_lang_content_opt_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" class="tab-pane <?php echo (($tmp = @$_smarty_tpl->tpl_vars['f']->value)===null||$tmp==='' ? '' : $tmp);?>
">
                            <div class="control-group pull-top">
                                <div>Title :(*)</div>
                                <?php if (isset($_smarty_tpl->tpl_vars['attr'])) {$_smarty_tpl->tpl_vars['attr'] = clone $_smarty_tpl->tpl_vars['attr'];
$_smarty_tpl->tpl_vars['attr']->value = ('opt_name_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('opt_name_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>

                                <input type="text" 
                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                    value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->{$_smarty_tpl->tpl_vars['attr']->value}))===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="opt_name_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                    maxlength="255" 
                                    placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"
                                    >
                            </div>
                            <div class="control-group pull-top">
                                <div>Desc :(*)</div>
                                <?php if (isset($_smarty_tpl->tpl_vars['attr'])) {$_smarty_tpl->tpl_vars['attr'] = clone $_smarty_tpl->tpl_vars['attr'];
$_smarty_tpl->tpl_vars['attr']->value = ('opt_desc_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('opt_desc_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>

                                <input type="text" 
                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                    value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->{$_smarty_tpl->tpl_vars['attr']->value}))===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="opt_desc_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                    maxlength="255" 
                                    placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"
                                    >
                            </div>
                        </div>
                         <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = ''; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable('', true, 0);?>
                    <?php } ?>
                </div>
                <div class="clearfix"></div>
                <div class="control-group pull-top">
                    <div>Value :</div>
                    <input type="text" 
                        rows="1"
                        class="form-control validate[maxSize[100]]"
                        name="opt_size" 
                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->opt_size, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                </div>
            </form>
        </div>
    </div>
</div>
<?php }} ?>
