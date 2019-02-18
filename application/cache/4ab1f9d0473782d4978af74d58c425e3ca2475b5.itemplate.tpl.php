<?php /*%%SmartyHeaderCode:15575481c9c2e5d242-79677738%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4ab1f9d0473782d4978af74d58c425e3ca2475b5' => 
    array (
      0 => 'application\\templates\\cms\\itemplate.tpl',
      1 => 1418357423,
      2 => 'file',
    ),
    '42a05989d47971c248459a0d975d7c7992a022e8' => 
    array (
      0 => 'application\\templates\\cms\\conf\\cms.conf',
      1 => 1418354531,
      2 => 'file',
    ),
    '9e5142a8ee3f76824ce78fc928f37685e9e90def' => 
    array (
      0 => 'application\\templates\\cms\\inc\\meta.tpl',
      1 => 1418184485,
      2 => 'file',
    ),
    '8dc4eb75a170658c624fe085e597d4aeac847aa7' => 
    array (
      0 => 'application\\templates\\cms\\inc\\head.tpl',
      1 => 1418374929,
      2 => 'file',
    ),
    '11a2d8bb290d5489270a62acb1464ad83363a583' => 
    array (
      0 => 'application\\templates\\cms\\widget\\message.tpl',
      1 => 1418200033,
      2 => 'file',
    ),
    'ef9f33b8edf9de6ec0daf4973c3a34a6a2998dfa' => 
    array (
      0 => 'application\\templates\\cms\\widget\\navimenu.tpl',
      1 => 1418358121,
      2 => 'file',
    ),
    '9cf812b34d05783f3aca0be20ba97ca3788d7bfd' => 
    array (
      0 => 'application\\templates\\cms\\widget\\navimenuAdmin.tpl',
      1 => 1418358121,
      2 => 'file',
    ),
    '5c909935c27b378225239ab6abc0f1d908caa6e8' => 
    array (
      0 => 'application\\templates\\cms\\inc\\quickbar.tpl',
      1 => 1416713220,
      2 => 'file',
    ),
    '7e5489c04e34fcd79e7a3eac197c2a55bcf32a4b' => 
    array (
      0 => 'application\\templates\\cms\\cp\\file\\crumbs.tpl',
      1 => 1418351367,
      2 => 'file',
    ),
    '25552c5198b619963a06e642fbf0fdb2e000de20' => 
    array (
      0 => 'application\\templates\\cms\\cp\\file\\entryList.tpl',
      1 => 1418352044,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15575481c9c2e5d242-79677738',
  'cache_lifetime' => 60,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_548ab111663345_63034992',
  'variables' => 
  array (
    'conf' => 0,
    'f' => 0,
    'sec' => 0,
    'ci' => 0,
  ),
  'has_nocache_code' => false,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_548ab111663345_63034992')) {function content_548ab111663345_63034992($_smarty_tpl) {?>                <!DOCTYPE html>
<html lang="en">
    <head>
        <title>CMS - CKFinder</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="shortcut icon" href="http://local.ci.com/libraries/images/tk1109_green.jpg" type="image/x-icon">
        <meta name="viewport" content="width=device-width; initial-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/ui/themes/base/jquery.ui.all.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/bootstrap-select.min.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/plugin/select2/select2.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/bootstrap-colorpicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/plugin/mCustomSrollbar/jquery.mCustomScrollbar.css"/>
        <link rel="stylesheet" type="text/css" href="http://local.ci.com/libraries/bootstrap/css/cms.css"/>
        
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/ui/js/jquery-ui-1.9.2.custom.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/select2/jquery.select2.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/moment.min.js"></script> 
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/bootstrap-datetimepicker.min.js"></script> 
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/bootstrap-colorpicker.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/bootstrap/js/dateformat.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/datatable/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/validation-engine/jquery.validationEngine.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/validation-engine/jquery.validationEngine-en.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/mCustomSrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/cms/cms.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/plugin/tmpl.js"></script>
        <script type="text/javascript" src="http://local.ci.com/libraries/ckeditor/ckeditor.js" ></script>

        <!--[if IE]>
            <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
        <![endif]-->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>

<div id="iTopMenu" class="transition iTopMenu">
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
                    <span class="hidden-xs hidden-mb">Trường Khương Xuân</span>
                    <i class="fa fa-users"></i>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li><a href="JavaScript:void(0)" onclick="accountdialog()">Account Info</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="http://local.ci.com/cms/auth/logout?state=cms/file"><i class="fa-sign-out"></i>Logout</a></li>
                </ul>
            </li>
        </ul>

    </div>
</header>


</div>
<div class="message-dropdown transition" role="menu" aria-labelledby="dLabel">
    <div class="fill-search-control">
        <div class="pull-top">
            <div class="col-xs-6">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="glyphicon glyphicon-th-list"></i>
                    </span>
                    <select class="selectpicker form-control" id="e_type">
                        <option value="e">Message</option>
                        <option value="">Error</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-6">
                <div class='input-group date' id='datetimepicker'>
                    <input type='text' class="form-control"
                            value="2014/12/12"
                            data-date-format="YYYY/MM/DD"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="iMessage">
        <div class="log-errors"></div>
    </div>
</div>
<div class="mark-body"></div>
<div id="iLeftBar" class="transition iLeftBar" >
    <div class="navigation-head">
        <img class="cms-logo" src="http://local.ci.com/libraries/images/tk1109_green.jpg"/>CMS 1109
    </div>
    <div class="navigation-menu">
                <ul class="nav nav-list">
    	                        	<li class="nav-header">CONTENT PROVIDER</li>
            	            		<li>
            		                                        			            					<div><i class="fa fa-image"></i>Gallery</div>
                			                			            			            		                                    		                                        			            					<div><i class="fa fa-bars"></i>Application</div>
                			                			                				<ul>
                				                                                    					   <li><a href="">Webpage</a></li>
                                                    				                				</ul>
                                        			            		        			</li>
                        	                                	<li class="nav-header">SERVICE OPERATOR</li>
            	            		<li>
            		                                        			            					<div><i class="fa fa-cogs"></i>Settings</div>
                			                			                				<ul>
                				                                                    					   <li><a href="/cms/cp/lang/vp/lawyer">Language</a></li>
                                                    				                                                    					   <li><a href="/cms/file">KCFinder - Image manage</a></li>
                                                    				                				</ul>
                                        			            		                                        			                				<a href="/cms/account"><i class="fa fa-group"></i>User Account</a>
                			                			            			            		        			</li>
                        	            </ul>
                    <ul class="nav nav-list">
    	                        	<li class="nav-header">SUPPER</li>
            	            		<li>
            		                                        			            					<div><i class=""></i>MENU</div>
                			                			                				<ul>
                				                                                    					   <li><a href="/cms/cp/menu/vp/supper">Menu - Supper</a></li>
                                                    				                                                    					   <li><a href="/cms/cp/menu/vp/cms">Menu - CMS</a></li>
                                                    				                				</ul>
                                        			            		        			</li>
                        	            </ul>
        </div>
</div>
<div id="iContain" class="transition iContain">
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

                <div class="crumbs">
    <ul class="breadcrumb"> 
        <li><a href="/cms">CMS</a></li>
        <li><a href="/cms/cp" title="">Content Provider</a></li>
        <li class="active"><span>CKFinder</span></li>
    </ul>
</div>

        <div class="transition iEntryList">
                    
<iframe id="kcfinderiframe" name="kcfinderiframe" 
    src="/libraries/kcfinder/browse.php?lang=en&type=image" 
    style="border: 0;width: 100%;position:absolute;height:100%;top:0;left:0"></iframe>

            </div>
</div>
<div id="iFoot" class="transition iFoot">
    Page rendered in <strong>{elapsed_time}</strong> seconds
</div>
<iframe id="integration_asynchronous" name="integration_asynchronous" style="width: 0;height: 0;border: 0;position: absolute"></iframe><?php }} ?>
