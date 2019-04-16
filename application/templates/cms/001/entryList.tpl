
[{nocache}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/001/rowTmpl.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/001/actScript.tpl"}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>[{$tplConfig.title}]</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                [{if $unit|strpos:"a"!==false}]
                <li><a href="JavaScript:" title="Add new entry" onclick="[{$tplConfig.name}].onAddItem()"><i class="fa fa-plus"></i></a></li>
                [{/if}]
                <li><a href="JavaScript:" title="Refresh entrys" onclick="[{$tplConfig.name}].onRefresh()"><i class="fa fa-rotate-left"></i></a></li>
                <li><a href="JavaScript:" title="Setting" ><i class="fa fa-cogs"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <div>
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
            <div class="table-overflow">
                <table id="entryDatatable" class="no-table" style="width: 100%">
                    <thead style="display: none;">
                        <tr>
                            <th>&nbsp;</th>
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
                [{if $unit|strpos:"a"!==false}]
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