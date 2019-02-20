[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
  [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
  <div id="wrap" class="cover">
        <div id="header">
            <div class="container">
                <div id="logo" ui-yield-to="logo">
                    <a href="/" class="hover-line" ui-content-for="logo"><span></span></a>
                </div>
                <div class="hot-line"><span class="fa fa-phone-square"></span> VN: (+84) 88 606 3577 | Korea: (+82) 10 4906 5736</div>
                <div id="cnavi" class="nav" ui-yield-to="cnavi"></div>
            </div>
        </div>
        <div id="left-contents-wrap" ui-yield-to="left-contents">
          <div ui-content-for="left-contents" style="width: 100%;height: 100%;" id="google-map">
            <div id="map" style="width: 100%;height: 100%;"></div>
          </div>
          
        </div>
        <div id="contents-wrap">
            <div id="contents">
                <div id="product-detail" class="content">
                    <style type="text/css">
                        #header{
                            background-image: url(/assets/sunwoo/images/banner.jpg);
                            background-size: cover;
                            height: 228px;
                        }
                    </style>
                    
                    <div class="box-search">
                        [{if $product_detail->product_images}]
                        <div class="body-slider" style="">
                            <div id="owl-demo" class="owl-carousel">
                                              
                                <div class="item bg-100" style="background-image:url('/data/image/bg-vn-2.jpg');background-position: top center;"></div>
                                                          
                                <div class="item bg-100" style="background-image:url('/data/image/bg-vn-1.jpg');background-position: top center;"></div>
                                                          
                                <div class="item bg-100" style="background-image:url('/data/image/bg-vn.jpg');background-position: top center;"></div>
                            </div>
                        </div>
                        [{else}]
                        <img src="[{$product_detail->product_cover|default:$product_detail->product_thumb}]" style="width: 100%;margin-bottom">
                        [{/if}]
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#about" aria-controls="about" role="tab" data-toggle="tab">Gioi thieu chung</a></li>
                        <li role="presentation"><a href="#general" aria-controls="general" role="tab" data-toggle="tab">Thong tin co ban</a></li>
                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Noi that</a></li>
                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Tien ich</a></li>
                      </ul>

                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="about">
                            [{$product_detail->product_content_vi}]
                            
                        </div>
                        <div role="tabpanel" class="tab-pane" id="general">
                            <table class="table table-borderd">
                                <tr>
                                    <td>Dien tich</td>
                                    <td>[{$product_detail->product_acreage}]</td>
                                    <td>Rong</td>
                                    <td>[{$product_detail->product_width}]</td>
                                </tr>
                                <tr>
                                    <td>Dai</td>
                                    <td>[{$product_detail->product_height}]</td>
                                    <td>Gia</td>
                                    <td>[{$product_detail->product_price}]</td>
                                </tr>
                                <tr>
                                    <td>Noi that</td>
                                    <td>[{$product_detail->product_furniture_vi}]</td>
                                    <td>Tien ich</td>
                                    <td>[{$product_detail->product_utilities_vi}]</td>
                                </tr>
                                <tr>
                                    <td>Phong ngu</td>
                                    <td>[{$product_detail->product_bathroom}]</td>
                                    <td>Phong tam</td>
                                    <td>[{$product_detail->product_bedroom}]</td>
                                </tr>
                            </table>
                            
                        </div>
                      </div>
                      
                      </div>

                    <script type="text/javascript">
                      app.product_list = [[{$product_detail|@json_encode}]]
                    </script>
                    <script src="/assets/sunwoo/js/product-detail.js?id=[{$product_detail->product_id}]" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>