<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 14:50:39
         compiled from "application\templates\cms\cp\line\entryList.tpl" */ ?>
<?php /*%%SmartyHeaderCode:5905726995c6a617b3d08d4-92213537%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f72e4c2e52b8c8d0c7c4caae2f2f2f2fc8f6759f' => 
    array (
      0 => 'application\\templates\\cms\\cp\\line\\entryList.tpl',
      1 => 1550476236,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '5905726995c6a617b3d08d4-92213537',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a617b4f9944_93469316',
  'variables' => 
  array (
    'type' => 1,
    'tplConfig' => 1,
    'unit' => 1,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a617b4f9944_93469316')) {function content_5c6a617b4f9944_93469316($_smarty_tpl) {?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/003/rowTmpl.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ((@constant('APPPATH')).("templates/cms/003/actScript.tpl"), $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo '<script'; ?>
 type="text/javascript">
    _oConfig = {
        'showImage':false,
        'entryType':'<?php echo $_smarty_tpl->tpl_vars['type']->value;?>
',
        'cateType':'',
        'entryId': '',
        'dataColumns':[],
        'paginate': false,
        'entryBindingUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/bindingbytype/',
        'entryEditUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/editpanel/',
        'entryCommitUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/onCommit/',
        'entryDeleteUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/delete/'
    };
    _oConfig.dataColumns = [
        {
            'mData': "_id",
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
            'mData': "_status",
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
.changeStatus('+status+',\'' + datarow._id + '\')" '+
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
            'mData': "_title_vi",
        },
        {
            'mData': "header_title_vi",
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
                <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,"a")!==false) {?>
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
                            <th>Head</th>
                            
                            
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
                <?php if (strpos($_smarty_tpl->tpl_vars['unit']->value,"a")!==false) {?>
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
</ul>
<?php }} ?>
