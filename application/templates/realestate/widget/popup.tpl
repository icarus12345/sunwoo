<div id="login" class="dialog transition" style="z-index:1110;">
	<div class="content transition">
		<div class="">
			<div class="head"><span>[{$languages.all_login|default:'Đăng nhập'}] !</span> <i class="pull-right fa fa-close" onclick="dialog('login')"></i></div>
			<div class="body">
				<form name="signForm" id="signForm" target="integration_asynchronous">
				[{$languages.all_dont_have_account|default:'Bạn chưa có tài khoản'}]. <a class="dark" href="#" onclick="dialog('register')">[{$languages.all_register|default:'Tham gia'}] [{$languages.all_here|default:'tại đây'}]</a>.
				<div class="space-line"></div>
				<div class="input-group">
					<input class="form-control dark validate[required,custom[email]]" placeholder="Email" name="Email" />
				</div>
				<div class="space-line"></div>
				<div class="input-group password-control">
					<input type="password" class="form-control darkvalidate[required,minSize[4],maxSize[255]]" placeholder="Password" name="Password" />
				</div>
				<div class="space-line"></div>
				<!--<div class="row">
					<div class="col-xs-6">
						
					</div>
					<div class="col-xs-6">
						<button class="btn btn-default btn-block" type="button" onclick="loginfn()">LOGIN</button>
					</div>
				</div>-->
				</form>
			</div>
			<div class="dfoot" onclick="loginfn()">
				[{$languages.all_login|default:'Đăng nhập'}]
			</div>
		</div>
	</div>
</div>
<div id="register" class="dialog transition" style="z-index:1110;">
	<div class="content transition">
		<div class="">
			<div class="head"><span>[{$languages.all_register|default:'Tham gia'}] !</span> <i class="pull-right fa fa-close" onclick="dialog('register')"></i></div>
			<div class="body">
			<form name="regForm" id="regForm" target="integration_asynchronous">
				[{$languages.all_have_account|default:'Bạn đã có tài khoản'}]. <a class="dark" href="#" onclick="dialog('login')">[{$languages.all_login|default:'Đăng nhập'}] [{$languages.all_here|default:'tại đây'}]</a>.
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
				<!--<div class="row half">
					<div class="col-xs-6 half">
						
					</div>

					<div class="col-xs-6 half">
						<button class="btn btn-default btn-block" type="button" onclick="registerfn()">Register</button>
					</div>
				</div>-->
			</form>
			</div>
			<div class="dfoot" onclick="registerfn()">
				[{$languages.all_register|default:'Tham gia'}]
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
		$('#advisoryForm').validationEngine({
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
				dialogMsg(rsdata.message);
				if (rsdata.result < 0) {
				} else {
					// window.location.reload();
					document.signForm.Email = params.Email;
					document.signForm.Password = params.Password;
					document.regForm.reset();
					$('#register').removeClass('in');
					loginfn();
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
					//window.location.reload();
					$('.acc-info>a>span').html(rsdata.accountInfo.FirstName + ' ' + rsdata.accountInfo.LastName);
					$('.acc-info').show();
					$('.sigin-link').hide();
					document.signForm.reset();
					$('#login').removeClass('in');
				}
			}
		}).call();
	}
	function logoutfn(){
		httpRequest({
			'url': '/frontend/account/onLogout',
			'data': {
				
			},
			'callback': function(rsdata) {
				if (rsdata.result < 0) {
					dialogMsg(rsdata.message);
				} else {
					$('.acc-info').hide();
					$('.sigin-link').show();
				}
			}
		}).call();
	}
	function advisoryfn(){
		if( $('#advisoryForm').validationEngine('validate') === false)return;
		var params = $('#advisoryForm').serializeObject();
		httpRequest({
			'url': '/frontend/excution/addAdvisory',
			'data': {
				params : params
			},
			'callback': function(rsdata) {
				dialogMsg(rsdata.message);
				if (rsdata.result < 0) {
				} else {
					document.advisoryForm.reset();
					$('#contactus').removeClass('in');
				}
			}
		}).call();
	}
</script>
<!-- <div id="pending" class="spinner pending"></div> -->
<div id="dialogMsg" class="dialog" style="z-index:2222">
	<div class="content">
		<div>
			<div class="head">[{$languages.all_notification|default:'THÔNG BÁO'}] !</div>
			<div class="body">
				A confirmed address is a shipping address that PayPal has established as belonging to the PayPal account holder. To be protected by PayPal's Seller Protection Policy, you must require the shipping address to be a confirmed address
			</div>
			<div class="dfoot" onclick="closeMsg()">
				OK
			</div>
		</div>
	</div>
</div>
<div id="contactus" class="dialog transition" style="z-index:1110;">
	<div class="content transition">
		<div class="">
			<div class="head"><span>[{$languages.all_advisory|default:'GIẢI ĐÁP THẮC MẮC'}] !</span> <i class="pull-right fa fa-close" onclick="dialog('contactus')"></i></div>
			<div class="body">
			<form name="advisoryForm" id="advisoryForm" target="integration_asynchronous">
				[{$languages.all_have_account|default:'Bạn đã có tài khoản'}]. <a class="dark" href="#" onclick="dialog('login')">[{$languages.all_login|default:'Đăng nhập'}] [{$languages.all_here|default:'tại đây'}]</a>.
				<div class="space-line"></div>
				<div class="row half">
					<div class="col-xs-6 half">
						<div class="input-group">
							<input name="advisory_name"
							[{if $smarty.session.accountInfo}] 
								value="[{$smarty.session.accountInfo->FirstName}] [{$smarty.session.accountInfo->LastName}]" 
							[{/if}]
								class="form-control dark validate[required,minSize[4],maxSize[255]]" 
								placeholder="Họ và Tên"/>
						</div>
						<div class="space-line"></div>
					</div>
					<div class="col-xs-6 half">
						<div class="input-group">
							<select name="advisory_category" class="form-control">
								[{foreach from=$categories item=foo}]
								<option value="[{$foo->cat_id}]">[{$foo->cat_title|escape:'html'}]</option>
                                [{/foreach}]
							</select>
						</div>
						<div class="space-line"></div>
					</div>
				</div>
				<div class="row half">
					<div class="col-xs-12 half">
						<div class="input-group">
							<input name="advisory_email" 
								value="[{$smarty.session.accountInfo->Email}]"
								class="form-control dark validate[required,custom[email]]" 
								placeholder="Email"/>
						</div>
						<div class="space-line"></div>
					</div>
				</div>
				<div class="row half">
					<div class="col-xs-12 half">
						<div class="input-group">
							<input name="advisory_title" class="form-control dark validate[required]" placeholder="Tiêu đề"/>
						</div>
						<div class="space-line"></div>
					</div>
				</div>
				<div class="row half">
					<div class="col-xs-12 half">
						<div class="input-group">
							<textarea name="advisory_desc" class="form-control dark validate[required]" placeholder="Nội dung câu hỏi"></textarea>
						</div>
						<div class="space-line"></div>
					</div>
				</div>
				<input type="hidden" name="advisory_type" value="advisory">
				<!--<div class="row half">
					<div class="col-xs-6 half">
						
					</div>

					<div class="col-xs-6 half">
						<button class="btn btn-default btn-block" type="button" onclick="registerfn()">Register</button>
					</div>
				</div>-->
			</form>
			</div>
			<div class="dfoot" onclick="advisoryfn()">
				[{$languages.all_send|default:'Send'}]
			</div>
		</div>
	</div>
</div>