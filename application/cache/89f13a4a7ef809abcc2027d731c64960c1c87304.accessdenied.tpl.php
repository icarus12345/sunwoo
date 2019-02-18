<?php /*%%SmartyHeaderCode:2228355119c6f05f8d6-94378570%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '89f13a4a7ef809abcc2027d731c64960c1c87304' => 
    array (
      0 => 'application\\templates\\cms\\auth\\accessdenied.tpl',
      1 => 1419004830,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2228355119c6f05f8d6-94378570',
  'cache_lifetime' => 60,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_551ce0011aec64_47047254',
  'has_nocache_code' => false,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_551ce0011aec64_47047254')) {function content_551ce0011aec64_47047254($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>Access Denied</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" type="text/css" href="http://1109.com/libraries/bootstrap/css/auth.css">
        <link rel="stylesheet" type="text/css" href="http://1109.com/libraries/bootstrap/css/font-awesome.css">
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
                                Access is denied for user "Trường Khương Xuân".<br>
                                <span style="color:#d9534f">This function to requires an administrative account.<br>
                                Please check your authority, and try again.<br>
                                </span>
                                Goto <a href="http://1109.com/cms">CMS</a> or
                                <a href="http://1109.com/cms/auth/logout?state=cms/co/post/privilege_view">logout</a>.
                        </p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html><?php }} ?>
