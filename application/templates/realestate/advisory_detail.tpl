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
                    <div class="h2-title pull-top "><span>TƯ VẤN</span>
                        [{$site->data_title|default:'GIẢI ĐÁP TRẢ LỜI TƯ VẤN KHÁCH HÀNG 24/24'|escape:'html'}]
                    </div>
                    <div class="pull-top">
                        <div class="h3-title">
                            <span style="float:none">[{$advisory->advisory_title|escape:'html'}]</span>
                        </div>

                        <div class="h4-title" >
                            <i class="fa fa-question-circle"></i> Nội dung 
                            <span class="c-gray pull-right">[{$advisory->advisory_name}] - [{$advisory->advisory_publicday|date_format}]</span>
                        </div>
                        <div class="gray word-wrap">[{$advisory->advisory_desc}]</div>
                        <div class="space-line"></div>
                        <div class="h4-title" ><i class="fa fa-reply"></i> Trả Lời</div>
                        <div class="gray">
                            [{$advisory->advisory_content|default:'Đang cập nhật ...'}]
                        </div>
                        <div class="space-line"></div>
                    </div>
                    
                </div>
              </div>
            <div class="sm-space"></div>
        </div>
        <script type="text/javascript">
        
        </script>

    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/widget/popup.tpl"}]
</body>