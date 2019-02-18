
[{nocache}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/vp/video/rowTmpl.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/vp/video/actScript.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/vp/video/videoPluginJs.tpl"}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>[{$tplConfig.title}]</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                [{if $unit|strpos:".a."!==false}]
                <li><a href="JavaScript:" title="Add new entry" onclick="[{$tplConfig.name}].onAddItem()"><i class="fa-plus"></i></a></li>
                [{/if}]
                <li><a href="JavaScript:" title="Refresh entrys" onclick="[{$tplConfig.name}].onRefresh()"><i class="fa-rotate-left"></i></a></li>
                <li><a href="JavaScript:" title="Setting" ><i class="fa-cogs"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-sm-3 pull-bottom">
                    <span class="squaredThree">
                        <input type="checkbox"  
                            id="squaredThreeToggleThumb" 
                            name="squaredThreeToggleThumb"
                            onchange="[{$tplConfig.name}].toggleImage();" 
                            >
                        <label for="squaredThreeToggleThumb"></label>
                    </span>
                    Show/Hide Thumbnail

                </div>
                <div class="col-sm-3 pull-bottom">
                    <div class="row">
                        <a href="JavaScript:void(0)" class="code" data-toggle="dropdown">Sort toggle by <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="JavaScript:void(0)" onclick="$('.[{$tplConfig.prefix}]author').click()">Author</a></li>
                            <li><a href="JavaScript:void(0)" onclick="$('.[{$tplConfig.prefix}]category').click()">Category</a></li>
                            <li><a href="JavaScript:void(0)" onclick="$('.[{$tplConfig.prefix}]insert').click()">Insert date</a></li>
                            
                        </ul>
                    </div>
                </div>
                <!-- <div class="col-sm-3 pull-bottom">
                    <select id="video-category-filler" class="form-control selectpicker"
                        onchange="filterByCat()"    
                        data-size="10"
                        >
                        <option value="" >Filter by Category</option>
                        [{foreach from=$cates item=c}]
                            <option 
                                data-content="<span style='padding-left: [{($c->cat_value|substr_count:'>' -1) *20}]px;'>[{$c->cat_title|escape:'html'}]</span>"
                                [{if $c->cat_id == $item->video_category}]selected="1"[{/if}]
                                value="[{$c->cat_id|default:''}]">
                                    [{$c->cat_title|default:''}]
                            </option>
                        [{/foreach}]
                    </select>
                </div> -->
            </div>
            <script type="text/javascript">
                function filterByCat(){
                       
                }
            </script>
            <div class="table-overflow">
                <table id="entryDatatable" class="no-table" style="width: 100%">
                    <thead style="display: none;">
                        <tr>
                            <th>&nbsp;</th>
                            <th class="[{$tplConfig.prefix}]author hidden-all">&nbsp;</th>
                            <th class="[{$tplConfig.prefix}]category hidden-all">&nbsp;</th>
                            <th class="[{$tplConfig.prefix}]insert hidden-all">&nbsp;</th>
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
    [{if $unit|strpos:".a."!==false}]
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
    [{/if}]
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Refresh entrys" onclick="[{$tplConfig.name}].onRefresh()">
                <i class="fa fa-rotate-left"></i>
            </a>
        </div>
    </li>
</ul>
[{/nocache}]