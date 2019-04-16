
[{nocache}]
[{*include file=$smarty.const.APPPATH|cat:"templates/cms/cp/product/rowTmpl.tpl"*}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/cp/product/actScript.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/cms/cp/product/actOptBasicScript.tpl"}]
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
                <table id="entryDatatable" class="table table-bordered table-striped message-table -no-table" style="width: 100%">
                    <thead>
                        <tr class="before-filter">
                            <th><span class="fa fa-key"></span></th>
                            <th></th>
                            <th>Thumb</th>
                            <th style="min-width: 240px;">Title</th>
                            <th>Category</th>
                            <th style="min-width: 100px;">Code</th>
                            <th style="min-width: 120px;">Owner</th>
                            <th style="min-width: 120px;">Price</th>
                            <th style="min-width: 120px;">Created At</th>
                            <th style="min-width: 120px;">Modified At</th>
                        </tr>
                        <tr class="filter-rows">
                            <td></td>
                            <td>
                                <input type="checkbox" checked data-index="1">
                            </td>
                            <td></td>
                            <td><input type="text" placeholder="Search for ..." data-index="3"></td>
                            <td>
                                <select data-index="4">
                                    <option value=""></option>
                                    [{if $cates|default:null}]
                                    [{foreach from=$cates item=c}]
                                        <option 
                                            data-content="<span style='padding-left: [{$c->level*20}]px;'>[{$c->title|escape}]</span>"
                                            value="[{$c->value|escape|default:''}]">
                                                [{'&nbsp;&nbsp;&nbsp;&nbsp;'|str_repeat:$c->level}][{$c->title|default:''}]
                                        </option>
                                    [{/foreach}]
                                    [{/if}]
                                </select>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                    <tfoot>
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