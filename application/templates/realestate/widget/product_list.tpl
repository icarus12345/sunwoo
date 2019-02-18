<div class="row pull-top">
[{foreach from=$product_list item=foo}]
	<div class="col-sm-3 col-mb-3 col-xs-6">
	    
	        <div class="product-item-2" onclick="$(this).next().click()">
	            <div class="nailthumb">
	                <div class="nailthumb-figure-75">
	                    <div class="nailthumb-container" style="overflow: hidden; padding: 0px;">
	                        <img class="nailthumb-image lazy" src="[{$foo->product_thumb|escape:'html'}]" 
	                        	title="[{$foo->product_title|escape:'html'}]"
	                        	-style="position:absolute;top:0;left:0;bottom:0;right:0;margin: auto;max-width:100%;max-height:100%" 
	                        	>
	                    </div>
	                </div>
	            </div>
	        </div>
	        [{if $foo->product_images|default:''!=''}]
                [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$foo->product_images}]
                [{foreach from=$images item=img}]
                <a class="swipebox" 
                    href="[{$img}]" 
                    data-cap='[{$foo->product_desc|escape:'html'}]'
                    title="[{$foo->product_title|escape:'html'}]"
                    rel="gallery-[{$foo->product_id}]"
                    ></a>
                [{/foreach}]
            [{/if}]
        <a href="/[{$catealias[$cate]}]/[{$foo->product_alias|escape:'html'}]">
	        <p class="line-clamp-f-2 project-cap">
	        	[{if $lang=='en'}]
	            <strong>[{$foo->product_title_en|default:$foo->product_title|escape:'html'}]</strong></br>
	        	[{else}]
	            <strong>[{$foo->product_title|escape:'html'}]</strong></br>
	            [{/if}]
	        </p> 
	    </a>   
	</div>
[{/foreach}]
</div>
<div>
[{$htmlPager}]
</div>