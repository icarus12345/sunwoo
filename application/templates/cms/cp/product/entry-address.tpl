<div class="control-group pull-top">
    <div>Address : <span data-latlonpreview="product_latproduct_lng">[{$item->product_lat|escape|default:'0'}] [{$item->product_lng|escape|default:'0'}]</span></div>
    
    <div style="height:240px;background:#ccc"
        data-googlemap="1" 
        data-lat="[{$item->product_lat|escape|default:'0'}]" 
        data-latcolumn="product_lat" 
        data-lon="[{$item->product_lng|escape|default:'0'}]"
        data-loncolumn="product_lng"
        data-address-input="product_address"
        ></div>
        <input type="hidden" 
            value="[{$item->product_lat|escape|default:'0'}]" 
            name="product_lat"
            >
        <input type="hidden" 
            value="[{$item->product_lng|escape|default:'0'}]" 
            name="product_lng"
            >
        <div class="code">
            Click on Map or drag marker to change location.
        </div>
</div>
<div class="row half">
    <div class="col-mb-6 half"> 
        <div class="control-group pull-top">
            <div>Address :</div>
            <input type="text" 
                id="product_address"
                class="form-control validate[]" 
                value="[{$item->product_address|escape|default:''}]" 
                name="product_address"
                >
        </div>
    </div>
    <div class="col-mb-6 half"> 
        <div class="control-group pull-top">
            <div>Country :</div>
            <div class="row-fluid">
                <select 
                    name="product_country_id" 
                    class="form-control selectpicker"
                    data-putto="#frm-err-product_country_id"
                    data-live-search="true"
                    data-size="10"
                    >
                    [{if $countries|default:null}]
                    [{foreach from=$countries item=c}]
                        <option 
                            [{if $c->_id == $item->product_country_id}]selected="1"[{/if}]
                            value="[{$c->_id|default:''}]"
                            >
                            [{$c->_local_name|default:''}]
                        </option>
                    [{/foreach}]
                    [{/if}]
                </select>
            </div>
            <div id="frm-err-product_country_id"></div>
        </div>
    </div>
</div>