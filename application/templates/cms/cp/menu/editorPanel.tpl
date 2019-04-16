[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Menu</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->menu_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="menu_type" id="menu_type" 
                       value="[{$item->menu_type|default:$type|default:''}]"/>
                <div>Title :</div>
                <div class="control-group">
                    <input type="text" class="form-control validate[required]" 
                           placeholder="Title"
                           name="menu_title"
                           value="[{$item->menu_title|quotes_to_entities|default:''}]"
                           data-putto=".error-title"/>
                    <div class="erb error-title"></div>
                </div>
                <div class="pull-top control-group">
                    <div>Parent :</div>
                    <div class="row-fluid">
                        <select name="menu_parent" class="form-control selectpicker"
                                data-size="6"
                                >
                            <option value="0">[ Root ]</option>
                            [{assign var="level" value=-1}]
                            [{foreach from=$menus item=c}]
                                [{if $c->menu_id == $item->menu_id}]
                                    [{assign var="level" value=$c->menu_level}]
                                [{/if}]
                                [{if $level!=-1 and $c->menu_level <= $level and $c->menu_id != $item->menu_id}]
                                    [{assign var="level" value=-1}]
                                [{/if}]
                                <option 
                                    data-content="<span style='padding-left: [{$c->menu_level*20+20}]px;'>[{$c->menu_title|escape}]</span>"
                                    [{if $c->menu_id == $item->menu_parent}]selected="1"[{/if}]
                                    [{if $level!=-1 and $level < $c->menu_level}]disabled=1[{/if}]
                                    [{if $c->menu_id == $item->menu_id}]disabled=1[{/if}]
                                    value="[{$c->menu_id|default:''}]"
                                    >
                                    [{$c->menu_display|default:''}]
                                </option>
                            [{/foreach}]
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Link :</div>
                            <input type="text" class="form-control" 
                                placeholder="Link"
                                name="menu_link"
                                value="[{$item->menu_link|quotes_to_entities|default:''}]"
                                />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Class :</div>
                            <input type="text" class="form-control" 
                                placeholder="Class"
                                name="menu_class"
                                value="[{$item->menu_class|quotes_to_entities|default:''}]"
                                />
                        </div>
                    </div>   
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Image :</div>
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control" value="[{$item->menu_thumb|default:''}]" 
                                    name="menu_thumb" id="menu_thumb"
                                    >
                                <span class="add-on" onclick="BrowseServer('#menu_thumb')">
                                    <i class="fa fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Position :</div>
                            <input type="number" 
                                class="form-control" value="[{$item->menu_position|default:''}]" 
                                name="menu_position"
                                >
                        </div>
                    </div>
                </div>
                <div class="control-group pull-top">
                    <div>
                        Desc :
                    </div>
                    <textarea class="form-control de-desc" 
                            rows="3"
                            name="menu_desc"
                            data-putto=".error_desc" >[{$item->menu_desc|quotes_to_entities|default:''}]</textarea>

                    <div class="erb error_desc"></div>
                </div>
                <div id="sendquestion-message"></div>
            </form>
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-second">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()">
                <i class="fa fa-save fa"></i>
            </a>
        </div>
    </li>
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()">
                <i class="fa fa-reply-all"></i>
            </a>
        </div>
    </li>
</ul>
[{/nocache}]