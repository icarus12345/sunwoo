<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:44
         compiled from "application\templates\cms\000\template.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7581719635bed3904737191-54474245%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '85cda259fad7864e62c228e21486fa7b8fb9445c' => 
    array (
      0 => 'application\\templates\\cms\\000\\template.tpl',
      1 => 1433859997,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7581719635bed3904737191-54474245',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'tplConfig' => 0,
    'ci' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed39047b5c82_04365252',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed39047b5c82_04365252')) {function content_5bed39047b5c82_04365252($_smarty_tpl) {?>
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
    <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/inc/quickbar.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

    <div class="crumbs">
        <ul class="breadcrumb"> 
            <li><a href="/cms">CMS</a></li>
            <li><a href="/cms/cp" title="">Content Provider</a></li>
            <li class="active"><span><?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['title'];?>
</span></li>
        </ul>
    </div>
    <div id="iEntry" class="transition iEntry" style="overflow-y:auto">
        <div id="entry-container" class="container">
            
        </div>
    </div>
    <div id="iEntryList" class="transition iEntryList" style="overflow-y:auto">
        <div class="mark"></div>
        <div class="container" style="min-height: 100%;position:relative">
            <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).($_smarty_tpl->tpl_vars['tplConfig']->value['entryListTpl']), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

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
