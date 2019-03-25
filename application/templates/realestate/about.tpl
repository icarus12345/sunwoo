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
                          <li><a href="/">Home</a></li>
                          <li class="active">About</li>
                        </ol>
                        <h1 class="h1-title">[{$languages.all_welcome|quotes_to_entities}]</h1>
                        <div class="desc">[{$languages.all_addressStr|quotes_to_entities}]</div>
                        <div class="pull-top pull-bottom"></div>
                        <div class="row">
                            <div class="col-lg-8">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs white-tab" role="tablist">
                                    [{assign var="f" value="active"}]
                                    [{foreach from=$news_list item=item}]
                                        <li role="presentation" class="[{$f|default:''}]">
                                            <a  href="#tab-about-[{$item->news_id}]"
                                                data-toggle="tab" 
                                                >
                                                    [{$item->news_title|quotes_to_entities|ucwords}]
                                            </a>
                                        </li>
                                        [{assign var="f" value=""}]
                                    [{/foreach}]
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="about">
                                        <div class="ckeditor">[{$product_detail->product_content}]</div>
                                        
                                    </div>
                                    [{assign var="f" value="active"}]
                                    [{foreach from=$news_list item=item}]
                                        <div role="tabpanel" class="tab-pane [{$f|default:''}]" id="tab-about-[{$item->news_id}]">
                                                    <div class="ckeditor">[{$item->news_content}]</div>
                                        </div>
                                        [{assign var="f" value=""}]
                                    [{/foreach}]
                                </div>
                                <div class="fb-comment">
                                    <div class="fb-comments" data-width="100%" data-href="[{base_url()}]/project/detail/[{$product_detail->product_id}]" data-numposts="5"></div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/contact-form.tpl"}]

                            </div>
                        </div>
                    </div>
                    <script src="/assets/sunwoo/js/about.js?id=[{$product_detail->product_id}]" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>