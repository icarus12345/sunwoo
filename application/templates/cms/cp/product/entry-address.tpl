<div class="control-group pull-top">
    <div>Address : <span data-latlonpreview="product_latproduct_lng">[{$item->product_lat|escape|default:'0'}] [{$item->product_lng|escape|default:'0'}]</span></div>
    
    <div style="height:240px;background:#ccc"
        data-googlemap="1" 
        data-lat="[{$item->product_lat|escape|default:'0'}]" 
        data-latcolumn="product_lat" 
        data-lon="[{$item->product_lng|escape|default:'0'}]"
        data-loncolumn="product_lng"
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
