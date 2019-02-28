
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
            'mData': "Id",
            'sWidth': "36px", 'bSortable': false,
            'sClass':'gridAction',
            'mRender': function ( value, type, datarow ) {
                return tmpl("tmpl-action-unit", datarow);
                var str = '';
                [{if $unit}]
                str =  '<ul class="table-controls">'
                    [{if $unit|strpos:".e."!==false}]
                    str +=  '<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onEditItem(\'' + value + '\')" title="Edit entry (' + value + ')" ><i class="fa fa-edit"></i></a> </li>';
                    [{/if}]
                    [{if $unit|strpos:".d."!==false}]
                    if(datarow.menu_lock!=='true'){
                        str += '<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onDeleteItem(\'' + value + '\')" title="Delete entry (' + value + ')" ><i class="fa fa-trash-o"></i></a> </li>';
                    }
                    [{/if}]
                    [{if $unit|strpos:".l."!==false}]
                    if(datarow.menu_lock!=='true'){
                        str += '<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onLockItem(\'' + value + '\')" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i></a> </li>';
                    }
                    [{/if}]
                
                str += '</ul>';
                [{/if}]
                return str;
            }
        },
        {
            'mData': "Status",
            'sWidth': "36px",
            'sClass':'cb-column',
            render: function ( value, type, row ) {
                var str = [
                    '<label class="cb">',
                    '<input type="checkbox" ',
                        (value == 'true'?'checked':'')
                        ];
                        [{if $unit}]
                            [{if $unit|strpos:".e."!==false}]
                                if(row.[{$tplConfig.prefix}]Lock!='false'){
                                    var status = row.[{$tplConfig.prefix}]Status =='false'?'true':'false'
                                str.push(' onclick="[{$tplConfig.name}].changeStatus('+status+',\'' + row.[{$tplConfig.prefix}]Id + '\')" ')
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
        {

            'mData': "Image",'sWidth': "56px",'bSortable': false,
            "bVisible": true,
            'sClass':'gridThumb',
            'mRender': function ( value, type, datarow ) {
                if(value)
                    return '<div style="height:32px;width:52px;background-image:url('+value+')" class="bg-cover"/>';
                else return '';
            }
        },
        {'mData': "Name"}
    ];

</script>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>[{$tplConfig.title}]</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                [{if $unit|strpos:".a."!==false}]
                <li><a href="JavaScript:" title="Add new entry" onclick="[{$tplConfig.name}].onPopAddItem('[{$layout}]')"><i class="fa-plus"></i></a></li>
                [{/if}]
                <li><a href="JavaScript:" title="Refresh entrys" onclick="[{$tplConfig.name}].onRefresh()"><i class="fa-rotate-left"></i></a></li>
                <li><a href="JavaScript:" title="Setting" ><i class="fa-cogs"></i></a></li>
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
                            <th>Thumb</th>
                            <th>Title</th>
                            
                            
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
                onclick="[{$tplConfig.name}].onPopAddItem('[{$layout}]')"
                [{/if}]
                >
                <i class="fa-plus"></i>
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