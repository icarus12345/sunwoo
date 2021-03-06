<script type="text/javascript">
var _oConfig = {
    'showImage':false,
    'entryType':'[{$type}]',
    'cateType':'',
    'entryId': '',
    'dataColumns':[],
    'paginate':true,
    'entryBindingUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/bindingbytype/',
    'entryEditUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/editpanel/',
    'entryCommitUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/onCommit/',
    'entryDeleteUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/onDelete/'
};
var [{$tplConfig.name}] = (function() {
    var oTable, dtable, me = this, scrollTop = 0;
    return {
        'toggleImage': function(){
            var column = oTable.column( 2 );
            // Toggle the visibility
            column.visible( ! column.visible() );
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
            oTable = $('#entryDatatable').DataTable({
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
            // oTable.fnSetFilteringDelay(2000);
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
                        if($('#[{$tplConfig.prefix}]content').length==1)
                            addEditorBasic('[{$tplConfig.prefix}]content',240);
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
                                    [{$tplConfig.name}].onSave();
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
            if($('#[{$tplConfig.prefix}]content').length==1)
                $('#[{$tplConfig.prefix}]content').val(CKEDITOR.instances['[{$tplConfig.prefix}]content'].getData());
            if( $('#entryForm').validationEngine('validate') === false){
                addNotice('Please complete required input.','info');
                return;
            }
            var Id = $('#EntryId').val();
            var Params =$('#entryForm').serializeObject();
            if($('#sortable').length>0){
                var images = $('#sortable img.thumb').map(function(){return $(this).attr('src')});
                Params.[{$tplConfig.prefix}]images = images.get().join('\r\n');
            }
            this.onCommit(_oConfig.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    [{$tplConfig.name}].onRefresh();
                    [{$tplConfig.name}].onCancel();
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
                                [{$tplConfig.name}].onRefresh();
                            }
                        }
                    }).call();
                }
            );
        },
        'onRefresh': function(){
            // oTable.fnDraw(false);
            oTable.ajax.reload();
        },
        'changeStatus':function(status,Id){
            this.onCommit( _oConfig.entryCommitUri, {
                '[{$tplConfig.prefix}]status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    [{$tplConfig.name}].onRefresh();
                }
            });
        },
        'onLockItem':function(Id){
            this.onCommit( _oConfig.entryCommitUri, {
                '[{$tplConfig.prefix}]lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    [{$tplConfig.name}].onRefresh();
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
    [{$tplConfig.name}].onInit();
});
</script>