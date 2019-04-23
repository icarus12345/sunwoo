[{nocache}]
<div class="row-fluid">
    <div class="widget full">
        <div class="modal-header">
            <h4>Product</h4>
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
                <input type="hidden" name="_ordering" value="[{$item->_ordering|default:time()}]">
                <input type="hidden" name="_type" 
                            value="[{$item->_type|default:$type|default:''}]"/>
                <div class="row half">
                    <div class="col-mb-6 half">            
                        <div class="pull-top control-group">
                            <div>Category :(*)</div>

                            <div class="row-fluid">
                                <select 
                                    data-cateid=1
                                    name="_category_id" 
                                    class="form-control selectpicker"
                                    data-putto="#frm-err-category"
                                    data-live-search="true"
                                    data-size="10"
                                    >
                                    [{if $cates|default:null}]
                                    [{foreach from=$cates item=c}]
                                        <option 
                                            data-content="<span style='padding-left: [{$c->_level*20}]px;'>[{$c->_title|escape}]</span>"
                                            [{if $c->_id == $item->_category_id}]selected="1"[{/if}]
                                            value="[{$c->_id|default:''}]">
                                                [{$c->_title|default:''}]
                                        </option>
                                    [{/foreach}]
                                    [{/if}]
                                </select>
                            </div>
                            <div id="frm-err-category"></div>
                        </div>
                    </div>
                    <div class="col-mb-6 half">            
                        <div class="pull-top control-group">
                            <div>Supplier :(*)</div>

                            <div class="row-fluid">
                                <select 
                                    name="_supplier_id" 
                                    class="form-control selectpicker"
                                    data-putto="#frm-err-supplier"
                                    data-live-search="true"
                                    data-size="10"
                                    >
                                    <option value="0"></option>
                                    [{if $cates|default:null}]
                                    [{foreach from=$supplier_data item=c}]
                                        <option 
                                            [{if $c->_id == $item->_supplier_id}]selected="1"[{/if}]
                                            value="[{$c->_id|default:''}]">
                                                [{$c->_title|default:''}]
                                        </option>
                                    [{/foreach}]
                                    [{/if}]
                                </select>
                            </div>
                            <div id="frm-err-supplier"></div>
                        </div>
                    </div>
                    
                    <div class="col-mb-3 half"> 
                        <div class="control-group pull-top">
                            <div>Code :</div>
                            <input type="text" 
                                class="form-control validate[required,minSize[2],maxSize[20]]"
                                name="_code" 
                                value="[{$item->_code|escape|default:''}]"/>
                        </div>
                    </div>
                    <div class="col-mb-3 half"> 
                        <div class="control-group pull-top">
                            <div>Price (Unit:1000):</div>
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control text-right validate[required,min[0],custom[number]]"
                                    name="_price" 
                                    value="[{$item->_price|escape|default:'0'}]"/>
                                <span class="add-on" title="Unit 1000">
                                    K
                                </span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-mb-2 half"> 
                        <div class="control-group pull-top">
                            <div>Discount:</div>
                            <div class="input-append">
                                <input type="text" 
                                    class="form-control validate[required,custom[number]]"
                                    name="_discount" 
                                    value="[{$item->_discount|escape|default:'0'}]"/>
                                <span class="add-on" title="Unit 1000">
                                    K
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-mb-2 half"> 
                            
                        <div class="control-group pull-top">
                            <div>Status :</div>
                            <select name="_status" class="form-control selectpicker">
                                <option value="1">Enable</option>
                                <option value="0" [{if $item->_status|default:'1'=='0'}]selected[{/if}]>Disable</option>
                            </select>
                        </div>
                        
                    </div>
                    <div class="col-mb-2 half">   
                        <div class="control-group pull-top">
                            <div>Label :</div>
                            <select name="_label" class="form-control selectpicker">
                                <option value=""></option>
                                <option value="hot" [{if $item->_label|default:''=='hot'}]selected[{/if}]>Hot</option>
                                <option value="new" [{if $item->_label|default:''=='new'}]selected[{/if}]>New</option>
                                <option value="sale" [{if $item->_label|default:''=='sale'}]selected[{/if}]>Sale</option>
                                <option value="sold" [{if $item->_label|default:''=='sold'}]selected[{/if}]>Sold</option>
                            </select>
                        </div>
                        
                    </div>
                </div>
                <div class="row half pull-bottom">
                    
                    <div class="col-mb-6 half"> 
                        
                    </div>
                </div>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#product-info" aria-controls="product-info" role="tab" data-toggle="tab">General Information</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-images" aria-controls="product-images" role="tab" data-toggle="tab">Images</a>
                    </li>
                    <li role="presentation">
                        <a href="#product-custom" aria-controls="product-custom" role="tab" data-toggle="tab">Customize</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active pull-top" id="product-info">
                        

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
                                                [{$attr= '_title_'|cat:$la->lang_short}]

                                                <input type="text" 
                                                    onblur="AliasTo('#entryForm input[name=[{$attr}]]','#entryForm input[name=_alias_[{$la->lang_short}]]')" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="[{$attr}]" 
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    
                                                    maxlength="255" 
                                                    >
                                            </div>
                                        </div>
                                        <div class="col-mb-6 half">
                                            <div class="control-group pull-top">
                                                <div>Alias :</div>
                                                [{$attr= '_alias_'|cat:$la->lang_short}]
                                                <input type="text" 
                                                    class="form-control validate[required,minSize[2],maxSize[255]]"
                                                    name="[{$attr}]" 
                                                    data-lang="[{$la->lang_short}]"
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]"
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="row half">
                                        <div class="col-mb-6 half"> 
                                            <div class="control-group pull-top">
                                                <div>Price :(*)</div>
                                                [{$attr= '_price_'|cat:$la->lang_short}]

                                                <input type="text" 
                                                    class="form-control validate[required,min[0],custom[number]]" 
                                                    value="[{$item->$attr|quotes_to_entities|default:''}]" 
                                                    name="[{$attr}]" 
                                                    placeholder="[{$la->lang_name|ucwords}]"
                                                    
                                                    maxlength="255" 
                                                    >
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="control-group pull-top">
                                        <div>Desc :(*)</div>
                                        [{$attr= '_desc_'|cat:$la->lang_short}]
                                        <textarea class="form-control validate[required]" 
                                            name="[{$attr}]" 
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
                                        [{$attr= '_content_'|cat:$la->lang_short}]
                                        <div class="">
                                            <textarea 
                                                class="form-control validate[required]" 
                                                data-editor="basic"
                                                id="[{$attr}]" 
                                                name="[{$attr}]" 
                                                rows="10" 
                                                data-lang="[{$la->lang_short}]"
                                                placeholder="[{$la->lang_name|ucwords}]">[{$item->$attr|quotes_to_entities|default:''}]</textarea>
                                        </div>
                                    </div>
                                    [{/if}]

                                    <div class="control-group pull-top">
                                        <div>Tag :(*)</div>
                                        [{$attr= '_tag_'|cat:$la->lang_short}]
                                        <textarea class="form-control validate[required]" 
                                            name="[{$attr}]" 
                                            rows="2" 
                                            data-lang="[{$la->lang_short}]"
                                            placeholder="[{$la->lang_name|ucwords}]">[{$item->$attr|quotes_to_entities|default:''}]</textarea>
                                    </div>
                                </div>


                                [{assign var="f" value=""}]
                            [{/foreach}]
                        </div>
                        
                        <div class="clearfix"></div>
                        
                    </div>
                    <div role="tabpanel" class="tab-pane" id="product-images">
                        <div class="row half pull-top">
                            <div class="col-xs-6 half">
                                <div class="control-group pull-top">
                                    <div>Image :(*)</div>
                                    <div class="input-append">
                                        <input type="text" 
                                            [{if $item->_image}]title="<img src='[{$item->_image}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                            class="form-control tool-tip validate[required,maxSize[255]]" 
                                            value="[{$item->_image|escape|default:''}]" 
                                            name="_image" 
                                            id="_image"
                                            >
                                        <span class="add-on" 
                                            title="Choose Image"
                                            onclick="BrowseServer('#_image')">
                                            <i class="fa fa-image"></i>
                                        </span>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-xs-6 half">
                                <div class="control-group pull-top">
                                    <div>Cover :</div>
                                    <div class="input-append">
                                        <input type="text" 
                                            [{if $item->_cover}]title="<img src='[{$item->_cover}]' style='max-height:80px;max-width:120px'/>"[{/if}]
                                            class="form-control tool-tip validate[maxSize[255]]" 
                                            value="[{$item->_cover|escape|default:''}]" 
                                            name="_cover" 
                                            id="_cover"
                                            >
                                        <span class="add-on" 
                                            title="Choose Image"
                                            onclick="BrowseServer('#_cover')">
                                            <i class="fa fa-image"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div class="pull-top">
                                <div>List Images:</div>
                        </div>
                        <ul id="sortable-default"data-role="sortable" class="sortable" style="min-height: 100px" data-prefix="_data[images][default][]">
                            [{if $item->_data}]
                                <li class="ui-state-default ui-state-dashed" onclick="App.PhotoBook.add('#sortable-default')">
                                        <i class="fa fa-plus"></i>
                                </li>
                                [{foreach from=$item->_data.images.default item=img}]
                                    <li class="ui-state-default">
                                        <img class="thumb" src="[{$img|escape}]"/>
                                        <div class="action cursor" onclick="App.PhotoBook.delete(this)">
                                            <i class="fa fa-trash-alt"></i>
                                        </div>
                                        <input type="hidden" name="_data[images][default][]" value="[{$img|escape}]">
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
                    <div role="tabpanel" class="tab-pane" id="product-custom">
                        [{include file=$smarty.const.APPPATH|cat:"templates/cms/cp/product/entry-custom.tpl"}]
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