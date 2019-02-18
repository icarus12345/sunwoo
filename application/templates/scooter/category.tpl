[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/meta.tpl"}]
<body class="scoo-contact">
    <div class="nailthumb">
	    <div class="nailthumb-product bg-cover" 
	    	[{if $cat->cat_cover}]style="background-image:url([{$cat->cat_cover|escape:'html'}])"[{/if}]
	    	>
	        <div class="nailthumb-mark"></div>
	    </div>
		[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/menu.tpl"}]
		[{if $cat}]
		<div class="popup-head">
            <div class="container">
                <div class="popup-body">
                    <div>
                        <div class="pull-bottom">
                            <img class="pop-title" src="/assets/scooter/images/track.png"/>
                            [{if $cat->cat_image}]<img class="pop-title" src="[{$cat->cat_image|escape:'html'}]"/>[{/if}]
                            <img class="pop-title" src="/assets/scooter/images/line.png"/>
                        </div>
                        <div class="pull-top">
                            <div class="line-clamp-3 word-wrap">[{$cat->cat_desc|escape:'html'}]</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        [{/if}]
    </div>
    <div class="tracker-body">
        <div class="container">
            <div style="max-width: 380px;margin: 0 auto;padding: 20px 0">
                <div class="title-2">SCOOTER [{if $cat}]/ <b>[{$cat->cat_title|escape:'html'}]</b>[{/if}]</div>
                <!-- <div style="padding: 20px 0">
                    <div class="input-group search-mode">
                        <input type="text" class="form-control" placeholder="Search mode" aria-describedby="basic-addon2">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-search"></i>
                        </span>
                    </div>
                </div> -->
            </div>
            <div class="row">
                <div class="row">
                	[{foreach from=$products item=foo}]
                    <div class="col-sm-4 col-mb-6 col-xs-6">
                        <div class="scooter-item">
                            <div class="">
                            	<a href="/track/[{$foo->cat_alias|escape:'html'}]/[{$foo->product_alias|escape:'html'}]">
	                                <div class="nailthumb">
	                                    <div class="nailthumb-figure-square">
	                                        <div class="nailthumb-container">
	                                            <img data-original="[{$foo->product_thumb|escape:'html'}]" class="lazy"/>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="caption transition">
	                                    <div class="caption-title">
	                                        <b>[{$foo->product_title|escape:'html'}]</b>
	                                        <span>$ [{$foo->product_price|default:'0.00'|escape:'html'}]</span>
	                                    </div>
	                                    <div class="caption-desc">
	                                        <p class="line-clamp-f-3">[{$foo->product_desc|escape:'html'}]</p>
	                                    </div>
	                                </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    [{/foreach}]
                </div>
                <div class="pagination">
                    [{$paging}]
                </div>
            </div>
        </div>
    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]