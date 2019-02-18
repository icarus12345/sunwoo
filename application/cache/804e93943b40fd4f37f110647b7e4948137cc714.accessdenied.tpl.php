<?php /*%%SmartyHeaderCode:1759454719df2d605a6-30225015%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '804e93943b40fd4f37f110647b7e4948137cc714' => 
    array (
      0 => 'application\\templates\\cms\\auth\\accessdenied.tpl',
      1 => 1419004830,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1759454719df2d605a6-30225015',
  'cache_lifetime' => 60,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_54a3506f7b5939_50339085',
  'has_nocache_code' => false,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54a3506f7b5939_50339085')) {function content_54a3506f7b5939_50339085($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>Access Denied</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" type="text/css" href="http://192.168.11.9:1900/libraries/bootstrap/css/auth.css">
        <link rel="stylesheet" type="text/css" href="http://192.168.11.9:1900/libraries/bootstrap/css/font-awesome.css">
    </head>
    <body>
        <p class="notice">Welcome back! Sigin below to access all the features available to you.</p>
        <div class="content-wrapper">
            <div class="panel error-mobile">
                <div class="eight columns">
                    <h1 style="color:#d9534f">Access Denied</h1>
                    <div class="divider"></div>
                    <div>
                        <p style="text-align: left">
                                Access is denied for user "Doan".<br>
                                <span style="color:#d9534f">This function to requires an administrative account.<br>
                                Please check your authority, and try again.<br>
                                </span>
                                Goto <a href="http://192.168.11.9:1900/cms">CMS</a> or
                                <a href="http://192.168.11.9:1900/cms/auth/logout?state=cms/account">logout</a>.
                        </p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html><?php }} ?>
