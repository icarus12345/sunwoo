<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 09:33:12
         compiled from "application\templates\cms\cp\setting2\editPanelImg.tpl" */ ?>
<?php /*%%SmartyHeaderCode:9293879535c6a1968347919-53019873%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fccf81136899161bd4b3bf902c898fba9a2783d9' => 
    array (
      0 => 'application\\templates\\cms\\cp\\setting2\\editPanelImg.tpl',
      1 => 1437365054,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9293879535c6a1968347919-53019873',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'item' => 0,
    'type' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a19683b5f55_71440119',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a19683b5f55_71440119')) {function content_5c6a19683b5f55_71440119($_smarty_tpl) {?><div class="row-fluid">
    <div class="widget full">
        <div class="modal-body">
            <input 
                type="hidden" 
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->Id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="Type" 
                    value="<?php echo (($tmp = @(($tmp = @$_smarty_tpl->tpl_vars['item']->value->Type)===null||$tmp==='' ? $_smarty_tpl->tpl_vars['type']->value : $tmp))===null||$tmp==='' ? '' : $tmp);?>
"/>
                <input type="hidden" name="DataType" 
                    value="image"/>
                <input type="hidden" name="Status" 
                    value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->Status)===null||$tmp==='' ? 'true' : $tmp);?>
"/>
                <div class="control-group">
                    <div>Title :</div>
                    <input type="text" 
                        class="form-control" 
                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->Name, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                        name="Name"
                        >
                </div>
                <div class="control-group pull-top">
                    <div>
                        Image :
                        <div class="pull-right lang-tabs">
                            <ul class="nav-tabs">
                                <li class="active">
                                    <a  title="Tiếng Việt"
                                        href="#tab_image_vi" 
                                        data-toggle="tab" 
                                        >Vi</a>
                                </li>
                                <li>
                                    <a  title="English"
                                        href="#tab_image_en" 
                                        data-toggle="tab" 
                                        >En</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="controls tab-content">
                        <div id="tab_image_vi" class="tab-pane active">
                            <div class="input-append">
                                <input type="text" 
                                        class="form-control" value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->Image, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                        name="Image" id="Image"
                                        >
                                <span class="add-on"
                                      data-toggle="tooltip" data-placement="left" title="Tooltip on left"
                                      onclick="BrowseServer('#Image')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                        <div id="tab_image_en" class="tab-pane">
                            <div class="input-append">
                                <input type="text" 
                                        class="form-control" value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->Image_en, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                        name="Image_en" id="Image_en"
                                        >
                                <span class="add-on"
                                      data-toggle="tooltip" data-placement="left" title="Tooltip on left"
                                      onclick="BrowseServer('#Image_en')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="control-group">
                    <div>Link :</div>
                    <input type="text" 
                        class="form-control" 
                        value="<?php echo htmlspecialchars((($tmp = @$_smarty_tpl->tpl_vars['item']->value->Link)===null||$tmp==='' ? '' : $tmp), ENT_QUOTES, 'UTF-8', true);?>
" 
                        name="Link"
                        >
                </div>
            </form>
        </div>
    </div>
</div><?php }} ?>
