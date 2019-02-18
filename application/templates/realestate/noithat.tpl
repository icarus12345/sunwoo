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
                    <div class="h2-title pull-top ">
                        [{if $lang=='en'}]
                        <span>[{$tkProduct->product_title_en|default:'updating...'}]</span>
                        [{$tkProduct->product_desc_en|default:'TOAN LOI CONSTRUCTION COMPANY ACCEPT BUILD CONSTRUCTION AND DESIGN, INTERIOR DESIGN FOR PROJECT.'|escape:'html'}]
                        [{else}]
                        <span>[{$tkProduct->product_title}]</span>
                        [{$tkProduct->product_desc|default:'Công Ty TNHH Toàn Lợi chuyên nhận xây dựng và thiết kế, thiết kế nội thất cho các công trình'|escape:'html'}]
                        [{/if}]
                    </div>
                        
                        [{if $tkProduct->product_images|default:''!=''}]
                        [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$tkProduct->product_images}]
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
                    <div class="pull-top">
                        <div class="gray">
                            [{if $lang=='en'}]
                            [{$tkProduct->product_content_en|default:'updating...'}]
                            [{else}]
                            [{$tkProduct->product_content}]
                            [{/if}]
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