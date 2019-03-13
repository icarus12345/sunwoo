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
                value="[{$item->product_id|default:''}]" 
                id="EntryId"
                />
            
            <form name="entryForm" id="entryForm" target="integration_asynchronous">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#product-info" aria-controls="product-info" role="tab" data-toggle="tab">Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-opt" aria-controls="product-opt" role="tab" data-toggle="tab">General Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-features" aria-controls="product-features" role="tab" data-toggle="tab">Features</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-images" aria-controls="product-images" role="tab" data-toggle="tab">Image List</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-address" aria-controls="product-address" role="tab" data-toggle="tab">Address</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active pull-top" id="product-info">
                        <input type="hidden" name="product_type" 
                            value="[{$item->product_type|default:$type|default:''}]"/>

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
                                                [{$attr= 'product_title_'|cat:$la->lang_short}]

                                                <input type="text" 
                                                    onblur="AliasTo('#entryForm input[name=product_title_[{$la->lang_short}]]','#entryForm input[name=product_alias_[{$la->lang_short}]]')" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="product_title_[{$la->lang_short}]" 
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    
                                                    maxlength="255" 
                                                    >
                                            </div>
                                        </div>
                                        <div class="col-mb-6 half">
                                            <div class="control-group pull-top">
                                                <div>Alias :</div>
                                                [{$attr= 'product_alias_'|cat:$la->lang_short}]
                                                <input type="text" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]"
                                                    name="product_alias_[{$la->lang_short}]" 
                                                    data-lang="[{$la->lang_short}]"
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]"
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group pull-top">
                                        <div>Desc :(*)</div>
                                        [{$attr= 'product_desc_'|cat:$la->lang_short}]
                                        <textarea class="form-control validate[required]" 
                                            name="product_desc_[{$la->lang_short}]" 
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
                                        [{$attr= 'product_content_'|cat:$la->lang_short}]
                                        <div class="">
                                            <textarea class="form-control validate[required]" 
                                                data-editor="basic"
                                                id="product_content_[{$la->lang_short}]" 
                                                name="product_content_[{$la->lang_short}]" 
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
                            <div class="col-mb-3 half"> 
                                <div class="control-group pull-top">
                                    <div>Code :</div>
                                    <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[4],maxSize[20]]"
                                        name="product_code" 
                                        value="[{$item->product_code|escape|default:''}]"/>
                                </div>
                            </div>
                            <div class="col-mb-3 half"> 
                                <div class="control-group pull-top">
                                    <div>Is Hot :</div>
                                    <!-- <input type="text" 
                                        rows="1"
                                        class="form-control validate[required,minSize[4],maxSize[20]]"
                                        name="product_is_hot" 
                                        value="[{$item->product_is_hot|escape|default:''}]"/> -->
                                    <div class="">
                                        <input type='hidden' value='[{$item->product_is_hot}]' name='product_is_hot'>
                                        <label class="cb"> <input onChange="$(this).parent().prev().val(+(this.checked))" value="1" type="checkbox" [{if $item->product_is_hot}]checked=1[{/if}]><span></span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-mb-6 half">            
                                <div class="pull-top control-group">
                                    <div>Category :(*)</div>

                                    <div class="row-fluid">
                                        <select 
                                            name="product_category" 
                                            class="form-control selectpicker"
                                            data-putto="#frm-err-product_category"
                                            data-live-search="true"
                                            data-size="10"
                                            >
                                            [{if $cates|default:null}]
                                            [{foreach from=$cates item=c}]
                                                <option 
                                                    data-content="<span style='padding-left: [{$c->cat_level*20}]px;'>[{$c->cat_title_vi|escape}]</span>"
                                                    [{if $c->cat_id == $item->product_category}]selected="1"[{/if}]
                                                    value="[{$c->cat_id|default:''}]">
                                                        [{$c->cat_title_vi|default:''}]
                                                </option>
                                            [{/foreach}]
                                            [{/if}]
                                        </select>
                                    </div>
                                    <div id="frm-err-product_category"></div>
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
                                                    [{if $item->product_thumb}]title="<img src='[{$item->product_thumb}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                    class="form-control tool-tip validate[required,maxSize[255]]" 
                                                    value="[{$item->product_thumb|escape|default:''}]" 
                                                    name="product_thumb" 
                                                    id="product_thumb"
                                                    >
                                                <span class="add-on" 
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#product_thumb')">
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
                                                    [{if $item->product_cover}]title="<img src='[{$item->product_cover}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                                    class="form-control tool-tip validate[maxSize[255]]" 
                                                    value="[{$item->product_cover|escape|default:''}]" 
                                                    name="product_cover" 
                                                    id="product_cover"
                                                    >
                                                <span class="add-on" 
                                                    title="Choose Image"
                                                    onclick="BrowseServer('#product_cover')">
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
                                            <div>Position :</div>
                                            
                                                <input type="number" 
                                                    class="form-control validate[required,custom[number]]" 
                                                    data-prompt-position="topLeft:0,20"
                                                    data-errormessage-custom-error="Numbers only"
                                                    value="[{$item->product_position|escape|default:'100'}]" 
                                                    name="product_position"
                                                    data-putto="#err-product_position"
                                                    >
                                        </div>
                                        <div id="err-product_position"></div>
                                    </div>
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Status :</div>
                                            <select name="product_status" class="form-control selectpicker">
                                                <option value="true">Enable</option>
                                                <option value="false" [{if $item->product_status|default:''=='true'}][{/if}]>Disable</option>
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
                            [{if $item->product_images|default:''!=''}]
                                [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$item->product_images}]
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
                    <div role="tabpanel" class="tab-pane pull-top" id="product-opt">
                        [{*include file=$smarty.const.APPPATH|cat:"templates/cms/cp/product/entryOptBasic.tpl"*}]
                        <div class="lang-tabs default" style="z-index: 11;position: relative;margin-left: 10px">
                            <ul class="nav-tabs">
                                [{assign var="f" value="active"}]
                                [{foreach from=$langs item=la key =k}]
                                    <li class="[{$f|default:''}]">
                                        <a  title="[{$la->lang_name|ucwords}]"
                                            href="#tab_lang_general_[{$la->lang_short}]"  
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
                                <div id="tab_lang_general_[{$la->lang_short}]" class="tab-pane [{$f|default:''}]">
                                    <div class="row half">
                                        <div class="col-mb-6 half"> 
                                            <div class="control-group pull-top">
                                                <div>Furniture :</div>
                                                [{$attr= 'product_furniture_'|cat:$la->lang_short}]

                                                <input type="text" 
                                                    class="form-control validate[maxSize[100]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="product_furniture_[{$la->lang_short}]" 
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    maxlength="100" 
                                                    >
                                            </div>
                                        </div>
                                        <div class="col-mb-6 half"> 
                                            <div class="control-group pull-top">
                                                <div>Utilities :</div>
                                                [{$attr= 'product_utilities_'|cat:$la->lang_short}]

                                                <input type="text" 
                                                    class="form-control validate[maxSize[100]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="product_utilities_[{$la->lang_short}]" 
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    maxlength="100" 
                                                    >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                [{assign var="f" value=""}]
                            [{/foreach}]
                        </div>
                        <div class="row half">
                            <div class="col-mb-6 half"> 
                                <div class="row half">
                                    
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Price :</div>
                                            <input type="number" 
                                                class="form-control validate[custom[number]]" 
                                                value="[{$item->product_price|escape|default:'0'}]" 
                                                name="product_price"
                                                >
                                        </div>
                                    </div>
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Acreage :</div>
                                            <input type="number" 
                                                class="form-control validate[custom[number]]" 
                                                value="[{$item->product_acreage|escape|default:'0'}]" 
                                                name="product_acreage"
                                                >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-mb-6 half"> 
                                <div class="row half">
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Width :</div>
                                            <input type="number" 
                                                class="form-control validate[custom[number]]" 
                                                value="[{$item->product_width|escape|default:'0'}]" 
                                                name="product_width"
                                                >
                                        </div>
                                    </div>
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Height :</div>
                                            <input type="number" 
                                                class="form-control validate[custom[number]]" 
                                                value="[{$item->product_height|escape|default:'0'}]" 
                                                name="product_height"
                                                >
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="col-mb-6 half"> 
                                <div class="row half">
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Bedroom :</div>
                                            <input type="number" 
                                                class="form-control validate[custom[number]]" 
                                                value="[{$item->product_bedroom|escape|default:''}]" 
                                                name="product_bedroom"
                                                >
                                        </div>
                                    </div>
                                    <div class="col-xs-6 half">
                                        <div class="control-group pull-top">
                                            <div>Bathroom :</div>
                                            <input type="number" 
                                                class="form-control validate[custom[number]]" 
                                                value="[{$item->product_bathroom|escape|default:''}]" 
                                                name="product_bathroom"
                                                >
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="product-features">
                        [{include file=$smarty.const.APPPATH|cat:"templates/cms/cp/product/entry-features.tpl"}]
                    </div>
                    <div role="tabpanel" class="tab-pane" id="product-address">
                        [{include file=$smarty.const.APPPATH|cat:"templates/cms/cp/product/entry-address.tpl"}]
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