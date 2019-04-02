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
                          <li><a href="/">[{$languages.all_blogs|quotes_to_entities}]</a></li>
                          <li class="active">[{$news->news_title|quotes_to_entities}]</li>
                        </ol>
                        <h1 class="h1-title">[{$news->news_title|quotes_to_entities}]</h1>
                        <br/>
                        <div class="space-line"></div>
                        <div class="author-time">
                            <div class="pull-right">
                                <div class="fb-like" data-href="[{base_url()}]/blogs/detail/[{$news->news_id}]" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
                            </div>
                            <div class="">
                                <div class="avt"></div>
                                <div class="author-name"><b>Admin</b></div>
                                <div class="date-time">[{$news->news_insert|date_format}]</div>
                            </div>
                        </div>
                        <div class="space-line pull-top"></div>
                        <div class="space-line pull-top"></div>
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