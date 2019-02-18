<?php /*%%SmartyHeaderCode:122045471850e7e9750-78731690%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9ae935592b9f18341eed8fd198ca0761cd4398b0' => 
    array (
      0 => 'application\\templates\\cms\\auth\\login.tpl',
      1 => 1416727616,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '122045471850e7e9750-78731690',
  'cache_lifetime' => 60,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_54719ef8a70036_86347792',
  'has_nocache_code' => false,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54719ef8a70036_86347792')) {function content_54719ef8a70036_86347792($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>CMS - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/auth.css">
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/font-awesome.css">
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/jquery-1.9.1.min.js"></script>
    </head>
    <body>
        <p class="notice">Welcome back! Sigin below to access all the features available to you.</p>
        <div class="content-wrapper">
            <div class="panel error-mobile">
                <div class="eight columns">
                    <h1>Sigin to CMS</h1>
                    <div class="divider"></div>
                    <div>
                        <form>
                            <input type="hidden" name="action" value="login">
                            <div>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-bug"></i>
                                    </span>
                                    <input type="text" name="username" 
                                        class="form-control" 
                                        placeholder="User name" 
                                        >
                                </div>
                            </div>
                            <div>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-code"></i>
                                    </span>
                                    <input type="password" name="password"  
                                        class="form-control"
                                        placeholder="Password" 
                                        >
                                </div>
                            </div>
                            <div>
                                <div class="input-group">
                                    
                                    <button style="width: 100%" onclick="authsigin()" class="btn btn-default" type="button">
                                        <i class="fa fa-sign-in"></i> Sigin 
                                    </button>
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default" tabindex="-1">

                                            <span>OAuth<span>
                                            <span class="caret"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="bs-callout bs-callout-danger" style="display:none"></div>
                        </form>
                        
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <script type="text/javascript">
            var PENDING = false;
            function authsigin(){
                PENDING = true;
                jQuery.ajax({
                    type: 'POST',
                    //cache:false,
                    //timeout:10000,
                    data: {
                        username: $('input[name="username"]').val(),
                        password: $('input[name="password"]').val(),
                        action:'login'
                    },
                    dataType: 'json',
                    url: '',
                    success: function(data_result) {
                        PENDING = false;
                        if (data_result.result < 0) {
                            NoticeMessage(data_result.message);
                        } else {
                            NoticeMessage(data_result.message);
                            window.location.reload();
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        PENDING = false;
                        NoticeMessage('Sorry. Your request could not be completed.<br/> Please check your input data and try again.');
                    }
                });
            }
            function NoticeMessage(msg){
                $('.bs-callout-danger').show();
                $('.bs-callout-danger').html(msg);
            }
        </script>
    </body>
</html><?php }} ?>
