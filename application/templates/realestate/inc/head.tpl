        <div id="gnavi" class="nav" ui-yield-to="gnavi">
            <div class="nav-btn" ui-content-for="gnavi">
                <a href="#gnavi-links">
                    <span class="bars">
                        <span class="bar"></span>
                        <span class="bar"></span>
                        <span class="bar"></span>
                        <span class="bar"></span>
                    </span>
                </a>
            </div>
        </div>
        <nav id="gnavi-links" class="nav-links" ui-yield-to="left-nav">
            <div class="hover-line-links" ui-content-for="left-nav">
                <span class="close-gnavi fa fa-times" onclick="$('#gnavi .nav-btn').click()"></span>
                <ul>
                    <li class="head"><b>OPEN YOUR LIFE</b></li>
                    <li><a href="/"><span>Trang chủ</span></a></li>
                    <li><a href="/about"><span>Về chúng tôi</span></a></li>
                    <li><a href="/real-estate"><span>Nhà đất</span></a>
                        <ul>
                            <li><a href="/rent"><span>Cho thuê</span></a></li>
                            <li><a href="/selling"><span>Bán</span></a></li>
                            
                        </ul>
                    </li>
                    <li><a href="/project"><span>Dự án</span></a></li>
                    <li><a href="/invest"><span>Đầu tư</span></a></li>
                    <li><a href="/partner"><span>Đối tác</span></a></li>
                    <li><a href="/blogs"><span>Blogs</span></a></li>
                    <li><a href="/contact"><span>Liên hệ</span></a></li>
                </ul>
                <div class="footer">
                    <div class="">Kết nối với chúng tôi</div>
                    <div class="socials">
                        <a href="/" class="fb-social"><img src="/assets/sunwoo/images/facebook.png"/></a>
                        <a href="/" class="gg-social"><img src="/assets/sunwoo/images/google+.png"/></a>
                        <a href="/" class="yb-social"><img src="/assets/sunwoo/images/youtube.png"/></a>
                        <a href="/" class="za-social"><img src="/assets/sunwoo/images/zalo.png"/></a>
                        <a href="/" class="ta-social"><img src="/assets/sunwoo/images/kakaotalk.png"/></a>
                    </div>
                    <div class="copyright">Copyright &copy; 2019 by <a class="a" href="/">SUNWOO C&D</a> Ltd</div>
                </div>
            </div>
        </nav>