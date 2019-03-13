[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/meta.tpl"}]
<body>
	[{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/head.tpl"}]
	<div id="wrap" class="cover">
        <div id="header">
            <div class="container">
                <div id="logo" ui-yield-to="logo">
                    <a href="/" class="hover-line" ui-content-for="logo"><span></span></a>
                </div>
                <div class="hot-line"><span class="fa fa-phone-square"></span> VN: (+84) 88 606 3577 | Korea: (+82) 10 4906 5736</div>
                <div id="cnavi" class="nav" ui-yield-to="cnavi"></div>
            </div>
        </div>
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


    </div>
    [{include file=$smarty.const.APPPATH|cat:"templates/realestate/inc/foot.tpl"}]
</body>