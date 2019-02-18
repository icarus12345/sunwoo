var contactus_config = {
    'isMobile':false,
    'entryType':'',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/contactus/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/contactus/editpanel/',
    'entryCommitUri': base_url+'cms/cp/contactus/oncommit/',
    'entryDeleteUri': base_url+'cms/cp/contactus/ondelete/'
};
var contactus = (function() {
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
                        'mData': "contact_id",
                        'sWidth': "36px", 'bSortable': false,
                        'sClass':'gridAction',
                        'mRender': function ( value, type, datarow ) {
                            return tmpl("tmpl-action-unit", datarow);
                        }
                    },
                    {

                        'mData': "contact_subject",
                        'mRender': function ( value, type, datarow ) {
                            var str = datarow.contact_name +
                                '<span class="code">'+datarow.contact_email+'</span> '+
                                '<span class="c-gray" style="font-size:11px">at '+datarow.contact_insert+'</span><br/>'+
                                datarow.contact_subject;
                            return str;
                        }
                    }
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': true,
                'bServerSide': true,
                'bPaginate': true,
                'sAjaxSource': contactus_config.entryBindingUri+contactus_config.entryType,
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
                'url'         :   contactus_config.entryEditUri + contactus_config.entryType,
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
        'onPopAddItem': function(Layout){
            this.onPopEditItem(0,Layout);
        },
        'onPopEditItem': function(Id,Layout){
            
            if (pending > 0)return;
            $('#iEntryDialog').html('...');
            $('#entry-container').html('...');
            httpRequest({
                'url'         :   contactus_config.entryEditUri + contactus_config.entryType + '/?layout='+Layout,
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
                            'title': 'Message !',
                            'width':'320px',
                            'type':'notice',
                            'buttons' : [{
                                'text': 'Done',
                                'class': 'ui-btn',
                                'click': function() {
                                    contactus.onSave();
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
            this.onCommit(contactus_config.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    contactus.onRefresh();
                    contactus.onCancel();
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
                        'url': contactus_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                contactus.onRefresh();
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
            this.onCommit( contactus_config.entryCommitUri, {
                'Status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    contactus.onRefresh();
                }
            });
        },
        'onLockItem':function(Id,status){
            this.onCommit( contactus_config.entryCommitUri, {
                'Lock':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    contactus.onRefresh();
                }
            });
        },
        'onChangeSource': function(type){
            if(type!==contactus_config.entryType){
                contactus_config.entryType=type;
                oTable.fnSettings().sAjaxSource = (contactus_config.entryBindingUri+contactus_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'toggleElm': function(elm){
            $(elm).toggle();
        }
    };
}());
$(document).ready(function(){
    contactus.onInit();
});