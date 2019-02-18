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
                .about-bg{background-image: url('/assets/nha-dat/img/about-bg-en.png')}
              [{else}]  
                body{background-image: url('/assets/nha-dat/img/bg2.jpg')}
              [{/if}]
            </style>
            <div class="row">
                <div class="col-sm-3" style="padding-top: 10px;">
                    <div class="primary-color text-uppercase"><b>[{$languages.all_about|default:'Giới thiệu'}]</b></div>
                    <h3>[{$languages['all_about-us']|default:'VỀ CHÚNG TÔI'}]</h3>
                    <ul class="nav-left-menu">
                        [{foreach from=$news_list item=foo}]
                        <li [{if $foo->news_id == $news_detail->news_id}]class="active"[{/if}] >
                            <a href="/gioi-thieu/[{$foo->news_alias|escape:'html'}]">
                            [{if $lang=='en'}]
                            [{$foo->news_title_en|default:'updating'|escape:'html'}]
                            [{else}]
                            [{$foo->news_title|escape:'html'}]
                            [{/if}]
                            <span class="pull-right">»</span>
                            </a>
                        </li>
                        [{/foreach}]
                    </ul>
                    <div class="qa">
                      [{if $lang=='en'}]
                      <img src="/assets/nha-dat/img/qa-en.png">
                      <a href="/cataloue"><img src="/assets/nha-dat/img/other-en.png"></a>
                      [{else}]
                      <img src="/assets/nha-dat/img/qa.jpg">
                      <a href="/cataloue"><img src="/assets/nha-dat/img/other.jpg"></a>
                      [{/if}]
                  </div>
                </div>
                <div class="col-sm-9 pull-top">
                    <div class="h2-title pull-top text-uppercase"><span>[{$languages.all_about|default:'Giới thiệu'}]</span>
                        [{if $lang=='en'}]
                        [{$news_detail->news_desc_en|default:$news_detail->news_desc}]
                        [{else}]
                        [{$news_detail->news_desc}]
                        [{/if}]
                    </div>
                    <div class="row pull-top">
                        [{if $news_detail->news_thumb}]
                        <div class="col-sm-4 hidden-sm hidden-mb hidden-xs pull-top">
                            <img style="width:100%" src="[{$news_detail->news_thumb|escape:'html'}]">
                        </div>
                        <div class="col-sm-8 pull-top about-bg">
                          [{if $lang=='en'}]
                          [{$news_detail->news_content_en|default:'updating'}]
                          [{else}]
                          [{$news_detail->news_content|default:'updating'}]
                          [{/if}]
                        </div>
                        [{else}]
                            <div class="container"> 
                            [{if $lang=='en'}]
                            [{$news_detail->news_content_en|default:'updating'}]
                            [{else}]
                            [{$news_detail->news_content|default:'updating'}]
                            [{/if}]
                            </div>
                        [{/if}]
                    </div>
                    <div class=" pull-top">
                        <!--<div class="pull-bottom pull-top"><i class="fa fa-info-circle"></i> VỀ CHÚNG TÔI</div>

                        <table class="table table-bordered">
                          <thead>
                            <tr>
                              <th>STT</th>
                              <th>Họ & Tên</th>
                              <th>Chức Vụ</th>
                              <th>Địa Chỉ</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th scope="row">2</th>
                              <td>Ông Nguyễn Văn A</td>
                              <td>Tổng GĐ</td>
                              <td>20/2 Tân Phú Hòa, P12 - Q. Tân Phú</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Ông Nguyễn Văn A</td>
                              <td>Tổng GĐ</td>
                              <td>20/2 Tân Phú Hòa, P12 - Q. Tân Phú</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Ông Nguyễn Văn A</td>
                              <td>Tổng GĐ</td>
                              <td>20/2 Tân Phú Hòa, P12 - Q. Tân Phú</td>
                            </tr>
                          </tbody>
                        </table>
                    </div>-->
                </div>
            </div>
            <div class="sm-space"></div>
        </div>

    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/popup.tpl"}]
</body>