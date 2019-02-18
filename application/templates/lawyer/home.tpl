[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/meta.tpl"}]
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/head.tpl"}]
<div class="container main-page">
    <div class="space-line"></div>
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/left-nav.tpl"}]
    <div class="right-container">
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/right/home-slider.tpl"}]
    
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/right/hot-news.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/right/hot-event.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/lawyer/widget/right/member-testimonial.tpl"}]
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/lawyer/inc/foot.tpl"}]