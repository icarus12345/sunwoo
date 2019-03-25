[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
  [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
  <div id="wrap" class="cover">
        [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/top.tpl"}]
        <div id="left-contents-wrap" ui-yield-to="left-contents">
          <div ui-content-for="left-contents" style="width: 100%;height: 100%;">
            [{if $sliders}]
                <div id="owl-about" class="owl-carousel">
                    [{foreach from=$sliders item=foo}]
                    <div class="item cover" style="background-image:url('[{$foo->Image}]');background-position: top center;"></div>
                    [{/foreach}]
                </div>
            [{/if}]
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
                          <li class="active">[{$languages.all_partner|quotes_to_entities}]</li>
                        </ol>
                        <h1>[{$languages.all_partner_title|quotes_to_entities}]</h1>
                        <div class="pull-top pull-bottom"></div>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="row partner-list">
                                    [{foreach from=$news_list item=p key=i}]
                                    <div class="col-sm-4">
                                      <div class="partner bsd" data-lat="" data-lon="">
                                        <div class="nailthumb">
                                          <div class="nailthumb-figure-9-16">
                                            <div class="nailthumb-container cover" style="background-image:url('[{$p->news_cover|quotes_to_entities}]')">
                                            </div>
                                          </div>
                                          <div class="avt"><span class="cover" style="background-image:url('[{$p->news_thumb|quotes_to_entities}]')"></span></div>
                                        </div>
                                          <a class="cap" href="/partner/detail/[{$p->news_id}]">
                                            <h4><span class="line-clamp-1">[{$p->news_title|quotes_to_entities}]</span></h4>
                                            <div class="stars">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                            </div>
                                            <p><span class="line-clamp-1">[{$p->news_desc|quotes_to_entities|default:"Đang cập nhật"}]</span></p>
                                          </a>
                                      </div>
                                    </div>
                                    [{/foreach}]
                                </div>
                                [{$htmlPager}]
                            </div>
                            <div class="col-lg-4">
                                [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/contact-form.tpl"}]

                            </div>
                        </div>
                    </div>
                    <script src="/assets/sunwoo/js/about.js?id=" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>