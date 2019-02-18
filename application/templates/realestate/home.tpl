[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body style="background-image:none">
	<div class="body-slider" style="position:absolute;left:0;width:100%;top:0;height:550px;">
		<div id="owl-demo" class="owl-carousel">
			[{foreach from=$sliders item=foo}]
            [{if $lang=='en'}]
			<div class="item bg-100" style="background-image:url('[{$foo->Image_en}]');background-position: top center;"></div>
            [{else}]  
            <div class="item bg-100" style="background-image:url('[{$foo->Image}]');background-position: top center;"></div>
            [{/if}]
			[{/foreach}]
		</div>
	</div>
	[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
		<div class="container pull-bottom">
            <div class="header-space"></div>
            <div class="-row ">
                <div class="video-box">
                    <div class="video-bg">
                        <div class="pull-right">
                            <!-- <div class="primary-color"><b>VIDEO QUẢNG CÁO</b></div> -->
                            <div class="pull-top pull-bottom">
                                <button class="btn btn-xs btn-primary active text-uppercase">[{$languages['all_image']|default:'Hình ảnh'}]</button>
                                <button class="btn btn-xs btn-primary">VIDEO</button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="video">
                            <div>
                                <video id="my_video" loop autoplay muted>
                                    <source type="video/mp4" src="/assets/nha-dat/img/video/xaydung-3d.mp4">
                                </video>
                                <div class="controls">
                                    <!-- <i class="fa fa-play"></i> -->
                                    <i id="pay-pause" class="fa fa-pause"></i>
                                    <i class="fa fa-stop"></i>
                                    <input id="seekslider" class="seekslider" type="range" min="0" max="100" value="0" step="1">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="row pull-top">
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="space-line"></div>
                <div class="col-sm-6 col-mb-12">
                    <div class="row">
                        <div class="col-sm-6 col-mb-6 col-xs-12">
                            <div role="tabpanel">
                                <ul class="nav nav-tabs pull-bottom" role="tablist">
                                    <li class="active"><a href="#tintuc" data-toggle="tab">[{$languages.all_news|default:'TIN TỨC'}]</a></li>
                                    <li class=""><a href="#thongbao" data-toggle="tab">[{$languages.all_notification|default:'THÔNG BÁO'}]</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="tintuc">
                                        <ul class="list-news">
                                        [{foreach from=$news_list item=foo}]
                                            <li>
                                                <a href="/tin-tuc/[{$foo->news_alias|escape:'html'}]">
                                                [{if $lang=='en'}]
                                                    <div class="line-clamp-1">[{$foo->news_title_en|default:$foo->news_title|escape:'html'}]</div>
                                                [{else}]  
                                                    <div class="line-clamp-1">[{$foo->news_title|escape:'html'}]</div>  
                                                [{/if}]
                                                </a>
                                            </li>
                                        [{foreachelse}]
                                            <li>Dữ liệu đang cập nhật...</li>
                                        [{/foreach}]
                                        </ul>
                                        [{if $news_list|count==4}]
                                        <a href="/tin-tuc" class="more"></a>
                                        [{/if}]
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="thongbao">
                                        <ul class="list-news">
                                        [{foreach from=$noti_list item=foo}]
                                            <li>
                                                <a href="/thong-bao/[{$foo->news_alias|escape:'html'}]">
                                                    [{if $lang=='en'}]
                                                        <div class="line-clamp-1">[{$foo->news_title_en|default:$foo->news_title|escape:'html'}]</div>
                                                    [{else}]  
                                                        <div class="line-clamp-1">[{$foo->news_title|escape:'html'}]</div>  
                                                    [{/if}] 
                                                </a>
                                            </li>
                                        [{foreachelse}]
                                            <li>Dữ liệu đang cập nhật...</li>
                                        [{/foreach}]
                                        </ul>
                                        [{if $noti_list|count==4}]
                                        <a href="/thong-bao" class="more"></a>
                                        [{/if}]
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-mb-6 col-xs-12">
                            <div class="primary-color pull-bottom text-uppercase" ><b>[{$languages['all_buildings-project']|default:'Công trình - dự án'}]</b></div>
                            <div class="product-item">
                                [{if $ctProduct}]
                                <div class="product-thumb">
                                    
                                    <div class="nailthumb" onclick="$(this).next().click()">
                                        <div class="nailthumb-figure-75">
                                            <div class="nailthumb-container">
                                                <img src="[{$ctProduct->product_thumb|escape:'html'}]" class="lazy"/>
                                            </div>
                                        </div>
                                    </div>
                                    [{if $ctProduct->product_images|default:''!=''}]
                                        [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$ctProduct->product_images}]
                                        [{foreach from=$images item=img}]
                                        <a class="swipebox" 
                                            href="[{$img}]" 
                                            [{if $lang=='en'}]
                                            title="[{$ctProduct->product_title_en|default:$ctProduct->product_title|escape:'html'}]"data-cap='[{$ctProduct->product_desc_en|default:$ctProduct->product_desc|escape:'html'}]'
                                            [{else}]
                                            title="[{$ctProduct->product_title|escape:'html'}]"
                                            data-cap='[{$ctProduct->product_desc|escape:'html'}]'
                                            [{/if}]
                                            rel="gallery-[{$ctProduct->product_id}]"
                                            ></a>
                                        [{/foreach}]
                                    [{/if}]
                                </div>
                                <div class="product-capt">
                                    <div>
                                        <a href="/cong-trinh/[{$ctProduct->product_alias|escape:'html'}]">
                                            [{if $lang=='en'}]
                                            <strong><div class="line-clamp-1">[{$ctProduct->product_title_en|default:$ctProduct->product_title|escape:'html'}]</div></strong>
                                            [{else}]
                                            <strong><div class="line-clamp-1">[{$ctProduct->product_title|escape:'html'}]</div></strong>
                                            [{/if}]
                                        </a>
                                    </div>
                                    [{if $lang=='en'}]
                                    <p class="line-clamp-4">[{$ctProduct->product_desc_en|default:$ctProduct->product_desc|escape:'html'}]</p>
                                    [{else}]
                                    <p class="line-clamp-4">[{$ctProduct->product_desc|escape:'html'}]</p>
                                    [{/if}]
                                    <a href="/cong-trinh/[{$ctProduct->product_alias|escape:'html'}]">
                                        <span class="btn btn-xs btn-default">[{$languages['all_readmore']|default:'XEM THÊM'}] <i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                [{/if}]
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-sm-6 col-mb-12">
                    <div class="row">
                        <div class="col-sm-6 col-mb-6 col-xs-12">
                            <div class="primary-color text-uppercase"><b>[{$languages['all_interested_customers']|default:'Khách hàng quan tâm'}]</b></div>
                            <div class="product-item pull-top">
                                [{if $khProduct}]
                                <div class="product-thumb">
                                    <div class="nailthumb" onclick="$(this).next().click()">
                                        <div class="nailthumb-figure-75">
                                            <div class="nailthumb-container">
                                                <img src="[{$khProduct->product_thumb|escape:'html'}]" class="lazy"/>
                                            </div>
                                        </div>
                                    </div>
                                    [{if $khProduct->product_images|default:''!=''}]
                                        [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$khProduct->product_images}]
                                        [{foreach from=$images item=img}]
                                        <a class="swipebox" 
                                            href="[{$img}]" 
                                            [{if $lang=='en'}]
                                            title="[{$khProduct->product_title_en|default:$khProduct->product_title|escape:'html'}]"data-cap='[{$khProduct->product_desc_en|default:$khProduct->product_desc|escape:'html'}]'
                                            [{else}]
                                            title="[{$khProduct->product_title|escape:'html'}]"
                                            data-cap='[{$khProduct->product_desc|escape:'html'}]'
                                            [{/if}]
                                            rel="gallery-[{$khProduct->product_id}]"
                                            ></a>
                                        [{/foreach}]
                                    [{/if}]
                                </div>
                                <div class="product-capt">
                                    <div>
                                        <a href="/cong-trinh/[{$khProduct->product_alias|escape:'html'}]">
                                            [{if $lang=='en'}]
                                            <strong><div class="line-clamp-1">[{$khProduct->product_title_en|default:$khProduct->product_title|escape:'html'}]</div></strong>
                                            [{else}]
                                            <strong><div class="line-clamp-1">[{$khProduct->product_title|escape:'html'}]</div></strong>
                                            [{/if}]
                                        </a>
                                    </div>
                                    [{if $lang=='en'}]
                                    <p class="line-clamp-4">[{$khProduct->product_desc_en|default:$khProduct->product_desc|escape:'html'}]</p>
                                    [{else}]
                                    <p class="line-clamp-4">[{$khProduct->product_desc|escape:'html'}]</p>
                                    [{/if}]
                                    <a href="/cong-trinh/[{$khProduct->product_alias|escape:'html'}]">
                                        <span class="btn btn-xs btn-default">[{$languages['all_readmore']|default:'XEM THÊM'}] <i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                [{/if}]
                            </div>
                        </div>
                        <div class="col-sm-6 col-mb-6 col-xs-12">
                            <div class="primary-color text-uppercase"><b>[{$languages['all_interior-design']|default:'Thiết kế nội thất'}]</b></div>
                            <div class="product-item pull-top">
                                 [{if $tkProduct}]
                                <div class="product-thumb">
                                    <div class="nailthumb" onclick="$(this).next().click()">
                                        <div class="nailthumb-figure-75">
                                            <div class="nailthumb-container">
                                                <img src="[{$tkProduct->product_thumb|escape:'html'}]" class="lazy"/>
                                            </div>
                                        </div>
                                    </div>
                                    [{if $tkProduct->product_images|default:''!=''}]
                                        [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$tkProduct->product_images}]
                                        [{foreach from=$images item=img}]
                                        <a class="swipebox" 
                                            href="[{$img}]" 
                                            [{if $lang=='en'}]
                                            title="[{$tkProduct->product_title_en|default:$tkProduct->product_title|escape:'html'}]"data-cap='[{$tkProduct->product_desc_en|default:$tkProduct->product_desc|escape:'html'}]'
                                            [{else}]
                                            title="[{$tkProduct->product_title|escape:'html'}]"
                                            data-cap='[{$tkProduct->product_desc|escape:'html'}]'
                                            [{/if}]
                                            rel="gallery-[{$tkProduct->product_id}]"
                                            ></a>
                                        [{/foreach}]
                                    [{/if}]
                                </div>
                                <div class="product-capt">
                                    <div>
                                        <a href="/cong-trinh/[{$tkProduct->product_alias|escape:'html'}]">
                                            [{if $lang=='en'}]
                                            <strong><div class="line-clamp-1">[{$tkProduct->product_title_en|default:$tkProduct->product_title|escape:'html'}]</div></strong>
                                            [{else}]
                                            <strong><div class="line-clamp-1">[{$tkProduct->product_title|escape:'html'}]</div></strong>
                                            [{/if}]
                                        </a>
                                    </div>
                                    [{if $lang=='en'}]
                                    <p class="line-clamp-4">[{$tkProduct->product_desc_en|default:$tkProduct->product_desc|escape:'html'}]</p>
                                    [{else}]
                                    <p class="line-clamp-4">[{$tkProduct->product_desc|escape:'html'}]</p>
                                    [{/if}]
                                    <a href="/cong-trinh/[{$tkProduct->product_alias|escape:'html'}]">
                                        <span class="btn btn-xs btn-default">[{$languages['all_readmore']|default:'XEM THÊM'}] <i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="space-line"></div>
                                <div class="space-line"></div>
                                [{/if}]
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="sm-space"></div>
        </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/popup.tpl"}]
</body>