<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 17:20:55
         compiled from "application\templates\cms\cp\product\actScript.tpl" */ ?>
<?php /*%%SmartyHeaderCode:10784982995bed391105ab49-08262349%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6ad073d1ad96c1b9c9d9b1865034a4ce651ecf79' => 
    array (
      0 => 'application\\templates\\cms\\cp\\product\\actScript.tpl',
      1 => 1550485220,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '10784982995bed391105ab49-08262349',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5bed391111df06_38745658',
  'variables' => 
  array (
    'type' => 0,
    'tplConfig' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5bed391111df06_38745658')) {function content_5bed391111df06_38745658($_smarty_tpl) {?><?php echo '<script'; ?>
 type="text/javascript">
var _oConfig = {
    'showImage':false,
    'entryType':'<?php echo $_smarty_tpl->tpl_vars['type']->value;?>
',
    'cateType':'',
    'paginate':true,
    'entryId': '',
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
                'aoColumns': [
                    {
                        'mData': "<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
id"//,'sWidth': "180px"
                        , 'mRender': function ( value, type, datarow ) {
                            if(!_oConfig.showImage) datarow.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
thumb = null;
                            return tmpl("tmpl-entry", datarow);
                        }
                    }
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': _oConfig.paginate,
                'bServerSide': true,
                'bPaginate': true,
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
                        if($('[data-editor="basic"]').length){
                            $('[data-editor="basic"]').each(function(){
                                var id = $(this).attr('id');
                                addEditorBasic(id,240);
                            })
                        }
                        $('#entryForm .selectpicker').selectpicker();
                        $('#entryForm').validationEngine({
                            'scroll': false
                            , prettySelect : true
                            , validateNonVisibleFields:false
                        }); 
                        $('#entryForm .date').datetimepicker({
                            'pickDate': true,
                            'pickTime': true   ,
                            'dayOfWeekStart': 1
                        });
                        if($('#sortable').length == 1){
                            $( "#sortable" ).sortable({placeholder: "ui-state-highlight"});
                            $( "#sortable" ).disableSelection();
                        }

                        productopt_config.entryType = $('#product_token').val();
                        productopt.onInit();
                    }
                }
            }).call();
        },
        'onSave': function(){
            
            if($('[data-editor="basic"]').length){
                $('[data-editor="basic"]').each(function(){
                    var id = $(this).attr('id');
                    addEditorBasic(id,240);
                    $('#' + id).val(CKEDITOR.instances[id].getData());
                })
            }
            if( $('#entryForm').validationEngine('validate') === false){
                addNotice('Please complete required input.','info');
                return;
            }
            var Id = $('#EntryId').val();
            var Params =$('#entryForm').serializeObject();
            Params.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
features = Params.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
features.join(',')
            if($('#sortable').length == 1){
                var images = $('#sortable img.thumb').map(function(){return $(this).attr('src')});
                Params.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
images = images.get().join('\r\n');
            }
            
            // Params.<?php echo $_smarty_tpl->tpl_vars['tplConfig']->value['prefix'];?>
data = JSON.stringify( getProperties() );
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
