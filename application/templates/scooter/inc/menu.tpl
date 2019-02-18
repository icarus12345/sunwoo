
<header id="navbar" class="navbar" role="banner">
    <div class="container">

        <div class="navbar-header">

            <a href="/" class="navbar-brand">
                <img src="/assets/scooter/images/logo.png"/>
            </a>
            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                <span>
                    <span class="icon-bar line-1"></span>
                    <span class="icon-bar line-2"></span>
                    <span class="icon-bar line-3"></span>
                </span>
            </button>
        </div>
        <div class="account-menu">
            <div class="cart-menu">
                [{include file=$smarty.const.APPPATH|cat:"templates/scooter/widget/cartInfo.tpl"}]
            </div>
            <div>
                [{if $smarty.session.accountInfo}]
                <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                    [{$smarty.session.accountInfo->FirstName}]<img style="margin-top: -2px;margin-left: 5px" src="/assets/scooter/images/caret.png"/>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/account">Account Info</a></li>
                    <li><a href="/account/orders">Order History</a></li>
                    <li><a href="JavaScript:logout()">Sign out</a></li>
                </ul>
                [{else}]
                <a href="JavaScript:dialog('login')">
                    Login
                </a>
                [{/if}]
                
            </div>
            
        </div>
        <nav id="navigation" class="collapse navbar-collapse bs-navbar-collapse" role="navigation" style="overflow: hidden" >

            <ul class="nav navbar-nav pull-right">
                <li>
                    <a href="/" data-toggle="dropdown">Scooters</a>
                    <ul class="dropdown-menu">
                        [{foreach from=$categories item=foo}]
                        <li><a href="/track/[{$foo->cat_alias|escape:'html'}]">[{$foo->cat_title|escape:'html'}]</a></li>
                        [{/foreach}]

                    </ul>
                </li>
                <li><a href='/gears'>Gears</a></li>
                <li><a href='/story'>Stories</a></li>
                <li><a href='/about'>About</a></li>
                <li><a href='/contact'>Contact</a></li>
            </ul>
        </nav>
    </div>
</header>