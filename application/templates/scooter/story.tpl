[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/meta.tpl"}]
<body class="scoo-contact">
    <div class="nailthumb">
	    <div class="nailthumb-head bg-cover" 
	    	style="background-image:url(/assets/scooter/images/5.jpg)"
	    	>
	        <div class="nailthumb-mark"></div>
	    </div>
		[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/menu.tpl"}]
		<div class="popup-head">
            <div class="container">
                <div class="popup-body">
                    <div>
                        <div class="pull-bottom">
                            <img class="pop-title" src="/assets/scooter/images/pop-title-story.png"/>
                        </div>
                        <div class="pull-top">
                            <p class="line-clamp">
                                Quisque eu ipsum elit. Nullam et facilisis augue, ut porta sapien. Vivamus maximus feugiat ex, quis ultrices enim semper quis. Sed vitae leo vel erat maximus volutpat.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tracker-body">
        <div class="container">
            <div style="max-width: 380px;margin: 0 auto;padding: 20px 0">
                <div class="title-2">STORY</div>
            </div>
            <div class="row">
                <div class="row">
                	[{foreach from=$newss item=foo}]
                    <div class="col-sm-4 col-mb-6 col-xs-12">
                            <div class="story-item">
                                <div class="">
                                    <a href="/story/[{$foo->news_alias|escape:'html'}]">
                                        <div class="nailthumb">
                                            <div class="nailthumb-figure">
                                                <div class="nailthumb-container">
                                                    <img data-original="[{$foo->news_thumb|escape:'html'}]" class="lazy"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="caption">
                                            <div>
                                                <div class="caption-title line-clamp-1">
                                                    <b>[{$foo->news_title|escape:'html'}]</b>
                                                </div>
                                                <div class="space-line"></div>
                                                <div class="caption-desc">
                                                    <p class="line-clamp-3">[{$foo->news_desc|escape:'html'}]</p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    [{/foreach}]
                </div>
                <div class="pagination">
                    [{$paging}]
                </div>
            </div>
        </div>
    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/widget/feature.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]