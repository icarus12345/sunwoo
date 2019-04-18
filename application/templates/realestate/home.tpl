[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
	[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
	<div id="wrap" class="">
        [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/top.tpl"}]
        <div id="left-contents-wrap" ui-yield-to="left-contents"></div>
        <div id="contents-wrap">
            <div id="contents">
                <div id="home" class="content">
                    <div class="box-search table-box-center">
                        <div>
                            [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/search-box.tpl"}]
                        </div>
                    </div>
                    <style type="text/css">
                        #wrap{
                            background-image: url(/assets/sunwoo/images/home-bg.jpg);
                        }
                    </style>
                    <div class="box-search" style="margin-top: 30px;background:rgba(255, 255, 255, 0.9)">
                        
                        <h2 class="h2" style="margin: 0;color: #1b9290;font-weight: bold;">Featured Projects</h2>
                        <br/>
                        <div class="features">
                            [{foreach from=$features item=p key=i}]
                              <div class="product " data-pid="[{$p->product_id}]">
                                <div class="nailthumb bsd">
                                  <div class="nailthumb-figure-square">
                                    <div class="nailthumb-container cover" style="background-image:url('[{$p->product_thumb|quotes_to_entities}]')">
                                      <div class="tag"><span>[{$p->cat_title|quotes_to_entities}]</span></div>
                                      <a class="cap" href="/project/detail/[{$p->product_id}]">
                                        <span class="price">
                                          [{$p->product_price|number_format}]
                                          <span>[{$p->cat_unit|quotes_to_entities}]</span>
                                        </span>
                                        <h4><span class="line-clamp-1">[{$p->product_title|quotes_to_entities}]</span></h4>
                                        <p><span class="line-clamp-1">[{$p->product_address|quotes_to_entities|default:$languages.all_updating}]</span></p>
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
                            [{/foreach}]
                        </div>
                        <div class="clearfix"></div>
                        <br/>
                        <br/>
                        <br/>
                        <h2 class="h2" style="margin: 0;color: #1b9290;font-weight: bold;">Why Sunwoo is your reliable property partner ?</h2>
                        <br/>
                        <div class="row partner-list">
                            [{foreach from=$partners item=p key=i}]
                            <div class="col-md-3 col-sm-6 col-xs-6">
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
                        <div class="clearfix"></div>

                        <br/>
                        <br/>
                    </div>
                </div>
                
            </div>
        </div>
       <!--  <div class="dropup chats">
          <button class="btn btn-default dropdown-toggle " type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            <img class="tada" src="/assets/sunwoo/images/more.png">
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
            <li class=""><a href="viber://pa?chatURI=[public account URI]&text=[message text]"><img class="tada" src="/assets/sunwoo/images/viber.png"></a></li>
            <li>
                <a href="Javascript:$('.zalo-chat-widget').click();">
                    <img class="tada" src="/assets/sunwoo/images/zl.png">
                </a>
            </li>
            <li><a href="whatsapp://send?abid=[users name]&text=[message text]"><img class="tada" src="/assets/sunwoo/images/kk.png"></a></li>
            <li><a href="#"><img class="tada" src="/assets/sunwoo/images/fb.png"></a></li>
          </ul>
        </div> -->


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>