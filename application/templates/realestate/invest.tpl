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
          <div ui-content-for="left-contents" style="width: 100%;height: 100%;">
            <div id="map" style="width: 100%;height: 100%;"></div>
          </div>
          
        </div>
        <div id="contents-wrap">
            <div id="contents">
                <div id="product" class="content">
                    <style type="text/css">
                        #header{
                            background-image: url(/assets/sunwoo/images/banner.jpg);
                            background-size: cover;
                            height: 228px;
                        }

                        a[href^="http://maps.google.com/maps"],
                        a[href^="https://maps.google.com/maps"],
                        a[href^="https://www.google.com/maps"] {
                            display: none !important;
                        }
                        .gm-fullscreen-control,
                        .gm-svpc{
                          display: none;
                        }
                        .gm-bundled-control .gmnoprint {
                            display: block;
                        }
                        .gmnoprint:not(.gm-bundled-control) {
                            display: none;
                        }
                    </style>
                    
                    <div class="box-search green-tabs">
                      <ol class="breadcrumb">
                          <li><a href="/">Home</a></li>
                          <li class="active">[{$cate_detail->cat_title_vi}]</li>
                        </ol>
                      [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/search-box.tpl"}]
                      <div class="row product-list">
                        [{foreach from=$product_list item=p key=i}]
                        <div class="col-sm-[{$format_grid.$i}]">
                          <div class="product bsd" data-lat="" data-lon="">
                            <div class="nailthumb">
                              [{if $format_grid.$i == 4}]
                              <div class="nailthumb-figure-square">
                              [{elseif $format_grid.$i == 12}]
                              <div class="nailthumb-figure-9-16">
                              [{elseif $format_grid.$i == 6}]
                              <div class="nailthumb-figure-75">
                              [{/if}]
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

                      [{$htmlPager}]
                    </div>

                    <script type="text/javascript">
                      app.product_list = [{$product_list|@json_encode}];
                      app.countries = [{$countries|@json_encode}];
                    </script>
                    <script src="/assets/sunwoo/js/invest.js" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>