<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:47
         compiled from "application\templates\cms\cp\setting\iEntryList.tpl" */ ?>
<?php /*%%SmartyHeaderCode:9750949945bed3907ea53d8-01020047%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '66cd0a7b29985ed529dc01ae8755933d5033b28b' => 
    array (
      0 => 'application\\templates\\cms\\cp\\setting\\iEntryList.tpl',
      1 => 1433860061,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '9750949945bed3907ea53d8-01020047',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'unit' => 1,
    'tplConfig' => 1,
    'layout' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed39081be3a6_65732047',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed39081be3a6_65732047')) {function content_5bed39081be3a6_65732047($_smarty_tpl) {?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/003/rowTmpl.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/cp/setting/actScript.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo '<script'; ?>
 type="text/x-tmpl" id="tmpl-action-unit">
    <?php if ($_smarty_tpl->tpl_vars['unit']->value) {?>
    <ul class="table-controls">
        <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".e.")!==false) {?>
        <li>
            <span class="fa fa-edit" 
               onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onPopEditItem('{%=o.Id%}','<?php echo $_smarty_tpl->tpl_vars['layout']->value;?>
')" 
               title="Edit entry ({%=o.Id%})">
            </span> 
        </li>
        <?php }?>
        <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".s.")!==false) {?>
        <li>
            <i onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.changeStatus('{%=o.Status == 'true'?'false':'true'%}','{%=o.Id%}')" 
               title="Click to turn on/off entry ({%=o.Id%})" 
               class="fa fa-toggle-{%=o.Status == 'true'?'on':'off'%}"></i>
        </li>
        <?php }?>
        <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".d.")!==false) {?>
        {% if( o.Lock != 'true'){ %}
        <li>
            <i  class="fa fa-trash-o"
                onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onDeleteItem('{%=o.Id%}')" 
                title="Delete entry ({%=o.Id%})"
                ></i> 
        </li>
        {% } %}
        <?php }?>
        <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".l.")!==false) {?>
        <li>
            <i class="fa {%=o.Lock == 'true'?'fa-lock':'fa-unlock-alt'%}"
               onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onLockItem('{%=o.Id%}','{%=o.Lock == 'true'?'false':'true'%}')" 
               title="Lock entry ({%=o.Id%})" 
               ></i>
        </li>
        <?php }?>
    </ul>
    <?php }?>
<?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript">
    function applyMenu(){
        <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onCommit(base_url+'cms/cp/menu/menugender/');
    }
    _oConfig.paginate = false;
    _oConfig.dataColumns = [
        {
            'mData': "Id",
            'sWidth': "36px", 'bSortable': false,
            'sClass':'gridAction',
            'mRender': function ( value, type, datarow ) {
                return tmpl("tmpl-action-unit", datarow);
                var str = '';
                <?php if ($_smarty_tpl->tpl_vars['unit']->value) {?>
                str =  '<ul class="table-controls">'
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".e.")!==false) {?>
                    str +=  '<li><a href="JavaScript:" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onEditItem(\'' + value + '\')" title="Edit entry (' + value + ')" ><i class="fa fa-edit"></i></a> </li>';
                    <?php }?>
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".d.")!==false) {?>
                    if(datarow.menu_lock!=='true'){
                        str += '<li><a href="JavaScript:" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onDeleteItem(\'' + value + '\')" title="Delete entry (' + value + ')" ><i class="fa fa-trash-o"></i></a> </li>';
                    }
                    <?php }?>
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".l.")!==false) {?>
                    if(datarow.menu_lock!=='true'){
                        str += '<li><a href="JavaScript:" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onLockItem(\'' + value + '\')" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i></a> </li>';
                    }
                    <?php }?>
                
                str += '</ul>';
                <?php }?>
                return str;
            }
        },
        {
            'mData': "Status",
            'sWidth': "36px",
            'sClass':'gridStatus',
            'mRender': function ( value, type, datarow ) {
                var elm = '';
                <?php if ($_smarty_tpl->tpl_vars['unit']->value) {?>
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".e.")!==false) {?>
                    if(datarow.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock!='false'){
                        var status = datarow.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
Status =='false'?'true':'false'
                    elm = 
                        '<span '+ 
                            'onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.changeStatus('+status+',\'' + datarow.Id + '\')" '+
                            'title="Click to turn on/off entry" ';
                    if(value == 'false') 
                        elm += 'class="fa fa-toggle-off"';
                    else
                        elm += 'class="fa fa-toggle-on"';
                    elm += '></span>';
                    }
                    <?php }?>
                <?php }?>
                return elm;
            }
        },
        {

            'mData': "Image",'sWidth': "56px",'bSortable': false,
            'sClass':'gridThumb',
            'mRender': function ( value, type, datarow ) {
                if(value)
                    return '<div style="height:32px;width:52px;background-image:url('+value+')" class="bg-cover"/>';
                else return '';
            }
        },
        {'mData': "Name"}
    ];

<?php echo '</script'; ?>
>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4><?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['title'];?>
</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".a.")!==false) {?>
                <li><a href="JavaScript:" title="Add new entry" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onPopAddItem('<?php echo $_smarty_tpl->tpl_vars['layout']->value;?>
')"><i class="fa-plus"></i></a></li>
                <?php }?>
                <li><a href="JavaScript:" title="Refresh entrys" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onRefresh()"><i class="fa-rotate-left"></i></a></li>
                <li><a href="JavaScript:" title="Setting" ><i class="fa-cogs"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <div>
                <div class="pull-left">
                    <span class="squaredThree">
                        <input type="checkbox"  
                            id="squaredThreeToggleThumb" 
                            name="squaredThreeToggleThumb"
                            onchange="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.toggleImage();" 
                            >
                        <label for="squaredThreeToggleThumb"></label>
                    </span>
                    <label for="squaredThreeToggleThumb">Show/Hide Thumbnail</label>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="table-overflow">
                <table id="entryDatatable" class="table table-bordered table-striped message-table">
                    <thead>
                        <tr>
                            <th><span class="fa fa-key"></span></th>
                            <th><span class="fa fa-circle-thin"></span></th>
                            <th>Thumb</th>
                            <th>Title</th>
                            
                            
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
            
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-one">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Add new entry" 
                <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".a.")!==false) {?>
                onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onPopAddItem('<?php echo $_smarty_tpl->tpl_vars['layout']->value;?>
')"
                <?php }?>
                >
                <i class="fa-plus"></i>
            </a>
        </div>
    </li>
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Refresh entrys" onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onRefresh()">
                <i class="fa fa-rotate-left"></i>
            </a>
        </div>
    </li>
</ul>
<?php }} ?>
