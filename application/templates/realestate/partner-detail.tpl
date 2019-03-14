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
                          <li><a href="/">Trang chủ</a></li>
                          <li><a href="/">Đối tác</a></li>
                          <li class="active">[{$news->news_title|quotes_to_entities}]</li>
                        </ol>
                        <h1>[{$news->news_title|quotes_to_entities}]</h1>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="panel panel-default">
                                  <div class="panel-body">
                                        [{$news->news_content}]
                                    </div>
                                </div>
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