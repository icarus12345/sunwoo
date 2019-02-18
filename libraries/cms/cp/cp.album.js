var album_config = {
    'isMobile':false,
    'entryType':'',
    'cateType':'',
    'entryId': '',
    'entryBindingUri': base_url+'cms/cp/album/bindingbytype/',
    'entryEditUri': base_url+'cms/cp/album/editpanel/',
    'entryCommitUri': base_url+'cms/cp/album/oncommit/',
    'entryDeleteUri': base_url+'cms/cp/album/ondelete/'
};
var album = (function() {
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
                        'mData': "album_title"//,'sWidth': "180px"
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
                'sAjaxSource': 
                    album_config.entryBindingUri+
                    album_config.entryType+'/'+
                    album_config.cateType,
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
                'url'         :   
                    album_config.entryEditUri +
                    album_config.entryType+'/'+
                    album_config.cateType,
                'data'        :   {
                    'Id'  :   Id
                },
                'callback'    :   function(rsdata){
                    if(rsdata.result<0){
                        $('body').removeClass('is-entry');
                        addNotice(rsdata.message,'danger');
                    }else{
                        $('#entry-container').html(rsdata.htmlreponse);
                        if($('#album_content').length==1)
                            addEditorBasic('album_content',240);
                        $('#entryForm .selectpicker').selectpicker();
                        $('#entryForm').validationEngine({
                            'scroll': false
                            , prettySelect : true
                            //, validateNonVisibleFields:false
                        }); 
                        $( "#sortable" ).sortable({placeholder: "ui-state-highlight"});
                        $( "#sortable" ).disableSelection();
                        productopt_config.entryType = $('#album_token').val();
                        productopt.onInit();
                    }
                }
            }).call();
        },
        'onSave': function(){
            if($('#album_content').length==1)
                $('#album_content').val(CKEDITOR.instances['album_content'].getData());
            if( $('#entryForm').validationEngine('validate') === false){
                addNotice('Please complete required input.','info');
                return;
            }
            var Id = $('#EntryId').val();
            var Params =$('#entryForm').serializeObject();
            if($('#album_content').length==1)
                Params.album_content = CKEDITOR.instances['album_content'].getData();
            var images = $('#sortable img.thumb').map(function(){return $(this).attr('src')});
            Params.album_images = images.get().join('\r\n');
            console.log(Params.album_images)
            this.onCommit(album_config.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    album.onRefresh();
                    album.onCancel();
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
                        'url': album_config.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                album.onRefresh();
                            }
                        }
                    }).call();
                }
            );
        },
        'onRefresh': function(){
            // oTable.fnDraw(false);
            oTable.oApi._fnDraw( oTable.fnSettings() );
        },
        'changeStatus':function(status,Id){
            this.onCommit( album_config.entryCommitUri, {
                'album_status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    album.onRefresh();
                }
            });
        },
        'onLockItem':function(Id){
            this.onCommit( album_config.entryCommitUri, {
                'album_lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    album.onRefresh();
                }
            });
        },
        'onChangeSource': function(type){
            if(type!==album_config.entryType){
                album_config.entryType=type;
                oTable.fnalbums().sAjaxSource = (album_config.entryBindingUri+album_config.entryType);
                oTable.oApi._fnDraw( oTable.fnSettings() );
            }
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
    album.onInit();
});