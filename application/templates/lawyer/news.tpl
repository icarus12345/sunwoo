[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/head.tpl"}]
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
            <div class="title green">
                <div>[{if !$cat}]All [{/if}]News[{if $cat}] for [{$cat->cat_title|escape:'html'}][{/if}]</div>
                <a class="a small dfn pull-right" href="/news">More</a>
            </div>
        </div>
        [{if $news_list}]
        <div class="news-list row -container half">
            [{assign var="n" value=0}]
            [{foreach from=$news_list item=foo}]
                [{if $n < 2}]
                [{assign var="n" value=$n+1}]
            <div class="col-mb-6 half">
                <div class="news-item-sm">
                    <div>
                        <div class="date">
                            <span class="y">[{$foo->news_publicday|date_format:"%d-%m"}]</span>
                        </div>
                        <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                            <div class="nailthumb">
                                <div class="nailthumb-figure">
                                    <div class="nailthumb-container" style="overflow: hidden; padding: 0px;">
                                        <img class="nailthumb-image" src="[{$foo->news_thumb|escape:'html'}]">
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="cap">
                            <div class="line-clamp-2">
                                <span class="label-dark">[{$foo->cat_title|escape:'html'}]</span> [{$foo->news_title|escape:'html'}]
                            </div>
                        </div>
                    </div>
                </div>
                <div class="space-line"></div>
            </div>
                [{/if}]
            [{/foreach}]
            [{assign var="n" value=0}]
            [{foreach from=$news_list item=foo}]
            [{assign var="n" value=$n+1}]
            [{if $n > 2}]
            <div class="col-mb-6 half">
                <div class="news-item-md">
                    <div>
                        <div class="date">
                            <span class="y">[{$foo->news_publicday|date_format:"%d-%m"}]</span>
                        </div>
                        <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                            <div class="nailthumb">
                                <div class="nailthumb-figure">
                                    <div class="nailthumb-container">
                                        <img class="nailthumb-image lazy" src="[{$foo->news_thumb|escape:'html'}]">
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="cap">
                            <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                                <div class="line-clamp-f-2">
                                    [{$foo->news_title|escape:'html'}]
                                </div>
                            </a>
                            <div class="half-space-line"></div>
                            <div>
                                <span class="label">[{$foo->cat_title|escape:'html'}]</span>
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
            [{/if}]
            [{/foreach}]

            <div class="clearfix"></div>
        </div>
        <div>[{$paging}]</div>
        [{else}]
        <div class="row -container">
            <div class="no-data ">Sorry ! No data to display.</div>
        </div>
        [{/if}]

        <div class="row -container">
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
                        <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                            <div class="nailthumb">
                                <div class="nailthumb-figure">
                                    <div class="nailthumb-container">
                                        <img class="nailthumb-image lazy" src="[{$foo->news_thumb|escape:'html'}]">
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="cap">
                            <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
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
        <div class="row -container">
            <div class="no-data ">Sorry ! No data to display.</div>
        </div>
        [{/if}]
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/foot.tpl"}]