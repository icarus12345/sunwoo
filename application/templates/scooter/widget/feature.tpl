
<div class="feature-body">
    <div class="container">
        <div style="max-width: 380px;margin: 0 auto;padding: 20px 0">
            <h2 style="text-align: center;color: #000;margin: 0;padding: 4px 0;font-size: 40px">FEATURES</h2>
            <h4 style="font-weight: normal;text-align: center;margin: 0;padding: 4px 0">our hottest steads</h4>

        </div>
        <div class="row">
            <div>
                <div class="item active">
                    <div class="feature-list">
                        <div id="owl-example" class="owl-carousel">
                        	[{foreach from=$feature_products item=foo}]
                            <div class="item feature-item">
                                <div class="">
                                    <div class="">
                                    	<a href="/track/[{$foo->cat_alias|escape:'html'}]/[{$foo->product_alias|escape:'html'}]">
	                                        <div class="nailthumb">
	                                            <div class="nailthumb-figure-square">
	                                                <div class="nailthumb-container">
	                                                    <img src="[{$foo->product_thumb|escape:'html'}]" class=""/>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="caption">
	                                            <div class="caption-title">
	                                                <b>[{$foo->product_title|escape:'html'}]</b>
	                                                <span>$ [{$foo->product_price|escape:'html'}]</span>
	                                            </div>
	                                            <div class="caption-desc">
	                                                <p class="line-clamp-3">[{$foo->product_desc|escape:'html'}]</p>
	                                            </div>
	                                            <div>
	                                                <img style="float: right;padding: 20px 0 10px 0" src="/assets/scooter/images/more.png"/>
	                                                <div class="clearfix"></div>
	                                            </div>
	                                        </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            [{/foreach}]
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>