[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
	<div class="body-slider" style="position:absolute;left:0;width:100%;top:0;height:550px;">
		<div id="owl-demo" class="owl-carousel">
			[{foreach from=$sliders item=foo}]
			<div class="item bg-cover" style="background-image:url('[{$foo->Image}]');background-position: top center;"></div>
			[{/foreach}]
		</div>
	</div>
	[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
		
        
        <div class="container pull-bottom">
            <div class="about-space"></div>
            <style type="text/css">
                [{if $lang=='en'}]
                    body{background-image: url('/assets/nha-dat/img/bg2-en.jpg')}
                [{else}]  
                  body{background-image: url('/assets/nha-dat/img/bg2.jpg')}
                [{/if}]
            </style>
            <div class="row">
                <div class="col-sm-3" style="padding-top: 10px;">
                    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/left_menu.tpl"}]
                </div>
                <div class="col-sm-9 pull-top">
                    <div class="space-line"></div>
                    <div class="h2-title pull-top "><span>[{if $lang=='en'}]Contact us[{else}]LIÊN HỆ[{/if}]</span>
                        [{if $lang=='en'}]
                      [{$site->data_title_en|default:'GIẢI ĐÁP TRẢ LỜI TƯ VẤN KHÁCH HÀNG 24/24'|escape:'html'}]
                      [{else}]
                      [{$site->data_title|default:'GIẢI ĐÁP TRẢ LỜI TƯ VẤN KHÁCH HÀNG 24/24'|escape:'html'}]
                      [{/if}]
                    </div>
                    <div class="row pull-top">
                        <div class="col-sm-3 pull-top">
                            <img style="width:100%;max-width:200px;margin:auto" src="[{$site->data_thumb}]">
                        </div>
                        <div class="col-sm-9 pull-top">
                            [{if $lang=='en'}]
                            <div class="h3-title"><span style="float:none">[{$site->data_subtitle_en|default:'updating...'}]</span></div>
                            <div class="gray">
                                [{$site->data_content_en|default:'updating...'}]
                            </div>
                            [{else}]
                            <div class="h3-title"><span style="float:none">[{$site->data_subtitle}]</span></div>
                            <div class="gray">
                                [{$site->data_content}]
                            </div>
                            [{/if}]
                        </div>
                        <div class="clear-clear"></div>
                        <div class="col-sm-6 pull-top">
                            <div class="contact-box">
                                <div class="h4-title2">[{if $lang=='en'}]SEARCH FILTER[{else}]TÌM CÂU TRẢ LỜI[{/if}]</div>
                                <label class="select-map">
                                    <span data-toggle="dropdown" id="cat-dropdown">[{if $lang=='en'}]Category[{else}]Chuyên mục[{/if}] <i class="fa fa-caret-right"></i></span>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="JavaScript:changeCate('','Tất cả')">[{if $lang=='en'}]All[{else}]Tất cả[{/if}]</a></li>
                                        [{foreach from=$categories item=foo}]
                                        <li><a href="JavaScript:changeCate('[{$foo->cat_id}]','[{$foo->cat_title|escape:'html'}]')">[{$foo->cat_title|escape:'html'}]</a></li>
                                        [{/foreach}]
                                    </ul>
                                </label>
                                <input type="text" id="qAdvisory">
                                <button type="button" onclick="searchAdvisory()" class="btn btn-xs btn-info">&nbsp;&nbsp;[{if $lang=='en'}]SEARCH[{else}]TÌM KIẾM[{/if}]&nbsp;&nbsp;</button>
                            </div>
                        </div>
                        <div class="col-sm-6 pull-top">
                            <div class="contact-box">
                                <img src="/assets/nha-dat/img/phone.jpg" height="58" style="float:left">
                                <div class="h4-title2">[{if $lang=='en'}]CUSTOMMER SUPPORT[{else}]TRUNG TÂM HỖ TRỢ KHÁCH HÀNG[{/if}]</div>
                                <h2>(+84)(8) 39168714</h2>
                                
                            </div>
                        </div>
                    </div>
                    <div class="pull-top">
                        <div class="advisory-list">
                            
                        </div>
                        
                    </div>
                    
                </div>
              </div>
            <div class="sm-space"></div>
        </div>
        <script type="text/javascript">
        function changeCate(catid,str){
            $('#cat-dropdown').html(str + ' <i class="fa fa-caret-right"></i>');
            myCat = catid;
            loadAdvisory(1);
        }
        function searchAdvisory(){
            q = $('#qAdvisory').val();
            loadAdvisory(1);
        }
        var myPage = 1, myCat = '',q='';
        function loadAdvisory(page){
            myPage = page;
            httpRequest({
                'url': '/realestate/advisory/loadAdvisory/'+ page ,
                'datatype': "text",
                'data': {
                    'cat': myCat,
                    'q': q
                },
                'callback': function(rsdata) {
                    $('.advisory-list').html(rsdata);
                }
            }).call();
        }
        $(document).ready(function(){
          loadAdvisory(myPage)
        });
        
        </script>

    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/popup.tpl"}]
</body>