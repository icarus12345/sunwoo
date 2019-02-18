<?php /*%%SmartyHeaderCode:245015471525a609408-29196754%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7deaeffd59c5a63f3dc36ba014fae97461e4a035' => 
    array (
      0 => 'application\\templates\\cms\\co_teamplate.tpl',
      1 => 1416714549,
      2 => 'file',
    ),
    '42a05989d47971c248459a0d975d7c7992a022e8' => 
    array (
      0 => 'application\\templates\\cms\\conf\\cms.conf',
      1 => 1416714543,
      2 => 'file',
    ),
    '9e5142a8ee3f76824ce78fc928f37685e9e90def' => 
    array (
      0 => 'application\\templates\\cms\\inc\\meta.tpl',
      1 => 1416714514,
      2 => 'file',
    ),
    '8dc4eb75a170658c624fe085e597d4aeac847aa7' => 
    array (
      0 => 'application\\templates\\cms\\inc\\head.tpl',
      1 => 1416713188,
      2 => 'file',
    ),
    '5c909935c27b378225239ab6abc0f1d908caa6e8' => 
    array (
      0 => 'application\\templates\\cms\\inc\\quickbar.tpl',
      1 => 1416713220,
      2 => 'file',
    ),
    '3743c62ad71e39b616a6d76bdaa410e368039efd' => 
    array (
      0 => 'application\\templates\\cms\\widget\\sidebar.tpl',
      1 => 1416713506,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '245015471525a609408-29196754',
  'cache_lifetime' => 60,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_54715937f35bf5_30882448',
  'has_nocache_code' => false,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54715937f35bf5_30882448')) {function content_54715937f35bf5_30882448($_smarty_tpl) {?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>CMS - Content Provider</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width; initial-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/ui/themes/base/jquery.ui.all.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/bootstrap-select.min.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/cms.css"/>
        
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/ui/js/jquery-ui-1.9.2.custom.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/dateformat.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/cms.js"></script>
        <!--[if IE]>
			<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
		<![endif]-->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

<header id="navbar" class="navbar" role="banner">
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
                <a href="#" data-toggle="dropdown" title="Notication message"><span class="fa fa-comments-o"></span></a>
                <ul class="dropdown-menu message-dropdown" role="menu" aria-labelledby="dLabel">
                    <li class="notification-header">
                        <em>You have 2 unread messages</em>
                    </li>
                    <li class="inbox-item clearfix">
                        <a href="page-inbox.html#">
                            <div class="media">
                                <div class="media-body">
                                    <h5 class="media-heading name">Antonius</h5>
                                    <p class="text">The problem just happened this morning. I can't see ...</p>
                                    <span class="timestamp">4 minutes ago</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="inbox-item unread clearfix">
                        <a href="page-inbox.html#">
                            <div class="media">
                                <div class="media-body">
                                    <h5 class="media-heading name">Michael</h5>
                                    <p class="text">Hey dude, cool theme!</p>
                                    <span class="timestamp">2 hours ago</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="inbox-item unread clearfix">
                        <a href="page-inbox.html#">
                            <div class="media">
                                <div class="media-body">
                                    <h5 class="media-heading name">Stella</h5>
                                    <p class="text">Ok now I can see the status for each item. Thanks! :D</p>
                                    <span class="timestamp">Oct 6</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="inbox-item clearfix">
                        <a href="page-inbox.html#">
                            <div class="media">
                                <div class="media-body">
                                    <h5 class="media-heading name">Jane Doe</h5>
                                    <p class="text"><i class="fa fa-reply"></i> Please check the status of your ...</p>
                                    <span class="timestamp">Oct 2</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="inbox-item clearfix">
                        <a href="page-inbox.html#">
                            <div class="media">
                                <div class="media-body">
                                    <h5 class="media-heading name">John Simmons</h5>
                                    <p class="text"><i class="fa fa-reply"></i> I've fixed the problem :)</p>
                                    <span class="timestamp">Sep 12</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="notification-footer">
                        <a href="page-inbox.html#">View All Messages</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="dropdown" title="Setting"><span class="fa fa-sliders"></span></a>
                <ul class="dropdown-menu pull-center" role="menu" aria-labelledby="dLabel">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="JavaScript:toggleContent()">Action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Logout</a></li>
                </ul>
            </li>
            <li>
                <a href='#'  data-toggle="dropdown" title="Account">
                    <span class="hidden-xs hidden-mb">Admin</span> 
                    <i class="fa fa-users visible-xs visible-mb"></i>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dLabel">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="JavaScript:toggleContent()">Action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa-sign-out"></i>Logout</a></li>
                </ul>
            </li>
        </ul>

    </div>
</header>

<div id="quick-bar" class="quick-bar transition">
    <ul class="round-buttons ">
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="Image" class="tip" data-original-title="Logout">
                    <i class="fa-image"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="Category" class="tip">
                    <i class="fa fa-list-ul"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="News" class="tip">
                    <i class="fa fa-newspaper-o"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="Comments" class="tip">
                    <i class="fa fa-comments"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="File" class="tip">
                    <i class="fa fa-folder-open-o"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="Chart" class="tip">
                    <i class="fa-line-chart"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="Setting" class="tip" data-original-title="Logout">
                    <i class="fa-toggle-off"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="User" class="tip">
                    <i class="fa-users"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="Setting" class="tip">
                    <i class="fa-cogs"></i>
                </a>
            </div>
        </li>
        <li>
            <div class="depth">
                <a href="#" data-placement="bottom" title="Logout" class="tip" data-original-title="Logout">
                    <i class="fa-sign-out"></i>
                </a>
            </div>
        </li>
    </ul>
</div>

<div id="container" class="transition">
    <div>
        <div>
            <div class="sidebar to-frond">
    <ul class="nav nav-list">
        <li class="nav-header">Content Provider</li>

        <li>
            <a class="navi-data-Slider" href="/cms/cp/data/viewport/Slider"><i class="fa-film"></i>Slide show</a>
        </li>
        <li class="-nav-collapse">
            <div>
                <i class="fa fa-bar-chart-o"></i>Consultancy
                <span class="navi-collapse"></span>
            </div>
            <ul>
                <li><a class="navi-category-consultancy" href="/cms/cp/category/viewport/consultancy" title="">Legal consultant</a></li>
                <li><a class="navi-ant-" href="/cms/cp/ant/" title="">Ant interview questions</a></li>
            </ul>
        </li>
        <li class="nav-collapse">
            <div>
                <i class="fa-image"></i>Thư viện ảnh
                <span class="navi-collapse"></span>
            </div>
            <ul>
                <li><a class="navi-album-graphic-design" href="/cms/cp/album/viewport/graphic-design" title="">Graphic Design</a></li>
                <li><a class="navi-album-web-design" href="/cms/cp/album/viewport/web-design" title="">Web Design</a></li>
                <li><a class="navi-album-printing-design" href="/cms/cp/album/viewport/printing-design" title="">Printing Design</a></li>
                <li><a class="navi-album-brand-develoment" href="/cms/cp/album/viewport/brand-develoment" title="">Brand Development</a></li>
                <li><a class="navi-album-price-list" href="/cms/cp/album/viewport/price-list" title="">Price List</a></li>
            </ul>
        </li>
        <li><a href="forms.html#"><i class=" fa-bars"></i>Applications</a>
            <ul>

                <li><a class="navi-content-about current" href="/cms/cp/content/viewport/about" title="">About us</a></li>
                <li><a class="navi-content-news" href="/cms/cp/content/viewport/news" title="">News</a></li>
                <li><a class="navi-content-event" href="/cms/cp/content/viewport/event" title="">Event</a></li>
                <li><a class="navi-content-legal-community" href="/cms/cp/content/viewport/legal-community" title="">Legal Community</a></li>

            </ul>
        </li>
        <li class="nav-header">Service Operator</li>
        <li class="-nav-collapse">
            <div>
                <i class="fa-cogs"></i>Settings
                <span class="navi-collapse"></span>
            </div>
            <ul>
                <li><a class="navi-lang-lawyer" href="/cms/cp/lang/viewport/lawyer" title="">Language</a></li>
                <li><a class="navi-file" href="/cms/file" title="">KCFinder - Image Manage</a></li>
                <li><a class="navi-webpage-" href="/cms/cp/webpage" title="">Web page</a></li>
    <!--        <li><a class="navi-config-" href="/cms/so/config/viewport/" title="">Module</a></li>
                <li><a class="navi-type-Product" href="/cms/cp/type/viewport/Product" title="">Product Type</a></li>
                <li><a class="navi-config-webinfo" href="/cms/so/config/viewport/webinfo" title="">Site Info</a></li>
                <li><a class="navi-config-banner" href="/cms/so/config/viewport/banner" title="">Banner of Website</a></li>
                <li><a class="navi-config-webinfo" href="/cms/sm/home/viewport/webinfo" title="">Site Info</a></li>
                <li><a class="navi-config-webpage" href="/cms/sm/home/viewportwebpage/webpage" title="">WebPage</a></li>
                <li><a class="navi-config-contactus" href="/cms/sm/home/viewport/contactus" title="">Contact Info</a></li>-->
            </ul>
        </li>
        <li><a href="/cms/user" title=""><i class="fa-group"></i>Dashboard User</a></li>

    </ul>
</div>
        </div>
    </div>
</div><?php }} ?>
