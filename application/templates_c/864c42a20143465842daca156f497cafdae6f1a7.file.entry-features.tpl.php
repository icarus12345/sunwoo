<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:16:58
         compiled from "application/templates/cms/cp/product/entry-features.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7275650405c6aa23ae24249-03368114%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '864c42a20143465842daca156f497cafdae6f1a7' => 
    array (
      0 => 'application/templates/cms/cp/product/entry-features.tpl',
      1 => 1550483646,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7275650405c6aa23ae24249-03368114',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'item' => 0,
    'head_data' => 0,
    'head' => 0,
    'line_data' => 0,
    'line' => 0,
    'product_features' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa23ae2e772_27201420',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa23ae2e772_27201420')) {function content_5c6aa23ae2e772_27201420($_smarty_tpl) {?>
<div>
    <?php if (isset($_smarty_tpl->tpl_vars['product_features'])) {$_smarty_tpl->tpl_vars['product_features'] = clone $_smarty_tpl->tpl_vars['product_features'];
$_smarty_tpl->tpl_vars['product_features']->value = explode(',',$_smarty_tpl->tpl_vars['item']->value->product_features); $_smarty_tpl->tpl_vars['product_features']->nocache = null; $_smarty_tpl->tpl_vars['product_features']->scope = 0;
} else $_smarty_tpl->tpl_vars['product_features'] = new Smarty_variable(explode(',',$_smarty_tpl->tpl_vars['item']->value->product_features), null, 0);?>
    <?php  $_smarty_tpl->tpl_vars['head'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['head']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['head_data']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['head']->key => $_smarty_tpl->tpl_vars['head']->value) {
$_smarty_tpl->tpl_vars['head']->_loop = true;
?>
        <fieldset>
            <legend><?php echo $_smarty_tpl->tpl_vars['head']->value->_title_vi;?>
</legend>
            <div>

                <?php  $_smarty_tpl->tpl_vars['line'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['line']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['line_data']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['line']->key => $_smarty_tpl->tpl_vars['line']->value) {
$_smarty_tpl->tpl_vars['line']->_loop = true;
?>
                    <?php if ($_smarty_tpl->tpl_vars['head']->value->_id==$_smarty_tpl->tpl_vars['line']->value->_head_id) {?>
                        <div class="form-check">
                            <input 
                                class="form-check-input" 
                                type="checkbox" 
                                id="_features_<?php echo $_smarty_tpl->tpl_vars['line']->value->_id;?>
" 
                                name="product_features"
                                value="<?php echo $_smarty_tpl->tpl_vars['line']->value->_id;?>
"
                                <?php if (in_array($_smarty_tpl->tpl_vars['line']->value->_id,$_smarty_tpl->tpl_vars['product_features']->value)) {?>checked<?php }?>
                                >
                                
                            <label class="form-check-label" for="_features_<?php echo $_smarty_tpl->tpl_vars['line']->value->_id;?>
">
                                <?php echo $_smarty_tpl->tpl_vars['line']->value->_title_vi;?>

                            </label>
                        </div>
                    <?php }?>
                <?php } ?>
            </div>
        </fieldset>
    <?php } ?>
</div>
<?php }} ?>
