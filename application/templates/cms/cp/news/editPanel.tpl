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
                value="[{$item->news_id|default:''}]" 
                id="EntryId"
                />
            
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="news_type" value="[{$item->post_type|default:$type}]">
               
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
                                                [{$attr= 'news_title_'|cat:$la->lang_short}]

                                                <input type="text" 
                                                    onblur="AliasTo('#entryForm input[name=news_title_[{$la->lang_short}]]','#entryForm input[name=news_alias_[{$la->lang_short}]]')" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="news_title_[{$la->lang_short}]" 
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    
                                                    maxlength="255" 
                                                    >
                                            </div>
                                        </div>
                                        <div class="col-mb-6 half">
                                            <div class="control-group pull-top">
                                                <div>Alias :</div>
                                                [{$attr= 'news_alias_'|cat:$la->lang_short}]
                                                <input type="text" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]"
                                                    name="news_alias_[{$la->lang_short}]" 
                                                    data-lang="[{$la->lang_short}]"
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]"
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group pull-top">
                                        <div>Desc :(*)</div>
                                        [{$attr= 'news_desc_'|cat:$la->lang_short}]
                                        <textarea class="form-control validate[required]" 
                                            name="news_desc_[{$la->lang_short}]" 
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
                                        [{$attr= 'news_content_'|cat:$la->lang_short}]
                                        <div class="">
                                            <textarea class="form-control validate[required]" 
                                                data-editor="basic"
                                                id="news_content_[{$la->lang_short}]" 
                                                name="news_content_[{$la->lang_short}]" 
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
                                        <select name="news_category" class="form-control selectpicker"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            <option value="0" >Nothing Select</option>
                                            [{foreach from=$cates item=c}]
                                                <option 
                                                    data-content="<span style='padding-left: [{($c->cat_value|substr_count:'>' -1) *20}]px;'>[{$c->cat_title|escape:'html'}]</span>"
                                                    [{if $c->cat_id == $item->news_category}]selected="1"[{/if}]
                                                    value="[{$c->cat_id|default:''}]">
                                                        [{$c->cat_title|default:''}]
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
                                                    [{if $item->news_thumb}]title="<img src='[{$item->news_thumb}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="[{$item->news_thumb|escape:'html'|default:''}]" 
                                                    name="news_thumb" 
                                                    id="news_thumb"
                                                    data-putto="#frmErrorVideoThumb"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#news_thumb')"
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
                                                    [{if $item->news_cover}]title="<img src='[{$item->news_cover}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="[{$item->news_cover|escape:'html'|default:''}]" 
                                                    name="news_cover" 
                                                    id="news_cover"
                                                    data-putto="#frmErrorVideoCover"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#news_cover')"
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
                                            <div>Position :</div>
                                            <input type="number" 
                                                    class="form-control" value="[{$item->news_position|default:'0'}]" 
                                                    name="news_position"
                                                    >
                                        </div>
                                    </div>
                                    <div class="col-mb-4 half">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="news_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" [{if ($item->news_status|default:'')=='false'}]selected[{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-mb-4 half" style="display:none">
                                        <div class="control-group pull-top">
                                            <div>Public date :</div>
                                            <div class='input-group date'>
                                                <input type='text' class="form-control validate[required]"
                                                    name="news_publicday" 
                                                    value="[{$item->news_publicday|default:('Y-m-d H:i:s'|date)}]"
                                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
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
                                name="news_tag">[{$item->news_tag|escape:'html'|default:''}]</textarea>

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