[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
	[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
	<div id="wrap" class="cover">
        [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/top.tpl"}]
        <div id="left-contents-wrap" ui-yield-to="left-contents"></div>
        <div id="contents-wrap">
            <div id="contents">
                <div id="home" class="content">
                    <style type="text/css">
                        #wrap{
                            background-image: url(/assets/sunwoo/images/home-bg.jpg);
                        }
                    </style>
                    <div class="box-search table-box-center">
                        <div>
                            [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/search-box.tpl"}]
                        </div>
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