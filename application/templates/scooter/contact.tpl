[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/meta.tpl"}]
<body class="scoo-contact">
    <div class="nailthumb">
	    <div class="nailthumb-head bg-cover" style="overflow:hidden">
                <div class="google-map">
                    [{$info.map}]
                    <div class="mark"></div>
                </div>
                <div class="nailthumb-mark"></div>
            </div>
		[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/menu.tpl"}]
		<div class="popup-head">
                <div class="container">
                    <div class="popup-body">
                        <div>
                            <div class="pull-bottom">
                                <img class="pop-title" src="[{$info.contacttitle}]"/>
                            </div>
                            <div class="pull-top">
                                <p class="line-clamp">[{$info.contactdesc}]</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]