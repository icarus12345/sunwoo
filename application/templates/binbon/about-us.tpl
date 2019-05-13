[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/nav.tpl"}]

<div class="wrap">
    <ol class="breadcrumb">
      <li><a href="/">[{$languages.default.home|escape}]</a></li>
      <li><a href="/">[{$languages.default.pages|escape}]</a></li>
      <li class="active">[{$languages.default.about_us|escape}]</li>
    </ol>
    <div class="about-us row">
        <div class="col-sm-4">
            <div class="working-hour">
                <h3>[{$news_list[1]->_title|escape}]</h3>
                <p>[{$news_list[1]->_desc|escape}]</p>
                <div class="">
                    <div class="ckeditor">[{$news_list[1]->_content}]</div>
                </div>
                <div class="text-center pull-top">
                    <a href="/pages/contact-us" class="btn btn-primary">[{$languages.default.contact_us|escape}]</a>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="working-hour">
                <h3>[{$news_list[0]->_title|escape}]</h3>
                <p>[{$news_list[0]->_desc|escape}]</p>
                <div class="">
                    <div class="ckeditor">[{$news_list[0]->_content}]</div>
                </div>
            </div>
        </div>
    </div>
    <div class="our-services">
        <h3>[{$languages.default.our_services|escape}]</h3>
        <div class="row">
            [{foreach from=$our_services item=foo}]
            <div class="col-sm-4 item">
                <div>
                    <span class="thumb cover" style="background-image: url('[{$foo->_thumb|escape}]');"></span>
                    <div class="">[{$foo->_title|escape}]</div>
                    <p class="line-clamp-2">[{$foo->_desc|escape}]</p>
                </div>
            </div>
            [{/foreach}]
        </div>
    </div>
    <br/>
    <div class="working-hour">
        <h3>[{$languages.default.partner_us|escape}]</h3>
        <fieldset class="owl-border">
            <legend>[{$languages.default.we_love_brands|escape}]</legend>
            <div class="owl-carousel owl-theme" id="owl-carousel-partner">
                [{foreach from=$suppliers item=foo}]
                <div class="item">
                    <img title="[{$foo->_title|escape}]" src="[{$foo->_image|escape}]"/>
                </div>
                [{/foreach}]
            </div>
        </fieldset>
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/binbon/inc/foot.tpl"}]
