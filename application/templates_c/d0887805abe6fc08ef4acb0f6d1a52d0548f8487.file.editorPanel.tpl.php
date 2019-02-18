<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:15:30
         compiled from "application\templates\cms\account\editorPanel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:12013308755bed3932926b62-19973653%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd0887805abe6fc08ef4acb0f6d1a52d0548f8487' => 
    array (
      0 => 'application\\templates\\cms\\account\\editorPanel.tpl',
      1 => 1433860000,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '12013308755bed3932926b62-19973653',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'item' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed39329fc941_27375690',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed39329fc941_27375690')) {function content_5bed39329fc941_27375690($_smarty_tpl) {?>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>User Account</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="account.onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="account.onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->ause_id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="ause_id"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="pull-bottom control-group">
                            <div>Authority :</div>
                            <select class="form-control selectpicker" name="ause_authority" multiple >
                                <option <?php if ($_smarty_tpl->tpl_vars['item']->value->ause_authority=="Guest") {?>selected="1"<?php }?> value="Guest">Guest</option>
                                <option <?php if ($_smarty_tpl->tpl_vars['item']->value->ause_authority=="Admin") {?>selected="1"<?php }?> value="Admin">Admin</option>
                                <option <?php if ($_smarty_tpl->tpl_vars['item']->value->ause_authority=="User") {?>selected="1"<?php }?> value="User">User</option>
                                <option <?php if ($_smarty_tpl->tpl_vars['item']->value->ause_authority=="View") {?>selected="1"<?php }?> value="View">View</option>
                                <option <?php if (strpos($_smarty_tpl->tpl_vars['item']->value->ause_authority,"CP")!==false) {?>selected="1"<?php }?> value="CP">Content Provider</option>
                                <option <?php if (strpos($_smarty_tpl->tpl_vars['item']->value->ause_authority,"Video")!==false) {?>selected="1"<?php }?> value="Video">Video Manager</option>
                                <option <?php if (strpos($_smarty_tpl->tpl_vars['item']->value->ause_authority,"Audio")!==false) {?>selected="1"<?php }?> value="Audio">Audio Manager</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class=" pull-bottom control-group">
                            <div>Status :</div>
                            <select class="form-control selectpicker" name="ause_status">
                                <option <?php if ($_smarty_tpl->tpl_vars['item']->value->ause_status=="true") {?>selected="1"<?php }?> value="true">Enable</option>
                                <option <?php if ($_smarty_tpl->tpl_vars['item']->value->ause_status=="false") {?>selected="1"<?php }?> value="false">Disable</option>
                            </select>
                        </div>
                    </div>   
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="pull-bottom control-group">
                            <div>Account Name :</div>
                            <input type="text" class="form-control validate[required]" 
                                   name="ause_name"
                                   value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->ause_name))===null||$tmp==='' ? '' : $tmp);?>
"
                                   data-putto=".error-ause_name"/>
                            <div class="erb error-ause_name"></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="pull-bottom control-group">
                            <div>Email :</div>
                            <input type="text" class="form-control validate[required]" 
                                   name="ause_email"
                                   value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->ause_email))===null||$tmp==='' ? '' : $tmp);?>
"
                                   data-putto=".error-ause_email"/>
                            <div class="erb error-ause_email"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="pull-bottom control-group">
                            <div>Username :</div>
                            <input type="text" class="form-control validate[required]" 
                                   name="ause_username"
                                   value="<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value->ause_username))===null||$tmp==='' ? '' : $tmp);?>
"
                                   data-putto=".error-ause_username"/>
                            <div class="erb error-ause_username"></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class=" pull-bottom control-group">
                            <div>Password :</div>
                            <div class="input-append">
                                <input type="text" class="form-control" 
                                    placeholder="Current password"
                                    name="ause_password"
                                    value=""
                                    />
                                <span class="add-on" title="Random new password" onclick="account.getNewPass()">
                                    <i class="fa-random"></i>
                                </span>
                            </div>
                        </div>
                    </div>   
                </div>

                <div>
                    <button class="btn btn-default" onclick="account.onSave()">Save</button>
                    <button class="btn btn-default" onclick="account.onCancel()">Cancel</button>
                </div>
                <div class="bs-callout bs-callout-danger">
                    <h4>Note</h4>
                    <div>
                        User : can't create new cms account.<br/>
                        Admin : can create new cms account and update cms user account<br/>
                        View : only view data, can't create, update entry data.
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<?php }} ?>
