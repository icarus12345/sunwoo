<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:15:30
         compiled from "application\templates\cms\account\rowTmpl.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2884170575bed3932c857d4-33824852%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6347a335a66f60b3a9254f96ec8617f5a697d09d' => 
    array (
      0 => 'application\\templates\\cms\\account\\rowTmpl.tpl',
      1 => 1433860001,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2884170575bed3932c857d4-33824852',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed3932c9a4f5_11470554',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed3932c9a4f5_11470554')) {function content_5bed3932c9a4f5_11470554($_smarty_tpl) {?><?php echo '<script'; ?>
 type="text/x-tmpl" id="tmpl-entry">
    <div class="panel panel-default ">
        <div class="example">{%=o.ause_name%}</div>
        <div class="panel-body">
            {% if(o.ause_picture){ %}
            <!--<img style="float: left;margin-right: 8px;" src="{%=o.ause_picture%}" height="60"/>-->
            {% } %}
            <div>
                
                <div>Username :{%=o.ause_username%}</div>
                <div>Email :{%=o.ause_email%}</div>
                <div>Authority :{%=o.ause_authority%}</div>
            </div>
        </div>
        
        {% if( <?php echo $_SESSION['auth']['user']->ause_position;?>
<o.ause_position ) { %}
        <div class="action">
            <div class="btn-group -dropup">
                <div onclick="account.onEditItem('{%=o.ause_id%}')" class="btn btn-default">
                    <span class="fa fa-edit"></span>Edit Account
                </div>
                {% if(o.ause_status=='true'){ %}
                <div onclick="account.changeStatus('false','{%=o.ause_id%}')" class="btn btn-default">
                    <span class="fa fa-toggle-on"></span>Enable
                </div>
                {% }else{ %}
                <div onclick="account.changeStatus('true','{%=o.ause_id%}')" class="btn btn-default">
                    <span class="fa fa-toggle-off"></span>Disable
                </div>
                {% } %}
                <div class="btn btn-default dropdown-toggle " data-toggle="dropdown" aria-expanded="false">
                    <span class="caret"></span><span class="sr-only">Toggle Dropdown</span>
                </div>
                <ul class="dropdown-menu pull-right" role="menu">
                    <li class="">
                        <a href="JavaScript:" onclick="account.onDeleteItem('{%=o.ause_id%}')"><span class="fa fa-trash-o"></span>Delete Account</a>
                    </li>
                    <li class="divider"></li>
                    <li class="disabled"><a href="JavaScript:">Preview</a></li>
                </ul>
            </div>
        </div>
        {% } %}
        
    </div>
<?php echo '</script'; ?>
><?php }} ?>
