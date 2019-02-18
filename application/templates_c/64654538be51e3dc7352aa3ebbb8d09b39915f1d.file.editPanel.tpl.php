<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 17:49:07
         compiled from "application\templates\cms\cp\product\editPanel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11803259555c6a1e9a39b3e8-49624862%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '64654538be51e3dc7352aa3ebbb8d09b39915f1d' => 
    array (
      0 => 'application\\templates\\cms\\cp\\product\\editPanel.tpl',
      1 => 1550486943,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11803259555c6a1e9a39b3e8-49624862',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a1e9a58c8c8_04142859',
  'variables' => 
  array (
    'tplConfig' => 1,
    'item' => 1,
    'type' => 1,
    'langs' => 1,
    'f' => 1,
    'la' => 1,
    'attr' => 1,
    'ci' => 1,
    'cates' => 1,
    'c' => 1,
    'images' => 1,
    'img' => 1,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a1e9a58c8c8_04142859')) {function content_5c6a1e9a58c8c8_04142859($_smarty_tpl) {?>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Product</h4>
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
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->product_id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="EntryId"
                />
            
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#product-info" aria-controls="product-info" role="tab" data-toggle="tab">Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-opt" aria-controls="product-opt" role="tab" data-toggle="tab">General Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-features" aria-controls="product-features" role="tab" data-toggle="tab">Features</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-images" aria-controls="product-images" role="tab" data-toggle="tab">Image List</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active pull-top" id="product-info">
                        <input type="hidden" name="product_type" 
                            value="<?php echo (($tmp = @(($tmp = @$_smarty_tpl->tpl_vars['item']->value->product_type)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['type']->value : $tmp))===null||$tmp==='' ? '' : $tmp);?>
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
                                            href="#tab_lang_content_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
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
                                <div id="tab_lang_content_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" class="tab-pane <?php echo (($tmp = @$_smarty_tpl->tpl_vars['f']->value)===null||$tmp==='' ? '' : $tmp);?>
">
                                    <div class="row half">
                                        <div class="col-mb-6 half"> 
                                            <div class="control-group pull-top">
                                                <div>Title :(*)</div>
                                                <?php if (isset($_smarty_tpl->tpl_vars['attr'])) {$_smarty_tpl->tpl_vars['attr'] = clone $_smarty_tpl->tpl_vars['attr'];
$_smarty_tpl->tpl_vars['attr']->value = ('product_title_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('product_title_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>

                                                <input type="text" 
                                                    onblur="AliasTo('#entryForm input[name=product_title_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
]','#entryForm input[name=product_alias_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
]')" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                    value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->{$_smarty_tpl->tpl_vars['attr']->value}))===null||$tmp==='' ? '' : $tmp);?>
" 
                                                    name="product_title_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                                    placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"
                                                    
                                                    maxlength="255" 
                                                    >
                                            </div>
                                        </div>
                                        <div class="col-mb-6 half">
                                            <div class="control-group pull-top">
                                                <div>Alias :</div>
                                                <?php if (isset($_smarty_tpl->tpl_vars['attr'])) {$_smarty_tpl->tpl_vars['attr'] = clone $_smarty_tpl->tpl_vars['attr'];
$_smarty_tpl->tpl_vars['attr']->value = ('product_alias_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('product_alias_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>
                                                <input type="text" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]"
                                                    name="product_alias_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
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
$_smarty_tpl->tpl_vars['attr']->value = ('product_desc_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('product_desc_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>
                                        <textarea class="form-control validate[required]" 
                                            name="product_desc_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                            rows="10" 
                                            data-lang="<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"
                                            placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"><?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->{$_smarty_tpl->tpl_vars['attr']->value}))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                                    </div>

                                    
                                    <?php if ($_smarty_tpl->tpl_vars['ci']->value->agent->is_mobile()) {?>
                                    <div class="pull-top">
                                        <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                                    </div>
                                    <?php } else { ?>
                                    <div class="control-group pull-top">
                                        <div>Content :</div>
                                        <?php if (isset($_smarty_tpl->tpl_vars['attr'])) {$_smarty_tpl->tpl_vars['attr'] = clone $_smarty_tpl->tpl_vars['attr'];
$_smarty_tpl->tpl_vars['attr']->value = ('product_content_').($_smarty_tpl->tpl_vars['la']->value->lang_short); $_smarty_tpl->tpl_vars['attr']->nocache = true; $_smarty_tpl->tpl_vars['attr']->scope = 0;
} else $_smarty_tpl->tpl_vars['attr'] = new Smarty_variable(('product_content_').($_smarty_tpl->tpl_vars['la']->value->lang_short), true, 0);?>
                                        <div class="">
                                            <textarea class="form-control validate[required]" 
                                                data-editor="basic"
                                                id="product_content_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                                name="product_content_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                                rows="10" 
                                                data-lang="<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"
                                                placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"><?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->{$_smarty_tpl->tpl_vars['attr']->value}))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                                        </div>
                                    </div>
                                    <?php }?>

                                </div>


                                <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = ''; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable('', true, 0);?>
                            <?php } ?>
                        </div>
                        
                        <div class="row half">
                            <div class="col-mb-6 half"> 
                                <div class="control-group pull-top">
                                    <div>Code :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[4],maxSize[20]]"
                                        name="product_code" 
                                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->product_code, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                                </div>
                            </div>
                            <div class="col-mb-6 half">            
                                <div class="pull-top control-group">
                                    <div>Category :(*)</div>

                                    <div class="row-fluid">
                                        <select 
                                            name="product_category" 
                                            class="form-control selectpicker"
                                            data-putto="#frm-err-product_category"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            <?php if ((($tmp = @$_smarty_tpl->tpl_vars['cates']->value)===null||$tmp==='' ? null : $tmp)) {?>
                                            <?php  $_smarty_tpl->tpl_vars['c'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['c']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['cates']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['c']->key => $_smarty_tpl->tpl_vars['c']->value) {
$_smarty_tpl->tpl_vars['c']->_loop = true;
?>
                                                <option 
                                                    data-content="<span style='padding-left: <?php echo $_smarty_tpl->tpl_vars['c']->value->cat_level*20;?>
px;'><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['c']->value->cat_title, ENT_QUOTES, 'UTF-8', true);?>
</span>"
                                                    <?php if ($_smarty_tpl->tpl_vars['c']->value->cat_id==$_smarty_tpl->tpl_vars['item']->value->product_category) {?>selected="1"<?php }?>
                                                    value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->cat_id)===null||$tmp==='' ? '' : $tmp);?>
">
                                                        <?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->cat_title)===null||$tmp==='' ? '' : $tmp);?>

                                                </option>
                                            <?php } ?>
                                            <?php }?>
                                        </select>
                                    </div>
                                    <div id="frm-err-product_category"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row half">
                            <div class="col-mb-6 half">   
                                <div class="row half">
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Image :(*)</div>
                                            <div class="input-append">
                                                <input type="text" 
                                                    <?php if ($_smarty_tpl->tpl_vars['item']->value->product_thumb) {?>title="<img src='<?php echo $_smarty_tpl->tpl_vars['item']->value->product_thumb;?>
' style='max-height:80px;max-width:120px'/>"<?php }?>
                                                    class="form-control tool-tip validate[required,maxSize[255]]" 
                                                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->product_thumb, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                                    name="product_thumb" 
                                                    id="product_thumb"
                                                    >
                                                <span class="add-on" 
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#product_thumb')">
                                                    <i class="fa-image"></i>
                                                </span>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Cover :</div>
                                            <div class="input-append">
                                                <input type="text" 
                                                    <?php if ($_smarty_tpl->tpl_vars['item']->value->product_cover) {?>title="<img src='<?php echo $_smarty_tpl->tpl_vars['item']->value->product_cover;?>
' style='max-height:80px;max-width:120px'/>"<?php }?>
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->product_cover, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                                    name="product_cover" 
                                                    id="product_cover"
                                                    >
                                                <span class="add-on" 
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#product_cover')">
                                                    <i class="fa-image"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>     
                                
                            </div>
                            <div class="col-mb-6 half"> 
                                <div class="row half">
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Position :</div>
                                            
                                                <input type="number" 
                                                    class="form-control validate[required,custom[number]]" 
                                                    data-prompt-position="topLeft:0,20"
                                                    data-errormessage-custom-error="Numbers only"
                                                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->product_position, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '100' : $tmp);?>
" 
                                                    name="product_position"
                                                    data-putto="#err-product_position"
                                                    >
                                        </div>
                                        <div id="err-product_position"></div>
                                    </div>
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="product_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" <?php if ((($tmp = @$_smarty_tpl->tpl_vars['item']->value->product_status)===null||$tmp==='' ? '' : $tmp)=='true') {
}?>>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div role="tabpanel" class="tab-pane" id="product-images">
                        <div class="container pull-top">
                            <span class="code cursor" 
                                title="Add new Photo" 
                                onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.choosePhotos()">
                                <i class="fa-plus"></i>&nbsp;Add Images
                            </span>
                            &nbsp;&nbsp;
                            <span class="code cursor" 
                                title="Delete all" 
                                onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.deletePhotos()">
                                <i class="fa fa-trash-o"></i>&nbsp;Delete all
                            </span>
                        </div>
                        <ul id="sortable" class="sortable" style="min-height: 100px">
                            <?php if ((($tmp = @$_smarty_tpl->tpl_vars['item']->value->product_images)===null||$tmp==='' ? '' : $tmp)!='') {?>
                                <?php if (isset($_smarty_tpl->tpl_vars['images'])) {$_smarty_tpl->tpl_vars['images'] = clone $_smarty_tpl->tpl_vars['images'];
$_smarty_tpl->tpl_vars['images']->value = preg_split('/\r\n|[\r\n]/',$_smarty_tpl->tpl_vars['item']->value->product_images); $_smarty_tpl->tpl_vars['images']->nocache = true; $_smarty_tpl->tpl_vars['images']->scope = 0;
} else $_smarty_tpl->tpl_vars['images'] = new Smarty_variable(preg_split('/\r\n|[\r\n]/',$_smarty_tpl->tpl_vars['item']->value->product_images), true, 0);?>
                                <?php  $_smarty_tpl->tpl_vars['img'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['img']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['images']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['img']->key => $_smarty_tpl->tpl_vars['img']->value) {
$_smarty_tpl->tpl_vars['img']->_loop = true;
?>
                                    <li class="ui-state-default">
                                        <img class="thumb" src="<?php echo $_smarty_tpl->tpl_vars['img']->value;?>
"/>
                                        <div class="action cursor" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.deletePhoto(this)">
                                            <i class="fa fa-trash-o"></i>
                                        </div>
                                    </li>
                                <?php } ?>
                            <?php }?>
                        </ul>
                        <div class="clearfix"></div>
                        <div class="code">
                            Drag to sort images.<br/>
                            Press Ctrl to select multi images.
                        </div>
                        
                    </div>
                    <div role="tabpanel" class="tab-pane" id="product-opt">
                        <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/cp/product/entryOptBasic.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

                    </div>
                    <div role="tabpanel" class="tab-pane" id="product-features">
                        <?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/cp/product/entry-features.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

                    </div>
                </div>
                <div class="clearfix"></div>
                
            </form>
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
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
