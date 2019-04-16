
[{nocache}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/003/rowTmpl.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/cp/data/actScript.tpl"}]
<script type="text/javascript">
    function applyMenu(){
        
    }

    _oConfig.paginate = false;
    _oConfig.dataColumns = [
        {
            'mData': "data_id",
            'sWidth': "36px", 'bSortable': false,
            'sClass':'gridAction',
            'mRender': function ( value, type, datarow ) {
                var str = '';
                [{if $unit}]
                str =  '<ul class="table-controls">'
                    [{if $unit|strpos:".e."!==false}]
                    str +=  '<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onEditItem(\'' + value + '\')" title="Edit entry (' + value + ')" ><i class="fa fa-edit"></i></a> </li>';
                    [{/if}]
                    [{if $unit|strpos:".d."!==false}]
                    if(datarow.audio_lock!=='true'){
                        str += '<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onDeleteItem(\'' + value + '\')" title="Delete entry (' + value + ')" ><i class="fa fa-trash-o"></i></a> </li>';
                    }
                    [{/if}]
                    [{if $unit|strpos:".l."!==false}]
                    if(datarow.audio_lock!=='true'){
                        str += '<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onLockItem(\'' + value + '\')" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i></a> </li>';
                    }
                    [{/if}]
                
                str += '</ul>';
                [{/if}]
                return str;
            }
        },
        {
            'mData': "data_status",
            'sWidth': "36px",
            'sClass':'gridStatus',
            'mRender': function ( value, type, datarow ) {
                var elm = '';
                [{if $unit}]
                    [{if $unit|strpos:".e."!==false}]
                    if(datarow.[{$tplConfig.prefix}]lock!='false'){
                        var status = datarow.[{$tplConfig.prefix}]status =='false'?'true':'false'
                    elm = 
                        '<span '+ 
                            'onclick="[{$tplConfig.name}].changeStatus('+status+',\'' + datarow.data_id + '\')" '+
                            'title="Click to turn on/off entry" ';
                    if(value == 'false') 
                        elm += 'class="fa fa-toggle-off"';
                    else
                        elm += 'class="fa fa-toggle-on"';
                    elm += '></span>';
                    }
                    [{/if}]
                [{/if}]
                return elm;
            }
        },{
            'mData': "data_thumb",'sWidth': "40px",'sClass':'gridThumb',
            'mRender': function ( value, type, datarow ) {
                return '<img height="40" src="'+value+'"/>';
            }
        },{
            'mData': "data_title",
            'mRender': function ( value, type, datarow ) {
                return datarow.data_name?datarow.data_name:value;
            }
        }
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
                            <th class="gridThumb">Thumb</th>
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
    [{if $smarty.session.auth.user->ause_authority=='Administrator'}]
    [{if $unit|strpos:".apply."!==false}]
    <li>
        <div class="depth">
            <a  href="JavaScript:void(0)" title="Update Navigation Menu" onclick="applyMenu()">
                <i class="fa fa-building"></i>
            </a>
        </div>
    </li>
    [{/if}]
    [{/if}]
</ul>
[{/nocache}]