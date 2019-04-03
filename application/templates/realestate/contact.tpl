[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
  [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
  <div id="wrap" class="cover">
        [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/top.tpl"}]
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
                    <div class="box-search">
                        <ol class="breadcrumb">
                          <li><a href="/">[{$languages.all_home|quotes_to_entities}]</a></li>
                          <li class="active">[{$languages.all_contact}]</li>
                        </ol>
                       
                        <div class="pull-top pull-bottom"></div>
                        <div class="row">
                            <div class="col-lg-8">
                                <h1 class="h1-title">[{$data->data_title|quotes_to_entities}]</h1>
                                <br/>
                                <br/>
                                <div class="ckeditor">[{$data->data_content}]</div>
                                <br/>
                                <br/>
                            </div>
                            <div class="col-lg-4">
                                [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/contact-form.tpl"}]

                            </div>
                        </div>
                    </div>
                    <script src="/assets/sunwoo/js/contact.js" type="text/javascript"></script>

                </div>
                
            </div>
        </div>


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>