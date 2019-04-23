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
    'entryDeleteUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/onDelete/',
    'putontopUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/putontop/',
    'putupUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/putup/',
    'putdownUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/putdown/',
};
_oConfig.dataColumns = [
        {
            'data': "[{$tplConfig.prefix}]id",
            // 'width': "80px", 
            'bSortable': false,
            'sClass':'action-dropdown',
            'render': function ( value, type, datarow ) {
                var str = '';
                [{if $unit}]
                var menu = [];
                [{if $unit|strpos:".e."!==false}] 
                menu.push('<li onclick="[{$tplConfig.name}].onEditItem(\'' + value + '\')"><a href="#"><i class="fa fa-pencil-alt"></i> Edit</a></li>')
                [{/if}]
                [{if $unit|strpos:".d."!==false}]
                if(datarow.[{$tplConfig.prefix}]readonly!=='true'){
                    menu.push('<li ><a href="#" onclick="[{$tplConfig.name}].onDeleteItem(\'' + value + '\')"><i class="fa fa-trash-alt"></i> Delete</a></li>')
                }else{
                    menu.push('<li class="disabled"><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>')
                    
                }
                [{else}]
                    menu.push('<li class="disabled"><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>')
                [{/if}]
                [{if $unit|strpos:".l."!==false}]
                if(+datarow.[{$tplConfig.prefix}]readonly){
                    menu.push('<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onLockItem(\'' + value + '\')" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i> Lock</a> </li>');
                }else{
                    menu.push('<li class="disabled"><a href="JavaScript:" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i> Lock</a> </li>');

                }
                [{else}]
                    menu.push('<li class="disabled"><a href="JavaScript:" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i> Lock</a> </li>');
                [{/if}]
                str += [
                '<div class="btn-group">',
                  '<button type="button" class="btn btn-default btn-sm" [{if $unit|strpos:".e."!==false}] onclick="[{$tplConfig.name}].onEditItem(\'' + value + '\')"[{/if}]><i class="fa fa-pencil-alt"></i> Edit</button>',
                  '<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">',
                    '<span class="caret"></span>',
                    '<span class="sr-only">Toggle Dropdown</span>',
                  '</button>',
                  '<ul class="dropdown-menu">',
                    menu.join(''),
                    
                    '<li role="separator" class="divider"></li>',
                    '<li><a href="#" onclick="App.SEO(\'product\',\'' + value + '\')" ><i class="fa fa-hashtag"></i> SEO</a></li>',
                    '<li role="separator" class="divider"></li>',
                    '<li><a href="#" onclick="[{$tplConfig.name}].putontop(\'' + value + '\')" ><i class="fa fa-arrow-up"></i> Put on top</a></li>',
                    '<li><a href="#" onclick="[{$tplConfig.name}].putup(\'' + value + '\')"><i class="fa fa-arrow-up"></i> Put up</a></li>',
                    '<li><a href="#" onclick="[{$tplConfig.name}].putdown(\'' + value + '\')"><i class="fa fa-arrow-down"></i> Put down</a></li>',
                  '</ul>',
                '</div>',
                ].join('')
                [{/if}]
                return str;
            }
        },
        {
            'data': "[{$tplConfig.prefix}]status",
            'width': "48px",
            'sClass':'cb-column w36',
            render: function ( value, type, row ) {
                var str = [
                    '<label class="cb">',
                    '<input type="checkbox" ',
                        (+value?'checked':'')
                        ];
                        [{if $unit}]
                            [{if $unit|strpos:".e."!==false}]
                                if(!+row.[{$tplConfig.prefix}]readonly){
                                    var status = +(!+row.[{$tplConfig.prefix}]status)
                                str.push(' onclick="[{$tplConfig.name}].changeStatus('+status+',\'' + row.[{$tplConfig.prefix}]id + '\')" ')
                                }else{
                                    str.push('disabled');
                                }
                            [{else}]
                                str.push('disabled');
                            [{/if}]
                        [{else}]
                            str.push('disabled');
                        [{/if}]
                    str.push('><span></span></label>');
                return str.join(' ');
            },
        },{
            'data': "[{$tplConfig.prefix}]image",'sClass': "gridThumb",'width': "40",
            "visible": _oConfig.showImage,
            'render': function ( value, type, datarow ) {
                if(value)
                    return '<div style="height:32px;width:52px;background-image:url('+value+')" class="bg-cover"/>';
                else return '';
            }
        },{
            'data': "[{$tplConfig.prefix}]title",'width': "120px",'sWidth': "240px",
            'render': function ( value, type, datarow ) {
                var str= '';
                // if(datarow.cat_title && datarow.cat_title !='')
                //     str+='<span class="code">' + datarow.cat_title + '</span>';
                str+=value;
                return str;
            }
        },{
            'data': "cat_title",'width': "120"
        },{
            'data': "supplier_title",'width': "120"
        },{
            'data': "[{$tplConfig.prefix}]code",'width': "120"
        },{
            'data': "[{$tplConfig.prefix}]owner",'width': "120"
        },{
            'data': "[{$tplConfig.prefix}]price",'width': "120",
            render:function ( value, type, datarow ) {
                return value + 'K'
            }
        },{
            'data': "[{$tplConfig.prefix}]discount",'width': "60",
            render:function ( value, type, datarow ) {
                return value + 'K'
            }
        },{
            'data': "[{$tplConfig.prefix}]label",'width': "60"
        },{
            'data': "[{$tplConfig.prefix}]created_at",'width': "126",
        },{
            'data': "[{$tplConfig.prefix}]modified_at",'width': "126",
        }
    ];
var [{$tplConfig.name}] = (function() {
    var oTable, dtable, me = this, scrollTop = 0;
    return {
        'toggleImage': function(){
            _oConfig.showImage = !_oConfig.showImage;
            // this.onRefresh();
            // Get the column API object
            console.log(oTable)
            var column = oTable.column( 2 );
            // Toggle the visibility
            column.visible( ! column.visible() );
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
            oTable = $('#entryDatatable').DataTable({
                'aaSorting': [],
                'aoColumns': _oConfig.dataColumns,
                'sServerMethod': "POST",
                'iDisplayLength': 25,
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
                },
                initComplete: function () {
                    $( oTable.table().container() ).on( 'enterKey change', 'thead input,thead select', function () {
                        var index = $(this).data('index')
                        console.log(index,'index')
                        if ( oTable.column(index).search() !== this.value ) {
                            oTable
                                .column( index )
                                .search( this.value )
                                .draw();
                        }
                    } );
                    setTimeout(function(){
                    $('.filter-rows input[type="checkbox"]').each(function(){
                        var index = $(this).data('index')
                        var cb = $(this).checkbox()
                        cb.chbxChecked(null);
                        cb.on('check', function(e){
                            var checked = e.checked;
                            oTable
                                .column( index )
                                .search( checked===null?'':+checked )
                                .draw();
                        });
                    });
                    //     $('#entryDatatable_wrapper thead tr td').each( function (i) {
                     
                    //         $( 'input,select', this ).on( 'enterKey change', function () {
                    //             if ( oTable.column(i+1).search() !== this.value ) {
                    //                 oTable
                    //                     .column(i+1)
                    //                     .search( this.value )
                    //                     .draw();
                    //             }
                    //         } );
                    //     } );
                    },120)
                },
                scrollX:        true,
                scrollCollapse: true,
                fixedColumns:   {
                    leftColumns: 4
                },
                orderCellsTop: true,
                "columnDefs": [
                  { "width": "240px", "targets": 3 },
                  { "width": "120px", "targets": 4 },
                  { "width": "120px", "targets": 5 }
                ],
            });
                // oTable.columns().every( function () {
                //     var column = this;
                //     var timer;
                //     var index = $(this.header()).index();
                //     var head_column = $('#entryDatatable_wrapper .filter-rows td:eq('+index+')')
                //     console.log(this.header(),'HEADER')
                //     console.log(head_column,'head_column')
                //     head_column.find( 'input,select').on( 'enterKey change', function () {
                //         var input = this;
                //         if(timer) clearTimeout(timer)
                //         // timer = setTimeout(function(){
                //             if ( column.search() !== input.value ) {
                //                 column
                //                     .search( input.value )
                //                     .draw();
                //             }
                //         // },1000)
                //     } );
                // } );
            // // oTable.fnSetFilteringDelay(2000);
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
                        App.InitForm($('#entryForm'))
                        // if($('[data-editor="basic"]').length){
                        //     $('[data-editor="basic"]').each(function(){
                        //         var id = $(this).attr('id');
                        //         addEditorBasic(id,240);
                        //     })
                        // }
                        // $('#entryForm .selectpicker').selectpicker();

                        // $('#entryForm').validationEngine({
                        //     'scroll': false
                        //     , prettySelect : true
                        //     , validateNonVisibleFields:false
                        // }); 
                        // $('#entryForm .date').datetimepicker({
                        //     'pickDate': true,
                        //     'pickTime': true   ,
                        //     'dayOfWeekStart': 1
                        // });
                        // if($('#sortable').length == 1){
                        //     $( "#sortable" ).sortable({placeholder: "ui-state-highlight"});
                        //     $( "#sortable" ).disableSelection();
                        // }
                        // var frm = $('#entryForm')
                        // setTimeout(function(){
                        //     frm.find('[data-googlemap]').get().map(function(elm){
                        //         console.log($(elm).data('latcolumn'),'latclm')
                        //         console.log($(elm).data('loncolumn'),'loncolumn')
                        //         App.AddGoogleMap(elm,function(e){
                        //             console.log(e)
                        //             frm.find('input[name="'+$(elm).data('latcolumn')+'"]').val(e.latLng.lat());
                        //             frm.find('input[name="'+$(elm).data('loncolumn')+'"]').val(e.latLng.lng());
                        //             frm.find('span[data-latlonpreview="'+$(elm).data('latcolumn')+$(elm).data('loncolumn')+'"]').text(e.latLng.lat() + ' ' + e.latLng.lng());
                        //             var address_input = $(elm).data('address-input');
                        //             if(address_input){
                        //                 App.getAddress(e.latLng.lat(),e.latLng.lng(),function(res){
                        //                     if(res && res.results && res.results[0]){
                        //                         console.log(res.results[0].formatted_address,address_input)
                        //                         $('#'+address_input).val(res.results[0].formatted_address)
                        //                     }else{
                        //                         $('#'+address_input).val('')
                        //                         console.log('Unkown address')
                        //                     }
                        //                 })
                        //             }
                        //             //https://maps.googleapis.com/maps/api/geocode/json?latlng=10.759171651626405,106.42599052008768&sensor=false&key=AIzaSyBWqKci2rs1gaHG2PlcHjpMqef3XiQiJOw
                        //         })
                        //     })
                        // },500)

                        // productopt_config.entryType = $('#product_token').val();
                        // productopt.onInit();

                        $('#entryForm [data-cateid]').change(function(){
                            console.log(this.value,'this.value')
                            $('[data-headid]').hide()
                            $('[data-headid="'+this.value+'"]').show()
                            $('[data-custombox] [data-headid]:not([data-headid="'+this.value+'"]) input[type="checkbox"]').prop('checked',false)
                        }).trigger('change')
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
            var Params =$('#entryForm').serializeJSON();
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
            oTable.ajax.reload();
            // oTable.ajax.reload();
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
        'putontop':function(Id){
            this.onCommit( _oConfig.putontopUri, {
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    [{$tplConfig.name}].onRefresh();
                }
            });
        },
        'putup':function(Id){
            this.onCommit( _oConfig.putupUri, {
            }, Id, function(rsdata){
                if(rsdata.result>=0){
                    [{$tplConfig.name}].onRefresh();
                }
            });
        },
        'putdown':function(Id){
            this.onCommit( _oConfig.putdownUri, {
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
                                '<i class="fa fa-trash-alt"></i>'+
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