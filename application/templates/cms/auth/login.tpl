<!DOCTYPE html>
<html lang="en">
    <head>
        <title>CMS - Login</title>
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
                    <h1>Sigin to CMS</h1>
                    <div class="divider"></div>
                    <div>
                        <form method="POST">
                            <input type="hidden" name="action" value="login">
                            <div>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-bug"></i>
                                    </span>
                                    <input type="text" name="username" 
                                        class="form-control" 
                                        placeholder="User name" 
                                        >
                                </div>
                            </div>
                            <div>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-code"></i>
                                    </span>
                                    <input type="password" name="password"  
                                        class="form-control"
                                        placeholder="Password" 
                                        >
                                </div>
                            </div>
                            <div>
                                <div class="input-group">
                                    
                                    <button style="width: 100%" class="btn btn-default" type="submit">
                                        <i class="fa fa-sign-in"></i> Sigin 
                                    </button>
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default" tabindex="-1">

                                            <span>OAuth<span>
                                            <span class="caret"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            [{if $message}]
                            <div class="bs-callout bs-callout-danger">[{$message}]</div>
                            [{/if}]
                        </form>
                        
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html>