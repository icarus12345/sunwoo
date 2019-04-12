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
                <span class="close-gnavi fa fa-times" onclick="$('#gnavi .nav-btn a').click()"></span>
                <ul>
                    <li class="head"><b>[{$languages.all_open_your_life|quotes_to_entities}]</b></li>
                    <li><a href="/"><span>[{$languages.all_home|quotes_to_entities}]</span></a></li>
                    <li><a href="/about"><span>[{$languages.all_about_us|quotes_to_entities}]</span></a></li>
                    <li>
                        <a href="/real-estate"><span>[{$languages.all_real_estate|quotes_to_entities}]</span></a>
                        <span class="fa fa-angle-up"></span>
                        <ul>
                            <li><a href="/rent"><span>[{$languages.all_rent|quotes_to_entities}]</span></a></li>
                            <li><a href="/selling"><span>[{$languages.all_selling|quotes_to_entities}]</span></a></li>
                            
                        </ul>
                    </li>
                    <li><a href="/project"><span>[{$languages.all_project|quotes_to_entities}]</span></a></li>
                    <li><a href="/invest"><span>[{$languages.all_invest|quotes_to_entities}]</span></a></li>
                    <li><a href="/partner"><span>[{$languages.all_partner|quotes_to_entities}]</span></a></li>
                    <li><a href="/blogs"><span>[{$languages.all_blogs|quotes_to_entities}]</span></a></li>
                    <li><a href="/contact"><span>[{$languages.all_contact|quotes_to_entities}]</span></a></li>
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