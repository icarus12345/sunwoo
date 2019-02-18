<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-02-18 19:10:37
         compiled from "application/templates/realestate/widget/popup.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4149589855c6aa0bd71eca9-26149589%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '38471c2f86caee7bbdd7bf5ef0267789f9e14036' => 
    array (
      0 => 'application/templates/realestate/widget/popup.tpl',
      1 => 1434009044,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4149589855c6aa0bd71eca9-26149589',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'languages' => 0,
    'categories' => 0,
    'foo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5c6aa0bd73ada6_61269677',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5c6aa0bd73ada6_61269677')) {function content_5c6aa0bd73ada6_61269677($_smarty_tpl) {?><div id="login" class="dialog transition" style="z-index:1110;">
	<div class="content transition">
		<div class="">
			<div class="head"><span><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_login'])===null||$tmp==='' ? 'Đăng nhập' : $tmp);?>
 !</span> <i class="pull-right fa fa-close" onclick="dialog('login')"></i></div>
			<div class="body">
				<form name="signForm" id="signForm" target="integration_asynchronous">
				<?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_dont_have_account'])===null||$tmp==='' ? 'Bạn chưa có tài khoản' : $tmp);?>
. <a class="dark" href="#" onclick="dialog('register')"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_register'])===null||$tmp==='' ? 'Tham gia' : $tmp);?>
 <?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_here'])===null||$tmp==='' ? 'tại đây' : $tmp);?>
</a>.
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
				<?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_login'])===null||$tmp==='' ? 'Đăng nhập' : $tmp);?>

			</div>
		</div>
	</div>
</div>
<div id="register" class="dialog transition" style="z-index:1110;">
	<div class="content transition">
		<div class="">
			<div class="head"><span><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_register'])===null||$tmp==='' ? 'Tham gia' : $tmp);?>
 !</span> <i class="pull-right fa fa-close" onclick="dialog('register')"></i></div>
			<div class="body">
			<form name="regForm" id="regForm" target="integration_asynchronous">
				<?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_have_account'])===null||$tmp==='' ? 'Bạn đã có tài khoản' : $tmp);?>
. <a class="dark" href="#" onclick="dialog('login')"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_login'])===null||$tmp==='' ? 'Đăng nhập' : $tmp);?>
 <?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_here'])===null||$tmp==='' ? 'tại đây' : $tmp);?>
</a>.
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
				<?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_register'])===null||$tmp==='' ? 'Tham gia' : $tmp);?>

			</div>
		</div>
	</div>
</div>
<?php echo '<script'; ?>
 type="text/javascript">
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
<?php echo '</script'; ?>
>
<!-- <div id="pending" class="spinner pending"></div> -->
<div id="dialogMsg" class="dialog" style="z-index:2222">
	<div class="content">
		<div>
			<div class="head"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_notification'])===null||$tmp==='' ? 'THÔNG BÁO' : $tmp);?>
 !</div>
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
			<div class="head"><span><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_advisory'])===null||$tmp==='' ? 'GIẢI ĐÁP THẮC MẮC' : $tmp);?>
 !</span> <i class="pull-right fa fa-close" onclick="dialog('contactus')"></i></div>
			<div class="body">
			<form name="advisoryForm" id="advisoryForm" target="integration_asynchronous">
				<?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_have_account'])===null||$tmp==='' ? 'Bạn đã có tài khoản' : $tmp);?>
. <a class="dark" href="#" onclick="dialog('login')"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_login'])===null||$tmp==='' ? 'Đăng nhập' : $tmp);?>
 <?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_here'])===null||$tmp==='' ? 'tại đây' : $tmp);?>
</a>.
				<div class="space-line"></div>
				<div class="row half">
					<div class="col-xs-6 half">
						<div class="input-group">
							<input name="advisory_name"
							<?php if ($_SESSION['accountInfo']) {?> 
								value="<?php echo $_SESSION['accountInfo']->FirstName;?>
 <?php echo $_SESSION['accountInfo']->LastName;?>
" 
							<?php }?>
								class="form-control dark validate[required,minSize[4],maxSize[255]]" 
								placeholder="Họ và Tên"/>
						</div>
						<div class="space-line"></div>
					</div>
					<div class="col-xs-6 half">
						<div class="input-group">
							<select name="advisory_category" class="form-control">
								<?php  $_smarty_tpl->tpl_vars['foo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['foo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['categories']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['foo']->key => $_smarty_tpl->tpl_vars['foo']->value) {
$_smarty_tpl->tpl_vars['foo']->_loop = true;
?>
								<option value="<?php echo $_smarty_tpl->tpl_vars['foo']->value->cat_id;?>
"><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['foo']->value->cat_title, ENT_QUOTES, 'UTF-8', true);?>
</option>
                                <?php } ?>
							</select>
						</div>
						<div class="space-line"></div>
					</div>
				</div>
				<div class="row half">
					<div class="col-xs-12 half">
						<div class="input-group">
							<input name="advisory_email" 
								value="<?php echo $_SESSION['accountInfo']->Email;?>
"
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
				<?php echo (($tmp = @$_smarty_tpl->tpl_vars['languages']->value['all_send'])===null||$tmp==='' ? 'Send' : $tmp);?>

			</div>
		</div>
	</div>
</div><?php }} ?>
