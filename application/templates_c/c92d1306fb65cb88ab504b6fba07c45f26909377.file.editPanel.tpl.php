<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 12:24:46
         compiled from "application\templates\cms\cp\settingvpe\editPanel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14246362905c6a419e7eb1d4-94821671%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c92d1306fb65cb88ab504b6fba07c45f26909377' => 
    array (
      0 => 'application\\templates\\cms\\cp\\settingvpe\\editPanel.tpl',
      1 => 1433860064,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14246362905c6a419e7eb1d4-94821671',
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
  'unifunc' => 'content_5c6a419e866793_38028378',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a419e866793_38028378')) {function content_5c6a419e866793_38028378($_smarty_tpl) {?><div class="row-fluid">
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
                    value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->DataType, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? 'text' : $tmp);?>
"/>
                <input type="hidden" name="Status" 
                    value="true"/>
                <?php if ($_smarty_tpl->tpl_vars['item']->value) {?>
                <div>
                    <b><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->Name, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</b>
                </div>
                <?php } else { ?>
                <div class="control-group">
                    <div>Name :</div>
                    <input type="text" 
                        class="form-control" 
                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->Name, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                        name="Name"
                        >
                </div>
                <?php }?>
                <div class="control-group pull-top">
                    <div>Title :</div>
                    <textarea 
                        rows="1"
                        class="form-control"
                        name="Title"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->Title, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                </div>
                <div class="control-group pull-top">
                    <div>Value :</div>
                    <?php if ($_smarty_tpl->tpl_vars['item']->value->DataType=="bool") {?>
                    <select name="Value" class="form-control selectpicker" data-size="10" >
                        <option value="true">True</option>
                        <option value="false" <?php if ($_smarty_tpl->tpl_vars['item']->value->Value=='false') {?>selected=1<?php }?>>False</option>
                    </select>
                    <?php } else { ?>
                    <textarea 
                        rows="1"
                        class="form-control"
                        name="Value"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->Value, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                    <?php }?>
                </div>
            </form>
        </div>
    </div>
</div><?php }} ?>
