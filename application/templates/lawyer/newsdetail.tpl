[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/head.tpl"}]
<link rel="stylesheet" type="text/css" href="/libraries/ckeditor/contents.css"/>

<div class="container main-page">
    <div class="space-line"></div>
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left-nav.tpl"}]
    <div class="right-container">
        <div class="navi">
            Home › News › [{if $cat}][{$cat->cat_title|escape:'html'}][{/if}]
        </div>
        <div class="divider"></div>
        <div class="space-line"></div>
        <div class="-container">
        [{if $news}]
            <div class="h3">
                <div>[{$news->news_title|escape:'html'}]</div>
            </div>
            <div class="space-line"></div>
            <div class="dfn">[{$news->news_desc|escape:'html'}]</div>
            <div class="small date">
                <span class="label">[{$cat->cat_title|escape:'html'}]</span> - 
                [{$news->news_publicday|date_format:"%a %d-%m, %Y"}]
            </div>
            <div class="space-line"></div>
            <div class="ckeditor">[{$news->news_content}]</div>
            <div class="space-line"></div>
            [{if $news_relate}]
            <div class="title-ver"><div>Related</div></div>
            <!-- <div class="space-line"></div> -->
            <div class="container">
                <ul class="h-list square-dot">
                [{foreach from=$news_relate item=foo}]
                    <li>
                        <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                        [{$foo->news_title|escape:'html'}] <span class="date"> - [{$foo->news_publicday|date_format:"%a %d-%m, %Y"}]</span>
                        </a>
                    </li>
                [{/foreach}]
                </ul>
            </div>
            <div class="space-line"></div>
            [{/if}]
        [{else}]
            <div class="no-data ">Sorry ! No data to display.</div>
        [{/if}]
        </div>

        <div class="-container">
            <div class="title orange">
                <div><span>Feature Event</span></div>
                <a class="a small dfn pull-right" href="/event">More</a>
            </div>
        </div>

        [{if $event_feature}]
        <div class="news-list row -container half">
            
            [{foreach from=$event_feature item=foo}]
            <div class="col-mb-6 half">
                <div class="news-item-md">
                    <div>
                        <div class="date">
                            <span class="y">[{$foo->news_publicday|date_format:"%d-%m"}]</span>
                        </div>
                        <a href="/event/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                            <div class="nailthumb">
                                <div class="nailthumb-figure">
                                    <div class="nailthumb-container">
                                        <img class="nailthumb-image lazy" src="[{$foo->news_thumb|escape:'html'}]">
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="cap">
                            <a href="/event/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                                <div class="line-clamp-f-2">
                                    [{$foo->news_title|escape:'html'}]
                                </div>
                            </a>
                            <div class="half-space-line"></div>
                            <div>
                                <span class="label">[{$foo->news_at|escape:'html'}]</span>
                                <div class="icon pull-right">
                                    <i class="fa fa-eye"></i> [{$foo->news_view|escape:'html'}]
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="space-line"></div>
            </div>
            [{/foreach}]

            <div class="clearfix"></div>
        </div>
        [{else}]
        <div class="-container">
            <div class="no-data ">Sorry ! No data to display.</div>
        </div>
        [{/if}]
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/foot.tpl"}]