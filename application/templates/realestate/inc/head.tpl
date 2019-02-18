<header id="navbar" class="navbar" role="banner">
    <div class="container">
        <div style="position:absolute;top:4px;left:10px;">
            <a href="http://en.toanloi.vn"><img src="https://az545221.vo.msecnd.net/skype-faq-media/faq_content/skype/flags/gb_16x16.png"></a>
            &nbsp;&nbsp;
            <a href="http://vi.toanloi.vn"><img src="https://az545221.vo.msecnd.net/skype-faq-media/faq_content/skype/flags/vn_16x16.png"></a>
        </div>
        <div class="">
            <div class="pull-right top-menu">
                <!-- <a class="btn btn-default btn-sm">Trang chủ</a> -->
                <div class="acc-info" [{if not $smarty.session.accountInfo|default:null}] style="display:none" [{/if}]>
                    <a href="#" data-toggle="dropdown" class="btn btn-default btn-sm">
                        <span>[{$smarty.session.accountInfo->FirstName}] [{$smarty.session.accountInfo->LastName}] </span>
                        <i class="fa fa-caret-right"></i>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">[{$languages.all_account|default:'Tài khoản'}]</a></li>
                        <li><a href="JavaScript:logoutfn()">[{$languages.all_logout|default:'Thoát'}]</a></li>
                    </ul>
                </div>
                <div class="sigin-link" [{if $smarty.session.accountInfo|default:null}] style="display:none" [{/if}]>
                    <a href="JavaScript:dialog('login')" class="btn btn-default btn-sm">[{$languages.all_login|default:'Đăng nhập'}]</a>
                    <a href="JavaScript:dialog('register')" class="btn btn-default btn-sm">[{$languages.all_register|default:'Tham gia'}]</a>
                </div>
                <a href="JavaScript:dialog('contactus')" class="btn btn-default btn-sm">[{$languages.all_advisory|default:'Tư vấn'}]</a>
                <!--<ul>
                    <li><a class="btn btn-default btn-sm">ngôn ngữ</a>
                        <ul>
                            <li>tiếng anh</li>
                            <li>tiếng việt</li>
                        </ul>
                    </li>
                </ul>-->
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="navbar-header">
            <a href="#" class="navbar-brand">
                [{if $lang=='en'}]
                <img src="/assets/nha-dat/img/logo-en.png"/>
                [{else}]
                <img src="/assets/nha-dat/img/logo.png"/>
                [{/if}]
            </a>
            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                <span>
                    <span class="icon-bar line-1"></span>
                    <span class="icon-bar line-2"></span>
                    <span class="icon-bar line-3"></span>
                </span>
            </button>
        </div>
        <nav id="navigation" class="collapse navbar-collapse bs-navbar-collapse" role="navigation" style="overflow: hidden" >

            <ul class="nav navbar-nav pull-right">
                <li><a href='/'>[{$languages.all_home|default:'Trang chủ'}]</a></li>
                <li>
                    <a href="/gioi-thieu" >[{$languages.all_about|default:'Giới thiệu'}]</a>
                    <!-- <a href="#" data-toggle="dropdown">Courses</a>
                    <ul class="dropdown-menu">
                        <li><a href='/product/xgard'>Park</a></li>
                        <li><a href='/product/red-shied'>Street</a></li>
                        <li><a href='/product/green-shied'>Arena</a></li>
                        <li><a href='/product/green-shied'>Green Shied</a></li>
                    </ul> -->
                </li>
                <li><a href="/cong-trinh">[{$languages['all_buildings-project']|default:'Công trình - dự án'}]</a></li>
                <li><a href="/noi-that">[{$languages['all_interior-design']|default:'Thiết kế nội thất'}]</a></li>
                <li><a href="/lien-he">[{$languages.all_Contact|default:'Liên hệ'}]</a></li>
            </ul>
        </nav>
    </div>
</header>