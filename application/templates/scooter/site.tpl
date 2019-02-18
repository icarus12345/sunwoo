[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/meta.tpl"}]
<body class="scoo-contact">
    <div class="nailthumb">
	    <div class="nailthumb-head bg-cover" 
	    	style="background-image:url([{$news->news_cover|default:'/assets/scooter/images/5.jpg'|escape:'html'}])"
	    	>
	        <div class="nailthumb-mark"></div>
	    </div>
		[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/menu.tpl"}]
		
    </div>
    <div class="tracker-body">
        <div class="container">
            <div style="max-width: 720px;margin: 0 auto;padding: 20px 0">
                <div class="title-2">[{$site->site_title}]</div>

                <div style="color:#999">
                [{$site->site_content}]
                </div>
            </div>
            
        </div>
    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/widget/feature.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]