var image_config = {
    'isMobile':false,
    'entryType':'lawyer',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/image/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/image/editpanel/',
    'entryCommitUri': base_url+'cms/cp/image/oncommit/',
    'entryDeleteUri': base_url+'cms/cp/image/ondelete/'
};
var image = (function() {
    var oTable, dtable, me = this, scrollTop = 0;
    return {
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
                        'mData': "Name"//,'sWidth': "180px"
                        , 'mRender': function ( value, type, datarow ) {
                            return tmpl("tmpl-entry", datarow);
                        }
                    }
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': true,
                'bServerSide': true,
                'bPaginate': true,
                'sAjaxSource': image_config.entryBindingUri+image_config.entryType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'osetting': {
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
            $('#iEntryDialog').html('...');
            httpRequest({
                'url'         :   image_config.entryEditUri + image_config.entryType,
                'data'        :   {
                    'Id'  :   Id
                },
                'callback'    :   function(rsdata){
                    if(rsdata.result<0){
                        $('body').removeClass('is-entry'); 
                        addNotice(rsdata.message,'danger');
                    }else{
                        $('#entry-container').html(rsdata.htmlreponse);
                        $('#entryForm').validationEngine({
                            'scroll': false,
                            validateNonVisibleFields:true
                        });
                        var dataType = $('#entryForm [name="DataType"]').val();
                        if(dataType == 'html')
                            if($('#EditorValue').length==1)
                                addEditorBasic('EditorValue',240);
                        $('#entryForm .selectpicker').selectpicker();
                        $('#entryForm').validationEngine({'scroll': false});
                        
                    }
                }
            }).call();
        },
        'onPopEditItem': function(Id){
            
            if (pending > 0)return;
            $('#iEntryDialog').html('...');
            $('#entry-container').html('...');
            httpRequest({
                'url'         :   image_config.entryEditUri + image_config.entryType,
                'data'        :   {
                    'Id'  :   Id
                },
                'callback'    :   function(rsdata){
                    if(rsdata.result<0){
                        addNotice(rsdata.message,'danger');
                    }else{
                        $('#iEntryDialog').html(rsdata.htmlreponse);
                        uidialog({
                            'message' : $('#iEntryDialog'),
                            'title': 'Setting !',
                            'width':'320px',
                            'type':'notice',
                            'buttons' : [{
                                'text': 'Done',
                                'class': 'ui-btn',
                                'click': function() {
                                    image.onSave();
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
            if( $('#entryForm').validationEngine('validate') === false)return;
            var Id = $('#EntryId').val();
            var Params =$('#entryForm').serializeObject();
            if(Params.DataType == 'html')
                if($('#EditorValue').length==1)
                    Params.Value = CKEDITOR.instances['EditorValue'].getData();
            this.onCommit(image_config.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    image.onRefresh();
                    image.onCancel();
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
                        'url': image_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                image.onRefresh();
                            }
                        }
                    }).call();
                }
            );
        },
        'onRefresh': function(){
            oTable.fnDraw(false);
        },
        'changeStatus':function(status,Id){
            this.onCommit( image_config.entryCommitUri, {
                'image_status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    image.onRefresh();
                }
            });
        },
        'onLockItem':function(Id){
            this.onCommit( image_config.entryCommitUri, {
                'Lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    image.onRefresh();
                }
            });
        },
        'onChangeSource': function(type){
            if(type!==image_config.entryType){
                image_config.entryType=type;
                oTable.fnSettings().sAjaxSource = (image_config.entryBindingUri+image_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'toggleElm': function(elm){
            $(elm).toggle();
        }
    };
}());
$(document).ready(function(){
    image.onInit();
});