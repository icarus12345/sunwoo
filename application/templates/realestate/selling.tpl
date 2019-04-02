[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
  [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
  <div id="wrap" class="cover">
        [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/top.tpl"}]
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
                    </style>
                    
                    <div class="box-search green-tabs">
                      <ol class="breadcrumb">
                          <li><a href="/">[{$languages.all_home|quotes_to_entities}]</a></li>
                          <li class="active">[{$cate_detail->cat_title}]</li>
                        </ol>
                      [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/search-box.tpl"}]
                      <div class="row product-list">
                        [{foreach from=$product_list item=p key=i}]
                        <div class="col-lg-[{$format_grid.$i}] col-md-12">
                          <div class="product bsd" data-pid="[{$p->product_id}]">
                            <div class="nailthumb">
                              [{if $format_grid.$i == 4}]
                              <div class="nailthumb-figure-square">
                              [{elseif $format_grid.$i == 12}]
                              <div class="nailthumb-figure-9-16">
                              [{elseif $format_grid.$i == 6}]
                              <div class="nailthumb-figure-75">
                              [{/if}]
                                <div class="nailthumb-container cover" style="background-image:url('[{$p->product_thumb|quotes_to_entities}]')">
                                  <div class="tag"><span>[{$p->cat_title|quotes_to_entities}]</span></div>
                                  <a class="cap" href="/project/detail/[{$p->product_id}]">
                                    <span class="price">
                                      [{$p->product_price|number_format}]
                                      <span>[{$p->cat_unit|quotes_to_entities}]</span>
                                    </span>
                                    <h4><span class="line-clamp-1">[{$p->product_title|quotes_to_entities}]</span></h4>
                                    <p><span class="line-clamp-1">[{$p->product_desc|quotes_to_entities|default:"Đang cập nhật"}]</span></p>
                                  </a>
                                </div>
                              </div>
                              <div class="serv">
                                <table>
                                  <tr>
                                    <td><span class="fa fa-moon"></span> [{$languages.all_bedroom|quotes_to_entities}]:[{$p->product_bedroom|quotes_to_entities}]</td>
                                    <td><span class="fa fa-tint"></span> [{$languages.all_bathroom|quotes_to_entities}]:[{$p->product_bathroom|quotes_to_entities}]</td>
                                    <td><span class="fa fa-expand"></span> [{$languages.all_acreage|quotes_to_entities}]:[{$p->product_acreage|quotes_to_entities}] m2</td>
                                  </tr>
                                </table>
                              </div>
                            </div>
                          </div>
                        </div>
                        [{foreachelse}]
                        <div class=" col-sm-12"><p class="alert alert-warning" role="alert">[{$languages.all_updating|quotes_to_entities}]</p></div>
                        [{/foreach}]
                      </div>

                      [{$htmlPager}]
                    </div>

                    <script type="text/javascript">
                      app.product_list = [{$product_list|@json_encode}]
                    </script>
                    <script src="/assets/sunwoo/js/product.js" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>