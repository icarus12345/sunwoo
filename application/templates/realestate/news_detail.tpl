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
                          <li><a href="/">[{$languages.all_blogs|quotes_to_entities}]</a></li>
                          <li class="active">[{$news->news_title|quotes_to_entities}]</li>
                        </ol>
                        <h1 class="h1-title">[{$news->news_title|quotes_to_entities}]</h1>
                        <br/>
                        <div class="space-line"></div>
                        <div class="panel panel-default">
                          <div class="panel-body">
                                <div class="ckeditor">[{$news->news_content}]</div>
                            </div>
                        </div>

                        <div class="fb-comment">
                            <div class="fb-comments" data-width="100%" data-href="[{base_url()}]/blogs/detail/[{$news->news_id}]" data-numposts="5"></div>
                        </div>
                        [{if $relateds}]
                        <br/>
                        <br/>
                        <div>[{$languages.all_related|quotes_to_entities}]</div>
                        <div class="related-items">
                            <div id="owl-related" class="owl-carousel">
                                [{foreach from=$relateds item=p}]
                                    <div class="item">
                                        <div class="blog bsd" data-lat="" data-lon="">
                                            <div class="nailthumb">
                                              <div class="nailthumb-figure-blog">
                                                <div class="nailthumb-container cover" style="background-image:url('[{$p->news_thumb|quotes_to_entities}]')">
                                                </div>
                                              </div>
                                            </div>
                                              <a class="cap" href="/blogs/detail/[{$p->news_id}]">
                                                <span class="cat">[{$p->cat_title|quotes_to_entities}]</span>
                                                <h4><span class="line-clamp-1">[{$p->news_title|quotes_to_entities}]</span></h4>
                                                
                                                <p><span class="line-clamp-2">[{$p->news_desc|quotes_to_entities|default:$languages.all_updating}]</span></p>
                                                <span class="date">[{$p->news_insert}]</span>
                                              </a>
                                          </div>
                                    </div>
                                [{/foreach}]
                            </div>
                        </div>
                        [{/if}]
                    </div>
                    <script src="/assets/sunwoo/js/news-detail.js?id=" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>