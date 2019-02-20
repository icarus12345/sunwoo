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
                    </style>
                    
                    <div class="box-search">
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Cho thuê</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Bán</a></li>
                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Dự án</a></li>
                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Ðầu tư</a></li>
                      </ul>

                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active">
                            <div class="pull-bottom">
                                <div class="input-group">
                                  <input type="text" class="form-control" placeholder="Search for...">
                                  <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" onclick="app.search()">Tìm kiếm</button>
                                  </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 col-sm-6 pull-bottom">
                                    <select class="form-control">
                                        <option>Chọn loại hình</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6 pull-bottom">
                                    <select class="form-control">
                                        <option>Chọn diện tích</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6 pull-bottom">
                                    <select class="form-control">
                                        <option>Chọn phòng ngủ</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6 pull-bottom">
                                    <select class="form-control">
                                        <option>Chọn bảng giá</option>
                                    </select>

                                </div>
                            </div>
                            <div>Tìm kiếm nâng cao</div>
                            <div class="row">
                                <div class="col-md-3 col-sm-6 pull-top">
                                    <select class="form-control">
                                        <option>Chọn loại hình</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn diện tích</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn phòng ngủ</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn bảng giá</option>
                                    </select>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn loại hình</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn diện tích</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn phòng ngủ</option>
                                    </select>

                                </div>
                                <div class="col-md-3 col-sm-6  pull-top">
                                    <select class="form-control">
                                        <option>Chọn bảng giá</option>
                                    </select>

                                </div>
                            </div>
                            
                        </div>
                      </div>
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
                                  <div class="tag"><span>[{$p->cat_title|quotes_to_entities}]</span></div>
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
                      app.product_list = [{$product_list|@json_encode}]
                    </script>
                    <script src="/assets/sunwoo/js/product.js" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>