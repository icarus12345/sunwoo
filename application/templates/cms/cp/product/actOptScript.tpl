<script type="text/javascript">
var productopt_config = {
    'entryType':'',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/opt/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/opt/editpanel/',
    'entryCommitUri': base_url+'cms/cp/opt/oncommit/',
    'entryDeleteUri': base_url+'cms/cp/opt/ondelete/'
};
var productopt = (function() {
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
            oTable = $('#entryOptDatatable').dataTable({
                'aaSorting': [],
                'aoColumns': [
                    {
                        'mData': "opt_id",
                        'sWidth': "60px", 'bSortable': false,
                        'sClass':'gridAction',
                        'mRender': function ( value, type, datarow ) {
                            var str = 
                            '<ul class="table-controls">'+
                            //'<li><a href="JavaScript:" onclick="" title="Add entry" title="Add entry"><i class="fa fa-plus"></i></a> </li>'+
                            '<li><a href="JavaScript:" onclick="productopt.onEditItem(\'' + value + '\')" title="Edit entry" ><i class="fa fa-edit"></i></a> </li>'+
                            '<li><a href="JavaScript:" onclick="productopt.onDeleteItem(\'' + value + '\')" title="Delete entry" ><i class="fa fa-trash-o"></i></a> </li>';
                            
                            str += '</ul>';
                            return str;
                        }
                    },
                    {
                        'mData': "opt_status",
                        'sWidth': "48px",
                        'sClass':'gridStatus',
                        'mRender': function ( value, type, datarow ) {
                            var elm = 
                                '<span '+ 
                                    'onclick="productopt.changeStatus(this,\'' + datarow.opt_id + '\')" '+
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
                        'mData': "opt_name"//,'sWidth': "180px"
                        , 'mRender': function ( value, type, datarow ) {
                            return value;//tmpl("tmpl-entry", datarow);
                        }
                    },
                    {
                        'mData': "opt_price",'sWidth': "100px"
                    },
                    {
                        'mData': "opt_amount",'sWidth': "60px"
                    },
                    {
                        'mData': "opt_color",'sWidth': "70px"
                        , 'mRender': function ( value, type, datarow ) {
                            return '<span class="opt-color" style="background:'+value+'"></span>';
                        }
                    },
                    {
                        'mData': "opt_size",'sWidth': "60px"
                    }
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': true,
                'bServerSide': true,
                'bPaginate': false,
                'bFilter': false,
                'sAjaxSource': productopt_config.entryBindingUri+productopt_config.entryType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'oproductopt': {
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
            $('#iEntryDialog').html('...');
            httpRequest({
                'url'         :   productopt_config.entryEditUri + productopt_config.entryType,
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
                            'title': 'Product Option Setting !',
                            'width':'320px',
                            'type':'notice',
                            'buttons' : [{
                                'text': 'Done',
                                'class': 'ui-btn',
                                'click': function() {
                                    productopt.onSave();
                                }
                            },{
                                'text': 'Cancel',
                                'class': 'ui-btn',
                                'click': function() {
                                    $(this).dialog("close");
                                }
                            }]
                        }).open();
                        $('#entryOptForm').validationEngine({
                            'scroll': false
                            , 'isPopup' : true
                            , validateNonVisibleFields:true
                        });
                        $('#entryOptForm .selectpicker').selectpicker();
                        $('#entryOptForm').validationEngine({'scroll': false});
                        $('#entryOptForm .colorpicker').colorpicker();
                    }
                }
            }).call();
        },
        'onSave': function(){
            if( $('#entryOptForm').validationEngine('validate') === false)return false;
            var Id = $('#EntryOptId').val();
            var Params =$('#entryOptForm').serializeObject();
            this.onCommit(productopt_config.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    productopt.onRefresh();
                    productopt.onCancel();
                }
            });
        },
        'onCancel': function(){
            $('#iEntryDialog').dialog('close');
        },
        'onDeleteItem': function(Id){
            ConfirmMsg(
                'Delete item ?',
                'These items will be permanently deleted and cannot be recovered. Are you sure ?',
                function(){
                    httpRequest({
                        'url': productopt_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                productopt.onRefresh();
                            }
                        }
                    }).call();
                }
            );
        },
        'onRefresh': function(){
            oTable.fnDraw(false);
        },
        'changeStatus':function(that,Id){
            var status = 'true';
            if($(that).hasClass('fa-toggle-on')){
                $(that).removeClass('fa-toggle-on')
                    .addClass('fa-toggle-off');
                status = 'false';
            }else
                $(that).removeClass('fa-toggle-off')
                    .addClass('fa-toggle-on');
                    
            this.onCommit( productopt_config.entryCommitUri, {
                'opt_status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    //productopt.onRefresh();
                }
            });
        },
        'onLockItem':function(Id){
            this.onCommit( productopt_config.entryCommitUri, {
                'productopt_lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    productopt.onRefresh();
                }
            });
        },
        'onChangeSource': function(type){
            if(type!==productopt_config.entryType){
                productopt_config.entryType=type;
                oTable.fnproductopts().sAjaxSource = (productopt_config.entryBindingUri+productopt_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'initEditor': function(elm){
            addEditorBasic('productopt_content',240);
            $('#entryForm .selectpicker').selectpicker();
            $('#entryForm').validationEngine({'scroll': false});
        }
    };
}());
</script>