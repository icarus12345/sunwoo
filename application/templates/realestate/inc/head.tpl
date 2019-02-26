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
        </nav>