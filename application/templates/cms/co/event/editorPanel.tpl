[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
            <h4>Edit Event</h4>
            [{else}]
            <h4>Add new Event</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->story_id|default:''}]" 
                id="EntryId"
                />
            
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="story_type" value="[{$item->post_type|default:$type}]">
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
                                    <div>Title :(*)</div>
                                    <input type="text" 
                                        class="form-control validate[required,minSize[2],maxSize[255]]" 
                                        value="[{$item->story_title|escape:'html'|default:''}]" 
                                        name="story_title"
                                        maxlength="255" 
                                        onblur="AliasTo('#entryForm input[name=story_title]','#entryForm input[name=story_alias]')" 
                                        >
                                </div>
                            </div>
                            <div class="col-mb-6">
                                <div class="control-group pull-top">
                                    <div>Alias :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,maxSize[255]]"
                                        name="story_alias" 
                                        value="[{$item->story_alias|escape|default:''}]"/>
                                </div>            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-mb-6">   
                                <div class="control-group pull-top">
                                    <div>Link</div>
                                    <input type="text" 
                                        class="form-control validate[maxSize[255]]" 
                                        value="[{$item->story_link|escape:'html'|default:''}]" 
                                        name="story_link"
                                        maxlength="255" 
                                        >
                                </div>
                            </div>
                            <div class="col-mb-6">   
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="control-group pull-top">
                                            <div>Thumb image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    class="form-control validate[required,maxSize[255]]" 
                                                    value="[{$item->story_thumb|escape:'html'|default:''}]" 
                                                    name="story_thumb" 
                                                    id="story_thumb"
                                                    data-putto="#frmErrorVideoThumb"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#story_thumb')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorVideoThumb"></div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-mb-6">
                                        <div class="control-group pull-top">
                                            <div>Cover image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    class="form-control validate[required,maxSize[255]]" 
                                                    value="[{$item->story_cover|escape:'html'|default:''}]" 
                                                    name="story_cover" 
                                                    id="story_cover"
                                                    data-putto="#frmErrorVideoCover"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#story_cover')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorVideoCover"></div>
                                        </div>
                                    </div>
                                </div>     
                                
                            </div>
                            <div class="col-sm-12"> 
                                <div class="row">
                                    
                                    <div class="col-mb-3">
                                        <div class="control-group pull-top">
                                            <div>Position :</div>
                                            <input type="number" 
                                                    class="form-control" value="[{$item->story_position|default:'0'}]" 
                                                    name="story_position"
                                                    >
                                        </div>
                                    </div>
                                    <div class="col-mb-3">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="story_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" [{if $item->story_status|default:''=='true'}][{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-mb-3">
                                        <div class="control-group pull-top">
                                            <div>Start date :</div>
                                            <div class='input-group date'>
                                                <input type='text' class="form-control validate[required]"
                                                    name="story_startday" 
                                                    value="[{$item->story_startday|default:('Y-m-d H:i:s'|date)}]"
                                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-mb-3">
                                        <div class="control-group pull-top">
                                            <div>End date :</div>
                                            <div class='input-group date'>
                                                <input type='text' class="form-control validate[required]"
                                                    name="story_publicday" 
                                                    value="[{$item->story_publicday|default:('Y-m-d H:i:s'|date)}]"
                                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="control-group pull-top">
                            <div>Desc :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[required,maxSize[4000]]"
                                name="story_desc">[{$item->story_desc|escape:'html'|default:''}]</textarea>

                        </div>
                        <div class="control-group pull-top">
                            <div>Tag :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[required,maxSize[255]]"
                                name="story_tag">[{$item->story_tag|escape:'html'|default:''}]</textarea>

                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="entry-tab-002"> 
                        [{if $ci->agent->is_mobile()}]
                        <div class="pull-top">
                            <div class="code">Editor is hidden in Mobile, please user desktop browser to edit.</div>
                        </div>
                        [{else}]
                        <div class="control-group pull-top">
                            <div>Content :</div>
                            <textarea 
                                rows="10"
                                class="form-control"
                                id="story_content"
                                name="story_content">[{$item->story_content|escape|default:''}]</textarea>

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