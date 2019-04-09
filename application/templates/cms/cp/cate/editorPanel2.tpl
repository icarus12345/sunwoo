[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Category</h4>
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
            <input type="hidden" name="ordering" value="[{$item->ordering|default:time()}]">
                <input type="hidden" name="type" id="type" 
                    value="[{$item->type|default:$type|default:''}]"/>
                <div class="lang-tabs default" style="z-index: 11;position: relative;margin-left: 10px">
                    <ul class="nav-tabs">
                        [{assign var="f" value="active"}]
                        [{foreach from=$langs item=la key =k}]
                            <li class="[{$f|default:''}]">
                                <a  title="[{$la->lang_name|ucwords}]"
                                    href="#tab_lang_content_[{$la->lang_short}]"  
                                    data-toggle="tab" 
                                    >
                                        [{$la->lang_name|ucwords}]
                                </a>
                            </li>
                            [{assign var="f" value=""}]
                        [{foreachelse}]
                            
                        [{/foreach}]
                    </ul>
                </div>
                <div class="controls tab-content" style="border-top: 1px solid #ddd;float: left;width: 100%;">
                    [{assign var="f" value="active"}]
                    [{foreach from=$langs item=la key =k}]
                        <div id="tab_lang_content_[{$la->lang_short}]" class="tab-pane [{$f|default:''}]">
                            <div class="row half">
                                <div class="col-mb-6 half"> 
                                    <div class="control-group pull-top">
                                        <div>Title :(*)</div>
                                        [{$attr= 'title_'|cat:$la->lang_short}]

                                        <input type="text" 
                                            onblur="AliasTo('#entryForm input[name=title_[{$la->lang_short}]]','#entryForm input[name=alias_[{$la->lang_short}]]')" 
                                            class="form-control validate[required,minSize[2],maxSize[255]]" 
                                            value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                            name="title_[{$la->lang_short}]" 
                                            placeholder="[{$la->lang_name|ucwords}]"
                                            
                                            maxlength="255" 
                                            >
                                    </div>
                                </div>
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Alias :</div>
                                        [{$attr= 'alias_'|cat:$la->lang_short}]
                                        <input type="text" 
                                            class="form-control validate[required,minSize[2],maxSize[255]]"
                                            name="alias_[{$la->lang_short}]" 
                                            data-lang="[{$la->lang_short}]"
                                            placeholder="[{$la->lang_name|ucwords}]"
                                            value="[{$item->$attr|quotes_to_entities|default:''}]"
                                            />
                                    </div>
                                </div>
                            </div>
                            <div class="control-group pull-top">
                                <div>Desc :(*)</div>
                                [{$attr= 'description_'|cat:$la->lang_short}]
                                <textarea class="form-control validate[required]" 
                                    name="description_[{$la->lang_short}]" 
                                    rows="2" 
                                    data-lang="[{$la->lang_short}]"
                                    placeholder="[{$la->lang_name|ucwords}]">[{$item->$attr|quotes_to_entities|default:''}]</textarea>
                            </div>

                            

                        </div>


                        [{assign var="f" value=""}]
                    [{/foreach}]
                </div>
                
                <div class="row half">
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>Image :</div>
                            <div class="input-append">
                                <input type="text" 
                                    [{if $item->image}]title="<img src='[{$item->image}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                    class="form-control tool-tip" value="[{$item->image|default:''}]" 
                                    name="image" id="image"
                                    >
                                <span class="add-on " onclick="BrowseServer('#image')" title="Choose Image">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>Thumb :</div>
                            <div class="input-append">
                                <input type="text" 
                                    [{if $item->image}]title="<img src='[{$item->thumb}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                    class="form-control tool-tip" value="[{$item->thumb|default:''}]" 
                                    name="thumb" id="thumb"
                                    >
                                <span class="add-on" onclick="BrowseServer('#thumb')">
                                    <i class="fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row half">
                    <div class="col-mb-6 half">
                        <div class="pull-top control-group">
                            <div>Parent :(*)</div>
                            <div class="row-fluid">
                                <select name="parent_id" class="form-control selectpicker"
                                    data-live-search="true"
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
                                                [{$c->title|escape|default:''}]
                                        </option>
                                    [{/foreach}]
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-3 half">
                        <div class="control-group pull-top">
                            <div>Status :</div>
                            <div style="padding-top:5px">
                                <span class="circleRad">
                                    <input id="status1" 
                                        name="status" type="radio" 
                                        [{if $item->status}]checked[{/if}]
                                        value="1">
                                    <label for="status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="status2" name="status" type="radio" value="0"
                                        [{if !$item->status}]checked[{/if}]
                                    >
                                    <label for="status2">Disable&nbsp;&nbsp;</label>
                                </span>

                            </div>
                        </div>
                    </div>
                </div>
                
<!--                <div class="">
                    <button style="width: 100%" class="btn btn-default" type="button" onclick="sendquestion();">Gửi</button>
                </div>-->
                <div id="sendquestion-message"></div>
            </form>
        </div>
<!--        <div class="modal-footer">
            <button class="btn btn-primary" onclick="toggleContent()">Done</button>
            <button class="btn btn-default" onclick="language.onCancel()">Cancel</button>
            <div class="base_loading modal-loading" style="display: none;"></div>
        </div>-->
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