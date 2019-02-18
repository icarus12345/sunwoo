<?php /*%%SmartyHeaderCode:269435471663a32be80-02993195%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'df748ba6559355c93c8b8efe7658d62104c941b4' => 
    array (
      0 => 'application\\templates\\cms\\cp\\lang\\editorPanel.tpl',
      1 => 1416803158,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '269435471663a32be80-02993195',
  'cache_lifetime' => 60,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_54758e93d545c1_86634781',
  'has_nocache_code' => true,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54758e93d545c1_86634781')) {function content_54758e93d545c1_86634781($_smarty_tpl) {?><div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Content</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="language.onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="language.onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input 
                    type="hidden" 
                    value="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['lang_set']->value)===null||$tmp==='' ? '' : $tmp);?>
" 
                    id="lang_set" name="lang_set"
                    />
                <?php if (!isset($_smarty_tpl->tpl_vars['item']->value)) {?>
                <div class="pull-bottom">
                    <div>Name</div>
                    <div class="input-group ">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-comment"></i>
                        </span>
                        <input type="text" class="form-control validate[required]" 
                               placeholder="Name" 
                               name="lang_key" id="lang_key"
                               data-putto=".error_title"/>
                    </div>
                    <div class="erb error_title"></div>
                </div>
                <?php } else { ?>
                <input 
                    type="hidden" 
                    value="<?php echo quotes_to_entities($_smarty_tpl->tpl_vars['item']->value['data'][$_smarty_tpl->tpl_vars['langs']->value[0]->lang_short]->lang_key);?>
" 
                    id="lang_key" name="lang_key"
                    />
                <?php }?>
                <div class="pull-bottom">
                    <div>
                        Custom language for "<?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value['data'][$_smarty_tpl->tpl_vars['langs']->value[0]->lang_short]->lang_key))===null||$tmp==='' ? 'New value' : $tmp);?>
"  :
                        <div class="pull-right lang-tabs">
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
                                            href="#tab_de_desc_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"  
                                            data-toggle="tab" 
                                            >
                                                <?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_short);?>

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
                    </div>
                    <div class="input-group">
                        <div class="controls tab-content">
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
                            <div id="tab_de_desc_<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
" 
                                class="tab-pane <?php echo (($tmp = @$_smarty_tpl->tpl_vars['f']->value)===null||$tmp==='' ? '' : $tmp);?>
">
                                <textarea class="form-control validate[required]" 
                                          rows="10" name="lang_text" 
                                          data-putto=".error_message" 
                                          data-lang="<?php echo $_smarty_tpl->tpl_vars['la']->value->lang_short;?>
"
                                          placeholder="<?php echo ucwords($_smarty_tpl->tpl_vars['la']->value->lang_name);?>
"><?php echo (($tmp = @quotes_to_entities($_smarty_tpl->tpl_vars['item']->value['data'][$_smarty_tpl->tpl_vars['la']->value->lang_short]->lang_text))===null||$tmp==='' ? '' : $tmp);?>
</textarea>
                            </div>
                                <?php if (isset($_smarty_tpl->tpl_vars["f"])) {$_smarty_tpl->tpl_vars["f"] = clone $_smarty_tpl->tpl_vars["f"];
$_smarty_tpl->tpl_vars["f"]->value = ''; $_smarty_tpl->tpl_vars["f"]->nocache = true; $_smarty_tpl->tpl_vars["f"]->scope = 0;
} else $_smarty_tpl->tpl_vars["f"] = new Smarty_variable('', true, 0);?>
                            <?php }
if (!$_smarty_tpl->tpl_vars['la']->_loop) {
?>
                                    
                            <?php } ?>
                        </div>
                    </div>
                    <div class="erb error_message"></div>
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
<?php }} ?>
