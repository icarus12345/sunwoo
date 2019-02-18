<div class="tracker-body" style="padding-bottom: 0">
    <div class="container">
        <div class="footer">
            <div class="col-sm-4">
                <div class="foot-title">Contact</div>
                <div class="foot-desc">[{$info.contact}]</div>
            </div>
            <div class="col-sm-4">
                <div class="foot-title">For customer</div>
                <div class="foot-list">
                    [{$info.forcustomer}]
                </div>
            </div>
            <div class="col-sm-4">
                <div class="foot-title">Shoot us a message</div>
                <div class="pull-top pull-bottom">
                   <input type="text" class="form-control" placeholder="Subject"> 
                </div>
                <div class="pull-top pull-bottom">
                    <input type="text" class="form-control" placeholder="Your email">
                </div>
                <div class="pull-top pull-bottom">
                    <textarea class="form-control" placeholder="Message"></textarea>
                </div>
                <div class="pull-top pull-bottom">
                    <button class="btn pull-right">SEND</button>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="">
                <div class="foot-menu">
                    <div class="col-sm-6">
                        <div class="foot-left">[{$info.copyright}]</div>
                    </div>
                    <div class="col-sm-6">
                        <div class="foot-menu-right">
                            <a href="/">Home</a>
                            <a href="/story">Story</a>
                            <a href="/about">About</a>
                            <a href="/contact">Contact</a>
                            <a href="">Site map</a>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>
[{include file=$smarty.const.APPPATH|cat:"templates/scooter/inc/reg-sign.tpl"}]