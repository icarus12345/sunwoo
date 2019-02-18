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
                      [{$cate_detail->cat_desc_en|default:'TOAN LOI CONSTRUCTION COMPANY ACCEPT BUILD CONSTRUCTION AND DESIGN, INTERIOR DESIGN FOR PROJECT.'|escape:'html'}]
                      [{else}]
                      [{$cate_detail->cat_desc|default:'Công Ty TNHH Toàn Lợi chuyên nhận xây dựng và thiết kế, thiết kế nội thất cho các công trình'|escape:'html'}]
                      [{/if}]
                      
                    </div>
                    <div class="pull-top">
                        [{if $lang=='en'}]
                        <div class="h3-title"><span style="float:none">[{$site->data_title_en|default:'updating...'}]</span></div>
                        [{else}]
                        <div class="h3-title"><span style="float:none">[{$site->data_title|default:'updating...'}]</span></div>
                        [{/if}]
                        <div class="gray">
                            [{if $lang=='en'}]
                            [{$site->data_content_en|default:'updating...'}]
                            [{else}]
                            [{$site->data_content|default:'updating...'}]
                            [{/if}]
                        </div>
                        <div class="project-box">
                            <img src="/assets/nha-dat/img/ct.jpg">
                            <div class="video">
                                <div>
                                    <video id="my_video" loop="loop" autoplay="autoplay" muted="">
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
                            <div class="project-cap">
                                <div class="h4-title">
                                  <img src="/assets/nha-dat/img/dot2.jpg"/>
                                  [{if $lang=='en'}]
                                  [{$site->data_subtitle_en|default:'updating...'}]
                                  [{else}]
                                  [{$site->data_subtitle|default:'updating...'}]
                                  [{/if}]
                                </div>
                                [{if $lang=='en'}]
                                <div class="line-clamp-4 word-wrap" style="text-align:left">[{$site->data_desc_en|default:'updating...'}]</div>
                                [{else}]
                                <div class="line-clamp-4 word-wrap" style="text-align:left">[{$site->data_desc|default:'updating...'}]</div>
                                [{/if}]
                            </div>
                        </div>
                        <div class="space-line"></div>
                        <div class="space-line"></div>
                        
                        <div class="product-list">
                            
                        </div>
                        
                    </div>
                    
                </div>
              </div>
            <div class="sm-space"></div>
        </div>
        <script type="text/javascript">
        function loadProduct(page){
          httpRequest({
              'url': '/frontend/product/loadProduct/'+ page ,
              'datatype': "text",
              'data': {
                cat : '[{$cate}]'
              },
              'callback': function(rsdata) {
                  $('.product-list').html(rsdata);
                  lazyLoad();
                  if ($('.product-list a.swipebox').length > 0) {
                      $('.product-list a.swipebox').swipebox({
                          useCSS: true,
                          callback:function(elm){
                             console.log(elm)
                          }
                      });
                  }
                  // if(!app.scroll){app.scroll=true;}
                  // else
                  //     scrollToElm('#srollToHere');
              }
          }).call();
        }
        function lazyLoad(){
          $(".product-list img.lazy").each(function() {
              $(this).removeClass('lazy');
              $(this.parentNode).nailthumb();
          });
        }
        $(document).ready(function(){
          loadProduct(1)
        })
        </script>

    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/popup.tpl"}]
</body>