<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 11:49:36
         compiled from "application\templates\cms\cp\cate\editorPanel2.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7716517045c6a39604f6a70-63822029%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a4e42786f1deef5e0b563ef34e9e63438edd78e1' => 
    array (
      0 => 'application\\templates\\cms\\cp\\cate\\editorPanel2.tpl',
      1 => 1433860053,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7716517045c6a39604f6a70-63822029',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'tplConfig' => 1,
    'item' => 1,
    'type' => 1,
    'cates' => 1,
    'c' => 1,
    'level' => 1,
    'o' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a39606d98e8_02092985',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a39606d98e8_02092985')) {function content_5c6a39606d98e8_02092985($_smarty_tpl) {?>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Category</h4>
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
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->cat_id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="cat_type" id="cat_type" 
                    value="<?php echo (($tmp = @(($tmp = @$_smarty_tpl->tpl_vars['item']->value->cat_type)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['type']->value : $tmp))===null||$tmp==='' ? '' : $tmp);?>
"/>
                <div class="row half">
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>Title :</div>
                            <input type="text" 
                                rows="1"
                                onblur="AliasTo('#entryForm input[name=cat_title]','#entryForm input[name=cat_alias]')" 
                                class="form-control validate[required,minSize[4],maxSize[255]]"
                                name="cat_title" 
                                value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->cat_title, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                        </div>
                    </div>
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>Alias :</div>
                            <input type="text" 
                                rows="1"
                                class="form-control validate[required,minSize[4],maxSize[255]]"
                                name="cat_alias" 
                                value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->cat_alias, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                        </div>
                    </div>
                </div>
                <div class="row half">
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>Image :</div>
                            <div class="input-append">
                                <input type="text" 
                                    <?php if ($_smarty_tpl->tpl_vars['item']->value->cat_image) {?>title="<img src='<?php echo $_smarty_tpl->tpl_vars['item']->value->cat_image;?>
' style='max-height:80px;max-width:120px'/>"<?php }?>
                                    class="form-control tool-tip" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->cat_image)===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="cat_image" id="cat_image"
                                    >
                                <span class="add-on " onclick="BrowseServer('#cat_image')" title="Choose Image">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>Thumb :</div>
                            <div class="input-append">
                                <input type="text" 
                                    <?php if ($_smarty_tpl->tpl_vars['item']->value->cat_image) {?>title="<img src='<?php echo $_smarty_tpl->tpl_vars['item']->value->cat_thumb;?>
' style='max-height:80px;max-width:120px'/>"<?php }?>
                                    class="form-control tool-tip" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->cat_thumb)===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="cat_thumb" id="cat_thumb"
                                    >
                                <span class="add-on" onclick="BrowseServer('#cat_thumb')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row half">
                    <div class="col-mb-6">
                        <div class="pull-top control-group">
                            <div>Parent :(*)</div>
                            <div class="row-fluid">
                                <select name="cat_parent" class="form-control selectpicker"
                                    data-live-search="true"
                                    data-size="10"
                                    >
                                    <option value="0" data-title="[ Root ]" data-level="-1">[ Root ]</option>
                                    <?php if (isset($_smarty_tpl->tpl_vars["level"])) {$_smarty_tpl->tpl_vars["level"] = clone $_smarty_tpl->tpl_vars["level"];
$_smarty_tpl->tpl_vars["level"]->value = -1; $_smarty_tpl->tpl_vars["level"]->nocache = true; $_smarty_tpl->tpl_vars["level"]->scope = 0;
} else $_smarty_tpl->tpl_vars["level"] = new Smarty_variable(-1, true, 0);?>
                                    <?php  $_smarty_tpl->tpl_vars['c'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['c']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['cates']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['c']->key => $_smarty_tpl->tpl_vars['c']->value) {
$_smarty_tpl->tpl_vars['c']->_loop = true;
?>
                                        <?php if ($_smarty_tpl->tpl_vars['c']->value->cat_id==$_smarty_tpl->tpl_vars['item']->value->cat_id) {?>
                                            <?php if (isset($_smarty_tpl->tpl_vars["level"])) {$_smarty_tpl->tpl_vars["level"] = clone $_smarty_tpl->tpl_vars["level"];
$_smarty_tpl->tpl_vars["level"]->value = $_smarty_tpl->tpl_vars['c']->value->cat_level; $_smarty_tpl->tpl_vars["level"]->nocache = true; $_smarty_tpl->tpl_vars["level"]->scope = 0;
} else $_smarty_tpl->tpl_vars["level"] = new Smarty_variable($_smarty_tpl->tpl_vars['c']->value->cat_level, true, 0);?>
                                        <?php }?>
                                        <?php if ($_smarty_tpl->tpl_vars['level']->value!=-1&&$_smarty_tpl->tpl_vars['c']->value->cat_level<=$_smarty_tpl->tpl_vars['level']->value&&$_smarty_tpl->tpl_vars['c']->value->cat_id!=$_smarty_tpl->tpl_vars['item']->value->cat_id) {?>
                                            <?php if (isset($_smarty_tpl->tpl_vars["level"])) {$_smarty_tpl->tpl_vars["level"] = clone $_smarty_tpl->tpl_vars["level"];
$_smarty_tpl->tpl_vars["level"]->value = -1; $_smarty_tpl->tpl_vars["level"]->nocache = true; $_smarty_tpl->tpl_vars["level"]->scope = 0;
} else $_smarty_tpl->tpl_vars["level"] = new Smarty_variable(-1, true, 0);?>
                                        <?php }?>
                                        <option 
                                            data-content="<span style='padding-left: <?php echo $_smarty_tpl->tpl_vars['c']->value->cat_level*20+20;?>
px;'><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->cat_title, ENT_QUOTES, 'UTF-8', true);?>
</span>"
                                            <?php if ($_smarty_tpl->tpl_vars['c']->value->cat_id==$_smarty_tpl->tpl_vars['item']->value->cat_parent) {?>selected="1"<?php }?>
                                            <?php if ($_smarty_tpl->tpl_vars['level']->value!=-1&&$_smarty_tpl->tpl_vars['level']->value<$_smarty_tpl->tpl_vars['c']->value->cat_level) {?>disabled=1<?php }?>
                                            <?php if ($_smarty_tpl->tpl_vars['c']->value->cat_id==$_smarty_tpl->tpl_vars['item']->value->cat_id) {?>disabled=1<?php }?>
                                            value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->cat_id)===null||$tmp==='' ? '' : $tmp);?>
">
                                                <?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->cat_title)===null||$tmp==='' ? '' : $tmp);?>

                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-3 half">
                        <div class="control-group pull-top">
                            <div>Status :</div>
                            <div style="padding-top:5px">
                                <span class="circleRad">
                                    <input id="cat_status1" 
                                        name="cat_status" type="radio" 
                                        <?php if ($_smarty_tpl->tpl_vars['o']->value->cat_status!=(($tmp = @'false')===null||$tmp==='' ? '' : $tmp)) {?>checked<?php }?>
                                        value="true">
                                    <label for="cat_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="cat_status2" name="cat_status" type="radio" value="false"
                                        <?php if ($_smarty_tpl->tpl_vars['o']->value->cat_status==(($tmp = @'false')===null||$tmp==='' ? '' : $tmp)) {?>checked<?php }?>
                                    >
                                    <label for="cat_status2">Disable&nbsp;&nbsp;</label>
                                </span>

                            </div>
                        </div>
                    </div>
                    <div class="col-mb-3 half">
                        <div class="control-group pull-top">
                            <div>Position :</div>
                            <input type="number" 
                                    class="form-control" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->cat_position)===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="cat_position"
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
                            name="cat_desc"
                            data-putto=".error_desc" ><?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->cat_desc))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                            
                    <div class="erb error_desc"></div>
                </div>
<!--                <div class="">
                    <button style="width: 100%" class="btn btn-default" type="button" onclick="sendquestion();">Gửi</button>
                </div>-->
                <div id="sendquestion-message"></div>
            </form>
        </div>
<!--        <div class="modal-footer">
            <button class="btn btn-primary" onclick="toggleContent()">Done</button>
            <button class="btn btn-default" onclick="language.onCancel()">Cancel</button>
            <div class="base_loading modal-loading" style="display: none;"></div>
        </div>-->
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
