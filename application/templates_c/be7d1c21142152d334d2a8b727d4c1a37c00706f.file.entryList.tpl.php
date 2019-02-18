<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 12:27:44
         compiled from "application\templates\cms\cp\menu\entryList.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13793576105c6a4250647f28-17427736%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'be7d1c21142152d334d2a8b727d4c1a37c00706f' => 
    array (
      0 => 'application\\templates\\cms\\cp\\menu\\entryList.tpl',
      1 => 1433860055,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13793576105c6a4250647f28-17427736',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'tplConfig' => 1,
    'unit' => 1,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a4250704cb3_90954021',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a4250704cb3_90954021')) {function content_5c6a4250704cb3_90954021($_smarty_tpl) {?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/003/rowTmpl.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/cp/menu/actScript.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo '<script'; ?>
 type="text/javascript">
    function applyMenu(){
        <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onCommit(base_url+'cms/cp/menu/menugender/');
    }
    _oConfig.paginate = false;
    _oConfig.dataColumns = [
        {
            'mData': "menu_id",
            'sWidth': "36px", 'bSortable': false,
            'sClass':'gridAction',
            'mRender': function ( value, type, datarow ) {
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
            'mData': "menu_status",
            'sWidth': "36px",
            'sClass':'gridStatus',
            'mRender': function ( value, type, datarow ) {
                var elm = '';
                <?php if ($_smarty_tpl->tpl_vars['unit']->value) {?>
                    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".e.")!==false) {?>
                    if(datarow.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock!='false'){
                        var status = datarow.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
status =='false'?'true':'false'
                    elm = 
                        '<span '+ 
                            'onclick="<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.changeStatus('+status+',\'' + datarow.menu_id + '\')" '+
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
            'mData': "menu_title",
            'mRender': function ( value, type, datarow ) {
                //return '----'.repeater(datarow.Level) + datarow.Title;
                var rowstr = '';
                rowstr += '<span style="float:left;padding-left:' +(28*datarow.menu_level) +'px">'
                    + '<i class="row-push"></i>'
                    + datarow.menu_title
                    + '</span>';
                return rowstr;
            }
        }
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
.onAddItem()"><i class="fa-plus"></i></a></li>
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
                            <th>Name</th>
                            
                            
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
.onAddItem()"
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
    <?php if ($_SESSION['auth']['user']->ause_authority=='Administrator') {?>
    <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,".apply.")!==false) {?>
    <li>
        <div class="depth">
            <a  href="JavaScript:void(0)" title="Update Navigation Menu" onclick="applyMenu()">
                <i class="fa fa-building"></i>
            </a>
        </div>
    </li>
    <?php }?>
    <?php }?>
</ul>
<?php }} ?>
