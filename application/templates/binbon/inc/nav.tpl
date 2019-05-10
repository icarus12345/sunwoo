    <div class="left-bar">
        <a href="/" class="logo">BINBON</a>
        <ul>
            <li><a href="/">[{$languages.default.home|escape}]</a></li>
            <li>
                <a href="#">[{$languages.default.pages|escape}]</a>
                <ul>
                    <li><a href="/pages/about-us">[{$languages.default.about_us|escape}]</a></li>
                    <li><a href="/pages/contact-us">[{$languages.default.contact_us|escape}]</a></li>
                </ul>
            </li>
            <li><a href="/shop">[{$languages.default.shop|escape}]</a></li>
            <li><a href="/blog">[{$languages.default.blog|escape}]</a></li>
        </ul>
        <div id="cart" class="cart">
            [{include file=$smarty.const.APPPATH|cat:"templates/binbon/widget/cart-info.tpl"}]
        </div>
    </div>