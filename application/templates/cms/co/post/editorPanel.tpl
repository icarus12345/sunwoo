[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
            <h4>Edit Post</h4>
            [{else}]
            <h4>Add new Post</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->post_id|default:''}]" 
                id="EntryId"
                />
            
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
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
                        <div class="row">
                            <div class="col-mb-6 "> 
                                <div class="control-group pull-top">
                                    <div>Title :(*)</div>
                                    <input type="text" 
                                        class="form-control validate[required,minSize[2],maxSize[255]]" 
                                        value="[{$item->post_title|escape:'html'|default:''}]" 
                                        name="post_title"
                                        maxlength="255" 
                                        onblur="AliasTo('#entryForm input[name=post_title]','#entryForm input[name=post_alias]')" 
                                        >
                                </div>
                            </div>
                            <div class="col-mb-6">
                                <div class="control-group pull-top">
                                    <div>Alias :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,maxSize[255]]"
                                        name="post_alias" 
                                        value="[{$item->post_alias|escape|default:''}]"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-mb-6"> 
                                <div class="pull-top control-group">
                                    <div>Author :</div>

                                    <div class="row-fluid">
                                        <select 
                                            name="post_author" 
                                            class="form-control selectpicker"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            <option value="">Nothing Selected</option>
                                            [{if $authors|default:null}]
                                            [{foreach from=$authors item=o}]
                                                <option
                                                    [{if $o->author_id == $item->post_author}]selected="1"[{/if}]
                                                    value="[{$o->author_id|default:''}]">
                                                        [{$o->author_name|default:''|escape:'html'}]
                                                </option>
                                            [{/foreach}]
                                            [{/if}]
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-mb-6">            
                                <div class="pull-top control-group">
                                    <div>Topic :</div>

                                    <div class="row-fluid">
                                        <select 
                                            name="post_topic" 
                                            class="form-control selectpicker"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            <option value="">Nothing Selected</option>
                                            [{if $topics|default:null}]
                                            [{foreach from=$topics item=a}]
                                                [{if $a[0]->author_name|default:'' !=''}]
                                                <optgroup label="Author: [{$a[0]->author_name|default:''|escape:'html'}]">
                                                [{/if}]
                                                [{foreach from=$a item=o}]

                                                <option
                                                    [{if $o->topic_id == $item->post_topic}]selected="1"[{/if}]
                                                    value="[{$o->topic_id|default:''}]">
                                                        [{$o->topic_title|default:''|escape:'html'}]
                                                </option>
                                                [{/foreach}]
                                                [{if $a[0]->author_name|default:'' !=''}]
                                                </optgroup>
                                                [{/if}]
                                            [{/foreach}]
                                            [{/if}]
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-mb-12">   
                                <div class="row">
                                    <div class="col-mb-6">
                                        <div class="control-group pull-top">
                                            <div>Thumb image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    class="form-control validate[required,maxSize[255]]" 
                                                    value="[{$item->post_thumb|escape:'html'|default:''}]" 
                                                    name="post_thumb" 
                                                    id="post_thumb"
                                                    data-putto="#frmErrorpostThumb"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#post_thumb')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorpostThumb"></div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-mb-6">
                                        <div class="control-group pull-top">
                                            <div>Cover image :(*)</div>
                                            <div class='input-group'>
                                                <input type="text" 
                                                    class="form-control validate[required,maxSize[255]]" 
                                                    value="[{$item->post_cover|escape:'html'|default:''}]" 
                                                    name="post_cover" 
                                                    id="post_cover"
                                                    data-putto="#frmErrorpostCover"
                                                    >
                                                <span style"cursor:pointer"
                                                    class="input-group-addon"
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#post_cover')"
                                                    ><i class="fa fa-image"></i></span>
                                            </div>
                                            <div id="frmErrorpostCover"></div>
                                        </div>
                                    </div>
                                </div>     
                                
                            </div>
                            <div class="col-sm-12"> 
                                <div class="row">
                                    
                                    <div class="col-mb-4">
                                        <div class="control-group pull-top">
                                            <div>Position :</div>
                                            <input type="number" 
                                                    class="form-control" value="[{$item->post_position|default:'0'}]" 
                                                    name="post_position"
                                                    >
                                        </div>
                                    </div>
                                    <div class="col-mb-4">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="post_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" [{if $item->post_status|default:''=='true'}][{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-mb-4">
                                        <div class="control-group pull-top">
                                            <div>Public date :</div>
                                            <div class='input-group date'>
                                                <input type='text' class="form-control validate[required]"
                                                    name="post_publicday" 
                                                    value="[{$item->post_publicday|default:('Y-m-d H:i:s'|date)}]"
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
                                name="post_desc">[{$item->post_desc|escape:'html'|default:''}]</textarea>

                        </div>
                        <div class="control-group pull-top">
                            <div>Tag :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[required,maxSize[255]]"
                                name="post_tag">[{$item->post_tag|escape:'html'|default:''}]</textarea>

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
                                id="post_content"
                                name="post_content">[{$item->post_content|escape|default:''}]</textarea>

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