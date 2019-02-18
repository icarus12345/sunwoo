<header id="navbar" class="navbar" role="banner">
    <div class="container">
        <div class="">
            <div class="pull-right top-menu">
                <!-- <a class="btn btn-default btn-sm">Trang chủ</a> -->
                <div class="acc-info" [{if not $smarty.session.accountInfo|default:null}] style="display:none" [{/if}]>
                    <a href="#" data-toggle="dropdown" class="btn btn-default btn-sm">
                        <span>[{$smarty.session.accountInfo->FirstName}] [{$smarty.session.accountInfo->LastName}] </span>
                        <i class="fa fa-caret-right"></i>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Tài khoản</a></li>
                        <li><a href="JavaScript:logoutfn()">Thoát</a></li>
                    </ul>
                </div>
                <div class="sigin-link" [{if $smarty.session.accountInfo|default:null}] style="display:none" [{/if}]>
                    <a href="JavaScript:dialog('login')" class="btn btn-default btn-sm">[{$languages.login|default:'Đăng nhập'}]</a>
                    <a href="JavaScript:dialog('register')" class="btn btn-default btn-sm">[{$languages.register|default:'Tham gia'}]</a>
                </div>
                [{$languages|print_r}]
                <a href="JavaScript:dialog('contactus')" class="btn btn-default btn-sm">Tư vấn</a>
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
                <img src="/assets/nha-dat/img/logo.png"/>
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
                <li><a href='/'>Trang chủ</a></li>
                <li>
                    <a href="/gioi-thieu" >Giới thiệu</a>
                    <!-- <a href="#" data-toggle="dropdown">Courses</a>
                    <ul class="dropdown-menu">
                        <li><a href='/product/xgard'>Park</a></li>
                        <li><a href='/product/red-shied'>Street</a></li>
                        <li><a href='/product/green-shied'>Arena</a></li>
                        <li><a href='/product/green-shied'>Green Shied</a></li>
                    </ul> -->
                </li>
                <li><a href="/cong-trinh">Công trình - dự án</a></li>
                <li><a href="/noi-that">Thiết kế nội thất</a></li>
                <li><a href="/lien-he">Liên hệ</a></li>
            </ul>
        </nav>
    </div>
</header>