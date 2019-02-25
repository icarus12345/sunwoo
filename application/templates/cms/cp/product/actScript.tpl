<script type="text/javascript">
var _oConfig = {
    'showImage':false,
    'entryType':'[{$type}]',
    'cateType':'',
    'paginate':true,
    'entryId': '',
    'entryBindingUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/bindingbytype/',
    'entryEditUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/editpanel/',
    'entryCommitUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/onCommit/',
    'entryDeleteUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/onDelete/'
};
var [{$tplConfig.name}] = (function() {
    var oTable, dtable, me = this, scrollTop = 0;
    return {
        'toggleImage': function(){
            _oConfig.showImage = !_oConfig.showImage;
            this.onRefresh();
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
        'createtable' :   function(){
            oTable = $('#entryDatatable').dataTable({
                'aaSorting': [],
                'aoColumns': [
                    {
                        'mData': "[{$tplConfig.prefix}]id"//,'sWidth': "180px"
                        , 'mRender': function ( value, type, datarow ) {
                            if(!_oConfig.showImage) datarow.[{$tplConfig.prefix}]thumb = null;
                            return tmpl("tmpl-entry", datarow);
                        }
                    }
                ],
                'sServerMethod': "POST",
                'iDisplayLength': 10,
                'bProcessing': _oConfig.paginate,
                'bServerSide': true,
                'bPaginate': true,
                'sAjaxSource': 
                    _oConfig.entryBindingUri+
                    _oConfig.entryType+'/'+
                    _oConfig.cateType,
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
                    _oConfig.entryEditUri +
                    _oConfig.entryType+'/'+
                    _oConfig.cateType,
                'data'        :   {
                    'Id'  :   Id
                },
                'callback'    :   function(rsdata){
                    if(rsdata.result<0){
                        $('body').removeClass('is-entry');
                        addNotice(rsdata.message,'danger');
                    }else{
                        $('#entry-container').html(rsdata.htmlreponse);

                        if($('[data-editor="basic"]').length){
                            $('[data-editor="basic"]').each(function(){
                                var id = $(this).attr('id');
                                addEditorBasic(id,240);
                            })
                        }
                        $('#entryForm .selectpicker').selectpicker();

                        $('#entryForm').validationEngine({
                            'scroll': false
                            , prettySelect : true
                            , validateNonVisibleFields:false
                        }); 
                        $('#entryForm .date').datetimepicker({
                            'pickDate': true,
                            'pickTime': true   ,
                            'dayOfWeekStart': 1
                        });
                        if($('#sortable').length == 1){
                            $( "#sortable" ).sortable({placeholder: "ui-state-highlight"});
                            $( "#sortable" ).disableSelection();
                        }
                        var frm = $('#entryForm')
                        setTimeout(function(){
                            frm.find('[data-googlemap]').get().map(function(elm){
                                console.log($(elm).data('latcolumn'),'latclm')
                                console.log($(elm).data('loncolumn'),'loncolumn')
                                App.AddGoogleMap(elm,function(e){
                                    console.log(e)
                                    frm.find('input[name="'+$(elm).data('latcolumn')+'"]').val(e.latLng.lat());
                                    frm.find('input[name="'+$(elm).data('loncolumn')+'"]').val(e.latLng.lng());
                                    frm.find('span[data-latlonpreview="'+$(elm).data('latcolumn')+$(elm).data('loncolumn')+'"]').text(e.latLng.lat() + ' ' + e.latLng.lng());
                                    var address_input = $(elm).data('address-input');
                                    if(address_input){
                                        App.getAddress(e.latLng.lat(),e.latLng.lng(),function(res){
                                            if(res && res.results && res.results[0]){
                                                console.log(res.results[0].formatted_address,address_input)
                                                $('#'+address_input).val(res.results[0].formatted_address)
                                            }else{
                                                $('#'+address_input).val('')
                                                console.log('Unkown address')
                                            }
                                        })
                                    }
                                    //https://maps.googleapis.com/maps/api/geocode/json?latlng=10.759171651626405,106.42599052008768&sensor=false&key=AIzaSyBWqKci2rs1gaHG2PlcHjpMqef3XiQiJOw
                                })
                            })
                        },500)

                        productopt_config.entryType = $('#product_token').val();
                        productopt.onInit();
                    }
                }
            }).call();
        },
        'onSave': function(){
            
            if($('[data-editor="basic"]').length){
                $('[data-editor="basic"]').each(function(){
                    var id = $(this).attr('id');
                    $('#' + id).val(CKEDITOR.instances[id].getData());
                })
            }
            if( $('#entryForm').validationEngine('validate') === false){
                addNotice('Please complete required input.','info');
                return;
            }
            var Id = $('#EntryId').val();
            var Params =$('#entryForm').serializeObject();
            Params.[{$tplConfig.prefix}]features = (Params.[{$tplConfig.prefix}]features||[]).join(',')
            if($('#sortable').length == 1){
                var images = $('#sortable img.thumb').map(function(){return $(this).attr('src')});
                Params.[{$tplConfig.prefix}]images = images.get().join('\r\n');
            }
            
            // Params.[{$tplConfig.prefix}]data = JSON.stringify( getProperties() );
            this.onCommit(_oConfig.entryCommitUri,Params,Id,function(rsdata){
                if(rsdata.result<0){
                    addNotice(rsdata.message,'danger');
                }else{
                    [{$tplConfig.name}].onRefresh();
                    [{$tplConfig.name}].onCancel();
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
                        'url': _oConfig.entryDeleteUri,
                        'data': {
                            'Id': Id
                        },
                        'callback': function(rsdata) {
                            if (rsdata.result < 0) {
                                addNotice(rsdata.message,'danger');
                            } else {
                                addNotice(rsdata.message,'info');
                                [{$tplConfig.name}].onRefresh();
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
            this.onCommit( _oConfig.entryCommitUri, {
                '[{$tplConfig.prefix}]status':status
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    [{$tplConfig.name}].onRefresh();
                }
            });
        },
        'onLockItem':function(Id){
            this.onCommit( _oConfig.entryCommitUri, {
                '[{$tplConfig.prefix}]lock':'true'
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    [{$tplConfig.name}].onRefresh();
                }
            });
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
    [{$tplConfig.name}].onInit();
});
</script>