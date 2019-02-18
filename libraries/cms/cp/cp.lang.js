var language_config = {
    'isMobile':false,
    'entryType':'lawyer',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/lang/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/lang/editpanel/',
    'entryCommitUri': base_url+'cms/cp/lang/commit/',
    'entryDeleteUri': base_url+'cms/co/product/ondelete/'
};
var language = (function() {
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
        'changeStatus':function(that){
            if($(that).hasClass('fa-toggle-on'))
                $(that).removeClass('fa-toggle-on')
                    .addClass('fa-toggle-off');
            else
                $(that).removeClass('fa-toggle-off')
                    .addClass('fa-toggle-on');
        },
        'createtable' :   function(){
            oTable = $('#entryDatatable').dataTable({
                'aaSorting': [],
                'aoColumns': [
                    {
                        'mData': "lang_id",
                        'sWidth': "60px", 'bSortable': false,
                        'sClass':'gridAction',
                        'mRender': function ( value, type, datarow ) {
                            var str = 
                            '<ul class="table-controls">'+
                            //'<li><a href="JavaScript:" onclick="" title="Add entry" title="Add entry"><i class="fa fa-plus"></i></a> </li>'+
                            '<li><a href="JavaScript:" onclick="language.onEditItem(\'' + datarow.lang_key + '\')" title="Edit entry" ><i class="fa fa-edit"></i></a> </li>';
                            
                            str += '</ul>';
                            return str;
                        }
                    },
                    {
                        'mData': "lang_set",
                        'sWidth': "48px",
                        'sClass':'gridStatus',
                        'mRender': function ( value, type, datarow ) {
                            var elm = 
                                '<span '+ 
                                    'onclick="language.changeStatus(this,\'' + datarow.lang_key + '\')" '+
                                    'title="Click to turn on/off entry" ';
                            if(value == false) 
                                elm += 'class="fa fa-toggle-off"';
                            else
                                elm += 'class="fa fa-toggle-on"';
                            elm += '></span>';
                            return elm;
                        }
                    },
                    {
                        'mData': "lang_key"//,'sWidth': "180px"
                    },
                    {
                        'mData': "lang_text",'sClass':'hidden-mb hidden-xs'
                    }
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': true,
                'bServerSide': true,
                'bPaginate': true,
                'sAjaxSource': language_config.entryBindingUri+language_config.entryType,
                'bJQueryUI': false,
                'bAutoWidth': false,
                'sPaginationType': "full_numbers",
                //sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
                'oLanguage': {
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
        'onEditItem': function(key){
            if (pending > 0)return;
            $('body').addClass('is-entry');
            httpRequest({
                'url'         :   language_config.entryEditUri + language_config.entryType,
                'data'        :   {
                    'key'  :   key
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
                    }
                }
            }).call();
        },
        'onSave': function(){
            //if( $('#entry_info').validationEngine('validate') === false)return false;
            var lang_set = document.entryForm.lang_set.value;
            var lang_key = document.entryForm.lang_key.value;
            var langs = $('textarea[name="lang_text"]').map(function(){return this.getAttribute('data-lang')}).toArray();
            var lang_text = $('textarea[name="lang_text"]').map(function(){return this.value}).toArray();
            
            var Params = {
                'lang_set': lang_set,
                'lang_key': lang_key,
                'langs': langs,
                'lang_texts': lang_text
            };
            this.onCommit(language_config.entryCommitUri,Params,0,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    language.onRefresh();
                    language.onCancel();
                }
            });
        },
        'onCancel': function(){
            $('body').removeClass('is-entry'); 
        },
        'onDeleteItem': function(Id){
            backend_delete(language_config.entryDeleteUri,Id,function(){
                language.onRefresh();
            });
        },
        'onRefresh': function(){
            oTable.fnDraw(false);
        },
        'onStatusChange':function(that,Id){
            var status = $(that).hasClass('checked')?'false':'true';
            this.onCommit( language_config.entryCommitUri, {
                'album_status':status
            }, Id, function(rsdata){
                if(rsdata.result<0){
                    bckdialog({
                        'type':'error'
                    }).open(rsdata.message);
                }else{
                    $(that).toggleClass('checked');
                    $(that).next().html(status=='false'?'Disable':'Enable')
                }
            });
        },
        'onChangeSource': function(type){
            if(type!==language_config.entryType){
                language_config.entryType=type;
                oTable.fnSettings().sAjaxSource = (language_config.entryBindingUri+language_config.entryType);
                oTable.fnDraw(false);
            }
        },
        'toggleElm': function(elm){
            $(elm).toggle();
        }
    };
}());
$(document).ready(function(){
    language.onInit();
});