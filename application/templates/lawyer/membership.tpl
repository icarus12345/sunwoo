[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/head.tpl"}]
<link rel="stylesheet" type="text/css" href="/libraries/ckeditor/contents.css"/>

<div class="container main-page">
    <div class="space-line"></div>
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left-nav.tpl"}]
    <div class="right-container">
        <div class="navi">
            Home › Membership
        </div>
        <div class="divider"></div>
        <div class="space-line"></div>
        [{if $staffs}]
        <div class="container">
            <div class="title">
                <div>STAFF</div>
            </div>
        </div>
        <div class="container half">
            [{foreach from=$staffs item=foo}]
            <div class="col-mb-6 half">
                <div class="item staff">
                    <div class="">
                        <div class=" line-clamp-4">[{$foo->data_desc|escape:'html'}]</div>
                        <div class="space-line"></div>
                        <div class="name">
                            <div>[{$foo->data_title|escape:'html'}]</div>
                            <span class="date">[{$foo->data_subtitle|escape:'html'}]</span><br>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <img class="av" src="[{$foo->data_thumb|escape:'html'}]">
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="space-line"></div>
            </div>
            [{/foreach}]
        </div>
        <div class="clearfix"></div>
        [{else}]
        <div class="container">
            <div class="no-data ">Sorry ! No data to display.</div>
        </div>
        [{/if}]
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/foot.tpl"}]