[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Product</h4>
            <ul class="navbar-icons" style="position: absolute;right: 0;top:0px;">
                <li><a href="JavaScript:" title="Save" onclick="[{$tplConfig.name}].onSave()"><i class="fa-save"></i></a></li>
                <li><a href="JavaScript:" title="Back to entry list" onclick="[{$tplConfig.name}].onCancel()"><i class="fa-reply-all"></i></a></li>
            </ul>
        </div>
        <div class="modal-body">
            <input 
                type="hidden" 
                value="[{$item->id|default:''}]" 
                id="EntryId"
                />
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <input type="hidden" name="ordering" value="[{$item->ordering|default:time()}]">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#product-info" aria-controls="product-info" role="tab" data-toggle="tab">Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-images" aria-controls="product-images" role="tab" data-toggle="tab">Image List</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active pull-top" id="product-info">
                        <input type="hidden" name="type" 
                            value="[{$item->type|default:$type|default:''}]"/>

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
                                                [{$attr= 'title_'|cat:$la->lang_short}]

                                                <input type="text" 
                                                    onblur="AliasTo('#entryForm input[name=title_[{$la->lang_short}]]','#entryForm input[name=alias_[{$la->lang_short}]]')" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="title_[{$la->lang_short}]" 
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    
                                                    maxlength="255" 
                                                    >
                                            </div>
                                        </div>
                                        <div class="col-mb-6 half">
                                            <div class="control-group pull-top">
                                                <div>Alias :</div>
                                                [{$attr= 'alias_'|cat:$la->lang_short}]
                                                <input type="text" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]"
                                                    name="alias_[{$la->lang_short}]" 
                                                    data-lang="[{$la->lang_short}]"
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]"
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row half">
                                        <div class="col-mb-6 half"> 
                                            <div class="control-group pull-top">
                                                <div>Price :(*)</div>
                                                [{$attr= 'price_'|cat:$la->lang_short}]

                                                <input type="text" 
                                                    class="form-control validate[required,min[0],custom[number]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="price_[{$la->lang_short}]" 
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    
                                                    maxlength="255" 
                                                    >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group pull-top">
                                        <div>Desc :(*)</div>
                                        [{$attr= 'description_'|cat:$la->lang_short}]
                                        <textarea class="form-control validate[required]" 
                                            name="description_[{$la->lang_short}]" 
                                            rows="2" 
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
                                        [{$attr= 'content_'|cat:$la->lang_short}]
                                        <div class="">
                                            <textarea 
                                                class="form-control validate[required]" 
                                                data-editor="basic"
                                                id="content_[{$la->lang_short}]" 
                                                name="content_[{$la->lang_short}]" 
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
                        
                        <div class="row half">
                            <div class="col-mb-6 half">            
                                <div class="pull-top control-group">
                                    <div>Category :(*)</div>

                                    <div class="row-fluid">
                                        <select 
                                            name="category_id" 
                                            class="form-control selectpicker"
                                            data-putto="#frm-err-category"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            [{if $cates|default:null}]
                                            [{foreach from=$cates item=c}]
                                                <option 
                                                    data-content="<span style='padding-left: [{$c->level*20}]px;'>[{$c->title|escape}]</span>"
                                                    [{if $c->id == $item->category_id}]selected="1"[{/if}]
                                                    value="[{$c->id|default:''}]">
                                                        [{$c->title|default:''}]
                                                </option>
                                            [{/foreach}]
                                            [{/if}]
                                        </select>
                                    </div>
                                    <div id="frm-err-category"></div>
                                </div>
                            </div>
                            
                            <div class="col-mb-3 half"> 
                                <div class="control-group pull-top">
                                    <div>Code :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[2],maxSize[20]]"
                                        name="code" 
                                        value="[{$item->code|escape|default:''}]"/>
                                </div>
                            </div>
                            <div class="col-mb-3 half"> 
                                <div class="control-group pull-top">
                                    <div>Is Hot :</div>
                                    <!-- <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[4],maxSize[20]]"
                                        name="is_hot" 
                                        value="[{$item->is_hot|escape|default:''}]"/> -->
                                    <div class="">
                                        <input type='hidden' value='[{$item->is_hot|default:"0"}]' name='is_hot'>
                                        <label class="cb"> <input onChange="$(this).parent().prev().val(+(this.checked))" value="1" type="checkbox" [{if $item->is_hot}]checked=1[{/if}]><span></span></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row half">
                            <div class="col-mb-6 half">   
                                <div class="row half">
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Image :(*)</div>
                                            <div class="input-append">
                                                <input type="text" 
                                                    [{if $item->thumb}]title="<img src='[{$item->thumb}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                    class="form-control tool-tip validate[required,maxSize[255]]" 
                                                    value="[{$item->thumb|escape|default:''}]" 
                                                    name="thumb" 
                                                    id="thumb"
                                                    >
                                                <span class="add-on" 
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#thumb')">
                                                    <i class="fa-image"></i>
                                                </span>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Cover :</div>
                                            <div class="input-append">
                                                <input type="text" 
                                                    [{if $item->cover}]title="<img src='[{$item->cover}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="[{$item->cover|escape|default:''}]" 
                                                    name="cover" 
                                                    id="cover"
                                                    >
                                                <span class="add-on" 
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#cover')">
                                                    <i class="fa-image"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>     
                                
                            </div>
                            <div class="col-mb-6 half"> 
                                <div class="row half">
                                    
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="status" class="form-control selectpicker">
                                                <option value="1">Enable</option>
                                                <option value="0" [{if $item->status|default:'1'=='0'}][{/if}]>Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div role="tabpanel" class="tab-pane" id="product-images">
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
                            [{if $item->images|default:''!=''}]
                                [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$item->images}]
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
    <br/>
    <br/>
    <br/>
    <br/>
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