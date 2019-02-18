<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:56
         compiled from "application\templates\cms\cp\product\rowTmpl.tpl" */ ?>
<?php /*%%SmartyHeaderCode:8328009215bed3910d6e454-39567296%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4d39089a1f20cc63b5c977d09a035af91918938c' => 
    array (
      0 => 'application\\templates\\cms\\cp\\product\\rowTmpl.tpl',
      1 => 1433860058,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8328009215bed3910d6e454-39567296',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'tplConfig' => 0,
    'unit' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed3910de52b0_61644409',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed3910de52b0_61644409')) {function content_5bed3910de52b0_61644409($_smarty_tpl) {?><?php echo '<script'; ?>
 type="text/x-tmpl" id="tmpl-entry">
    <div class="panel panel-default">
        <div class="panel-body">
            {% if(o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
thumb){ %}
            <img style="float: left;margin-right: 8px;" src="{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
thumb%}" height="60"/>
            {% } %}
            <div>
                <div class="">
                    <b>{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
title%}</b>
                    {% if(o.cat_title){ %}
                    <code>{%=o.cat_title%}</code>
                    {% } %}
                </div>
                <p class="word-wrap">{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
desc%}</p>
            </div>
        </div>
        <?php if ($_smarty_tpl->tpl_vars['unit']->value) {?>
        <div class="action">
            <div class="btn-group dropup">
                <div class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-ellipsis-v"></i>
                </div>
                <ul class="dropdown-menu" role="menu">
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".d.")!==false) {?>
                    <li class="{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock=='true'?'disabled':'' %}">
                        <a href="JavaScript:" onclick="{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock!='true'?'<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onDeleteItem('+o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
id+')':'' %}"><span class="fa fa-trash-o"></span> Delete entry</a>
                    </li>
                    <?php }?>
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".l.")!==false) {?>
                    <li class="{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock=='true'?'disabled':'' %}">
                        <a href="JavaScript:" onclick="{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock!='true'?'<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onLockItem('+o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
id+')':'' %}"><span class="fa fa-lock"></span> Lock entry</a>
                    </li>
                    <?php }?>
                    <li class="divider"></li>
                    <li class="disabled"><a href="JavaScript:"><span class="fa fa-eye"></span> Preview</a></li>
                </ul>
                <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".e.")!==false) {?>
                <div onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onEditItem('{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
id%}')" 
                     class="btn btn-default"
                     title="Click to edit entry({%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
id%})"
                     >
                    <span class="fa fa-pencil"></span>
                </div>
                {% if(o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
status=='true'){ %}
                <div onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.changeStatus('false','{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
id%}')" 
                     class="btn btn-default"
                     title="Click to disable entry"
                     >
                    <span class="fa fa-toggle-on"></span>
                </div>
                {% }else{ %}
                <div onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.changeStatus('true','{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
id%}')" 
                     title="Click to enable entry"
                     class="btn btn-default">
                    <span class="fa fa-toggle-off"></span>
                </div>
                {% } %}
                <?php }?>
            </div>
            <div class="pull-right modified" title="Last modified">
                <i class="fa fa-clock-o"></i>
                {%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
update?o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
update:o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
insert%}
            </div>
        </div>
        <?php }?>
    </div>
<?php echo '</script'; ?>
><?php }} ?>
