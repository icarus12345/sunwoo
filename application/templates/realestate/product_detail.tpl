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
                    <div class="h2-title pull-top text-uppercase">
                        <span>[{$languages.all_notification|default:'THÔNG BÁO'}]</span>
                        [{if $lang=='en'}]
                        Toan Loi company is agree construction and design, interior design for project
                        [{else}]
                        Công Ty TNHH Toàn Lợi chuyên nhận xây dựng và thiết kế, thiết kế nội thất cho các công trình.
                        [{/if}]
                    </div>
                    <div class="pull-top">
                        [{if $cate!='410'}]
                        <div class="h3-title text-center">
                            [{if $lang=='en'}]
                            <span style="float:none">[{$product_detail->product_title_en|default:$product_detail->product_title|escape:'html'}]</span>
                            [{else}]
                            <span style="float:none">[{$product_detail->product_title|escape:'html'}]</span>
                            [{/if}]
                            
                        </div>
                        <div class="gray">
                            [{if $lang=='en'}]
                            [{$product_detail->product_content_en}]
                            [{else}]
                            [{$product_detail->product_content}]
                            [{/if}]
                        </div>
                        <div class="space-line"></div>
                        <div class="space-line"></div>
                        [{/if}]

                        [{if $product_detail->product_images|default:''!=''}]
                        [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$product_detail->product_images}]
                        [{if $cate!='410'}]
                        <div class="text-center">[{if $lang=='en'}]Images[{else}]Hình ảnh[{/if}]</div>
                        [{/if}]
                        <div style="position:relative;padding-bottom:64%">
                            <div id="gallery" class="owl-carousel">
                                [{foreach from=$images item=img}]
                                <div class="item" style="background-image:url('[{$img}]');"></div>
                                [{/foreach}]
                            </div>
                            <div id="gallery-thumb" style="padding:0 20px">
                                <div id="owl-thumb-gallery" class="owl-carousel" >
                                    [{foreach from=$images item=img}]
                                    <div class="item">
                                        <div style="background-image:url('[{$img}]');"></div>
                                    </div>
                                    [{/foreach}]
                                </div>
                            </div>
                        </div>
                        [{/if}]
                        [{if $cate=='410'}]
                        <div class="space-line"></div>
                        <div class="space-line"></div>
                        <div class="h3-title text-center">
                            [{if $lang=='en'}]
                            <span style="float:none">[{$product_detail->product_title_en|default:$product_detail->product_title|escape:'html'}]</span>
                            [{else}]
                            <span style="float:none">[{$product_detail->product_title|escape:'html'}]</span>
                            [{/if}]
                        </div>
                        <div class="gray">
                            [{if $lang=='en'}]
                            [{$product_detail->product_content_en}]
                            [{else}]
                            [{$product_detail->product_content}]
                            [{/if}]
                        </div>
                        <div class="space-line"></div>
                        [{/if}]
                    </div>
                    
                </div>
              </div>
            <div class="sm-space"></div>
        </div>
        

    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/popup.tpl"}]
</body>