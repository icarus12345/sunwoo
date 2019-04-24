[{nocache}]
    <div class="row">
        <div class="col-sm-12">
            <input 
                type="hidden" 
                value="[{$item->_id|default:''}]" 
                id="seoEntryId"
                />
            <form name="seoform" id="seoform" target="integration_asynchronous">
                <input type="hidden" name="_type" id="_type" value="[{$type}]"/>
                <input type="hidden" name="_head_id" id="head_id" value="[{$head_id}]"/>
                <div class="lang-tabs default" style="z-index: 11;position: relative;margin-left: 10px">
                    <ul class="nav-tabs">
                        [{assign var="f" value="active"}]
                        [{foreach from=$langs item=la key =k}]
                            <li class="[{$f|default:''}]">
                                <a  title="[{$la->lang_name|ucwords}]"
                                    href="#tab_seo_[{$la->lang_short}]"  
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
                        
                        <div id="tab_seo_[{$la->lang_short}]" class="tab-pane [{$f|default:''}]">
                            <div class="control-group pull-top">
                                <div>Title :(*)</div>
                                [{$attr= '_title_'|cat:$la->lang_short}]
                                <input type="text" 
                                    class="form-control validate[required,minSize[2],maxSize[255]]"
                                    name="_title_[{$la->lang_short}]" 
                                    data-lang="[{$la->lang_short}]"
                                    placeholder="[{$la->lang_name|ucwords}]"
                                    value="[{$item->$attr|quotes_to_entities|default:''}]"
                                    />
                                
                            </div>
                            <div class="control-group pull-top">
                                <div>Keywords :(*)</div>
                                [{$attr= '_keyword_'|cat:$la->lang_short}]
                                <textarea class="form-control validate[required,maxSize[140]]" 
                                    name="_keyword_[{$la->lang_short}]" 
                                    rows="2" 
                                    data-lang="[{$la->lang_short}]"
                                    placeholder="[{$la->lang_name|ucwords}]">[{$item->$attr|quotes_to_entities|default:''}]</textarea>
                            </div>
                                
                            
                            
                            <div class="control-group pull-top">
                                <div>Desc :(*)</div>
                                [{$attr= '_desc_'|cat:$la->lang_short}]
                                <textarea class="form-control validate[required,maxSize[160]]" 
                                    name="_desc_[{$la->lang_short}]" 
                                    rows="2" 
                                    data-lang="[{$la->lang_short}]"
                                    placeholder="[{$la->lang_name|ucwords}]">[{$item->$attr|quotes_to_entities|default:''}]</textarea>

                            </div>
                        </div>
                        [{assign var="f" value=""}]
                    [{/foreach}]
                </div>

                <div class="control-group pull-top">
                    <div>Image :(*)</div>
                    <div class="input-append">
                        <input type="text" 
                            [{if $item->_image}]title="<img src='[{$item->_image}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                            class="form-control tool-tip validate[required,maxSize[255]]" 
                            value="[{$item->_image|escape|default:''}]" 
                            name="_image" 
                            id="seo_image"
                            >
                        <span class="add-on" 
                            title="Choose Image"
                            onclick="BrowseServer('#seo_image')">
                            <i class="fa fa-image"></i>
                        </span>
                    </div>
                </div>
            </form>
        </div>
    </div>
[{/nocache}]