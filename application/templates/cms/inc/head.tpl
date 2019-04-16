<header id="navbar" class="navbar" role="banner">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" type="button">
                <span class="icon-bar line-1"></span>
                <span class="icon-bar line-2"></span>
                <span class="icon-bar line-3"></span>
            </button>
            <a href="/vi" class="navbar-brand">
                <span class="space-line"></span>
            </a>
        </div>
        <ul class="nav navbar-nav pull-right">
            <li><a href="#" onclick="toggleQuickBar()" title="Quick navigation"><span class="fa fa-send"></span></a></li>
            <li>
                <a href="JavaScript:" 
                   onclick="cms.logMessage()"
                   title="Notication message">
                    <span class="fa fa-comments"></span>
                </a>
            </li>
            <li>
                <a href="#" data-toggle="dropdown" title="Setting"><span class="fa fa-sliders"></span></a>
                <ul class="dropdown-menu pull-center" role="menu" aria-labelledby="dLabel">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                </ul>
            </li>
            <li>
                <a href='#'  data-toggle="dropdown" title="Account">
                    <span class="hidden-xs hidden-mb">[{$smarty.session.auth.user->ause_name|default:'Unknown'}]</span>
                    <i class="fa fa-users"></i>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li><a href="JavaScript:void(0)" onclick="accountdialog()"><span class="fa fa-info-circle"></span> Account Info</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="[{'cms/auth/logout'|base_url}]?state=[{uri_string()}]&query=[{$smarty.get|http_build_query|urlencode}]"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </li>
        </ul>

    </div>
</header>

