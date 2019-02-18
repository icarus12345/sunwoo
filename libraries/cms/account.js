var account_config = {
    'isMobile':false,
    'entryType':'',
    'entryId': '',
    'entryBindingUri': base_url+'cms/account/bindingbytype/',
    'entryEditUri': base_url+'cms/account/editpanel/',
    'entryCommitUri': base_url+'cms/account/commit/',
    'entryDeleteUri': base_url+'cms/account/onDelete/'
};
var account = (function() {
    var oTable, dtable, me = this, scrollTop = 0;
    return {
        'oTable': function(){ return oTable;},
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
        'changeStatus':function(status,Id){
            this.onCommit( account_config.entryCommitUri, {
                'ause_status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    account.onRefresh();
                }
            });
        },
        'createtable' :   function(){
            oTable = $('#entryDatatable').dataTable({
                'aaSorting': [],
                'aoColumns': [
                    {
                        'mData': "ause_id",
                        'bSortable': false,
                        'mRender': function ( value, type, datarow ) {
                            return tmpl("tmpl-entry", datarow);
                        }
                    }
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': true,
                'bServerSide': true,
                'bPaginate': false,
                'bFilter': false,
                'sAjaxSource': account_config.entryBindingUri+account_config.entryType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'oaccount': {
                    'sSearch': "<span>Filter records:</span> _INPUT_",
                    'sLengthaccount': "<span>Show entries:</span> _account_",
                    'oPaginate': {
                        "sFirst": "First", 
                        "sLast": "Last", 
                        "sNext": ">", 
                        "sPrevious": "<"
                    }
                },
                'fnDrawCallback': function (oSettings) {
                    $(window).scrollTop(scrollTop); 
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
                'url'         :   account_config.entryEditUri + account_config.entryType,
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
                        $('#entryForm .selectpicker').selectpicker();
                        $('#entryForm').validationEngine({'scroll': false});
                    }
                }
            }).call();
        },
        'onSave': function(){
            if( $('#entryForm').validationEngine('validate') === false)return false;
            var Params = $('#entryForm').serializeObject();
            var Id = $('#ause_id').val();
            this.onCommit(account_config.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    account.onRefresh();
                    account.onCancel();
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
                        'url': account_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                account.onRefresh();
                            }
                        }
                    }).call();
                }
            );
        },
        'onRefresh': function(){
            scrollTop = $(window).scrollTop();
            oTable.fnDraw(false);
        },
        'onChangeSource': function(type){
            if(type!==account_config.entryType){
                account_config.entryType=type;
                oTable.fnSettings().sAjaxSource = (account_config.entryBindingUri+account_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'getNewPass': function(){
            var str = Math.random().toString(36).substring(10);
            document.entryForm.ause_password.value = str;
        }
    };
}());
$(document).ready(function(){
    account.onInit();
});