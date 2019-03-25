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
                value="[{$item->cat_id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="cat_type" id="cat_type" 
                    value="[{$item->cat_type|default:$type|default:''}]"/>
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
                                        [{$attr= 'cat_title_'|cat:$la->lang_short}]

                                        <input type="text" 
                                            onblur="AliasTo('#entryForm input[name=cat_title_[{$la->lang_short}]]','#entryForm input[name=cat_alias_[{$la->lang_short}]]')" 
                                            class="form-control validate[required,minSize[2],maxSize[255]]" 
                                            value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                            name="cat_title_[{$la->lang_short}]" 
                                            placeholder="[{$la->lang_name|ucwords}]"
                                            
                                            maxlength="255" 
                                            >
                                    </div>
                                </div>
                                <div class="col-mb-6 half">
                                    <div class="control-group pull-top">
                                        <div>Alias :</div>
                                        [{$attr= 'cat_alias_'|cat:$la->lang_short}]
                                        <input type="text" 
                                            class="form-control validate[required,minSize[2],maxSize[255]]"
                                            name="cat_alias_[{$la->lang_short}]" 
                                            data-lang="[{$la->lang_short}]"
                                            placeholder="[{$la->lang_name|ucwords}]"
                                            value="[{$item->$attr|quotes_to_entities|default:''}]"
                                            />
                                    </div>
                                </div>
                            </div>
                            <div class="control-group pull-top">
                                <div>Desc :(*)</div>
                                [{$attr= 'cat_desc_'|cat:$la->lang_short}]
                                <textarea class="form-control validate[required]" 
                                    name="cat_desc_[{$la->lang_short}]" 
                                    rows="2" 
                                    data-lang="[{$la->lang_short}]"
                                    placeholder="[{$la->lang_name|ucwords}]">[{$item->$attr|quotes_to_entities|default:''}]</textarea>
                            </div>

                            <div class="row half">
                                <div class="col-mb-6 half"> 
                                    <div class="control-group pull-top">
                                        <div>Unit :(*)</div>
                                        [{$attr= 'cat_unit_'|cat:$la->lang_short}]
                                        <input type="text" 
                                            class="form-control validate[maxSize[100]]" 
                                            value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                            name="cat_unit_[{$la->lang_short}]" 
                                            placeholder="[{$la->lang_name|ucwords}]"
                                            
                                            maxlength="255" 
                                            >
                                    </div>
                                </div>
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
                                    [{if $item->cat_image}]title="<img src='[{$item->cat_image}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                    class="form-control tool-tip" value="[{$item->cat_image|default:''}]" 
                                    name="cat_image" id="cat_image"
                                    >
                                <span class="add-on " onclick="BrowseServer('#cat_image')" title="Choose Image">
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
                                    [{if $item->cat_image}]title="<img src='[{$item->cat_thumb}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                    class="form-control tool-tip" value="[{$item->cat_thumb|default:''}]" 
                                    name="cat_thumb" id="cat_thumb"
                                    >
                                <span class="add-on" onclick="BrowseServer('#cat_thumb')">
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
                                <select name="cat_parent" class="form-control selectpicker"
                                    data-live-search="true"
                                    data-size="10"
                                    >
                                    <option value="0" data-title="[ Root ]" data-level="-1">[ Root ]</option>
                                    [{assign var="level" value=-1}]
                                    [{foreach from=$cates item=c}]
                                        [{if $c->cat_id == $item->cat_id}]
                                            [{assign var="level" value=$c->cat_level}]
                                        [{/if}]
                                        [{if $level!=-1 and $c->cat_level <= $level and $c->cat_id != $item->cat_id}]
                                            [{assign var="level" value=-1}]
                                        [{/if}]
                                        <option 
                                            data-content="<span style='padding-left: [{$c->cat_level*20+20}]px;'>[{$c->cat_title_vi|escape}]</span>"
                                            [{if $c->cat_id == $item->cat_parent}]selected="1"[{/if}]
                                            [{if $level!=-1 and $level < $c->cat_level}]disabled=1[{/if}]
                                            [{if $c->cat_id == $item->cat_id}]disabled=1[{/if}]
                                            value="[{$c->cat_id|default:''}]">
                                                [{$c->cat_title_vi|escape|default:''}]
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
                                    <input id="cat_status1" 
                                        name="cat_status" type="radio" 
                                        [{if $o->cat_status!='false'|default:''}]checked[{/if}]
                                        value="true">
                                    <label for="cat_status1">Enable&nbsp;&nbsp;</label>
                                </span>
                                <span class="circleRad">
                                    <input id="cat_status2" name="cat_status" type="radio" value="false"
                                        [{if $o->cat_status=='false'|default:''}]checked[{/if}]
                                    >
                                    <label for="cat_status2">Disable&nbsp;&nbsp;</label>
                                </span>

                            </div>
                        </div>
                    </div>
                    <div class="col-mb-3 half">
                        <div class="control-group pull-top">
                            <div>Position :</div>
                            <input type="number" 
                                    class="form-control" value="[{$item->cat_position|default:'0'}]" 
                                    name="cat_position"
                                    >
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