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
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#entry-tab-001" aria-controls="entry-tab-001" role="tab" data-toggle="tab">Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#entry-tab-002" aria-controls="entry-tab-002" role="tab" data-toggle="tab">Content</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="entry-tab-001">
                        <div class="row half" style="z-index:10;position: relative;">
                            <div class="col-mb-6  half"> 
                                <div class="control-group pull-top">
                                    <div>
                                        Title :(*)
                                        <div class="pull-right lang-tabs">
                                            <ul class="nav-tabs">
                                                <li class="active">
                                                    <a  title="Tiếng Việt"
                                                        href="#tab_news_title_vi" 
                                                        data-toggle="tab" 
                                                        >Vi</a>
                                                </li>
                                                <li>
                                                    <a  title="English"
                                                        href="#tab_news_title_en" 
                                                        data-toggle="tab" 
                                                        >En</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="controls tab-content">
                                        <div id="tab_news_title_vi" class="tab-pane active">
                                            <input type="text" 
                                                class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                value="[{$item->news_title|escape:'html'|default:''}]" 
                                                name="news_title"
                                                maxlength="255" 
                                                onblur="AliasTo('#entryForm input[name=news_title]','#entryForm input[name=news_alias]')" 
                                                >
                                        </div>
                                        <div id="tab_news_title_en" class="tab-pane">
                                            <input type="text" 
                                                class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                value="[{$item->news_title_en|escape:'html'|default:''}]" 
                                                name="news_title_en"
                                                maxlength="255" 
                                                >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-mb-6 half">
                                <div class="control-group pull-top">
                                    <div>Alias :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[6],maxSize[255]]"
                                        name="news_alias" 
                                        value="[{$item->news_alias|escape|default:''}]"/>
                                </div>            
                            </div>
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
                                            <option value="" >Nothing Select</option>
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
                            <div>
                                Desc :(*)
                                <div class="pull-right lang-tabs">
                                    <ul class="nav-tabs">
                                        <li class="active">
                                            <a  title="Tiếng Việt"
                                                href="#tab_news_desc_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_news_desc_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_news_desc_vi" class="tab-pane active">
                                    <textarea 
                                        rows="3"
                                        class="form-control validate[required,maxSize[4000]]"
                                        name="news_desc">[{$item->news_desc|escape:'html'|default:''}]</textarea>
                                </div>
                                <div id="tab_news_desc_en" class="tab-pane">
                                    <textarea 
                                        rows="3"
                                        class="form-control validate[required,maxSize[4000]]"
                                        name="news_desc_en">[{$item->news_desc_en|escape:'html'|default:''}]</textarea>
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
                    </div>
                    <div role="tabpanel" class="tab-pane" id="entry-tab-002"> 
                        [{if $ci->agent->is_mobile()}]
                        <div class="pull-top">
                            <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                        </div>
                        [{else}]
                        <div class="control-group pull-top">
                            <div>
                                Content :(*)
                                <div class="pull-right lang-tabs">
                                    <ul class="nav-tabs">
                                        <li class="active">
                                            <a  title="Tiếng Việt"
                                                href="#tab_news_content_vi" 
                                                data-toggle="tab" 
                                                >Vi</a>
                                        </li>
                                        <li>
                                            <a  title="English"
                                                href="#tab_news_content_en" 
                                                data-toggle="tab" 
                                                >En</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="controls tab-content">
                                <div id="tab_news_content_vi" class="tab-pane active">
                                    <textarea 
                                        rows="10"
                                        class="form-control"
                                        id="news_content"
                                        name="news_content">[{$item->news_content|escape|default:''}]</textarea>
                                </div>
                                <div id="tab_news_content_en" class="tab-pane">
                                    <textarea 
                                        rows="10"
                                        class="form-control"
                                        id="news_content_en"
                                        name="news_content_en">[{$item->news_content_en|escape|default:''}]</textarea>
                                </div>
                            </div>

                        </div>
                        [{/if}]
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