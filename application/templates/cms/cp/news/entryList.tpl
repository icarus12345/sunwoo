
[{nocache}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/003/rowTmpl.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/003/actScript.tpl"}]
<script type="text/javascript">
    _oConfig = {
        'showImage':false,
        'entryType':'[{$type}]',
        'cateType':'',
        'entryId': '',
        'dataColumns':[],
        'paginate': true,
        'entryBindingUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/bindingbytype/',
        'entryEditUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/editpanel/',
        'entryCommitUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/oncommit/',
        'entryDeleteUri': base_url+'cms/[{$tplConfig.group}]/[{$tplConfig.controller}]/ondelete/'
    };
    _oConfig.dataColumns = [
        {
            'mData': "news_id",
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
                    if(datarow.news_lock!=='true'){
                        str += '<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onDeleteItem(\'' + value + '\')" title="Delete entry (' + value + ')" ><i class="fa fa-trash-o"></i></a> </li>';
                    }
                    [{/if}]
                    [{if $unit|strpos:".l."!==false}]
                    if(datarow.news_lock!=='true'){
                        str += '<li><a href="JavaScript:" onclick="[{$tplConfig.name}].onLockItem(\'' + value + '\')" title="Lock entry (' + value + ')" ><i class="fa fa-lock"></i></a> </li>';
                    }
                    [{/if}]
                
                str += '</ul>';
                [{/if}]
                return str;
            }
        },
        {
            'mData': "news_status",
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
                                if(row.[{$tplConfig.prefix}]lock!='false'){
                                    var status = row.[{$tplConfig.prefix}]status =='false'?'true':'false'
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
            // 'mRender': function ( value, type, datarow ) {
            // }
        },{
            'mData': "news_thumb",'sClass': "gridThumb",'sWidth': "40px",
            "bVisible": _oConfig.showImage,
            'mRender': function ( value, type, datarow ) {
                if(value)
                    return '<div style="height:32px;width:52px;background-image:url('+value+')" class="bg-cover"/>';
                else return '';
            }
        },{
            'mData': "news_title",
            'mRender': function ( value, type, datarow ) {
                var str= '';
                // if(datarow.cat_title && datarow.cat_title !='')
                //     str+='<span class="code">' + datarow.cat_title + '</span>';
                str+=value||'';
                return str;
            }
        },{
            'mData': "cat_title",'sWidth': "120px"
        },{
            'mData': "news_insert",'sWidth': "126px",
        }
    ];
</script>
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>[{$tplConfig.title}]</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                [{if $unit|strpos:"a"!==false}]
                <li><a href="JavaScript:" title="Add new entry" onclick="[{$tplConfig.name}].onAddItem()"><i class="fa-plus"></i></a></li>
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
                        <tr role="row">
                            <th><span class="fa fa-key"></span></th>
                            <th><span class="fa fa-circle-thin"></span></th>
                            <th>Thumb</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th>Created At</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
                        <tr class="filter-rows">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><input type="text" placeholder="Search for ..."></td>
                            <td>
                                <select>
                                    <option value=""></option>
                                    [{if $cates|default:null}]
                                    [{foreach from=$cates item=c}]
                                        <option 
                                            data-content="<span style='padding-left: [{$c->cat_level*20}]px;'>[{$c->cat_title|escape}]</span>"
                                            value="[{$c->cat_value|escape|default:''}]">
                                                [{'&nbsp;&nbsp;&nbsp;&nbsp;'|str_repeat:$c->cat_level}][{$c->cat_title|default:''}]
                                        </option>
                                    [{/foreach}]
                                    [{/if}]
                                </select>
                            </td>
                            <td></td>
                        </tr>
                    </tfoot>
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
                [{if $unit|strpos:"a"!==false}]
                onclick="[{$tplConfig.name}].onAddItem()"
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