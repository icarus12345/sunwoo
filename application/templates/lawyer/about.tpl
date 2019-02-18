[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/head.tpl"}]
<link rel="stylesheet" type="text/css" href="/libraries/ckeditor/contents.css"/>

<div class="container main-page">
    <div class="space-line"></div>
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left-nav.tpl"}]
    <div class="right-container">
        <div class="navi">
            Home › About
        </div>
        <div class="divider"></div>
        <div class="space-line"></div>
        <ul class="nav nav-tabs">
            [{foreach from=$abouts item=foo}]
            <li role="presentation" class="[{if $about->news_id==$foo->news_id}]active[{/if}]">
                <a href="/about/[{$foo->news_alias|escape:'html'}]" >
                    [{$foo->news_title|escape:'html'}]
                </a>
            </li>
            [{/foreach}]
        </ul>
        <div class="space-line"></div>
        <div class="-container">
        [{if $about}]
            <!-- <div class="h3">
                <div>[{$about->news_title|escape:'html'}]</div>
            </div> -->
            <div class="space-line"></div>
            <div class="ckeditor">[{$about->news_content}]</div>
            <div class="space-line"></div>
            [{if $about_relate}]
            <div class="title-ver"><div>More</div></div>
            <!-- <div class="space-line"></div> -->
            <div class="container">
                <ul class="h-list square-dot">
                [{foreach from=$about_relate item=foo}]
                    <li>
                        <a href="/about/[{$foo->news_alias|escape:'html'}]">
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
        [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/right/gallery.tpl"}]
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/foot.tpl"}]