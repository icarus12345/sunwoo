
[{nocache}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/003/rowTmpl.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/cp/setting/actScript.tpl"}]
<script type="text/x-tmpl" id="tmpl-action-unit">
    [{if $unit}]
    <ul class="table-controls">
        [{if $unit|strpos:".e."!==false}]
        <li>
            <span class="fa fa-edit" 
               onclick="[{$tplConfig.name}].onPopEditItem('{%=o.Id%}','[{$layout}]')" 
               title="Edit entry ({%=o.Id%})">
            </span> 
        </li>
        [{/if}]
        [{if $unit|strpos:".s."!==false}]
        <li>
            <i onclick="[{$tplConfig.name}].changeStatus('{%=o.Status == 'true'?'false':'true'%}','{%=o.Id%}')" 
               title="Click to turn on/off entry ({%=o.Id%})" 
               class="fa fa-toggle-{%=o.Status == 'true'?'on':'off'%}"></i>
        </li>
        [{/if}]
        [{if $unit|strpos:".d."!==false}]
        {% if( o.Lock != 'true'){ %}
        <li>
            <i  class="fa fa-trash-o"
                onclick="[{$tplConfig.name}].onDeleteItem('{%=o.Id%}')" 
                title="Delete entry ({%=o.Id%})"
                ></i> 
        </li>
        {% } %}
        [{/if}]
        [{if $unit|strpos:".l."!==false}]
        <li>
            <i class="fa {%=o.Lock == 'true'?'fa-lock':'fa-unlock-alt'%}"
               onclick="[{$tplConfig.name}].onLockItem('{%=o.Id%}','{%=o.Lock == 'true'?'false':'true'%}')" 
               title="Lock entry ({%=o.Id%})" 
               ></i>
        </li>
        [{/if}]
    </ul>
    [{/if}]
</script>
<script type="text/javascript">
    function applyMenu(){
        [{$tplConfig.name}].onCommit(base_url+'cms/cp/menu/menugender/');
    }
    _oConfig.paginate = false;
    _oConfig.dataColumns = [
        {
            'data': "_id",
            'width': "36px", 'sortable': false,
            'class':'action-dropdown',
            'render': function ( value, type, datarow ) {
                var str = '';
                [{if $unit}]
                var menu = [];
                [{if $unit|strpos:".e."!==false}] 
                menu.push('<li onclick="[{$tplConfig.name}].onPopEditItem(\'' + value + '\',\'[{$layout}]\')"><a href="#"><i class="fa fa-edit"></i> Edit</a></li>')
                [{/if}]
                [{if $unit|strpos:".d."!==false}]
                if(datarow._lock!=='true'){
                    menu.push('<li ><a href="#" onclick="[{$tplConfig.name}].onDeleteItem(\'' + value + '\')"><i class="fa fa-trash-alt"></i> Delete</a></li>')
                }else{
                    menu.push('<li class="disabled"><a href="#"><i class="fa fa-trash-alt"></i> Delete</a></li>')
                    
                }
                [{else}]
                    menu.push('<li class="disabled"><a href="#"><i class="fa fa-trash-alt"></i> Delete</a></li>')
                [{/if}]
                [{if $unit|strpos:".l."!==false}]
                if(datarow._lock!=='true'){
                    menu.push('<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onLockItem(\'' + value + '\')" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i> Lock</a> </li>');
                }else{
                    menu.push('<li class="disabled"><a href="JavaScript:" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i> Lock</a> </li>');

                }
                [{else}]
                    menu.push('<li class="disabled"><a href="JavaScript:" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i> Lock</a> </li>');
                [{/if}]
                str += [
                '<div class="btn-group">',
                  '<button type="button" class="btn btn-default btn-sm" [{if $unit|strpos:".e."!==false}] onclick="[{$tplConfig.name}].onPopEditItem(\'' + value + '\',\'[{$layout}]\')"[{/if}]>Edit</button>',
                  '<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">',
                    '<span class="caret"></span>',
                    '<span class="sr-only">Toggle Dropdown</span>',
                  '</button>',
                  '<ul class="dropdown-menu">',
                    menu.join(''),
                    
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
            'data': "_status",
            'width': "36px",
            'class':'cb-column',
            render: function ( value, type, row ) {
                var str = [
                    '<label class="cb">',
                    '<input type="checkbox" ',
                        (+value?'checked':'')
                        ];
                        [{if $unit}]
                            [{if $unit|strpos:".e."!==false}]
                                if(row.[{$tplConfig.prefix}]lock!='false'){
                                    var status = +!+row.[{$tplConfig.prefix}]status
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
        },
        {'data': "_name"},
        {'data': "_value"}
    ];

</script>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>[{$tplConfig.title}]</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                [{if $unit|strpos:".a."!==false}]
                <li><a href="JavaScript:" title="Add new entry" onclick="[{$tplConfig.name}].onAddItem()"><i class="fa fa-plus"></i></a></li>
                [{/if}]
                <li><a href="JavaScript:" title="Refresh entrys" onclick="[{$tplConfig.name}].onRefresh()"><i class="fa fa-rotate-left"></i></a></li>
                <li><a href="JavaScript:" title="Setting" ><i class="fa fa-cogs"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <div>
                <div class="pull-left">
                    <span class="squaredThree">
                        <input type="checkbox"  
                            id="squaredThreeToggleThumb" 
                            name="squaredThreeToggleThumb"
                            onchange="[{$tplConfig.name}].toggleImage();" 
                            >
                        <label for="squaredThreeToggleThumb"></label>
                    </span>
                    <label for="squaredThreeToggleThumb">Show/Hide Thumbnail</label>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="table-overflow">
                <table id="entryDatatable" class="table table-bordered table-striped message-table">
                    <thead>
                        <tr>
                            <th><span class="fa fa-key"></span></th>
                            <th><span class="fa fa-circle-thin"></span></th>
                            <th>Name</th>
                            <th>Value</th>
                            
                            
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
            
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-one">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Add new entry" 
                [{if $unit|strpos:".a."!==false}]
                onclick="[{$tplConfig.name}].onAddItem()"
                [{/if}]
                >
                <i class="fa fa-plus"></i>
            </a>
        </div>
    </li>
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Refresh entrys" onclick="[{$tplConfig.name}].onRefresh()">
                <i class="fa fa-rotate-left"></i>
            </a>
        </div>
    </li>
</ul>
[{/nocache}]