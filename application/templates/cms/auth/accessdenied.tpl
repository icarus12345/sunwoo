<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Access Denied</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" type="text/css" href="[{'libraries/bootstrap/css/auth.css'|base_url}]">
        <link rel="stylesheet" type="text/css" href="[{'libraries/bootstrap/css/font-awesome.css'|base_url}]">
    </head>
    <body>
        <p class="notice">Welcome back! Sigin below to access all the features available to you.</p>
        <div class="content-wrapper">
            <div class="panel error-mobile">
                <div class="eight columns">
                    <h1 style="color:#d9534f">Access Denied</h1>
                    <div class="divider"></div>
                    <div>
                        <p style="text-align: left">
                                Access is denied for user "[{$smarty.session.auth.user->ause_name|default:'Unknown'}]".<br>
                                <span style="color:#d9534f">This function to requires an administrative account.<br>
                                Please check your authority, and try again.<br>
                                </span>
                                Goto <a href="[{'cms'|base_url}]">CMS</a> or
                                <a href="[{'cms/auth/logout'|base_url}]?state=[{uri_string()}]">logout</a>.
                        </p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html>