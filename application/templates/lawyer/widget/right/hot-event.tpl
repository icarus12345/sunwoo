<!-- -->
<div class="-container">
    <div class="title green">
        <div><i class="fa fa-calendar"></i>HOT EVENT</div>
    </div>
</div>
<div class="row">
    <div class="time-lines" style="padding-top:12%">
    	[{assign var="fos" value=''}]
    	[{foreach from=$event_feature item=foo}]
        <div class="col-mb-6 mix-top">
    	[{if $fos=='first-event'}]
    	[{assign var="fos" value='second-event'}]
    	[{else}]
    	[{assign var="fos" value='first-event'}]
    	[{/if}]
            <div class="event-time-line [{$fos}]">
                <div>
                    <a href="/event/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                        <h3 class="line-clamp-1">
                        	[{$foo->news_title|escape:'html'}]
                        </h3>
                        <div class="nailthumb">
                            <div class="nailthumb-figure">
                                <div class="nailthumb-container">
                                    <img class="nailthumb-image lazy" src="[{$foo->news_thumb|escape:'html'}]">
                                </div>
                        		<span class="date">[{$foo->news_publicday|date_format:"%a %d-%m, %Y"}]</span>
                            </div>
                        </div>
                        <div class="cap">
                            <div class="line-clamp-2">
                                [{if $foo->news_at}]<span class="label-dark">[{$foo->news_at|escape:'html'}]</span> [{/if}][{$foo->news_desc|escape:'html'}]
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        [{/foreach}]
        <div class="clearfix"></div>
    </div>
</div>
<div class="clearfix"></div>
<div class="space-line"></div>