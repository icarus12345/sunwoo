<!-- -->
<div class="row">
    <ul class="h-list">
        [{foreach from=$news_feature item=foo}]
        <li class="active">
            <a href="/news/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
            [{$foo->news_title|escape:'html'}]
            </a>
        </li>
        [{/foreach}]
    </ul>
</div>
<div class="space-line"></div>