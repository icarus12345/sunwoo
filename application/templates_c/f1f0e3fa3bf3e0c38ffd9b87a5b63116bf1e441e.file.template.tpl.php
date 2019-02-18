<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:15:30
         compiled from "application\templates\cms\template.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3384357275bed3932422fd9-95549465%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f1f0e3fa3bf3e0c38ffd9b87a5b63116bf1e441e' => 
    array (
      0 => 'application\\templates\\cms\\template.tpl',
      1 => 1433859952,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3384357275bed3932422fd9-95549465',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'conf' => 0,
    'f' => 0,
    'sec' => 0,
    'ci' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed393252ce02_41192741',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed393252ce02_41192741')) {function content_5bed393252ce02_41192741($_smarty_tpl) {?><?php if ((($tmp = @$_smarty_tpl->tpl_vars['conf']->value)===null||$tmp==='' ? null : $tmp)) {?>
    <?php  $_smarty_tpl->tpl_vars['f'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['f']->_loop = false;
 $_smarty_tpl->tpl_vars['sec'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['conf']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['f']->key => $_smarty_tpl->tpl_vars['f']->value) {
$_smarty_tpl->tpl_vars['f']->_loop = true;
 $_smarty_tpl->tpl_vars['sec']->value = $_smarty_tpl->tpl_vars['f']->key;
?>
        <?php  $_config = new Smarty_Internal_Config(((@constant('APPPATH')).("templates/")).($_smarty_tpl->tpl_vars['f']->value), $_smarty_tpl->smarty, $_smarty_tpl);$_config->loadConfigVars($_smarty_tpl->tpl_vars['sec']->value, 'local'); ?>
    <?php } ?>
<?php } else { ?>
    <?php  $_config = new Smarty_Internal_Config((@constant('APPPATH')).("templates/cms/conf/cms.conf"), $_smarty_tpl->smarty, $_smarty_tpl);$_config->loadConfigVars(null, 'local'); ?>
<?php }?>
<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/inc/meta.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<div id="iTopMenu" class="transition iTopMenu">
    <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/inc/head.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

</div>
<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/widget/message.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<div id="iLeftBar" class="transition iLeftBar" >
    <div class="navigation-head">
        <img class="cms-logo" src="<?php echo base_url('libraries/images/tk1109_green.jpg');?>
"/>CMS 1109
    </div>
    <div class="navigation-menu">
    <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/widget/accordionMenu.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

    
    </div>
</div>
<div id="iContain" class="transition iContain">
    <?php if ($_smarty_tpl->getConfigVariable('quickbarTpl')) {?>
        <?php echo $_smarty_tpl->getSubTemplate (((@constant('APPPATH')).("templates/")).($_smarty_tpl->getConfigVariable('quickbarTpl')), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

    <?php }?>
    <?php if ($_smarty_tpl->getConfigVariable('crumbTpl')) {?>
        <?php echo $_smarty_tpl->getSubTemplate (((@constant('APPPATH')).("templates/")).($_smarty_tpl->getConfigVariable('crumbTpl')), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

    <?php }?>
    <div id="iEntry" class="transition iEntry">
        <div id="entry-container" class="container">
            <?php if ($_smarty_tpl->getConfigVariable('entryEditorTpl')) {?>
                <?php echo $_smarty_tpl->getSubTemplate (((@constant('APPPATH')).("templates/")).($_smarty_tpl->getConfigVariable('entryEditorTpl')), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

            <?php }?>
        </div>
    </div>
    <div id="iEntryList" class="transition iEntryList">
        <div class="mark"></div>
        <div class="container">
            <?php if ($_smarty_tpl->getConfigVariable('entryListTpl')) {?>
                <?php echo $_smarty_tpl->getSubTemplate (((@constant('APPPATH')).("templates/")).($_smarty_tpl->getConfigVariable('entryListTpl')), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

            <?php }?>
        </div>
    </div>
</div>
<div id="iFoot" class="transition iFoot">
    Page rendered in <strong><?php echo $_smarty_tpl->tpl_vars['ci']->value->benchmark->elapsed_time();?>
</strong> seconds
</div>
<div id="iEntryDialog" class="iEntryDialog" style="display:none"></div>
<iframe id="integration_asynchronous" name="integration_asynchronous" style="width: 0;height: 0;border: 0;position: absolute"></iframe>
<div id="iPop-Entry" class="iPop">
    <div class="">
        <div class="pop-body">
            <div class="iPop-content"></div>
        </div>
    </div>
</div>
<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/auth/myaccount.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
<?php }} ?>
