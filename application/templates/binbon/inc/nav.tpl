    
    <div class="gototop" id="gototop"></div>
    <div class="left-bar" >
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navigation">
            <span>
                <span class="icon-bar line-1"></span>
                <span class="icon-bar line-2"></span>
                <span class="icon-bar line-3"></span>
            </span>
        </button>
        <a href="/" class="logo">BINBON</a>
        <ul class="collapse" id="navigation">
            <li><a href="/">[{$languages.default.home|escape}]</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                  [{$languages.default.pages|escape}] 
                  <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/pages/about-us">[{$languages.default.about_us|escape}]</a></li>
                    <li><a href="/pages/contact-us">[{$languages.default.contact_us|escape}]</a></li>
                </ul>
            </li>
            <li><a href="/shop">[{$languages.default.shop|escape}]</a></li>
            <li><a href="/blogs">[{$languages.default.blog|escape}]</a></li>
            <li class="langs">
                <a href="/?lang=vi">Tiếng Việt</a>
                <a href="/?lang=en">English</a>
            </li>
        </ul>
        <div id="cart" class="cart">
            [{include file=$smarty.const.APPPATH|cat:"templates/binbon/widget/cart-info.tpl"}]
        </div>
    </div>