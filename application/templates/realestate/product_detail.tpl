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
                                [{if $product_detail->product_images|default:''!=''}]
                                    [{assign var=images value='/\r\n|[\r\n]/'|preg_split:$product_detail->product_images}]
                                    [{foreach from=$images item=img}]
                                        <div class="item bg-100" style="background-image:url('[{$img}]');background-position: top center;"></div>
                                    [{/foreach}]
                                [{/if}]
                            </div>
                        </div>
                        [{else}]
                        <img src="[{$product_detail->product_cover|default:$product_detail->product_thumb}]" style="width: 100%;margin-bottom">
                        [{/if}]
                        <h1>[{$product_detail->product_title_vi|quotes_to_entities}]</h1>
                        <p>[{$product_detail->product_desc_vi|quotes_to_entities}]</p>
                       
                        
                        <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group">
                          <span class="btn btn-default" role="button">Giá:[{$product_detail->product_price|number_format|quotes_to_entities}]VND</span>
                          <span class="btn btn-default" role="button">Phòng ngủ:[{$product_detail->product_bathroom|quotes_to_entities}]</span>
                          <span class="btn btn-default" role="button">Phòng tắm:[{$product_detail->product_bedroom|quotes_to_entities}]</span>
                          <span class="btn btn-default" role="button">Diện tích:[{$product_detail->product_acreage|quotes_to_entities}]m2</span>
                          <span class="btn btn-default" role="button">Máy lạnh</span>
                        </div>
                        <div class="pull-top pull-bottom"></div>
                        <div class="row">
                            <div class="col-lg-8">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs white-tab" role="tablist">
                                    <li role="presentation" class="active"><a href="#about" aria-controls="about" role="tab" data-toggle="tab">Giới thiệu</a></li>
                                    <li role="presentation"><a href="#general" aria-controls="general" role="tab" data-toggle="tab">Thông tin</a></li>
                                    <li role="presentation"><a href="#fortunitis" aria-controls="fortunitis" role="tab" data-toggle="tab">Nội thất</a></li>
                                    <li role="presentation"><a href="#utinities" aria-controls="utinities" role="tab" data-toggle="tab">Tiện ích</a></li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="about">
                                        [{$product_detail->product_content_vi}]
                                        
                                    </div>
                                    
                                    <div role="tabpanel" class="tab-pane" id="general">
                                        <table class="table table-borderd">
                                            <tr>
                                                <td>Diện tích</td>
                                                <td>[{$product_detail->product_acreage|quotes_to_entities}]</td>
                                                <td>Chiều Rộng</td>
                                                <td>[{$product_detail->product_width|quotes_to_entities}]</td>
                                            </tr>
                                            <tr>
                                                <td>Chiều Dài</td>
                                                <td>[{$product_detail->product_height|quotes_to_entities}]</td>
                                                <td>Gia</td>
                                                <td>[{$product_detail->product_price|quotes_to_entities}]</td>
                                            </tr>
                                            <tr>
                                                <td>Nội thất</td>
                                                <td>[{$product_detail->product_furniture_vi|quotes_to_entities}]</td>
                                                <td>Tiện ích</td>
                                                <td>[{$product_detail->product_utilities_vi|quotes_to_entities}]</td>
                                            </tr>
                                            <tr>
                                                <td>Phòng ngủ</td>
                                                <td>[{$product_detail->product_bathroom|quotes_to_entities}]</td>
                                                <td>Phòng tắm</td>
                                                <td>[{$product_detail->product_bedroom|quotes_to_entities}]</td>
                                            </tr>
                                        </table>
                                        
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="fortunitis">
                                        <div class="row"> 
                                            [{foreach from=$product_detail->features item=item key=i}]
                                            [{if $item->_head_id == 2}]
                                            <div class="col-sm-6">
                                                [{$item->_title_vi}] <span class="fa fa-check pull-right"></span>
                                            </div>
                                            [{/if}]
                                            [{/foreach}]
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="utinities">
                                        <div class="row"> 
                                            [{foreach from=$product_detail->features item=item key=i}]
                                            [{if $item->_head_id == 3}]
                                            <div class="col-sm-6">
                                                [{$item->_title_vi}] <span class="fa fa-check pull-right"></span>
                                            </div>
                                            [{/if}]
                                            [{/foreach}]
                                        </div>
                                    </div>
                                </div>
                                <div class="fb-comment">
                                    <div class="fb-comments" data-width="100%" data-href="[{base_url()}]/project/detail/[{$product_detail->product_id}]" data-numposts="5"></div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/contact-form.tpl"}]

                            </div>
                        </div>
                        [{if $relateds}]
                        <br/>
                        <br/>
                        <div>Các dự án gần nhất</div>
                        <div class="related-items">
                            <div id="owl-related" class="owl-carousel">
                                [{foreach from=$relateds item=p}]
                                    <div class="item">
                                        <div class="product bsd" data-lat="" data-lon="">
                                            <div class="nailthumb">
                                              <div class="nailthumb-figure-square">
                                                <div class="nailthumb-container cover" style="background-image:url('[{$p->product_thumb|quotes_to_entities}]')">
                                                  <div class="tag"><span>[{$p->cat_title_vi|quotes_to_entities}]</span></div>
                                                  <a class="cap" href="/project/detail/[{$p->product_id}]">
                                                    <h4><span class="line-clamp-1">[{$p->product_title_vi|quotes_to_entities}]</span></h4>
                                                    <p><span class="line-clamp-1">[{$p->product_desc_vi|quotes_to_entities|default:"Đang cập nhật"}]</span></p>
                                                  </a>
                                                </div>
                                              </div>
                                              <div class="serv">
                                                <table>
                                                  <tr>
                                                    <td>Phòng ngủ:[{$p->product_bedroom|quotes_to_entities}]</td>
                                                    <td>Phòng tắm:[{$p->product_bathroom|quotes_to_entities}]</td>
                                                    <td>Diện tích:[{$p->product_acreage|quotes_to_entities}] m2</td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                        </div>
                                    </div>
                                [{/foreach}]
                            </div>
                        </div>
                        [{else}]
                        <img src="[{$product_detail->product_cover|default:$product_detail->product_thumb}]" style="width: 100%;margin-bottom">
                        [{/if}]
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