<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:15:30
         compiled from "application\templates\cms\account\entryList.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2158666815bed3932b69073-11919326%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'da5989779ffb275d190fdd1f61d8cb5a4012950f' => 
    array (
      0 => 'application\\templates\\cms\\account\\entryList.tpl',
      1 => 1433860001,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2158666815bed3932b69073-11919326',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'type' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed3932bc2288_17180186',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed3932bc2288_17180186')) {function content_5bed3932bc2288_17180186($_smarty_tpl) {?><?php echo '<script'; ?>
 type="text/javascript" src="<?php echo base_url('libraries/cms/account.js');?>
"><?php echo '</script'; ?>
>

<?php echo '<script'; ?>
 type="text/javascript">
    account_config.entryType = "<?php echo (($tmp = @$_smarty_tpl->tpl_vars['type']->value)===null||$tmp==='' ? '' : $tmp);?>
";
<?php echo '</script'; ?>
>
<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/account/rowTmpl.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>User Account</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Add new entry" onclick="account.onAddItem()"><i class="fa-plus"></i></a></li>
                <li><a href="JavaScript:" title="Refresh entrys" onclick="account.onRefresh()"><i class="fa-rotate-left"></i></a></li>
                <li><a href="JavaScript:" title="Setting" ><i class="fa-cogs"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <div class="table-overflow">
                <table id="entryDatatable" class="no-table" style="width: 100%">
                    <thead style="display: none;">
                        <tr>
                            <th>Account</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <div class="clear"></div>
            </div>
            <ul class="round-buttons">
                <li>
                    <div class="depth">
                        <a  href="JavaScript:" title="Add new entry" onclick="account.onAddItem()">
                            <i class="fa-plus"></i>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="depth">
                        <a  href="JavaScript:" title="Refresh entrys" onclick="account.onRefresh()">
                            <i class="fa fa-rotate-left"></i>
                        </a>
                    </div>
                </li>
            </ul>
            <div class="bs-callout bs-callout-danger">
                <h4>CSS3 Browser support</h4>
                <p>
                    <img src="http://www.w3schools.com/images/compatible_ie2020.gif"/> IE 9+, 
                    <img src="http://www.w3schools.com/images/compatible_firefox2020.gif"/> Firefox, 
                    <img src="http://www.w3schools.com/images/compatible_chrome2020.gif"/> Chrome, 
                    <img src="http://www.w3schools.com/images/precompatible_safari5920.gif"/> Safari
                </p>
            </div>
        </div>
    </div>
</div>
<?php }} ?>
