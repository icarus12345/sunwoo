<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:15:21
         compiled from "application\templates\cms\cp\news\editPanel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12838823825bed3929474a95-36721687%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a4df4be174ae3555559d3b90b42f288ae83b89f8' => 
    array (
      0 => 'application\\templates\\cms\\cp\\news\\editPanel.tpl',
      1 => 1436408035,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12838823825bed3929474a95-36721687',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'item' => 1,
    'tplConfig' => 1,
    'type' => 1,
    'cates' => 1,
    'c' => 1,
    'ci' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed3929592494_64180192',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed3929592494_64180192')) {function content_5bed3929592494_64180192($_smarty_tpl) {?>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <?php if ($_smarty_tpl->tpl_vars['item']->value) {?>
            <h4>Edit News</h4>
            <?php } else { ?>
            <h4>Add new News</h4>
            <?php }?>
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
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->news_id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="EntryId"
                />
            
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="news_type" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->post_type)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['type']->value : $tmp);?>
">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#entry-tab-001" aria-controls="entry-tab-001" role="tab" data-toggle="tab">Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#entry-tab-002" aria-controls="entry-tab-002" role="tab" data-toggle="tab">Content</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="entry-tab-001">
                        <div class="row half" style="z-index:10;position: relative;">
                            <div class="col-mb-6  half"> 
                                <div class="control-group pull-top">
                                    <div>
                                        Title :(*)
                                        <div class="pull-right lang-tabs">
                                            <ul class="nav-tabs">
                                                <li class="active">
                                                    <a  title="Tiếng Việt"
                                                        href="#tab_news_title_vi" 
                                                        data-toggle="tab" 
                                                        >Vi</a>
                                                </li>
                                                <li>
                                                    <a  title="English"
                                                        href="#tab_news_title_en" 
                                                        data-toggle="tab" 
                                                        >En</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="controls tab-content">
                                        <div id="tab_news_title_vi" class="tab-pane active">
                                            <input type="text" 
                                                class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_title, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                                name="news_title"
                                                maxlength="255" 
                                                onblur="AliasTo('#entryForm input[name=news_title]','#entryForm input[name=news_alias]')" 
                                                >
                                        </div>
                                        <div id="tab_news_title_en" class="tab-pane">
                                            <input type="text" 
                                                class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_title_en, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                                name="news_title_en"
                                                maxlength="255" 
                                                >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-mb-6 half">
                                <div class="control-group pull-top">
                                    <div>Alias :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[6],maxSize[255]]"
                                        name="news_alias" 
                                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_alias, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                                </div>            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-mb-6"> 
                                <div class="pull-top control-group">
                                    <div>Category :</div>
                                    <div class='input-group'>
                                        <select name="news_category" class="form-control selectpicker"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            <option value="" >Nothing Select</option>
                                            <?php  $_smarty_tpl->tpl_vars['c'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['c']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['cates']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['c']->key => $_smarty_tpl->tpl_vars['c']->value) {
$_smarty_tpl->tpl_vars['c']->_loop = true;
?>
                                                <option 
                                                    data-content="<span style='padding-left: <?php echo (substr_count($_smarty_tpl->tpl_vars['c']->value->cat_value,'>')-1)*20;?>
px;'><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->cat_title, ENT_QUOTES, 'UTF-8', true);?>
</span>"
                                                    <?php if ($_smarty_tpl->tpl_vars['c']->value->cat_id==$_smarty_tpl->tpl_vars['item']->value->news_category) {?>selected="1"<?php }?>
                                                    value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->cat_id)===null||$tmp==='' ? '' : $tmp);?>
">
                                                        <?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->cat_title)===null||$tmp==='' ? '' : $tmp);?>

                                                </option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="col-mb-6">   
                                <div class="row half">
                                    <div class="col-mb-6 half">
                                        <div class="control-group pull-top">
                                            <div>Thumb image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    <?php if ($_smarty_tpl->tpl_vars['item']->value->news_thumb) {?>title="<img src='<?php echo $_smarty_tpl->tpl_vars['item']->value->news_thumb;?>
' style='max-height:80px;max-width:120px'/>"<?php }?>
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_thumb, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                                    name="news_thumb" 
                                                    id="news_thumb"
                                                    data-putto="#frmErrorVideoThumb"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#news_thumb')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorVideoThumb"></div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-mb-6 half">
                                        <div class="control-group pull-top">
                                            <div>Cover image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    <?php if ($_smarty_tpl->tpl_vars['item']->value->news_cover) {?>title="<img src='<?php echo $_smarty_tpl->tpl_vars['item']->value->news_cover;?>
' style='max-height:80px;max-width:120px'/>"<?php }?>
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_cover, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                                    name="news_cover" 
                                                    id="news_cover"
                                                    data-putto="#frmErrorVideoCover"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#news_cover')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorVideoCover"></div>
                                        </div>
                                    </div>
                                </div>     
                                
                            </div>
                            <div class="col-sm-12 half"> 
                                <div class="">
                                    <div class="col-mb-4 half">
                                        <div class="control-group pull-top">
                                            <div>Position :</div>
                                            <input type="number" 
                                                    class="form-control" value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->news_position)===null||$tmp==='' ? '0' : $tmp);?>
" 
                                                    name="news_position"
                                                    >
                                        </div>
                                    </div>
                                    <div class="col-mb-4 half">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="news_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" <?php if (((($tmp = @$_smarty_tpl->tpl_vars['item']->value->news_status)===null||$tmp==='' ? '' : $tmp))=='false') {?>selected<?php }?>>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-mb-4 half" style="display:none">
                                        <div class="control-group pull-top">
                                            <div>Public date :</div>
                                            <div class='input-group date'>
                                                <input type='text' class="form-control validate[required]"
                                                    name="news_publicday" 
                                                    value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->news_publicday)===null||$tmp==='' ? (date('Y-m-d H:i:s')) : $tmp);?>
"
                                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>
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
                                                href="#tab_news_desc_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_news_desc_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_news_desc_vi" class="tab-pane active">
                                    <textarea 
                                        rows="3"
                                        class="form-control validate[required,maxSize[4000]]"
                                        name="news_desc"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_desc, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                                </div>
                                <div id="tab_news_desc_en" class="tab-pane">
                                    <textarea 
                                        rows="3"
                                        class="form-control validate[required,maxSize[4000]]"
                                        name="news_desc_en"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_desc_en, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                                </div>
                            </div>

                        </div>
                        <div class="control-group pull-top">
                            <div>Tag :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[maxSize[255]]"
                                name="news_tag"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_tag, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>

                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="entry-tab-002"> 
                        <?php if ($_smarty_tpl->tpl_vars['ci']->value->agent->is_mobile()) {?>
                        <div class="pull-top">
                            <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                        </div>
                        <?php } else { ?>
                        <div class="control-group pull-top">
                            <div>
                                Content :(*)
                                <div class="pull-right lang-tabs">
                                    <ul class="nav-tabs">
                                        <li class="active">
                                            <a  title="Tiếng Việt"
                                                href="#tab_news_content_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_news_content_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_news_content_vi" class="tab-pane active">
                                    <textarea 
                                        rows="10"
                                        class="form-control"
                                        id="news_content"
                                        name="news_content"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_content, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                                </div>
                                <div id="tab_news_content_en" class="tab-pane">
                                    <textarea 
                                        rows="10"
                                        class="form-control"
                                        id="news_content_en"
                                        name="news_content_en"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->news_content_en, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                                </div>
                            </div>

                        </div>
                        <?php }?>
                    </div>
                </div>    
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
