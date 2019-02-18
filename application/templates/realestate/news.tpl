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
                    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/left_menu.tpl"}]

                </div>
                <div class="col-sm-9 pull-top">
                    <div class="space-line"></div>
                    <div class="h2-title pull-top  ">
                        [{if $lang=='en'}]
                        <span>[{$cat->cat_title_en|default:'NEWS'|escape:'html'}]</span>
                        Toan Loi company is agree construction and design, interior design for project
                        [{else}]
                        <span>[{$cat->cat_title|default:'TIN TỨC'|escape:'html'}]</span>
                        Công Ty TNHH Toàn Lợi chuyên nhận xây dựng và thiết kế, thiết kế nội thất cho các công trình.
                        [{/if}]
                    </div>
                    <div class="pull-top">
                        [{foreach from=$news_list item=foo}]
                        <div>
                            <a href="/[{$cat->cat_alias|default:'tin-tuc'|escape:'html'}]/[{$foo->news_alias|escape:'html'}]">
                                <div class="nailthumb" style="float:left;margin-right:10px;width:100px;height:72px;position:relative">
                                    <div class="nailthumb-container">
                                        <img class="lazy nailthumb-image" src="[{$foo->news_thumb|escape:'html'}]">
                                    </div>
                                </div>
                                [{if $lang=='en'}]
                                <div><b>[{$foo->news_title_en|default:$foo->news_title|escape:'html'}]</b></div>
                                [{else}]
                                <div><b>[{$foo->news_title|escape:'html'}]</b></div>
                                [{/if}]
                            </a>
                            [{if $lang=='en'}]
                            <div class="line-clamp-f-3">[{$foo->news_desc_en|default:$foo->news_desc|escape:'html'}]</div>
                            [{else}]
                            <div class="line-clamp-f-3">[{$foo->news_desc|escape:'html'}]</div>
                            [{/if}]
                        </div>
                        <div class="clearfix"></div>
                        <div class="space-line"></div>
                        [{foreachelse}]
                        <div style="padding:40px 0;">Đang cập nhật...</div>
                        [{/foreach}]
                    </div>
                    <div >
                        [{$paging}]
                    </div>
                    
                </div>
              </div>
            <div class="sm-space"></div>
        </div>
        

    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/popup.tpl"}]
</body>