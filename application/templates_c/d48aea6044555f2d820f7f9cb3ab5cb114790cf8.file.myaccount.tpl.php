<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:16:38
         compiled from "application/templates/cms/auth/myaccount.tpl" */ ?>
<?php /*%%SmartyHeaderCode:761004655c6aa2261ec898-65930842%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd48aea6044555f2d820f7f9cb3ab5cb114790cf8' => 
    array (
      0 => 'application/templates/cms/auth/myaccount.tpl',
      1 => 1433860002,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '761004655c6aa2261ec898-65930842',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa2261f40f9_99574839',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa2261f40f9_99574839')) {function content_5c6aa2261f40f9_99574839($_smarty_tpl) {?><div id="iDialog" class="iDialog" style="display:none">
	<b><?php echo (($tmp = @htmlspecialchars($_SESSION['auth']['user']->ause_username, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</b>
	<form name="myinfoForm" id="myinfoForm" target="integration_asynchronous">
		<div class="control-group pull-top">
            <div>Diplay Name :</div>
            <input type="text" 
                class="form-control validate[required]" 
                value="<?php echo (($tmp = @htmlspecialchars($_SESSION['auth']['user']->ause_name, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                name="ause_name"
                >
        </div>
        <div class="control-group pull-top">
            <div>Email :</div>
            <input type="text" 
                class="form-control validate[required]" 
                value="<?php echo (($tmp = @htmlspecialchars($_SESSION['auth']['user']->ause_email, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                name="ause_email"
                >
        </div>
        <div class="control-group pull-top">
            <div>Password :</div>
            <div class="input-append">
                <input type="text" class="form-control" 
                    placeholder="Current password"
                    name="ause_password"
                    value=""
                    />
                <span class="add-on" title="Random new password" onclick="getNewPass()">
                    <i class="fa-random"></i>
                </span>
            </div>
        </div>
	</form>
</div><?php }} ?>
