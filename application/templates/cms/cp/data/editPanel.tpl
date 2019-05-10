<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
                <h4>[{$tplConfig.editEntryTitle}]</h4>
            [{else}]
                <h4>[{$tplConfig.addEntryTitle}]</h4>
            [{/if}]
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
                <input 
                    type="hidden" 
                    value="[{$item->_type|default:$type}]" 
                    name="_type"
                    />
                <input type="hidden" name="_ordering" value="[{$item->_ordering|default:time()}]">

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
                                    <div class="col-xs-12 half pull-top">
                                        <div class="control-group">
                                            <div>Title :</div>
                                            [{$attr= '_title_'|cat:$la->lang_short}]
                                            <input type="text" 
                                                rows="1"
                                                class="form-control validate[required,maxSize[255]]"
                                                name="_title_[{$la->lang_short}]" 
                                                value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                />
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="control-group pull-top">
                                    <div>Desc :</div>
                                    [{$attr= '_desc_'|cat:$la->lang_short}]
                                    <textarea 
                                        rows="3"
                                        class="form-control validate[required,maxSize[4000]]"
                                        name="_desc_[{$la->lang_short}]" 
                                        
                                        >[{$item->$attr|quotes_to_entities|default:''}]</textarea>

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
                                        <textarea 
                                            class="form-control validate[required]" 
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
                    <div class="col-xs-6">
                        <div class="control-group pull-top">
                            <div>Image :(*)</div>
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control validate[required,maxSize[255]]" 
                                    value="[{$item->_thumb|escape:'html'|default:''}]" 
                                    name="_thumb" 
                                    id="_thumb"
                                    data-putto="#frmErrorAuthorThumb"
                                    >
                                <span class="add-on" 
                                    title="Choose Image"
                                    onclick="BrowseServer('#_thumb')">
                                    <i class="fa fa-image"></i>
                                </span>
                            </div>
                            <div id="frmErrorAuthorThumb"></div>
                        </div>
                        
                    </div>
                    
                </div> 
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