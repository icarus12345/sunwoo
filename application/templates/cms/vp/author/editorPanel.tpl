[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            [{if $item}]
            <h4>[{$tplConfig.editEntryTitle}]</h4>
            [{else}]
            <h4>[{$tplConfig.addEntryTitle}]</h4>
            [{/if}]
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->author_id|default:''}]" 
                id="EntryId"
                />
            
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#[{$tplConfig.name}]-info" aria-controls="[{$tplConfig.name}]-info" role="tab" data-toggle="tab">Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#[{$tplConfig.name}]-images" aria-controls="[{$tplConfig.name}]-images" role="tab" data-toggle="tab">Image List</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="[{$tplConfig.name}]-info">
                        <input type="hidden" name="author_type" 
                            value="[{$item->author_type|default:$type|default:''}]"/>
                        <div class="row">
                            <div class="col-sm-6"> 
                                <div class="control-group pull-top">
                                    <div>Author name :(*)</div>
                                    <input type="text" 
                                        class="form-control validate[required,minSize[2],maxSize[100]]" 
                                        value="[{$item->author_name|escape:'html'|default:''}]" 
                                        name="author_name"
                                        maxlength="100" 
                                        onblur="AliasTo('#entryForm input[name=author_name]','#entryForm input[name=author_alias]')" 
                                        >
                                </div>
                            </div>
                            <div class="col-sm-6">            
                                <div class="control-group pull-top">
                                    <div>Alias :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,maxSize[255]]"
                                        name="author_alias" 
                                        value="[{$item->author_alias|escape|default:''}]"/>
                                </div>
                                <!-- 
                                <div class="pull-top control-group">
                                    <div>Category :(*)</div>

                                    <div class="row-fluid">
                                        <select 
                                            name="author_category" 
                                            class="form-control selectpicker"
                                            data-putto="#frm-err-author_category"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            <option value="">Nothing Selected</option>
                                            [{if $cates|default:null}]
                                            [{foreach from=$cates item=c}]
                                                <option 
                                                    data-content="<span style='padding-left: [{$c->cat_level*20}]px;'>[{$c->cat_title|escape}]</span>"
                                                    [{if $c->cat_id == $item->product_category}]selected="1"[{/if}]
                                                    value="[{$c->cat_id|default:''}]">
                                                        [{$c->cat_title|default:''}]
                                                </option>
                                            [{/foreach}]
                                            [{/if}]
                                        </select>
                                    </div>
                                    <div id="frm-err-author_category"></div> 
                                </div>
                                -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6"> 
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="control-group pull-top">
                                            <div>Position :</div>
                                            <input type="number" 
                                                    class="form-control" value="[{$item->author_position|default:'0'}]" 
                                                    name="author_position"
                                                    >
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="author_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" [{if $item->author_status|default:''=='true'}][{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">   
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="control-group pull-top">
                                            <div>Thumb image :(*)</div>
                                            <div class="input-append">
                                                <input type="text" 
                                                    class="form-control validate[required,maxSize[255]]" 
                                                    value="[{$item->author_thumb|escape:'html'|default:''}]" 
                                                    name="author_thumb" 
                                                    id="author_thumb"
                                                    data-putto="#frmErrorAuthorThumb"
                                                    >
                                                <span class="add-on" 
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#author_thumb')">
                                                    <i class="fa-image"></i>
                                                </span>
                                            </div>
                                            <div id="frmErrorAuthorThumb"></div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="control-group pull-top">
                                            <div>Cover image :(*)</div>
                                            <div class="input-append">
                                                <input type="text" 
                                                    class="form-control validate[required,maxSize[255]]" 
                                                    value="[{$item->author_cover|escape:'html'|default:''}]" 
                                                    name="author_cover" 
                                                    id="author_cover"
                                                    data-putto="#frmErrorAuthorCover"
                                                    >
                                                <span class="add-on" 
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#author_cover')">
                                                    <i class="fa-image"></i>
                                                </span>
                                            </div>
                                            <div id="frmErrorAuthorCover"></div>
                                        </div>
                                    </div>
                                </div>     
                                
                            </div>
                            <div class="col-sm-12"> 
                                <!-- <div class="row">
                                    <div class="col-xs-6">
                                        <div class="control-group pull-top">
                                            <div>Position :</div>
                                            <input type="number" 
                                                    class="form-control" value="[{$item->author_position|default:'0'}]" 
                                                    name="author_position"
                                                    >
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="author_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" [{if $item->author_status|default:''=='true'}][{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                        <fieldset>
                            <legend>Social Link</legend>
                        
                            <div class="row">
                                <div class="col-sm-6"> 
                                    <div class="control-group pull-bottom">
                                        <div>Facebook</div>
                                        <input type="text" 
                                            class="form-control validatemaxSize[255]]" 
                                            value="[{$item->author_face|escape:'html'|default:''}]" 
                                            name="author_face"
                                            maxlength="255" 
                                            >
                                    </div>
                                </div>
                                <div class="col-sm-6">            
                                    <div class="control-group pull-bottom">
                                        <div>Twitter</div>
                                        <input type="text" 
                                            class="form-control validatemaxSize[255]]" 
                                            value="[{$item->author_twit|escape:'html'|default:''}]" 
                                            name="author_twit"
                                            maxlength="255" 
                                            >
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6"> 
                                    <div class="control-group pull-bottom">
                                        <div>Google+</div>
                                        <input type="text" 
                                            class="form-control validatemaxSize[255]]" 
                                            value="[{$item->author_goog|escape:'html'|default:''}]" 
                                            name="author_goog"
                                            maxlength="255" 
                                            >
                                    </div>
                                </div>
                                <div class="col-sm-6">            
                                    <div class="control-group pull-bottom">
                                        <div>Youtube</div>
                                        <input type="text" 
                                            class="form-control validatemaxSize[255]]" 
                                            value="[{$item->author_yotu|escape:'html'|default:''}]" 
                                            name="author_yotu"
                                            maxlength="255" 
                                            >
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <div class="control-group pull-top">
                            <div>Desc :</div>
                            <textarea 
                                rows="3"
                                class="form-control validate[required,maxSize[255]]"
                                name="author_desc">[{$item->author_desc|escape:'html'|default:''}]</textarea>

                        </div>
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
                                    id="author_content"
                                    name="author_content">[{$item->author_content|escape|default:''}]</textarea>

                            </div>
                        [{/if}]
                    </div>
                    <div role="tabpanel" class="tab-pane" id="[{$tplConfig.name}]-images">
                        <div class="container pull-top">
                            <span class="code cursor" 
                                title="Add new Photo" 
                                onclick="[{$tplConfig.name}].choosePhotos()">
                                <i class="fa-plus"></i>&nbsp;Add Images
                            </span>
                            &nbsp;&nbsp;
                            <span class="code cursor" 
                                title="Delete all" 
                                onclick="[{$tplConfig.name}].deletePhotos()">
                                <i class="fa fa-trash-o"></i>&nbsp;Delete all
                            </span>
                        </div>
                        <ul id="sortable" class="sortable" style="min-height: 100px">
                            [{if $item->author_images|default:''!=''}]
                                [{assign var=images value="\r\n"|explode:$item->author_images}]
                                [{foreach from=$images item=img}]
                                    <li class="ui-state-default">
                                        <img class="thumb" src="[{$img}]"/>
                                        <div class="action cursor" onclick="[{$tplConfig.name}].deletePhoto(this)">
                                            <i class="fa fa-trash-o"></i>
                                        </div>
                                    </li>
                                [{/foreach}]
                            [{/if}]
                        </ul>
                        <div class="clearfix"></div>
                        <div class="code">
                            Drag to sort images.<br/>
                            Press Ctrl to select multi images.
                        </div>
                        
                    </div>
                </div>
                <div class="clearfix"></div>
                
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