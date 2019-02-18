<!-- -->
<div class="">
    <ul class="h-list square-dot">
        [{foreach from=$event_feature item=foo}]
        <li>
            <a href="/event/[{$foo->cat_alias|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
            [{$foo->news_title|escape:'html'}]
            </a>
        </li>
        [{/foreach}]
    </ul>
</div>