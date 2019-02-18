[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/meta.tpl"}]
<body>
    <div class="nailthumb">
	    <div class="nailthumb-head bg-cover" 
	    	style=""
	    	>
	        <div class="nailthumb-mark"></div>
	    </div>
		[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/menu.tpl"}]
		<div class="popup-head">
            <div class="container">
                <div class="popup-body">
                    <div>
                        <div class="pull-bottom">
                            <img class="pop-title" src="/assets/scooter/images/pop-title.png"/>
                        </div>
                        <div class="pull-top">
                            <button class="btn auto btn-grab">Grab your change</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/widget/trackbox.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/widget/scooitem.tpl"}]
    [{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/foot.tpl"}]