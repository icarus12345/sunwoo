<div id="iDialog" class="iDialog" style="display:none">
	<b>[{$smarty.session.auth.user->ause_username|escape|default:''}]</b>
	<form name="myinfoForm" id="myinfoForm" target="integration_asynchronous">
		<div class="control-group pull-top">
            <div>Diplay Name :</div>
            <input type="text" 
                class="form-control validate[required]" 
                value="[{$smarty.session.auth.user->ause_name|escape|default:''}]" 
                name="ause_name"
                >
        </div>
        <div class="control-group pull-top">
            <div>Email :</div>
            <input type="text" 
                class="form-control validate[required]" 
                value="[{$smarty.session.auth.user->ause_email|escape|default:''}]" 
                name="ause_email"
                >
        </div>
        <div class="control-group pull-top">
            <div>Password :</div>
            <div class="input-append">
                <input type="text" class="form-control" 
                    placeholder="Current password"
                    name="ause_password"
                    value=""
                    />
                <span class="add-on" title="Random new password" onclick="getNewPass()">
                    <i class="fa fa-random"></i>
                </span>
            </div>
        </div>
	</form>
</div>