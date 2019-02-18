<?php /*%%SmartyHeaderCode:2211254fb04585ea296-57532740%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3c52e382a2d8b0ccf269d24e4e1769e909eb7bce' => 
    array (
      0 => 'application\\templates\\navia\\home.tpl',
      1 => 1421686006,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2211254fb04585ea296-57532740',
  'variables' => 
  array (
    'slides' => 0,
    'f' => 0,
    'i' => 0,
    'settings' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_54fb04586680e7_95519476',
  'cache_lifetime' => 60,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54fb04586680e7_95519476')) {function content_54fb04586680e7_95519476($_smarty_tpl) {?><!DOCTYPE html>
<html>
    <head>
        <title>Navia</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width; initial-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" type="text/css" href="/libraries/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="/libraries/ui/themes/base/jquery.ui.all.css"/>
        <link rel="stylesheet" type="text/css" href="/libraries/bootstrap/css/bootstrap-select.min.css"/>
        <link rel="stylesheet" type="text/css" href="/libraries/plugin/owl-carousel/owl.carousel.css"/>
        <link rel="stylesheet" type="text/css" href="/libraries/plugin/select2/select2.css"/>
        <link rel="stylesheet" type="text/css" href="/libraries/bootstrap/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="/layout/navia/css/navia.css"/>
        

        <script type="text/javascript" src="/libraries/bootstrap/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="/libraries/ui/js/jquery-ui-1.9.2.custom.min.js"></script>
        <script type="text/javascript" src="/libraries/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/libraries/plugin/owl-carousel/owl.carousel.js"></script>
        <script type="text/javascript" src="/libraries/plugin/jquery.nailthumb.1.1.js"></script>
        <script type="text/javascript" src="/libraries/plugin/jquery.lazyload.min.js"></script>
        <script type="text/javascript" src="/layout/navia/js/navia.js"></script>
        <!--[if IE]>
            <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
        <![endif]-->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body class="">
        <header id="navbar" class="navbar" role="banner">
            <div class="">

                <div class="navbar-header">

                    <a href="#" class="navbar-brand">
                        <img src="/layout/navia/images/logo.png"/>
                    </a>
                    <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                        <span>
                            <span class="icon-bar line-1"></span>
                            <span class="icon-bar line-2"></span>
                            <span class="icon-bar line-3"></span>
                        </span>
                    </button>
                </div>
                <nav id="navigation" class="collapse navbar-collapse bs-navbar-collapse" role="navigation" style="overflow: hidden" >
                    <ul class="nav navbar-nav left-navbar">
                        <li><a href='/services'>Services</a></li>
                        <li><a href='/works'>Works</a></li>
                    </ul>
                    <ul class="nav navbar-nav right-navbar">
                        <li><a href='/about'>About</a></li>
                        <li><a href='/contact'>Contact</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <div id="navia-slider" class="carousel carousel-fade" data-ride="carousel" data-pause="false">
            <div class="carousel-inner" role="listbox">
                                            </div>
        </div>
        <div class="navia-popup">
            <div>
                <div id="navia-owl" class="owl-carousel" >
                    <div class="item">
                        <h1>IN DESIGN WE TRUST</h1>
                        <p>If there is shit all around me, how can I eat my ice cream?</p>
                    </div>
                    <div class="item">
                        <h1>IN DESIGN WE TRUST</h1>
                        <p>If there is shit all around me, how can I eat my ice cream?</p>
                    </div>
<!--                    <div class="item">
                        <h1>IN DESIGN WE TRUST</h1>
                        <p>If there is shit all around me, how can I eat my ice cream?</p>
                    </div>-->
                </div>
            </div>
        </div>
        <div class="navia-foot">
            
        </div>
    </body>
</html>
<?php }} ?>
