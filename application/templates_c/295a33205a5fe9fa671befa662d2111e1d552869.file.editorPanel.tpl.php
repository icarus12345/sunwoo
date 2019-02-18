<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 12:27:46
         compiled from "application\templates\cms\cp\menu\editorPanel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16493666965c6a4252d671f5-99685927%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '295a33205a5fe9fa671befa662d2111e1d552869' => 
    array (
      0 => 'application\\templates\\cms\\cp\\menu\\editorPanel.tpl',
      1 => 1433860055,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16493666965c6a4252d671f5-99685927',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'tplConfig' => 1,
    'item' => 1,
    'type' => 1,
    'menus' => 1,
    'c' => 1,
    'level' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a4252f2cda9_55775221',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a4252f2cda9_55775221')) {function content_5c6a4252f2cda9_55775221($_smarty_tpl) {?>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Menu</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->menu_id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="menu_type" id="menu_type" 
                       value="<?php echo (($tmp = @(($tmp = @$_smarty_tpl->tpl_vars['item']->value->menu_type)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['type']->value : $tmp))===null||$tmp==='' ? '' : $tmp);?>
"/>
                <div>Title :</div>
                <div class="control-group">
                    <input type="text" class="form-control validate[required]" 
                           placeholder="Title"
                           name="menu_title"
                           value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->menu_title))===null||$tmp==='' ? '' : $tmp);?>
"
                           data-putto=".error-title"/>
                    <div class="erb error-title"></div>
                </div>
                <div class="pull-top control-group">
                    <div>Parent :</div>
                    <div class="row-fluid">
                        <select name="menu_parent" class="form-control selectpicker"
                                data-size="6"
                                >
                            <option value="0">[ Root ]</option>
                            <?php if (isset($_smarty_tpl->tpl_vars["level"])) {$_smarty_tpl->tpl_vars["level"] = clone $_smarty_tpl->tpl_vars["level"];
$_smarty_tpl->tpl_vars["level"]->value = -1; $_smarty_tpl->tpl_vars["level"]->nocache = true; $_smarty_tpl->tpl_vars["level"]->scope = 0;
} else $_smarty_tpl->tpl_vars["level"] = new Smarty_variable(-1, true, 0);?>
                            <?php  $_smarty_tpl->tpl_vars['c'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['c']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['menus']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['c']->key => $_smarty_tpl->tpl_vars['c']->value) {
$_smarty_tpl->tpl_vars['c']->_loop = true;
?>
                                <?php if ($_smarty_tpl->tpl_vars['c']->value->menu_id==$_smarty_tpl->tpl_vars['item']->value->menu_id) {?>
                                    <?php if (isset($_smarty_tpl->tpl_vars["level"])) {$_smarty_tpl->tpl_vars["level"] = clone $_smarty_tpl->tpl_vars["level"];
$_smarty_tpl->tpl_vars["level"]->value = $_smarty_tpl->tpl_vars['c']->value->menu_level; $_smarty_tpl->tpl_vars["level"]->nocache = true; $_smarty_tpl->tpl_vars["level"]->scope = 0;
} else $_smarty_tpl->tpl_vars["level"] = new Smarty_variable($_smarty_tpl->tpl_vars['c']->value->menu_level, true, 0);?>
                                <?php }?>
                                <?php if ($_smarty_tpl->tpl_vars['level']->value!=-1&&$_smarty_tpl->tpl_vars['c']->value->menu_level<=$_smarty_tpl->tpl_vars['level']->value&&$_smarty_tpl->tpl_vars['c']->value->menu_id!=$_smarty_tpl->tpl_vars['item']->value->menu_id) {?>
                                    <?php if (isset($_smarty_tpl->tpl_vars["level"])) {$_smarty_tpl->tpl_vars["level"] = clone $_smarty_tpl->tpl_vars["level"];
$_smarty_tpl->tpl_vars["level"]->value = -1; $_smarty_tpl->tpl_vars["level"]->nocache = true; $_smarty_tpl->tpl_vars["level"]->scope = 0;
} else $_smarty_tpl->tpl_vars["level"] = new Smarty_variable(-1, true, 0);?>
                                <?php }?>
                                <option 
                                    data-content="<span style='padding-left: <?php echo $_smarty_tpl->tpl_vars['c']->value->menu_level*20+20;?>
px;'><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->menu_title, ENT_QUOTES, 'UTF-8', true);?>
</span>"
                                    <?php if ($_smarty_tpl->tpl_vars['c']->value->menu_id==$_smarty_tpl->tpl_vars['item']->value->menu_parent) {?>selected="1"<?php }?>
                                    <?php if ($_smarty_tpl->tpl_vars['level']->value!=-1&&$_smarty_tpl->tpl_vars['level']->value<$_smarty_tpl->tpl_vars['c']->value->menu_level) {?>disabled=1<?php }?>
                                    <?php if ($_smarty_tpl->tpl_vars['c']->value->menu_id==$_smarty_tpl->tpl_vars['item']->value->menu_id) {?>disabled=1<?php }?>
                                    value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->menu_id)===null||$tmp==='' ? '' : $tmp);?>
"
                                    >
                                    <?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->menu_display)===null||$tmp==='' ? '' : $tmp);?>

                                </option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Link :</div>
                            <input type="text" class="form-control" 
                                placeholder="Link"
                                name="menu_link"
                                value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->menu_link))===null||$tmp==='' ? '' : $tmp);?>
"
                                />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Class :</div>
                            <input type="text" class="form-control" 
                                placeholder="Class"
                                name="menu_class"
                                value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->menu_class))===null||$tmp==='' ? '' : $tmp);?>
"
                                />
                        </div>
                    </div>   
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Image :</div>
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->menu_thumb)===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="menu_thumb" id="menu_thumb"
                                    >
                                <span class="add-on" onclick="BrowseServer('#menu_thumb')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Position :</div>
                            <input type="number" 
                                class="form-control" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->menu_position)===null||$tmp==='' ? '' : $tmp);?>
" 
                                name="menu_position"
                                >
                        </div>
                    </div>
                </div>
                <div class="control-group pull-top">
                    <div>
                        Desc :
                    </div>
                    <textarea class="form-control de-desc" 
                            rows="3"
                            name="menu_desc"
                            data-putto=".error_desc" ><?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->menu_desc))===null||$tmp==='' ? '' : $tmp);?>
</textarea>

                    <div class="erb error_desc"></div>
                </div>
                <div id="sendquestion-message"></div>
            </form>
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-second">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Save" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onSave()">
                <i class="fa-save fa"></i>
            </a>
        </div>
    </li>
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Back to entry list" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onCancel()">
                <i class="fa fa-reply-all"></i>
            </a>
        </div>
    </li>
</ul>
<?php }} ?>
