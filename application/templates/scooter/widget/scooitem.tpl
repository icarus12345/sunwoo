<div id="owl-scoo" class="owl-carousel">
    [{foreach from=$feature_products item=foo}]
    <div class="item">
        <div class="scooter-body bg-cover" style="background-image:url([{$foo->product_cover|escape:'html'}])">
            <div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
                <div class="product-info dark limit">
                    <div class="sm-space-line"></div>
                    <h2 class="big-title">[{$foo->product_title|escape:'html'}]</h2>
                    <div class="sm-space-line"></div>
                    [{$foo->product_content}]
                </div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
                <div class="sm-space-line"></div>
            </div>
        </div>
    </div>
    [{/foreach}]
</div>