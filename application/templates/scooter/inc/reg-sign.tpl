<div id="login" class="dialog transition" style="z-index:1110;">
    <div class="content transition">
        <div class="">
            <div class="head"><span>LOGIN !</span> <i class="pull-right fa fa-close" onclick="dialog('login')"></i></div>
            <div class="body">
                <form name="signForm" id="signForm" target="integration_asynchronous">
                You dont have account. <a class="dark" href="#" onclick="dialog('register')">Register here</a>.
                <div class="space-line"></div>
                <div class="input-group">
                    <input class="form-control dark validate[required,custom[email]]" placeholder="Email" name="Email" />
                </div>
                <div class="space-line"></div>
                <div class="input-group password-control">
                    <input type="password" class="form-control darkvalidate[required,minSize[4],maxSize[255]]" placeholder="Password" name="Password" />
                    <span>Forgot?</span>
                </div>
                <div class="space-line"></div>
                <div class="row">
                    <div class="col-xs-6">
                        
                    </div>
                    <div class="col-xs-6">
                        <button class="btn btn-default btn-block" type="button" onclick="loginfn()">LOGIN</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="register" class="dialog transition" style="z-index:1110;">
    <div class="content transition">
        <div class="">
            <div class="head"><span>Register !</span> <i class="pull-right fa fa-close" onclick="dialog('register')"></i></div>
            <div class="body">
            <form name="regForm" id="regForm" target="integration_asynchronous">
                You have account. <a class="dark" href="#" onclick="dialog('login')">Login here</a>.
                <div class="space-line"></div>
                <div class="row half">
                    <div class="col-xs-6 half">
                        <div class="input-group">
                            <input name="FirstName" class="form-control dark validate[required,minSize[4],maxSize[255]]" placeholder="First name"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                    <div class="col-xs-6 half">
                        <div class="input-group">
                            <input name="LastName" class="form-control dark validate[required,minSize[4],maxSize[255]]" placeholder="Last name"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                </div>
                <div class="row half">
                    <div class="col-xs-12 half">
                        <div class="input-group">
                            <input name="Email" class="form-control dark validate[required,custom[email]]" placeholder="Email"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                </div>
                <div class="row half">
                    <div class="col-xs-6 half">
                        <div class="input-group">
                            <input type="password" name="Password" id="Password" class="form-control dark validate[required,minSize[4],maxSize[255]]" placeholder="Password"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                    <div class="col-xs-6 half">
                        <div class="input-group password-control">
                            <input type="password" class="form-control dark validate[required,equals[Password]]" placeholder="Confirm"/>
                        </div>
                        <div class="space-line"></div>
                    </div>
                </div>
                <div class="row half">
                    <div class="col-xs-6 half">
                        
                    </div>

                    <div class="col-xs-6 half">
                        <button class="btn btn-default btn-block" type="button" onclick="registerfn()">Register</button>
                    </div>
                </div>
            </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('#signForm').validationEngine({
            'scroll': false
            , 
            'isPopup' : false
            , 
            prettySelect : true
        //, validateNonVisibleFields:false
        });
        $('#regForm').validationEngine({
            'scroll': false
            , 
            'isPopup' : false
            , 
            prettySelect : true
        //, validateNonVisibleFields:false
        });
    });
    function registerfn(){
        if( $('#regForm').validationEngine('validate') === false)return;
        var params = $('#regForm').serializeObject();
        httpRequest({
            'url': '/frontend/account/onRegister',
            'data': {
                'params' : params
            },
            'callback': function(rsdata) {
                if (rsdata.result < 0) {
                    dialogMsg(rsdata.message);
                } else {
                    window.location.reload();
                }
            }
        }).call();
    }
    function loginfn(){
        if( $('#signForm').validationEngine('validate') === false)return;
        var params = $('#signForm').serializeObject();
        httpRequest({
            'url': '/frontend/account/onLogin',
            'data': {
                'params' : params
            },
            'callback': function(rsdata) {
                if (rsdata.result < 0) {
                    dialogMsg(rsdata.message);
                } else {
                    window.location.reload();
                }
            }
        }).call();
    }
    function logout(){
        httpRequest({
            'url': '/frontend/account/onLogout',
            'data': {
                
            },
            'callback': function(rsdata) {
                if (rsdata.result < 0) {
                    dialogMsg(rsdata.message);
                } else {
                    window.location.reload();
                }
            }
        }).call();
    }
</script>
<!-- <div id="pending" class="spinner pending"></div> -->
<div id="dialogMsg" class="dialog" style="z-index:2222">
    <div class="content">
        <div>
            <div class="head">Notication Message !</div>
            <div class="body">

            </div>
            <div class="foot" onclick="closeMsg()">
                Close
            </div>
        </div>
    </div>
</div>