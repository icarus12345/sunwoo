<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:44
         compiled from "application\templates\cms\inc\head.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20616368455bed3904b94c55-93321151%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ad535e7318fd2eefc8f6d1d6c775b39270b636e2' => 
    array (
      0 => 'application\\templates\\cms\\inc\\head.tpl',
      1 => 1433860006,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20616368455bed3904b94c55-93321151',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed3904bcdd87_61392031',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed3904bcdd87_61392031')) {function content_5bed3904bcdd87_61392031($_smarty_tpl) {?><header id="navbar" class="navbar" role="banner">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" type="button">
                <span class="icon-bar line-1"></span>
                <span class="icon-bar line-2"></span>
                <span class="icon-bar line-3"></span>
            </button>
            <a href="/vi" class="navbar-brand">
                <span class="space-line"></span>
            </a>
        </div>
        <ul class="nav navbar-nav pull-right">
            <li><a href="#" onclick="toggleQuickBar()" title="Quick navigation"><span class="fa fa-send-o"></span></a></li>
            <li>
                <a href="JavaScript:" 
                   onclick="cms.logMessage()"
                   title="Notication message">
                    <span class="fa fa-comments-o"></span>
                </a>
            </li>
            <li>
                <a href="#" data-toggle="dropdown" title="Setting"><span class="fa fa-sliders"></span></a>
                <ul class="dropdown-menu pull-center" role="menu" aria-labelledby="dLabel">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                </ul>
            </li>
            <li>
                <a href='#'  data-toggle="dropdown" title="Account">
                    <span class="hidden-xs hidden-mb"><?php echo (($tmp = @$_SESSION['auth']['user']->ause_name)===null||$tmp==='' ? 'Unknown' : $tmp);?>
</span>
                    <i class="fa fa-users"></i>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li><a href="JavaScript:void(0)" onclick="accountdialog()">Account Info</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="<?php echo base_url('cms/auth/logout');?>
?state=<?php echo uri_string();?>
&query=<?php echo urlencode(http_build_query($_GET));?>
"><i class="fa-sign-out"></i>Logout</a></li>
                </ul>
            </li>
        </ul>

    </div>
</header>

<?php }} ?>
