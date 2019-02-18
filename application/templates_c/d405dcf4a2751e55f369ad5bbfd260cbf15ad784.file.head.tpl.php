<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:10:37
         compiled from "application/templates/realestate/inc/head.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6570130255c6aa0bd6facf5-57663212%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd405dcf4a2751e55f369ad5bbfd260cbf15ad784' => 
    array (
      0 => 'application/templates/realestate/inc/head.tpl',
      1 => 1437445184,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6570130255c6aa0bd6facf5-57663212',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'languages' => 0,
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa0bd70ae93_63103486',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa0bd70ae93_63103486')) {function content_5c6aa0bd70ae93_63103486($_smarty_tpl) {?><header id="navbar" class="navbar" role="banner">
    <div class="container">
        <div style="position:absolute;top:4px;left:10px;">
            <a href="http://en.toanloi.vn"><img src="https://az545221.vo.msecnd.net/skype-faq-media/faq_content/skype/flags/gb_16x16.png"></a>
            &nbsp;&nbsp;
            <a href="http://vi.toanloi.vn"><img src="https://az545221.vo.msecnd.net/skype-faq-media/faq_content/skype/flags/vn_16x16.png"></a>
        </div>
        <div class="">
            <div class="pull-right top-menu">
                <!-- <a class="btn btn-default btn-sm">Trang chủ</a> -->
                <div class="acc-info" <?php if (!(($tmp = @$_SESSION['accountInfo'])===null||$tmp==='' ? null : $tmp)) {?> style="display:none" <?php }?>>
                    <a href="#" data-toggle="dropdown" class="btn btn-default btn-sm">
                        <span><?php echo $_SESSION['accountInfo']->FirstName;?>
 <?php echo $_SESSION['accountInfo']->LastName;?>
 </span>
                        <i class="fa fa-caret-right"></i>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_account'])===null||$tmp==='' ? 'Tài khoản' : $tmp);?>
</a></li>
                        <li><a href="JavaScript:logoutfn()"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_logout'])===null||$tmp==='' ? 'Thoát' : $tmp);?>
</a></li>
                    </ul>
                </div>
                <div class="sigin-link" <?php if ((($tmp = @$_SESSION['accountInfo'])===null||$tmp==='' ? null : $tmp)) {?> style="display:none" <?php }?>>
                    <a href="JavaScript:dialog('login')" class="btn btn-default btn-sm"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_login'])===null||$tmp==='' ? 'Đăng nhập' : $tmp);?>
</a>
                    <a href="JavaScript:dialog('register')" class="btn btn-default btn-sm"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_register'])===null||$tmp==='' ? 'Tham gia' : $tmp);?>
</a>
                </div>
                <a href="JavaScript:dialog('contactus')" class="btn btn-default btn-sm"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_advisory'])===null||$tmp==='' ? 'Tư vấn' : $tmp);?>
</a>
                <!--<ul>
                    <li><a class="btn btn-default btn-sm">ngôn ngữ</a>
                        <ul>
                            <li>tiếng anh</li>
                            <li>tiếng việt</li>
                        </ul>
                    </li>
                </ul>-->
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="navbar-header">
            <a href="#" class="navbar-brand">
                <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                <img src="/assets/nha-dat/img/logo-en.png"/>
                <?php } else { ?>
                <img src="/assets/nha-dat/img/logo.png"/>
                <?php }?>
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

            <ul class="nav navbar-nav pull-right">
                <li><a href='/'><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_home'])===null||$tmp==='' ? 'Trang chủ' : $tmp);?>
</a></li>
                <li>
                    <a href="/gioi-thieu" ><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_about'])===null||$tmp==='' ? 'Giới thiệu' : $tmp);?>
</a>
                    <!-- <a href="#" data-toggle="dropdown">Courses</a>
                    <ul class="dropdown-menu">
                        <li><a href='/product/xgard'>Park</a></li>
                        <li><a href='/product/red-shied'>Street</a></li>
                        <li><a href='/product/green-shied'>Arena</a></li>
                        <li><a href='/product/green-shied'>Green Shied</a></li>
                    </ul> -->
                </li>
                <li><a href="/cong-trinh"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_buildings-project'])===null||$tmp==='' ? 'Công trình - dự án' : $tmp);?>
</a></li>
                <li><a href="/noi-that"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_interior-design'])===null||$tmp==='' ? 'Thiết kế nội thất' : $tmp);?>
</a></li>
                <li><a href="/lien-he"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_Contact'])===null||$tmp==='' ? 'Liên hệ' : $tmp);?>
</a></li>
            </ul>
        </nav>
    </div>
</header><?php }} ?>
