<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:44
         compiled from "application\templates\cms\widget\accordionMenu.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5330750615bed3904cde279-95601051%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3f9b1b4f191f637208123c547894079aca77be5e' => 
    array (
      0 => 'application\\templates\\cms\\widget\\accordionMenu.tpl',
      1 => 1433860006,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5330750615bed3904cde279-95601051',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed3904d069f8_61694666',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed3904d069f8_61694666')) {function content_5bed3904d069f8_61694666($_smarty_tpl) {?><div id="jquery-accordion-menu" class="jquery-accordion-menu -default -blue -red green -white -black">
    <!-- <div class="jquery-accordion-menu-header"> Header </div> -->
    <!-- <ul>
        <li class="active">
            <a href="#"> <i class="fa fa-home"> </i> Home </a>
        </li>
        <li>
            <a href="#"> <i class="fa fa-glass"> </i> Events </a>
        </li>
        <li>
            <a href="#"> <i class="fa fa-file-image-o"> </i> Gallery </a> <span class="jquery-accordion-menu-label"> 12 </span> </li>
        <li>
            <a href="#"> <i class="fa fa-cog"> </i> Services </a>
            <ul class="submenu">
                <li> <a href="#"> Web Design </a> </li>
                <li> <a href="#"> Hosting </a> </li>
                <li> <a href="#"> Design </a>
                    <ul class="submenu">
                        <li> <a href="#"> Graphics </a> </li>
                        <li> <a href="#"> Vectors </a> </li>
                        <li> <a href="#"> Photoshop </a> </li>
                        <li> <a href="#"> Fonts </a> </li>
                    </ul>
                </li>
                <li> <a href="#"> Consulting </a> </li>
            </ul>
        </li>
        <li>
            <a href="#"> <i class="fa fa-newspaper-o"> </i> News </a>
        </li>
        <li>
            <a href="#"> <i class="fa fa-suitcase"> </i> Portfolio </a>
            <ul class="submenu">
                <li> <a href="#"> Web Design </a> </li>
                <li> <a href="#"> Graphics </a> <span class="jquery-accordion-menu-label"> 10 </span> </li>
                <li> <a href="#"> Photoshop </a> </li>
                <li> <a href="#"> Programming </a> </li>
            </ul>
        </li>
        <li>
            <a href="#"> <i class="fa fa-user"> </i> About </a>
        </li>
        <li>
            <a href="#"> <i class="fa fa-envelope"> </i> Contact </a>
        </li>
    </ul> -->
    <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/widget/navimenu.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

    <?php if ($_SESSION['auth']['user']->ause_authority=='Administrator') {?>
        <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/widget/navimenuAdmin.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

    <?php }?>
    <!-- <div class="jquery-accordion-menu-footer"> Footer </div> -->
</div><?php }} ?>
