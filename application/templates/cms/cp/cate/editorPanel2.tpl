[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Category</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
            <input type="hidden" name="_ordering" value="[{$item->_ordering|default:time()}]">
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
                                        [{$attr= '_title_'|cat:$la->lang_short}]

                                        <input type="text" 
                                            onblur="AliasTo('#entryForm input[name=[{$attr}]]','#entryForm input[name=_alias_[{$la->lang_short}]]')" 
                                            class="form-control validate[required,minSize[2],maxSize[255]]" 
                                            value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                            name="[{$attr}]" 
                                            placeholder="[{$la->lang_name|ucwords}]"
                                            
                                            maxlength="255" 
                                            >
                                    </div>
                                </div>
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Alias :</div>
                                        [{$attr= '_alias_'|cat:$la->lang_short}]
                                        <input type="text" 
                                            class="form-control validate[required,minSize[2],maxSize[255]]"
                                            name="[{$attr}]" 
                                            data-lang="[{$la->lang_short}]"
                                            placeholder="[{$la->lang_name|ucwords}]"
                                            value="[{$item->$attr|quotes_to_entities|default:''}]"
                                            />
                                    </div>
                                </div>
                            </div>
                            <div class="control-group pull-top">
                                <div>Desc :(*)</div>
                                [{$attr= '_desc_'|cat:$la->lang_short}]
                                <textarea class="form-control validate[required]" 
                                    name="[{$attr}]" 
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
                                    [{if $item->_image}]title="<img src='[{$item->_image}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                    class="form-control tool-tip" value="[{$item->_image|default:''}]" 
                                    name="_image" id="_image"
                                    >
                                <span class="add-on " onclick="BrowseServer('#_image')" title="Choose Image">
                                    <i class="fa fa-image"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-6 half">
                        <div class="control-group pull-top">
                            <div>Cover :</div>
                            <div class="input-append">
                                <input type="text" 
                                    [{if $item->_cover}]title="<img src='[{$item->_cover}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                    class="form-control tool-tip" value="[{$item->_cover|default:''}]" 
                                    name="_cover" id="_cover"
                                    >
                                <span class="add-on" onclick="BrowseServer('#_cover')">
                                    <i class="fa fa-image"></i>
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
                                <select name="_parent_id" class="form-control selectpicker"
                                    data-live-search="true"
                                    data-size="10"
                                    >
                                    <option value="0" data-title="[ Root ]" data-level="-1">[ Root ]</option>
                                    [{assign var="level" value=-1}]
                                    [{foreach from=$cates item=c}]
                                        [{if $c->_id == $item->_id}]
                                            [{assign var="level" value=$c->_level}]
                                        [{/if}]
                                        [{if $level!=-1 and $c->_level <= $level and $c->_id != $item->_id}]
                                            [{assign var="level" value=-1}]
                                        [{/if}]
                                        <option 
                                            data-content="<span style='padding-left: [{$c->_level*20+20}]px;'>[{$c->_title|escape}]</span>"
                                            [{if $c->_id == $item->_parent_id}]selected="1"[{/if}]
                                            [{if $level!=-1 and $level < $c->_level}]disabled=1[{/if}]
                                            [{if $c->_id == $item->_id}]disabled=1[{/if}]
                                            value="[{$c->_id|default:''}]">
                                                [{$c->_title|escape|default:''}]
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
                                        name="_status" type="radio" 
                                        [{if $item->_status|default:1}]checked[{/if}]
                                        value="1">
                                    <label for="status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="status2" name="_status" type="radio" value="0"
                                        [{if !$item->_status|default:1}]checked[{/if}]
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