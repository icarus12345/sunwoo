var site_config = {
    'isMobile':false,
    'entryType':'',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/webpage/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/webpage/editpanel/',
    'entryCommitUri': base_url+'cms/cp/webpage/oncommit/',
    'entryDeleteUri': base_url+'cms/cp/webpage/ondelete/'
};
var site = (function() {
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
                        'mData': "site_title"//,'sWidth': "180px"
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
                'sAjaxSource': site_config.entryBindingUri+site_config.entryType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'osite': {
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
                'url'         :   site_config.entryEditUri + site_config.entryType,
                'data'        :   {
                    'Id'  :   Id
                },
                'callback'    :   function(rsdata){
                    if(rsdata.result<0){
                        $('body').removeClass('is-entry');
                        addNotice(rsdata.message,'danger');
                    }else{
                        $('#entry-container').html(rsdata.htmlreponse);
                        if($('#site_content').length==1)
                            addEditorBasic('site_content',240);
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
            if($('#site_content').length==1)
                Params.site_content = CKEDITOR.instances['site_content'].getData();
            this.onCommit(site_config.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    site.onRefresh();
                    site.onCancel();
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
                        'url': site_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                site.onRefresh();
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
            this.onCommit( site_config.entryCommitUri, {
                'site_status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    site.onRefresh();
                }
            });
        },
        'onLockItem':function(Id){
            this.onCommit( site_config.entryCommitUri, {
                'site_lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    site.onRefresh();
                }
            });
        },
        'onChangeSource': function(type){
            if(type!==site_config.entryType){
                site_config.entryType=type;
                oTable.fnsites().sAjaxSource = (site_config.entryBindingUri+site_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'initEditor': function(elm){
            addEditorBasic('site_content',240);
            $('#entryForm .selectpicker').selectpicker();
            $('#entryForm').validationEngine({'scroll': false});
        }
    };
}());
$(document).ready(function(){
    site.onInit();
});