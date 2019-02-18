var content_config = {
    'isMobile':false,
    'cateType': '',
    'entryType':'',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/content/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/content/editpanel/',
    'entryCommitUri': base_url+'cms/cp/content/oncommit/',
    'entryDeleteUri': base_url+'cms/cp/content/ondelete/'
};
var content = (function() {
    var oTable, dtable, me = this, scrollTop = 0;
    return {
        'oTable': function(){return oTable;},
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
                        'mData': "content_title"//,'sWidth': "180px"
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
                'sAjaxSource': content_config.entryBindingUri + content_config.entryType + '/' + content_config.cateType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'ocontent': {
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
                'url'         :   content_config.entryEditUri + content_config.entryType + '/' + content_config.cateType,
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
                        if($('#content_content').length==1)
                            addEditorFeature('content_content',240);
                        $('#entryForm .selectpicker').selectpicker();
                        $('#entryForm').validationEngine({'scroll': false});
                        
                    }
                }
            }).call();
        },
        'onSave': function(){
            if( $('#entryForm').validationEngine('validate') === false)return false;
            var Id = $('#EntryId').val();
            var Params =$('#entryForm').serializeObject();
            if($('#content_content').length==1)
                Params.content_content = CKEDITOR.instances['content_content'].getData();
            this.onCommit(content_config.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    content.onRefresh();
                    content.onCancel();
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
                        'url': content_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                content.onRefresh();
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
            this.onCommit( content_config.entryCommitUri, {
                'content_status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    content.onRefresh();
                }
            });
        },
        'onLockItem':function(Id,Lock){
            this.onCommit( content_config.entryCommitUri, {
                'content_lock':Lock
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    content.onRefresh();
                }
            });
        },
        'onChangeSource': function(type){
            if(type!==content_config.entryType){
                content_config.entryType=type;
                oTable.fncontents().sAjaxSource = (content_config.entryBindingUri+content_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'toggleElm': function(elm){
            $(elm).toggle();
        }
    };
}());
$(document).ready(function(){
    content.onInit();
});