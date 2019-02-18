<?php /* Smarty version Smarty-3.1.21-dev, created on 2018-11-15 16:14:48
         compiled from "application\templates\cms\cp\setting\actScript.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18916965335bed39087c1964-65987005%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b84e13dce4298fd46c454cdc57d83aeb5ef2a35e' => 
    array (
      0 => 'application\\templates\\cms\\cp\\setting\\actScript.tpl',
      1 => 1433860059,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18916965335bed39087c1964-65987005',
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
  'unifunc' => 'content_5bed39088a2231_50184776',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed39088a2231_50184776')) {function content_5bed39088a2231_50184776($_smarty_tpl) {?><?php echo '<script'; ?>
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
/onCommit/',
    'entryDeleteUri': base_url+'cms/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['group'];?>
/<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['controller'];?>
/onDelete/'
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
        'onPopAddItem': function(Layout){
            this.onPopEditItem(0,Layout);
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
        'onPopEditItem': function(Id,Layout){
            
            if (pending > 0)return;
            $('#iEntryDialog').html('...');
            $('#entry-container').html('...');
            httpRequest({
                'url'         :   
                    _oConfig.entryEditUri +
                    _oConfig.entryType+'/'+
                    Layout,
                'data'        :   {
                    'Id'  :   Id,
                    layout: Layout
                },
                'callback'    :   function(rsdata){
                    if(rsdata.result<0){
                        addNotice(rsdata.message,'danger');
                    }else{
                        $('#iEntryDialog').html(rsdata.htmlreponse);
                        uidialog({
                            'message' : $('#iEntryDialog'),
                            'title': 'Setting !',
                            'width':'420px',
                            'type':'notice',
                            'buttons' : [{
                                'text': 'Done',
                                'class': 'ui-btn',
                                'click': function() {
                                    <?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['name'];?>
.onSave();
                                }
                            },{
                                'text': 'Cancel',
                                'class': 'ui-btn',
                                'click': function() {
                                    $(this).dialog("close");
                                }
                            }]
                        }).open();
                        $('#entryForm').validationEngine({
                            'scroll': false,
                            validateNonVisibleFields:true
                        });
                        $('#entryForm .selectpicker').selectpicker();
                        $('#entryForm').validationEngine({'scroll': false});
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
            if($('body').hasClass('is-entry')) 
                $('body').removeClass('is-entry'); 
            else
                $('#iEntryDialog').dialog("close");
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
            this.onCommit( _oConfig.entryCommitUri, {
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
            this.onCommit( _oConfig.entryCommitUri, {
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
