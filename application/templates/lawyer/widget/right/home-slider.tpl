[{if $news_event_latest}]
<div class="" style="height:293px;background: #000;">
    <div id="jssor-slider" style="position: relative; top: 0px; left: 0px; width: 754px;
        height: 293px; background:#000;">
        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(../../libraries/plugin/jssorslider/img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>
        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 554px; height: 293px;
            overflow: hidden;">
            [{foreach from=$news_event_latest item=foo }]
            <div>
                <div u='image' class="bg-cover" style="background-image:url([{$foo->news_thumb|escape:'html'}])"></div>
                <div u="thumb">
                    <div class="i bg-cover" style="background-image:url([{$foo->news_thumb|escape:'html'}])" ></div>
                    <div class="t">
                        <div class="line-clamp-f-2">
                            [{$foo->news_title|escape:'html'}]
                        </div>
                    </div>
                </div>
                <div u=caption class="caption"  style="position:absolute; left:0px; bottom: 0px; width:100%;"> 
                    <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]" class="label-dark pull-right">read more</a>
                    <div class="line-clamp-2">
                        [{$foo->news_desc|escape:'html'}]
                    </div>
                </div>
            </div>
            [{/foreach}]
        </div>
        <!-- Navigator Skin Begin -->
        <!-- navigator container -->
        <div u="navigator" class="jssor-navi" style="position: absolute; top: 5px; left: 5px;">
            <!-- navigator item prototype -->
            <div u="prototype" style="position: absolute; width: 10px; height: 10px;"></div>
        </div>
        <!-- Navigator Skin End -->
        <!-- ThumbnailNavigator Skin Begin -->
        <div u="thumbnavigator" class="jssor-thumb" style="position: absolute; width: 212px; height: 293px; left:554px; top:0px;">
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides" style="cursor: move;">
                <div u="prototype" class="thumb" style="position: absolute; width: 217px; height: 48px; top: 0; left: 0;">
                    <thumbnailtemplate></thumbnailtemplate>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- ThumbnailNavigator Skin End -->
        <a style="display: none" href="http://www.jssor.com">jQuery Carousel</a>
    </div>
</div>
<div class="space-line"></div>
[{/if}]