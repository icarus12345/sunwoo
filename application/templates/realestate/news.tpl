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
                          <li class="active">[{$languages.all_blogs|quotes_to_entities}]</li>
                        </ol>
                        <div class="pull-top pull-bottom"></div>
                        <div class="row blogs-list">
                            [{foreach from=$news_list item=p key=i}]
                            <div class="col-sm-[{$format_grid.$i}]">
                              <div class="blog bsd" data-lat="" data-lon="">
                                <div class="nailthumb">
                                  <div class="nailthumb-figure-blog">
                                    <div class="nailthumb-container cover" style="background-image:url('[{$p->news_thumb|quotes_to_entities}]')">
                                    </div>
                                  </div>
                                </div>
                                  <a class="cap" href="/blogs/detail/[{$p->news_id}]">
                                    <span class="cat">[{$p->cat_title|quotes_to_entities}]</span>
                                    <h4><span class="line-clamp-1">[{$p->news_title|quotes_to_entities|default:$languages.all_updating}]</span></h4>
                                    
                                    <p><span class="line-clamp-2">[{$p->news_desc|quotes_to_entities|default:$languages.all_updating}]</span></p>
                                    <span class="date">[{$p->news_insert}]</span>
                                  </a>
                              </div>
                            </div>
                            [{/foreach}]
                        </div>
                        [{$htmlPager}]
                    </div>
                    <script src="/assets/sunwoo/js/about.js?id=news" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>