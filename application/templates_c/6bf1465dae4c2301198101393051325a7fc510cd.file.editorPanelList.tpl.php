<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 12:09:18
         compiled from "application\templates\cms\cp\cate\editorPanelList.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6160916205c6a22c257db81-44617803%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6bf1465dae4c2301198101393051325a7fc510cd' => 
    array (
      0 => 'application\\templates\\cms\\cp\\cate\\editorPanelList.tpl',
      1 => 1550466549,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6160916205c6a22c257db81-44617803',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a22c268fb49_62709866',
  'variables' => 
  array (
    'tplConfig' => 1,
    'item' => 1,
    'type' => 1,
    'o' => 1,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a22c268fb49_62709866')) {function content_5c6a22c268fb49_62709866($_smarty_tpl) {?>
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
                <input 
                    type="hidden" 
                    value="0" 
                    name="cat_parent"
                    />
                <div class="row half">
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>
                                Title :(*)
                                <div class="pull-right lang-tabs">
                                    <ul class="nav-tabs">
                                        <li class="active">
                                            <a  title="Tiếng Việt"
                                                href="#tab_cat_title_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_cat_title_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_cat_title_vi" class="tab-pane active">
                                    <input type="text" 
                                        rows="1"
                                        onblur="AliasTo('#entryForm input[name=cat_title]','#entryForm input[name=cat_alias]')" 
                                        class="form-control validate[required,minSize[2],maxSize[255]]"
                                        name="cat_title" 
                                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->cat_title, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                                </div>
                                <div id="tab_cat_title_en" class="tab-pane">
                                    <input type="text" 
                                        rows="1"
                                        onblur="AliasTo('#entryForm input[name=cat_title_en]','#entryForm input[name=cat_alias_en]')" 

                                        class="form-control validate[required,minSize[2],maxSize[255]]"
                                        name="cat_title_en" 
                                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->cat_title_en, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>Alias :
                                <div class="pull-right lang-tabs">
                                    <ul class="nav-tabs">
                                        <li class="active">
                                            <a  title="Tiếng Việt"
                                                href="#tab_cat_alias_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_cat_alias_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_cat_alias_vi" class="tab-pane active">
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[2],maxSize[255]]"
                                        name="cat_alias" 
                                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->cat_alias, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                                </div>
                                <div id="tab_cat_alias_en" class="tab-pane">
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[2],maxSize[255]]"
                                        name="cat_alias_en" 
                                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->cat_alias_en, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                                </div>
                            </div>
                            
                        </div>
                    </div>
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
                    <div class="col-sm-6 half">
                        <div class="control-group pull-top">
                            <div>Position :</div>
                            <input type="number" 
                                    class="form-control" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->cat_position)===null||$tmp==='' ? 0 : $tmp);?>
" 
                                    name="cat_position"
                                    >
                        </div>
                    </div>
                </div>
                <div class="control-group pull-top">
                    <div>
                        Desc :(*)
                        <div class="pull-right lang-tabs">
                            <ul class="nav-tabs">
                                <li class="active">
                                    <a  title="Tiếng Việt"
                                        href="#tab_cat_desc_vi" 
                                        data-toggle="tab" 
                                        >Vi</a>
                                </li>
                                <li>
                                    <a  title="English"
                                        href="#tab_cat_desc_en" 
                                        data-toggle="tab" 
                                        >En</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="controls tab-content">
                        <div id="tab_cat_desc_vi" class="tab-pane active">
                            <textarea class="form-control de-desc" 
                                rows="3"
                                name="cat_desc"
                                data-putto=".error_desc" ><?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->cat_desc))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                        </div>
                        <div id="tab_cat_desc_en" class="tab-pane">
                            <textarea class="form-control de-desc" 
                                rows="3"
                                name="cat_desc_en"
                                data-putto=".error_desc" ><?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->cat_desc_en))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                        </div>
                    </div>
                    
                            
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
