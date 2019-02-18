<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 17:19:26
         compiled from "application\templates\cms\cp\product\entryList.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12479344265bed3910c23f32-95076466%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b7d69ef264f9a159c3da8abbe777737e50012419' => 
    array (
      0 => 'application\\templates\\cms\\cp\\product\\entryList.tpl',
      1 => 1550485156,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12479344265bed3910c23f32-95076466',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed3910c798e1_59024159',
  'variables' => 
  array (
    'tplConfig' => 1,
    'unit' => 1,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed3910c798e1_59024159')) {function content_5bed3910c798e1_59024159($_smarty_tpl) {?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/cp/product/rowTmpl.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/cp/product/actScript.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/cp/product/actOptBasicScript.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4><?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['title'];?>
</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,"a")!==false) {?>
                <li><a href="JavaScript:" title="Add new entry" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onAddItem()"><i class="fa-plus"></i></a></li>
                <?php }?>
                <li><a href="JavaScript:" title="Refresh entrys" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onRefresh()"><i class="fa-rotate-left"></i></a></li>
                <li><a href="JavaScript:" title="Setting" ><i class="fa-cogs"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <div>
                <span class="squaredThree">
                    <input type="checkbox"  
                        id="squaredThreeToggleThumb" 
                        name="squaredThreeToggleThumb"
                        onchange="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.toggleImage();" 
                        >
                    <label for="squaredThreeToggleThumb"></label>
                </span>
                Show/Hide Thumbnail
            </div>
            <div class="table-overflow">
                <table id="entryDatatable" class="no-table" style="width: 100%">
                    <thead style="display: none;">
                        <tr>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
            
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-one">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Add new entry" 
                <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,"a")!==false) {?>
                onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onAddItem()"
                <?php }?>
                >
                <i class="fa-plus"></i>
            </a>
        </div>
    </li>
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Refresh entrys" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onRefresh()">
                <i class="fa fa-rotate-left"></i>
            </a>
        </div>
    </li>
</ul>
<?php }} ?>
