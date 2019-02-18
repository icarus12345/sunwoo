var menu_config = {
    'isMobile':false,
    'entryType':'',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/menu/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/menu/editpanel/',
    'entryCommitUri': base_url+'cms/cp/menu/oncommit/',
    'entryCommitUri2': base_url+'cms/cp/menu/commit/',
    'entryDeleteUri': base_url+'cms/cp/menu/delete/',
    'applyUri': base_url+'cms/cp/menu/menugender/'
};
var menu = (function() {
    var oTable, dtable, me = this, scrollTop = 0;
    return {
        'onApply': function(){
            this.onCommit(menu_config.applyUri)
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
        'changeStatus':function(that,Id){
            var status = $(that).hasClass('fa-toggle-on')?'false':'true';
            this.onCommit( menu_config.entryCommitUri, {
                'menu_status':status
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
            this.onCommit( menu_config.entryCommitUri, {
                'menu_lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    menu.onRefresh();
                }
            });
        },
        'createtable' :   function(){
            oTable = $('#entryDatatable').dataTable({
                'aaSorting': [],
                'aoColumns': [
                    {
                        'mData': "menu_id",
                        'sWidth': "36px", 'bSortable': false,
                        'sClass':'gridAction',
                        'mRender': function ( value, type, datarow ) {
                            var str = 
                            '<ul class="table-controls">'+
                                '<li><a href="JavaScript:" onclick="menu.onEditItem(\'' + value + '\')" title="Edit entry (' + value + ')" ><i class="fa fa-edit"></i></a> </li>';
                            if(datarow.menu_lock!=='true'){
                                str += '<li><a href="JavaScript:" onclick="menu.onDeleteItem(\'' + value + '\')" title="Delete entry (' + value + ')" ><i class="fa fa-trash-o"></i></a> </li>';
                                str += '<li><a href="JavaScript:" onclick="menu.onLockItem(\'' + value + '\')" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i></a> </li>';
                            }
                            str += '</ul>';
                            return str;
                        }
                    },
                    {
                        'mData': "menu_status",
                        'sWidth': "36px",
                        'sClass':'gridStatus',
                        'mRender': function ( value, type, datarow ) {
                            var elm = 
                                '<span '+ 
                                    'onclick="menu.changeStatus(this,\'' + datarow.menu_id + '\')" '+
                                    'title="Click to turn on/off entry" ';
                            if(value == 'false') 
                                elm += 'class="fa fa-toggle-off"';
                            else
                                elm += 'class="fa fa-toggle-on"';
                            elm += '></span>';
                            return elm;
                        }
                    },
                    {
                        'mData': "menu_title",
                        'mRender': function ( value, type, datarow ) {
                            //return '----'.repeater(datarow.Level) + datarow.Title;
                            var rowstr = '';
                            rowstr += '<span style="float:left;padding-left:' +(28*datarow.menu_level) +'px">'
                                + '<i class="row-push"></i>'
                                + datarow.menu_title
                                + '</span>';
                            return rowstr;
                        }
                    }
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': true,
                'bServerSide': true,
                'bPaginate': false,
                'bFilter': false,
                'sAjaxSource': menu_config.entryBindingUri+menu_config.entryType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'omenu': {
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
                'url'         :   menu_config.entryEditUri + menu_config.entryType,
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
                    }
                }
            }).call();
        },
        'onSave': function(){
            if( $('#entryForm').validationEngine('validate') === false)return false;
            var Params = $('#entryForm').serializeObject();
            var Id = $('#menu_id').val();
            this.onCommit(menu_config.entryCommitUri2,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    menu.onRefresh();
                    menu.onCancel();
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
                        'url': menu_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                menu.onRefresh();
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
            if(type!==menu_config.entryType){
                menu_config.entryType=type;
                oTable.fnSettings().sAjaxSource = (menu_config.entryBindingUri+menu_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'toggleElm': function(elm){
            $(elm).toggle();
        }
    };
}());
$(document).ready(function(){
    menu.onInit();
});