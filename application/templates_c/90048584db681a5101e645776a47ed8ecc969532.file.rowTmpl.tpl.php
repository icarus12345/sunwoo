<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:48
         compiled from "application\templates\cms\003\rowTmpl.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1804735155bed39084b9f72-59070352%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '90048584db681a5101e645776a47ed8ecc969532' => 
    array (
      0 => 'application\\templates\\cms\\003\\rowTmpl.tpl',
      1 => 1433860000,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1804735155bed39084b9f72-59070352',
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
  'unifunc' => 'content_5bed390857c584_18793390',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed390857c584_18793390')) {function content_5bed390857c584_18793390($_smarty_tpl) {?><?php echo '<script'; ?>
 type="text/x-tmpl" id="tmpl-entry">
    <div class="panel panel-default">
        <div class="panel-body">
            {% if(o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
thumb){ %}
            <img style="float: left;margin-right: 8px;" src="{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
thumb%}" height="60"/>
            {% } %}
            <div>
                <div class="c-gray">{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
name%}</div>
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
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,"d")!==false) {?>
                    <li class="{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock=='true'?'disabled':'' %}">
                        <a href="JavaScript:" onclick="{%=o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock!='true'?'<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onDeleteItem('+o.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
id+')':'' %}"><span class="fa fa-trash-o"></span> Delete entry</a>
                    </li>
                    <?php }?>
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,"l")!==false) {?>
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
                <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,"e")!==false) {?>
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
