[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
            <h4>Edit News</h4>
            [{else}]
            <h4>Add new News</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
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
                <input type="hidden" name="_type" value="[{$item->_type|default:$type}]">
               
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
                                                    onblur="AliasTo('#entryForm input[name=_title_[{$la->lang_short}]]','#entryForm input[name=_alias_[{$la->lang_short}]]')" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="_title_[{$la->lang_short}]" 
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
                                                    name="_alias_[{$la->lang_short}]" 
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
                                            name="_desc_[{$la->lang_short}]" 
                                            rows="4" 
                                            data-lang="[{$la->lang_short}]"
                                            placeholder="[{$la->lang_name|ucwords}]">[{$item->$attr|quotes_to_entities|default:''}]</textarea>
                                    </div>

                                    
                                    [{if $ci->agent->is_mobile()}]
                                    <div class="pull-top">
                                        <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                                    </div>
                                    [{else}]
                                    <div class="control-group pull-top">
                                        <div>Content :</div>
                                        [{$attr= '_content_'|cat:$la->lang_short}]
                                        <div class="">
                                            <textarea class="form-control validate[required]" 
                                                data-editor="basic"
                                                id="_content_[{$la->lang_short}]" 
                                                name="_content_[{$la->lang_short}]" 
                                                rows="10" 
                                                data-lang="[{$la->lang_short}]"
                                                placeholder="[{$la->lang_name|ucwords}]">[{$item->$attr|quotes_to_entities|default:''}]</textarea>
                                        </div>
                                    </div>
                                    [{/if}]

                                </div>


                                [{assign var="f" value=""}]
                            [{/foreach}]
                        </div>

                        
                        <div class="row">
                            <div class="col-mb-6"> 
                                <div class="pull-top control-group">
                                    <div>Category :</div>
                                    <div class='input-group'>
                                        <select name="_category_id" class="form-control selectpicker"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            <option value="0" >Nothing Select</option>
                                            [{foreach from=$cates item=c}]
                                                <option 
                                                    data-content="<span style='padding-left: [{($c->value|substr_count:'>' -1) *20}]px;'>[{$c->title|escape:'html'}]</span>"
                                                    [{if $c->id == $item->_category_id}]selected="1"[{/if}]
                                                    value="[{$c->id|default:''}]">
                                                        [{$c->title|default:''}]
                                                </option>
                                            [{/foreach}]
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="col-mb-6">   
                                <div class="row half">
                                    <div class="col-mb-6 half">
                                        <div class="control-group pull-top">
                                            <div>Thumb image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    [{if $item->_thumb}]title="<img src='[{$item->_thumb}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="[{$item->_thumb|escape:'html'|default:''}]" 
                                                    name="_thumb" 
                                                    id="_thumb"
                                                    data-putto="#frmErrorVideoThumb"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#_thumb')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorVideoThumb"></div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-mb-6 half">
                                        <div class="control-group pull-top">
                                            <div>Cover image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    [{if $item->_cover}]title="<img src='[{$item->_cover}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="[{$item->_cover|escape:'html'|default:''}]" 
                                                    name="_cover" 
                                                    id="_cover"
                                                    data-putto="#frmErrorVideoCover"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#_cover')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorVideoCover"></div>
                                        </div>
                                    </div>
                                </div>     
                                
                            </div>
                            <div class="col-sm-12 half"> 
                                <div class="">
                                    
                                    <div class="col-mb-4 half">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="_status" class="form-control selectpicker">
                                                <option value="1">Enable</option>
                                                <option value="0" [{if ($item->_status|default:1)==0}]selected[{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="control-group pull-top">
                            <div>Tag :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[maxSize[255]]"
                                name="_tag">[{$item->_tag|escape:'html'|default:''}]</textarea>

                        </div>
                        
            </form>
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