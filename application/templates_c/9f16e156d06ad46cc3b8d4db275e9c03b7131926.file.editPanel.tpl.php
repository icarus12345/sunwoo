<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 09:31:09
         compiled from "application\templates\cms\cp\advisory\editPanel.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4028276435c6a18ed6cd361-67771477%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9f16e156d06ad46cc3b8d4db275e9c03b7131926' => 
    array (
      0 => 'application\\templates\\cms\\cp\\advisory\\editPanel.tpl',
      1 => 1433860050,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4028276435c6a18ed6cd361-67771477',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'item' => 0,
    'tplConfig' => 0,
    'cates' => 0,
    'c' => 0,
    'ci' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a18ed943c01_35400762',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a18ed943c01_35400762')) {function content_5c6a18ed943c01_35400762($_smarty_tpl) {?><div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <?php if ($_smarty_tpl->tpl_vars['item']->value) {?>
                <h4><?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['editEntryTitle'];?>
</h4>
            <?php } else { ?>
                <h4><?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['addEntryTitle'];?>
</h4>
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
                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->advisory_id)===null||$tmp==='' ? '' : $tmp);?>
" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <div class="control-group">
                    <div>Title :</div>
                    <input type="text" 
                        rows="1"
                        class="form-control validate[required,maxSize[255]]"
                        name="advisory_title" 
                        value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->advisory_title, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
"/>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="pull-top control-group">
                            <div>Category :</div>
                            <div class='input-group'>
                                <select name="advisory_category" class="form-control selectpicker"
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
                                            <?php if ($_smarty_tpl->tpl_vars['c']->value->cat_id==$_smarty_tpl->tpl_vars['item']->value->advisory_category) {?>selected="1"<?php }?>
                                            value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->cat_id)===null||$tmp==='' ? '' : $tmp);?>
">
                                                <?php echo (($tmp = @$_smarty_tpl->tpl_vars['c']->value->cat_title)===null||$tmp==='' ? '' : $tmp);?>

                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Name</div>
                            <input type="text" 
                                class="form-control validate[required,maxSize[255]]" 
                                value="<?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->advisory_name, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
" 
                                name="advisory_name" 
                                >
                                
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-mb-4">
                        <div class="control-group pull-top">
                            <div>Answers :</div>
                            <input type='text' class="form-control"
                                name="advisory_by" 
                                value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->advisory_by)===null||$tmp==='' ? '' : $tmp);?>
"/>
                        </div>
                    </div>
                    <div class="col-mb-4">
                        <div class="control-group pull-top">
                            <div>Public date :</div>
                            <div class='input-group date'>
                                <input type='text' class="form-control"
                                    name="advisory_publicday" 
                                    value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['item']->value->advisory_publicday)===null||$tmp==='' ? (date('Y-m-d H:i:s')) : $tmp);?>
"
                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="control-group pull-top">
                            <div>    
                                Status :
                            </div>
                            <div style="padding-top: 5px">
                                <span class="circleRad">
                                    <input id="advisory_status1" 
                                        name="advisory_status" type="radio" 
                                        <?php if ($_smarty_tpl->tpl_vars['item']->value->advisory_status!=(($tmp = @'false')===null||$tmp==='' ? '' : $tmp)) {?>checked<?php }?>
                                        value="true">
                                    <label for="advisory_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="advisory_status2" name="advisory_status" type="radio" value="false"
                                        <?php if ($_smarty_tpl->tpl_vars['item']->value->advisory_status==(($tmp = @'false')===null||$tmp==='' ? '' : $tmp)) {?>checked<?php }?>
                                    >
                                    <label for="advisory_status2">Disable&nbsp;&nbsp;</label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div> 
                
                <div class="control-group pull-top">
                    <div>Question :</div>
                    <textarea 
                        rows="3"
                        class="form-control validate[required,maxSize[4000]]"
                        name="advisory_desc"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->advisory_desc, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>

                </div>
                <?php if ($_smarty_tpl->tpl_vars['ci']->value->agent->is_mobile()) {?>
                <div class="pull-top">
                    <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                </div>
                <?php } else { ?>
                <div class="control-group pull-top">
                    <div>Content :</div>
                    <textarea 
                        rows="10"
                        class="form-control"
                        id="advisory_content"
                        name="advisory_content"><?php echo (($tmp = @htmlspecialchars($_smarty_tpl->tpl_vars['item']->value->advisory_content, ENT_QUOTES, 'UTF-8', true))===null||$tmp==='' ? '' : $tmp);?>
</textarea>

                </div>
                <?php }?>
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
</ul><?php }} ?>
