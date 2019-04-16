[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
            <h4>Edit Video</h4>
            [{else}]
            <h4>Add Video</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->video_id|default:''}]" 
                id="EntryId"
                />
            
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                        <div class="row">
                            <div class="col-xs-6" style="z-index:100">
                                <div class="control-group pull-top">
                                    <div>Category :</div>
                                    <div class='input-group'>
                                        <select name="video_category" class="form-control selectpicker"
                                                data-size="10"
                                                >
                                            <option value="" >Nothing Select</option>
                                            [{foreach from=$cates item=c}]
                                                <option 
                                                    data-content="<span style='padding-left: [{($c->cat_value|substr_count:'>' -1) *20}]px;'>[{$c->cat_title|escape:'html'}]</span>"
                                                    [{if $c->cat_id == $item->video_category}]selected="1"[{/if}]
                                                    value="[{$c->cat_id|default:''}]">
                                                        [{$c->cat_title|default:''}]
                                                </option>
                                            [{/foreach}]
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <div class="control-group pull-top">
                                    <div>Type :</div>
                                    <select name="video_type" class="form-control selectpicker">
                                        <option value="youtube">Youtube</option>
                                        <option value="vimeo" [{if $item->video_type|default:''=='vimeo'}]selected[{/if}]>Vimeo</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                <div class="control-group pull-top">
                                    <div>Video Id :</div>
                                    <div class='input-group'>
                                        <input type="text" 
                                            class="form-control validate[required]" value="[{$item->video_sourceid|default:''}]" 
                                            name="video_sourceid"
                                            placeholder="Please input video id (youtube id, vimeo id)"
                                            >
                                        <span class="input-group-addon" onclick="videoPlugin.getYoutubeInfo()"><span class="fa fa-download"></span></span>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                   
                        <div class="row">
                            <div class="col-sm-6"> 
                                <div class="control-group pull-top">
                                    <div>Video title :(*)</div>
                                    <input type="text" 
                                        class="form-control validate[required,minSize[2],maxSize[255]]" 
                                        value="[{$item->video_title|escape:'html'|default:''}]" 
                                        name="video_title"
                                        maxlength="100" 
                                        >
                                </div>
                            </div>
                            <div class="col-sm-6">            
                                <div class="pull-top control-group">
                                    <div>Author :(*)</div>

                                    <div class="row-fluid">
                                        <select 
                                            name="video_author" 
                                            class="form-control selectpicker"
                                            data-putto="#frm-err-video-author"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            <option value="">Nothing Selected</option>
                                            [{if $aAuthors|default:null}]
                                            [{foreach from=$aAuthors item=o}]
                                                <option
                                                    [{if $o->author_id == $item->video_author}]selected="1"[{/if}]
                                                    value="[{$o->author_id|default:''}]">
                                                        [{$o->author_name|default:''}]
                                                </option>
                                            [{/foreach}]
                                            [{/if}]
                                        </select>
                                    </div>
                                    <div id="frm-err-video-author"></div> 
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">   
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="control-group pull-top">
                                            <div>Thumb image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    class="form-control validate[required,maxSize[100]]" 
                                                    value="[{$item->video_thumb|escape:'html'|default:''}]" 
                                                    name="video_thumb" 
                                                    id="video_thumb"
                                                    data-putto="#frmErrorVideoThumb"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#video_thumb')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorVideoThumb"></div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="control-group pull-top">
                                            <div>Cover image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    class="form-control validate[required,maxSize[100]]" 
                                                    value="[{$item->video_cover|escape:'html'|default:''}]" 
                                                    name="video_cover" 
                                                    id="video_cover"
                                                    data-putto="#frmErrorVideoCover"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#video_cover')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorVideoCover"></div>
                                        </div>
                                    </div>
                                </div>     
                                
                            </div>
                            <div class="col-sm-12"> 
                                <div class="row">
                                    
                                    <div class="col-xs-4">
                                        <div class="control-group pull-top">
                                            <div>Position :</div>
                                            <input type="number" 
                                                    class="form-control" value="[{$item->video_position|default:'0'}]" 
                                                    name="video_position"
                                                    >
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="video_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" [{if $item->video_status|default:''=='true'}][{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="control-group pull-top">
                                            <div>Public date :</div>
                                            <div class='input-group date'>
                                                <input type='text' class="form-control"
                                                    name="video_publicday" 
                                                    value="[{$item->video_publicday|default:('Y-m-d H:i:s'|date)}]"
                                                    data-date-format="YYYY-MM-DD H:m:s"/>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="control-group pull-top">
                            <div>Source :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[maxSize[1000]]"
                                name="video_source">[{$item->video_source|escape:'html'|default:''}]</textarea>

                        </div>
                        <div class="control-group pull-top">
                            <div>Link :</div>
                            <input type="text" 
                                class="form-control validate[required,maxSize[255]]"
                                value="[{$item->video_link|escape:'html'|default:''}]" 
                                name="video_link"
                                >

                        </div>
                        <div class="control-group pull-top">
                            <div>Video detail :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[required,maxSize[4000]]"
                                name="video_desc">[{$item->video_desc|escape:'html'|default:''}]</textarea>

                        </div>
                        <div class="control-group pull-top">
                            <div>Tag :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[required,maxSize[255]]"
                                name="video_tag">[{$item->video_tag|escape:'html'|default:''}]</textarea>

                        </div>
                    <!-- </div>
                    <div role="tabpanel" class="tab-pane" id="entry-tab-002"> 
                        
                    </div>
                    </div> -->
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
[{/nocache}]