<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:16:32
         compiled from "application/templates/cms/auth/login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20652716395c6aa2204b8ad1-67258229%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '41820e5283cb35aec421accb6785e2bb2ea57099' => 
    array (
      0 => 'application/templates/cms/auth/login.tpl',
      1 => 1433860000,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20652716395c6aa2204b8ad1-67258229',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'message' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa2204dc8f0_72823988',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa2204dc8f0_72823988')) {function content_5c6aa2204dc8f0_72823988($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title>CMS - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/bootstrap/css/auth.css');?>
">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/bootstrap/css/font-awesome.css');?>
">
    </head>
    <body>
        <p class="notice">Welcome back! Sigin below to access all the features available to you.</p>
        <div class="content-wrapper">
            <div class="panel error-mobile">
                <div class="eight columns">
                    <h1>Sigin to CMS</h1>
                    <div class="divider"></div>
                    <div>
                        <form method="POST">
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
                                    
                                    <button style="width: 100%" class="btn btn-default" type="submit">
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
                            <?php if ($_smarty_tpl->tpl_vars['message']->value) {?>
                            <div class="bs-callout bs-callout-danger"><?php echo $_smarty_tpl->tpl_vars['message']->value;?>
</div>
                            <?php }?>
                        </form>
                        
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html><?php }} ?>
