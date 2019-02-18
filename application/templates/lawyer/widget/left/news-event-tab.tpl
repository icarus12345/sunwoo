<!-- -->
<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active">
            <a href="#tab-of-news" onmouseover="this.click()" aria-controls="tab-of-news" role="tab" data-toggle="tab">News</a>
        </li>
        <li role="presentation">
            <a href="#tab-of-event" onmouseover="this.click()" aria-controls="tab-of-event" role="tab" data-toggle="tab">Event</a>
        </li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="tab-of-news">
            <div class="space-line"></div>
            [{assign var="n" value=0}]
            [{foreach from=$news_latest item=foo }]
                [{if $n < 2}]
                [{assign var="n" value=$n+1}]
            <div class="news-item">
                <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                    <div class="nailthumb">
                        <div class="nailthumb-figure">
                            <div class="nailthumb-container">
                                <img class="nailthumb-image lazy" src="[{$foo->news_thumb|escape:'html'}]">
                            </div>
                        </div>
                    </div>
                </a>
                <div>
                    <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                        <div class="line-clamp-2">
                            [{$foo->news_title|escape:'html'}]
                        </div>
                    </a>
                    <div class="icon">
                        <i class="fa fa-eye"></i> [{$foo->news_view}]
                        <span class="date pull-right">[{$foo->news_publicday|date_format:"%a %d-%m, %Y"}]</span>
                    </div>
                </div>
            </div>
                [{/if}]
            [{/foreach}]
            [{if count($news_latest) > 2}]
            <div class="">
                <ul class="h-list square-dot">
                [{for $n=2 to count($news_latest)-1 }]
                [{assign var="foo" value=$news_latest[$n]}]
                    <li class="active">
                        <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                            [{$foo->news_title|escape:'html'}]
                        </a>
                    </li>
                [{/for}]
                </ul>
            </div>
            [{/if}]
            <div class="space-line"></div>
        </div>
        <div role="tabpanel" class="tab-pane" id="tab-of-event">
            <div class="space-line"></div>
            [{assign var="n" value=0}]
            [{foreach from=$event_latest item=foo }]
                [{if $n < 2}]
                [{assign var="n" value=$n+1}]
            <div class="news-item">
                <a href="/event/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                    <div class="nailthumb">
                        <div class="nailthumb-figure">
                            <div class="nailthumb-container">
                                <img class="nailthumb-image lazy" src="[{$foo->news_thumb|escape:'html'}]">
                            </div>
                        </div>
                    </div>
                </a>
                <div>
                    <a href="/event/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                        <div class="line-clamp-2">
                            [{$foo->news_title|escape:'html'}]
                        </div>
                    </a>
                    <div class="icon">
                        <i class="fa fa-eye"></i> [{$foo->news_view}]
                        <span class="date pull-right">[{$foo->news_publicday|date_format:"%a %d-%m, %Y"}]</span>
                    </div>
                </div>
            </div>
                [{/if}]
            [{/foreach}]
            [{if count($event_latest) > 2}]
            <div class="">
                <ul class="h-list square-dot">
                [{for $n=2 to count($event_latest)-1 }]
                [{assign var="foo" value=$event_latest[$n]}]
                    <li class="active"><a href="event/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">[{$foo->news_title|escape:'html'}]</a></li>
                [{/for}]
                </ul>
            </div>
            [{/if}]
            <div class="space-line"></div>
        </div>
    </div>
</div>
<div class="space-line"></div>