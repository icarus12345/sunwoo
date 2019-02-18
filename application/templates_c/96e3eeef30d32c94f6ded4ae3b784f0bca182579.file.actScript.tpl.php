<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 12:27:44
         compiled from "application\templates\cms\cp\menu\actScript.tpl" */ ?>
<?php /*%%SmartyHeaderCode:19212188365c6a425088d3a3-15470648%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '96e3eeef30d32c94f6ded4ae3b784f0bca182579' => 
    array (
      0 => 'application\\templates\\cms\\cp\\menu\\actScript.tpl',
      1 => 1433860055,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '19212188365c6a425088d3a3-15470648',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'type' => 0,
    'tplConfig' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6a42509002d6_84372903',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6a42509002d6_84372903')) {function content_5c6a42509002d6_84372903($_smarty_tpl) {?><?php echo '<script'; ?>
 type="text/javascript">
var _oConfig = {
    'showImage':false,
    'entryType':'<?php echo $_smarty_tpl->tpl_vars['type']->value;?>
',
    'cateType':'',
    'entryId': '',
    'dataColumns':[],
    'paginate':true,
    'entryBindingUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/bindingbytype/',
    'entryEditUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/editpanel/',
    'entryCommitUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/commit/',
    'entryCommitUri2': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/onCommit/',
    'entryDeleteUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/delete/'
};
var <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
 = (function() {
    var oTable, dtable, me = this, scrollTop = 0;
    return {
        'toggleImage': function(){
            _oConfig.showImage = !_oConfig.showImage;
            this.onRefresh();
        },
        'oTable': function(){ return oTable;},
        'toggleElm': function(elm){
            $(elm).toggle();
        },
        'onCommit': function(Url,Params, Id,callback) {
            httpRequest({
                'url': Url,
                'data': {
                    'Id': Id,
                    'Params': Params
                },
                'callback': function(rsdata) {
                    if (rsdata.result < 0) {
                        addNotice(rsdata.message,'danger');
                    } else {
                        addNotice(rsdata.message,'info');
                        if (typeof callback == 'function') {
                            callback(rsdata);
                        }
                    }
                }
            }).call();
        },
        'updateCell': function(cellValue,rowIndex,columnIndex){
            oTable.fnUpdate( cellValue, rowIndex, columnIndex,false);
        },
        'createtable' :   function(){
            oTable = $('#entryDatatable').dataTable({
                'aaSorting': [],
                'aoColumns': _oConfig.dataColumns,
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': true,
                'bServerSide': true,
                'bPaginate': _oConfig.paginate,
                'sAjaxSource': 
                    _oConfig.entryBindingUri+
                    _oConfig.entryType+'/'+
                    _oConfig.cateType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'oalbum': {
                    'sSearch': "<span>Filter records:</span> _INPUT_",
                    'sLengthMenu': "<span>Show entries:</span> _MENU_",
                    'oPaginate': {
                        "sFirst": "First", 
                        "sLast": "Last", 
                        "sNext": ">", 
                        "sPrevious": "<"
                    }
                }
            });
            oTable.fnSetFilteringDelay(2000);
        },
        'onInit': function(){
            this.createtable();
        },
        'onAddItem': function(){
            this.onEditItem(0);
        },
        'onEditItem': function(Id){
            if (pending > 0)return;
            $('body').addClass('is-entry');
            $('#entry-container').html('...');
            httpRequest({
                'url'         :   
                    _oConfig.entryEditUri +
                    _oConfig.entryType+'/'+
                    _oConfig.cateType,
                'data'        :   {
                    'Id'  :   Id
                },
                'callback'    :   function(rsdata){
                    if(rsdata.result<0){
                        $('body').removeClass('is-entry');
                        addNotice(rsdata.message,'danger');
                    }else{
                        $('#entry-container').html(rsdata.htmlreponse);
                        if($('#<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
content').length==1)
                            addEditorBasic('<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
content',240);
                        $('#entryForm .selectpicker').selectpicker();
                        $('#entryForm').validationEngine({
                            'scroll': false
                            , prettySelect : true
                            //, validateNonVisibleFields:false
                        }); 
                        if($('#sortable').length>0){
                            $( "#sortable" ).sortable({placeholder: "ui-state-highlight"});
                            $( "#sortable" ).disableSelection();
                        }
                    }
                }
            }).call();
        },
        'onSave': function(){
            if($('#<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
content').length==1)
                $('#<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
content').val(CKEDITOR.instances['<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
content'].getData());
            if( $('#entryForm').validationEngine('validate') === false){
                addNotice('Please complete required input.','info');
                return;
            }
            var Id = $('#EntryId').val();
            var Params =$('#entryForm').serializeObject();
            if($('#sortable').length>0){
                var images = $('#sortable img.thumb').map(function(){return $(this).attr('src')});
                Params.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
images = images.get().join('\r\n');
            }
            this.onCommit(_oConfig.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onRefresh();
                    <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onCancel();
                }
            });
        },
        'onCancel': function(){
            $('body').removeClass('is-entry');
        },
        'onDeleteItem': function(Id){
            ConfirmMsg(
                'Delete item ?',
                'These items will be permanently deleted and cannot be recovered. Are you sure ?',
                function(){
                    httpRequest({
                        'url': _oConfig.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onRefresh();
                            }
                        }
                    }).call();
                }
            );
        },
        'onRefresh': function(){
            // oTable.fnDraw(false);
            oTable.oApi._fnDraw( oTable.fnSettings() );
        },
        'changeStatus':function(status,Id){
            this.onCommit( _oConfig.entryCommitUri2, {
                '<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onRefresh();
                }
            });
        },
        'onLockItem':function(Id){
            this.onCommit( _oConfig.entryCommitUri2, {
                '<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onRefresh();
                }
            });
        },
        'choosePhotos': function(){
            openKCFinderMulti(function(files){
                for(var i in files){
                    $('#sortable').append(
                        '<li class="ui-state-default">'+
                            '<img class="thumb" src="'+files[i]+'"/>'+
                            '<div class="action cursor" title="Delete this photo" onclick="album.deletePhoto(this)">'+
                                '<i class="fa fa-trash-o"></i>'+
                            '</div>'+
                        '</li>'
                    );
                }
            })
        },
        'deletePhotos': function(){
            $('#sortable>li').hide(500,function(){$(this).remove()});
        },
        'deletePhoto': function(elm){
            $(elm).parents('li.ui-state-default').hide(500,function(){$(this).remove()});
        }
    };
}());
$(document).ready(function(){
    <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onInit();
});
<?php echo '</script'; ?>
><?php }} ?>
