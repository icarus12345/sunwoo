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
                        <div class="row" style="z-index:10;position: relative;">
                            <div class="col-mb-6 "> 
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
                            <div class="col-mb-6">
                                <div class="control-group pull-top">
                                    <div>Alias :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,maxSize[255]]"
                                        name="news_alias" 
                                        value="[{$item->news_alias|escape|default:''}]"/>
                                </div>            
                            </div>
                        </div>
                        <!-- <div class="row">
                            <div class="col-sm-12"> 
                                <div class="row">
                                    <div class="col-mb-3">
                                        <div class="control-group pull-top">
                                            <div>Position :</div>
                                            <input type="number" 
                                                    class="form-control" value="[{$item->news_position|default:'0'}]" 
                                                    name="news_position"
                                                    >
                                        </div>
                                    </div>
                                    <div class="col-mb-3">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="news_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" [{if $item->news_status|default:''=='true'}][{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-mb-6">
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
                        </div> -->
                        
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