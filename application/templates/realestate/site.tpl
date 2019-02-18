[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
	<div class="body-slider" style="position:absolute;left:0;width:100%;top:0;height:550px;">
		<div id="owl-demo" class="owl-carousel">
			[{foreach from=$sliders item=foo}]
			<div class="item bg-cover" style="background-image:url('[{$foo->Image}]');background-position: top center;"></div>
			[{/foreach}]
		</div>
	</div>
	[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
		
        
        <div class="container pull-bottom">
            <div class="about-space"></div>
            <style type="text/css">
                [{if $lang=='en'}]
                    body{background-image: url('/assets/nha-dat/img/bg2-en.jpg')}
                [{else}]  
                  body{background-image: url('/assets/nha-dat/img/bg2.jpg')}
                [{/if}]
            </style>
            <div class="row">
                <div class="col-sm-3" style="padding-top: 10px;">
                    <div class="primary-color"><b>GIỚI THIỆU</b></div>
                    <h3>VỀ CHÚNG TÔI</h3>
                    <ul class="nav-left-menu">
                        [{foreach from=$news_list item=foo}]
                        <li [{if $foo->news_id == $news_detail->news_id}]class="active"[{/if}] >
                            <a href="/gioi-thieu/[{$foo->news_alias|escape:'html'}]">[{$foo->news_title|escape:'html'}]<span class="pull-right">»</span></a>
                        </li>
                        [{/foreach}]
                    </ul>
                    <div class="qa">
                        <img src="/assets/nha-dat/img/qa.jpg">
                        <img src="/assets/nha-dat/img/other.jpg">
                    </div>
                </div>
                <div class="col-sm-9 pull-top">
                    <div class="h2-title pull-top "><span>GIỚI THIỆU</span>
                        TOÀN LỢI là một trong nhiều công ty xây dựng được khách hàng tin cậy và chọn lựa...
                    </div>
                    <div class="row pull-top">
                      <div class="container"> 
                        <div class="h3-title">
                            <span style="float:none">[{$site->data_title|escape:'html'}]</span>
                        </div>
                        [{$site->data_content}]
                      </div>
                    </div>
                    <div class=" pull-top">
                </div>
            </div>
            <div class="sm-space"></div>
        </div>

    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/popup.tpl"}]
</body>