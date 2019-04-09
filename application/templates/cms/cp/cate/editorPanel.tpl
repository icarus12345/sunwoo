[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
                <h4>[{$tplConfig.editEntryTitle}]</h4>
            [{else}]
                <h4>[{$tplConfig.addEntryTitle}]</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="type" id="type" 
                    value="[{$item->type|default:$type|default:''}]"/>
                <div class="row">
                    <div class="col-mb-6">
                        <div class="control-group pull-top">
                            <div>Title :</div>
                            <input type="text" 
                                rows="1"
                                onblur="AliasTo('#entryForm input[name=title]','#entryForm input[name=alias]')" 
                                class="form-control validate[required,minSize[6],maxSize[255]]"
                                name="title" 
                                value="[{$item->title|escape|default:''}]"/>
                        </div>
                    </div>
                    <div class="col-mb-6">
                        <div class="control-group pull-top">
                            <div>Alias :</div>
                            <input type="text" 
                                rows="1"
                                class="form-control validate[required,minSize[6],maxSize[255]]"
                                name="alias" 
                                value="[{$item->alias|escape|default:''}]"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-mb-6">
                        <div class="pull-top control-group">
                            <div>Parent :(*)</div>
                            <div class="row-fluid">
                                <select name="parent_id" class="form-control selectpicker"
                                        data-size="10"
                                        >
                                    <option value="0" data-title="[ Root ]" data-level="-1">[ Root ]</option>
                                    [{assign var="level" value=-1}]
                                    [{foreach from=$cates item=c}]
                                        [{if $c->id == $item->id}]
                                            [{assign var="level" value=$c->level}]
                                        [{/if}]
                                        [{if $level!=-1 and $c->level <= $level and $c->id != $item->id}]
                                            [{assign var="level" value=-1}]
                                        [{/if}]
                                        <option 
                                            data-content="<span style='padding-left: [{$c->level*20+20}]px;'>[{$c->title|escape}]</span>"
                                            [{if $c->id == $item->parent_id}]selected="1"[{/if}]
                                            [{if $level!=-1 and $level < $c->level}]disabled=1[{/if}]
                                            [{if $c->id == $item->id}]disabled=1[{/if}]
                                            value="[{$c->id|default:''}]">
                                                [{$c->title|default:''}]
                                        </option>
                                    [{/foreach}]
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-6">
                        <div class="control-group pull-top">
                            <div>Status :</div>
                            <div style="padding-top:5px">
                                <span class="circleRad">
                                    <input id="status1" 
                                        name="status" type="radio" 
                                        [{if $o->status!='false'|default:''}]checked[{/if}]
                                        value="true">
                                    <label for="status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="status2" name="status" type="radio" value="false"
                                        [{if $o->status=='false'|default:''}]checked[{/if}]
                                    >
                                    <label for="status2">Disable&nbsp;&nbsp;</label>
                                </span>

                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="control-group pull-top">
                    <div>Link :</div>
                    <input type="text" class="form-control" 
                        placeholder="Link"
                        name="link"
                        value="[{$item->link|quotes_to_entities|default:''}]"
                        />
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Image :</div>
                            <div class="input-append">
                                <input type="text" 
                                        class="form-control" value="[{$item->thumb|default:''}]" 
                                        name="thumb" id="thumb"
                                        >
                                <span class="add-on" onclick="BrowseServer('#thumb')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="control-group pull-top">
                            <div>Position :</div>
                            <input type="number" 
                                    class="form-control" value="[{$item->position|default:''}]" 
                                    name="position"
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
                            name="desc"
                            data-putto=".error_desc" >[{$item->desc|quotes_to_entities|default:''}]</textarea>
                            
                    <div class="erb error_desc"></div>
                </div>
                <div id="sendquestion-message"></div>
            </form>
            <div class="bs-callout bs-callout-danger">
                <h4>CSS3 Browser support</h4>
                <p>
                    <img src="http://www.w3schools.com/images/compatible_ie2020.gif"/> IE 9+, 
                    <img src="http://www.w3schools.com/images/compatible_firefox2020.gif"/> Firefox, 
                    <img src="http://www.w3schools.com/images/compatible_chrome2020.gif"/> Chrome, 
                    <img src="http://www.w3schools.com/images/precompatible_safari5920.gif"/> Safari
                </p>
            </div>
        </div>
    </div>
</div>
<ul class="round-buttons round-fixed f-second">
    <li>
        <div class="depth">
            <a  href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()">
                <i class="fa-save fa"></i>
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