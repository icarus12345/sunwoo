<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:44
         compiled from "application\templates\cms\inc\meta.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2276797925bed39048b47f2-45273142%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c94f819992c45f7ce8daeede50d35806d27d9c74' => 
    array (
      0 => 'application\\templates\\cms\\inc\\meta.tpl',
      1 => 1435113115,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2276797925bed39048b47f2-45273142',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed390492df70_96341926',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed390492df70_96341926')) {function content_5bed390492df70_96341926($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <title><?php echo $_smarty_tpl->getConfigVariable('pageTitle');?>
</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="shortcut icon" href="<?php echo base_url('libraries/images/tk1109_green.jpg');?>
" type="image/x-icon">
        <meta name="viewport" content="width=device-width; initial-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/bootstrap/css/bootstrap.css');?>
"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/ui/themes/base/jquery.ui.all.css');?>
"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/bootstrap/css/bootstrap-select.min.css');?>
"/>
<!--        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/plugin/select2/select2.css');?>
"/>-->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/bootstrap/css/font-awesome.css');?>
">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/bootstrap/css/bootstrap-datetimepicker.min.css');?>
"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/bootstrap/css/bootstrap-colorpicker.min.css');?>
"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/plugin/mCustomSrollbar/jquery.mCustomScrollbar.css');?>
"/>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('libraries/bootstrap/css/cms.css');?>
"/>
        <link href="<?php echo base_url('libraries/plugin/accordion-menu/jquery-accordion-menu.css');?>
" rel="stylesheet">
        <link href="<?php echo base_url('libraries/plugin/tokeninput/token-input.css');?>
" rel="stylesheet">


        

        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/bootstrap/js/jquery-1.9.1.min.js');?>
"><?php echo '</script'; ?>
>

        
        
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/ui/js/jquery-ui-1.9.2.custom.min.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
>
            $.widget.bridge('uitooltip', $.ui.tooltip);
        <?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/bootstrap/js/bootstrap.min.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/bootstrap/js/bootstrap-select.min.js');?>
"><?php echo '</script'; ?>
>
<!--        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/plugin/select2/jquery.select2.min.js');?>
"><?php echo '</script'; ?>
>-->
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/bootstrap/js/moment.min.js');?>
"><?php echo '</script'; ?>
> 
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/bootstrap/js/bootstrap-datetimepicker.min.js');?>
"><?php echo '</script'; ?>
> 
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/bootstrap/js/bootstrap-colorpicker.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/bootstrap/js/dateformat.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/plugin/datatable/jquery.dataTables.min.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/plugin/validation-engine/jquery.validationEngine.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/plugin/validation-engine/jquery.validationEngine-en.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/plugin/mCustomSrollbar/jquery.mCustomScrollbar.concat.min.js');?>
"><?php echo '</script'; ?>
>
        <!-- // <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/plugin/accordion-menu/jquery-accordion-menu.js');?>
"><?php echo '</script'; ?>
> -->
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/cms/cms.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/plugin/tmpl.js');?>
"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/ckeditor/ckeditor.js');?>
" ><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/plugin/tokeninput/jquery.tokeninput.js');?>
" ><?php echo '</script'; ?>
>

        <!--[if IE]>
            <?php echo '<script'; ?>
 src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"><?php echo '</script'; ?>
>
        <![endif]-->
        <!--[if lt IE 9]>
            <?php echo '<script'; ?>
 src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"><?php echo '</script'; ?>
>
            <?php echo '<script'; ?>
 src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"><?php echo '</script'; ?>
>
        <![endif]-->
        <?php echo '<script'; ?>
 type="text/javascript">
        $('document').ready(function(){
            <?php if ($_GET['navi']) {?>
                setTimeout(function(){
                    $('li[data-id=<?php echo $_GET['navi'];?>
]>a').click()
                },1000);
            <?php }?>
        });
        <?php echo '</script'; ?>
>
    </head>
    <body>
<?php }} ?>
