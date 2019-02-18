<!-- -->
<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active">
            <a href="#tab-of-led" onmouseover="this.click()" aria-controls="tab-of-led" role="tab" data-toggle="tab">Advisory</a>
        </li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="tab-of-led">
            <div class="space-line"></div>
            [{foreach from=$advisory_feature item=foo}]
            <div class="news-item-small">
                <div class="line-clamp-3">
                    <!-- <span class="label">[{$foo->cat_title|escape:'html'}]</span>  -->
                    <a href="/advisory/[{$foo->cat_alias|escape:'html'}]/[{$foo->advisory_id}]">[{$foo->advisory_title|escape:'html'}]</a>
                </div>
                <div class="icon">
                    <i class="fa fa-user"></i> [{$foo->advisory_name|escape:'html'}]
                    <span class="date pull-right">[{$foo->advisory_insert|date_format:"%a %d-%m, %Y"}]</span>
                </div>
            </div>
            [{/foreach}]
            <div class="space-line"></div>
        </div>
    </div>
</div>