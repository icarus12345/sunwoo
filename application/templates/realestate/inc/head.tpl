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
            <ul class="hover-line-links" ui-content-for="left-nav">
                <li><a href="/"><span>Trang chủ</span></a></li>
                <li><a href="/about.html"><span>Về chúng tôi</span></a></li>
                <li><a href="/realestate.html"><span>Nhà đất</span></a></li>
                <li><a href="/project.html"><span>Dự án</span></a></li>
                <li><a href="/invest.html"><span>Đầu tư</span></a></li>
                <li><a href="/partner.html"><span>Đối tác</span></a></li>
                <li><a href="/contact.html"><span>Liên hệ</span></a></li>

            </ul>
        </nav>