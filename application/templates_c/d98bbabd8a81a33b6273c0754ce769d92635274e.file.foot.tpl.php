<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:10:37
         compiled from "application/templates/realestate/inc/foot.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7123536445c6aa0bd70dbe2-60198013%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd98bbabd8a81a33b6273c0754ce769d92635274e' => 
    array (
      0 => 'application/templates/realestate/inc/foot.tpl',
      1 => 1437445214,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7123536445c6aa0bd70dbe2-60198013',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'languages' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa0bd71b9e7_13656183',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa0bd71b9e7_13656183')) {function content_5c6aa0bd71b9e7_13656183($_smarty_tpl) {?><div class="foot">
    <div class="container pull-top">
        <div class="col-sm-8">
            <div class="row">
                <div class="col-mb-4 pull-top">
                    <?php if ($_smarty_tpl->tpl_vars['lang']->value=='en') {?>
                    <img class="foot-logo" src="/assets/nha-dat/img/logo-en.png"/>
                    <?php } else { ?>
                    <img class="foot-logo" src="/assets/nha-dat/img/logo.png"/>
                    <?php }?>
                </div>
                <div class="col-mb-8 pull-top">
                    <div class="foot-menu">
                        <a href="/gioi-thieu/chinh-sach-chat-luong"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_quality_policy'])===null||$tmp==='' ? 'CHÍNH SÁCH CHẤT LƯỢNG' : $tmp);?>
</a>
                        <a href="/gioi-thieu/lien-he"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_Contact'])===null||$tmp==='' ? 'Liên hệ' : $tmp);?>
</a>
                        <a href="/lien-he"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_advisory'])===null||$tmp==='' ? 'GIẢI ĐÁP THẮC MẮC' : $tmp);?>
</a>
                    </div>
                    <div class="pull-top">
                        <?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_addressStr'])===null||$tmp==='' ? 'Địa chỉ : 119 Đường Số 9, Phường 16, Quận Gò Vấp' : $tmp);?>

                    </div>
                    <div class="pull-bottom">
                        <?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_telStr'])===null||$tmp==='' ? 'Tel : (+84.8) 39168714 - Email : toanloico@yahoo.com.vn' : $tmp);?>

                        
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4 pull-top">
            <div class="row">
                <div class="pull-bottom col-mb-4 col-sm-12 ">
                    FAMILY SITE 
                    <label class="select-map dropup">
                        <span data-toggle="dropdown"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_select_site'])===null||$tmp==='' ? 'Chọn các site khác' : $tmp);?>
 <i class="fa fa-caret-right"></i></span>
                        <ul class="dropdown-menu" role="menu">
                            <li ><a href="/" ><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_home'])===null||$tmp==='' ? 'Trang chủ' : $tmp);?>
</a></li>
                            <li ><a href="/gioi-thieu" ><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_about'])===null||$tmp==='' ? 'Giới thiệu' : $tmp);?>
</a></li>
                            <li ><a href="/cong-trinh" ><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_buildings-project'])===null||$tmp==='' ? 'Công trình - dự án' : $tmp);?>
</a></li>
                            <li ><a href="/noi-that" ><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_interior-design'])===null||$tmp==='' ? 'Thiết kế nội thất' : $tmp);?>
</a></li>
                            <li ><a href="/tin-tuc" ><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_news'])===null||$tmp==='' ? 'Tin tức' : $tmp);?>
</a></li>
                        </ul>
                    </label>
                </div>
                <div class="pull-bottom col-mb-8 col-sm-12">
                    <?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_copyrightStr'])===null||$tmp==='' ? 'COPYRIGHT &copy; 2015 Công Ty TNHH Toàn Lợi.' : $tmp);?>

                </div>
            </div>
            
        </div>
    </div>
</div>
<?php echo '<script'; ?>
 type="text/javascript" src="libraries/plugin/validation-engine/jquery.validationEngine.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript" src="libraries/plugin/validation-engine/jquery.validationEngine-en.js"><?php echo '</script'; ?>
><?php }} ?>
