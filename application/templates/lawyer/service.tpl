[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/head.tpl"}]
<link rel="stylesheet" type="text/css" href="/libraries/ckeditor/contents.css"/>

<div class="container main-page">
    <div class="space-line"></div>
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left-nav.tpl"}]
    <div class="right-container">
        <div class="navi">
            Home › Service
        </div>
        <div class="divider"></div>
        <div class="space-line"></div>
        <div class="container">
        [{if $service}]
            <div class="h3">
                <div>[{$service->news_title|escape:'html'}]</div>
            </div>
            <div class="space-line"></div>
            <div class="ckeditor">[{$service->news_content}]</div>
            <div class="space-line"></div>
            [{if $service_relate}]
            <div class="title-ver"><div>More</div></div>
            <!-- <div class="space-line"></div> -->
            <div class="container">
                <ul class="h-list square-dot">
                [{foreach from=$service_relate item=foo}]
                    <li>
                        <a href="/service/[{$foo->news_alias|escape:'html'}]">
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
        
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/foot.tpl"}]