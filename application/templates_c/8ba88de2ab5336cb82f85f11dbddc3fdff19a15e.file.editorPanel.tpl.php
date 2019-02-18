<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 14:35:00
         compiled from "application\templates\cms\cp\head\editorPanel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19574947175c6a514d8d4332-86139812%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8ba88de2ab5336cb82f85f11dbddc3fdff19a15e' => 
    array (
      0 => 'application\\templates\\cms\\cp\\head\\editorPanel.tpl',
      1 => 1550475297,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19574947175c6a514d8d4332-86139812',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a514da0cba0_75979267',
  'variables' => 
  array (
    'tplConfig' => 1,
    'item' => 1,
    'type' => 1,
    'langs' => 1,
    'f' => 1,
    'la' => 1,
    'attr' => 1,
    'o' => 1,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a514da0cba0_75979267')) {function content_5c6a514da0cba0_75979267($_smarty_tpl) {?>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Head</h4>
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
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->_id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="_type" id="_type" 
                    value="<?php echo (($tmp = @(($tmp = @$_smarty_tpl->tpl_vars['item']->value->_type)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['type']->value : $tmp))===null||$tmp==='' ? '' : $tmp);?>
"/>

                <div class="lang-tabs default" style="z-index: 11;position: relative;margin-left: 10px">
                    <ul class="nav-tabs">
                        <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = "active"; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable("active", true, 0);?>
                        <?php  $_smarty_tpl->tpl_vars['la'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['la']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['langs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['la']->key => $_smarty_tpl->tpl_vars['la']->value) {
$_smarty_tpl->tpl_vars['la']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['la']->key;
?>
                            <li class="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['f']->value)===null||$tmp==='' ? '' : $tmp);?>
">
                                <a  title="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"
                                    href="#tab_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"  
                                    data-toggle="tab" 
                                    >
                                        <?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>

                                </a>
                            </li>
                            <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = ''; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable('', true, 0);?>
                        <?php }
if (!$_smarty_tpl->tpl_vars['la']->_loop) {
?>
                            
                        <?php } ?>
                    </ul>
                </div>
                <div class="controls tab-content" style="border-top: 1px solid #ddd;float: left;width: 100%;">
                    <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = "active"; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable("active", true, 0);?>
                    <?php  $_smarty_tpl->tpl_vars['la'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['la']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['langs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['la']->key => $_smarty_tpl->tpl_vars['la']->value) {
$_smarty_tpl->tpl_vars['la']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['la']->key;
?>
                        
                        <div id="tab_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" class="tab-pane <?php echo (($tmp = @$_smarty_tpl->tpl_vars['f']->value)===null||$tmp==='' ? '' : $tmp);?>
">
                            <div class="row half">
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Title :(*)</div>
                                        <?php if (isset($_smarty_tpl->tpl_vars['attr'])) {$_smarty_tpl->tpl_vars['attr'] = clone $_smarty_tpl->tpl_vars['attr'];
$_smarty_tpl->tpl_vars['attr']->value = ('_title_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('_title_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>
                                        <input type="text" 
                                            class="form-control validate[required,minSize[2],maxSize[255]]"
                                            onblur="AliasTo('#entryForm input[name=_title_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
]','#entryForm input[name=_alias_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
]')" 
                                            name="_title_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                            data-lang="<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"
                                            placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"
                                            value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->{$_smarty_tpl->tpl_vars['attr']->value}))===null||$tmp==='' ? '' : $tmp);?>
"
                                            />
                                        
                                    </div>
                                </div>
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Alias :</div>
                                        <?php if (isset($_smarty_tpl->tpl_vars['attr'])) {$_smarty_tpl->tpl_vars['attr'] = clone $_smarty_tpl->tpl_vars['attr'];
$_smarty_tpl->tpl_vars['attr']->value = ('_alias_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('_alias_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>
                                        <input type="text" 
                                            class="form-control validate[required,minSize[2],maxSize[255]]"
                                            name="_alias_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                            data-lang="<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"
                                            placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"
                                            value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->{$_smarty_tpl->tpl_vars['attr']->value}))===null||$tmp==='' ? '' : $tmp);?>
"
                                            />
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="control-group pull-top">
                                <div>Desc :(*)</div>
                                <?php if (isset($_smarty_tpl->tpl_vars['attr'])) {$_smarty_tpl->tpl_vars['attr'] = clone $_smarty_tpl->tpl_vars['attr'];
$_smarty_tpl->tpl_vars['attr']->value = ('_desc_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('_desc_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>
                                <textarea class="form-control validate[required]" 
                                    name="_desc_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                    rows="10" 
                                    data-lang="<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"
                                    placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"><?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->{$_smarty_tpl->tpl_vars['attr']->value}))===null||$tmp==='' ? '' : $tmp);?>
</textarea>

                     
                                
                                        
                                <div class="erb error_desc"></div>
                            </div>
                        </div>
                        <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = ''; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable('', true, 0);?>
                    <?php } ?>
                </div>


                <!-- <div class="row half">
                    <div class="col-mb-4 half">
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
                    <div class="col-mb-4 half">
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
                    <div class="col-mb-4 half">
                        <div class="control-group pull-top">
                            <div>Cover :</div>
                            <div class="input-append">
                                <input type="text" 
                                    <?php if ($_smarty_tpl->tpl_vars['item']->value->cat_cover) {?>title="<img src='<?php echo $_smarty_tpl->tpl_vars['item']->value->cat_cover;?>
' style='max-height:80px;max-width:120px'/>"<?php }?>
                                    class="form-control tool-tip" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->cat_cover)===null||$tmp==='' ? '' : $tmp);?>
" 
                                    name="cat_cover" id="cat_cover"
                                    >
                                <span class="add-on" onclick="BrowseServer('#cat_cover')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div> -->

                <div class="row half" style="display:none">
                    <div class="col-sm-6 half">
                        <div class="control-group pull-top">
                            <div>Status :</div>
                            <div style="padding-top:5px">
                                <span class="circleRad">
                                    <input id="_status1" 
                                        name="_status" type="radio" 
                                        <?php if ($_smarty_tpl->tpl_vars['o']->value->_status!=(($tmp = @'false')===null||$tmp==='' ? '' : $tmp)) {?>checked<?php }?>
                                        value="true">
                                    <label for="_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="_status2" name="_status" type="radio" value="false"
                                        <?php if ($_smarty_tpl->tpl_vars['o']->value->_status==(($tmp = @'false')===null||$tmp==='' ? '' : $tmp)) {?>checked<?php }?>
                                    >
                                    <label for="_status2">Disable&nbsp;&nbsp;</label>
                                </span>

                            </div>
                        </div>
                    </div>
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
