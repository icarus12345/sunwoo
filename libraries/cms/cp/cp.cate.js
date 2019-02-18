var category_config = {
    'isMobile':false,
    'entryType': '',
    'dataType': 'tree',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/cate/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/cate/editpanel/',
    'entryCommitUri': base_url+'cms/cp/cate/oncommit/',
    'entryCommitUri2': base_url+'cms/cp/cate/commit/',
    'entryDeleteUri': base_url+'cms/cp/cate/delete/'
};
var category = (function() {
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
        'changeStatus':function(that,Id){
            var status = $(that).hasClass('fa-toggle-on')?'false':'true';
            this.onCommit( category_config.entryCommitUri, {
                'cat_status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    if($(that).hasClass('fa-toggle-on'))
                        $(that).removeClass('fa-toggle-on')
                            .addClass('fa-toggle-off');
                    else
                        $(that).removeClass('fa-toggle-off')
                            .addClass('fa-toggle-on');
                }
            });
        },
        'onLockItem':function(Id){
            this.onCommit( category_config.entryCommitUri, {
                'cat_lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    category.onRefresh();
                }
            });
        },
        'createtable' :   function(){
            oTable = $('#entryDatatable').dataTable({
                'aaSorting': [],
                'aoColumns': [
                    {
                        'mData': "cat_id",
                        'sWidth': "36px", 'bSortable': false,
                        'sClass':'gridAction',
                        'mRender': function ( value, type, datarow ) {
                            return tmpl("tmpl-action-unit", datarow);
                        }
                    },
                    {
                        'mData': "cat_title",
                        'mRender': function ( value, type, datarow ) {
                            //return '----'.repeater(datarow.Level) + datarow.Title;
                            var rowstr = '';
                            rowstr += '<span style="float:left;padding-left:' +(28*datarow.cat_level) +'px">'
                                + '<i class="row-push"></i>'
                                + datarow.cat_title
                                + '</span>';
                            return rowstr;
                        }
                    },
                    {
                        'mData': "cat_parent",'sClass':'hidden-mb hidden-xs',
                        'mRender': function ( value, type, datarow ) {
                            return datarow.cat_parent_title;
                        }
                    },
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': true,
                'bServerSide': true,
                'bPaginate': false,
                'bFilter': false,
                'sAjaxSource': category_config.entryBindingUri+category_config.entryType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'ocategory': {
                    'sSearch': "<span>Filter records:</span> _INPUT_",
                    'sLengthMenu': "<span>Show entries:</span> _MENU_",
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
                'url'         :   category_config.entryEditUri + category_config.entryType,
                'data'        :   {
                    'Id'  :   Id,
                    'dataType': category_config.dataType
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
                    }
                }
            }).call();
        },
        'onSave': function(){
            if( $('#entryForm').validationEngine('validate') === false)return false;
            var Params = $('#entryForm').serializeObject();
            var Id = $('#cate_id').val();
            this.onCommit(category_config.entryCommitUri2,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    category.onRefresh();
                    category.onCancel();
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
                        'url': category_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                category.onRefresh();
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
            if(type!==category_config.entryType){
                category_config.entryType=type;
                oTable.fnSettings().sAjaxSource = (category_config.entryBindingUri+category_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'toggleElm': function(elm){
            $(elm).toggle();
        }
    };
}());
$(document).ready(function(){
    category.onInit();
});