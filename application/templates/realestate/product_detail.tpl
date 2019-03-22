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
                        <ol class="breadcrumb">
                          <li><a href="/">[{$languages.all_home|quotes_to_entities}]</a></li>
                          <li><a href="/">[{$cate_detail->cat_title}]</a></li>
                          <li class="active">[{$product_detail->product_title}]</li>
                        </ol>
                        [{if $product_detail->product_images}]
                        <div class="body-slider" style="">
                            <div id="owl-demo" class="owl-carousel" style="box-shadow: 0 0 1px #ccc">
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
                        <h1 class="h1-title">[{$product_detail->product_title|quotes_to_entities}]</h1>
                        <p class="desc">[{$product_detail->product_address|quotes_to_entities}]</p>
                        <div class="srvs">
                            <table class="table">
                                <tr>
                                    <td><h4>[{$product_detail->product_price|number_format|quotes_to_entities}][{$product_detail->cat_unit|quotes_to_entities}]</h4></td>
                                    <td>
                                        <div class="item">
                                            <span class="srv-ico ico-1"></span>
                                            <div>Kết cấu</div>
                                            <div>[{$product_detail->product_bathroom|quotes_to_entities}] Phòng ngủ</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="item">
                                            <span class="srv-ico ico-2"></span>
                                            <div>Tiện ích</div>
                                            <div>[{$product_detail->product_utilities|quotes_to_entities}]</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="item">
                                            <span class="srv-ico ico-3"></span>
                                            <div>Diện tích</div>
                                            <div>[{$product_detail->product_acreage|quotes_to_entities}]m2</div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="item">
                                            <span class="srv-ico ico-4"></span>
                                            <div>Hệ thống sưởi</div>
                                            <div>Máy lạnh</div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="pull-top pull-bottom"></div>
                        <div class="row">
                            <div class="col-lg-8">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs white-tab" role="tablist">
                                    <li role="presentation" class="active"><a href="#about" aria-controls="about" role="tab" data-toggle="tab">[{$languages.all_about|quotes_to_entities}]</a></li>
                                    <li role="presentation"><a href="#general" aria-controls="general" role="tab" data-toggle="tab">[{$languages.all_information|quotes_to_entities}]</a></li>
                                    <li role="presentation"><a href="#fortunitis" aria-controls="fortunitis" role="tab" data-toggle="tab">[{$languages.all_furniture|quotes_to_entities}]</a></li>
                                    <li role="presentation"><a href="#utinities" aria-controls="utinities" role="tab" data-toggle="tab">[{$languages.all_utilities|quotes_to_entities}]</a></li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="about">
                                        <div class="ckeditor">[{$product_detail->product_content}]</div>
                                        
                                    </div>
                                    
                                    <div role="tabpanel" class="tab-pane" id="general">
                                        <table class="table table-borderd">
                                            <tr>
                                                <td>[{$languages.all_acreage|quotes_to_entities}]</td>
                                                <td>[{$product_detail->product_acreage|quotes_to_entities}]</td>
                                                <td>[{$languages.all_width|quotes_to_entities}]</td>
                                                <td>[{$product_detail->product_width|quotes_to_entities}]</td>
                                            </tr>
                                            <tr>
                                                <td>[{$languages.all_height|quotes_to_entities}]</td>
                                                <td>[{$product_detail->product_height|quotes_to_entities}]</td>
                                                <td>Gia</td>
                                                <td>[{$product_detail->product_price|quotes_to_entities}]</td>
                                            </tr>
                                            <tr>
                                                <td>[{$languages.all_furniture|quotes_to_entities}]</td>
                                                <td>[{$product_detail->product_furniture|quotes_to_entities}]</td>
                                                <td>[{$languages.all_utilities|quotes_to_entities}]</td>
                                                <td>[{$product_detail->product_utilities|quotes_to_entities}]</td>
                                            </tr>
                                            <tr>
                                                <td>[{$languages.all_bedroom|quotes_to_entities}]</td>
                                                <td>[{$product_detail->product_bathroom|quotes_to_entities}]</td>
                                                <td>[{$languages.all_bathroom|quotes_to_entities}]</td>
                                                <td>[{$product_detail->product_bedroom|quotes_to_entities}]</td>
                                            </tr>
                                        </table>
                                        
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="fortunitis">
                                        <div class="row"> 
                                            [{foreach from=$product_detail->features item=item key=i}]
                                            [{if $item->_head_id == 2}]
                                            <div class="col-sm-6">
                                                [{$item->_title}] <span class="fa fa-check pull-right"></span>
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
                                                [{$item->_title}] <span class="fa fa-check pull-right"></span>
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
                        <div>[{$languages.all_near_project|quotes_to_entities}]</div>
                        <div class="related-items">
                            <div id="owl-related" class="owl-carousel">
                                [{foreach from=$relateds item=p}]
                                    <div class="item">
                                        <div class="product bsd" data-lat="" data-lon="">
                                            <div class="nailthumb">
                                              <div class="nailthumb-figure-square">
                                                <div class="nailthumb-container cover" style="background-image:url('[{$p->product_thumb|quotes_to_entities}]')">
                                                  <div class="tag"><span>[{$p->cat_title|quotes_to_entities}]</span></div>
                                                  <a class="cap" href="/project/detail/[{$p->product_id}]">
                                                    <span class="price">
                                                      [{$p->product_price|number_format}]
                                                      <span>[{$p->cat_unit|quotes_to_entities}]</span>
                                                    </span>
                                                    <h4><span class="line-clamp-1">[{$p->product_title|quotes_to_entities}]</span></h4>
                                                    <p><span class="line-clamp-1">[{$p->product_address|quotes_to_entities|default:$languages.all_updating}]</span></p>
                                                  </a>
                                                </div>
                                              </div>
                                              <div class="serv">
                                                <table>
                                                  <tr>
                                                    <td><span class="fa fa-moon"></span> [{$p->product_bedroom|quotes_to_entities}]</td>
                                                    <td><span class="fa fa-tint"></span> [{$p->product_bathroom|quotes_to_entities}]</td>
                                                    <td><span class="fa fa-expand"></span> [{$p->product_acreage|quotes_to_entities}] m2</td>
                                                  </tr>
                                                </table>
                                              </div>
                                            </div>
                                        </div>
                                    </div>
                                [{/foreach}]
                            </div>
                        </div>
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