{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}
{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg"}
{/if}
<script src="/themes/clientarea/yunyoo/assets/js/public.js?v={$Ver}"></script>

<style>
	.semi-transparent-white-bg {
		background-color: rgb(255, 255, 255, 0.95);
	}

	body {
		/*background: url(https://h2.nexus/source/img/uptime.gif);*/
		/*background-repeat: no-repeat;*/
		/*background-size: cover;*/
		/*background-position: center;*/
	}

	section {
		/*backdrop-filter: blur(12px);*/
		/*--webkit-backdrop-filter: blur(12px);*/
		background-color: rgb(176 116 209 / 10%);
	}

	.input-group-append {
		height: 36.54px;
	}
</style>
<script>
	var mk = '{$Setting.msfntk}';
</script>
<script>
	function beforeSubmit(_this) {
		var is_checked = $('#customCheck1:checked');
		if (is_checked.length == 0) {
			toastr.error('{$Lang.check_privacy}');
			return false;
		}

		var button = document.getElementById('registerBtn');
		var icon = document.createElement('i');
		icon.className = 'fas fa-circle-notch bx-spin mr-1';
		button.disabled = true;
		button.innerHTML = '注册中...';
		button.prepend(icon);
		var form = document.getElementById('registerForm');
		form.submit();
		setTimeout(function () {
			button.disabled = false;
			button.innerHTML = '注册';
			icon.remove();
		}, 10000);
	}
</script>

<section>
	<div id="background-container">
		<div id="image-background"
			style="background-image: url({$Setting.custom_login_background_img}); background-size: cover; background-position: center top;">
		</div>
		<video id="video-background" autoplay="" loop="" muted="" playsinline=""
			src="{$Setting.custom_login_background_img}"
			style="object-fit: cover; object-position: center top; display: block;"></video>
		<style>
			#background-container {
				position: fixed;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				z-index: -1;
			}

			#image-background,
			#video-background {
				position: absolute;
				top: 0;
				left: 0;
				width: 100vw;
				height: 100vh;
				background-repeat: no-repeat;
				background-size: cover;
				z-index: 10;
			}

			#video-background {
				z-index: 20;
			}
		</style>
	</div>
	<div class="container d-flex flex-column">
		<div class="row align-items-center justify-content-center min-vh-100">
			<div class="col-md-7 col-lg-6 col-xl-5 py-6 py-md-0">
				<div class="card shadow zindex-100 mb-0 overflow-hidden rounded-lg semi-transparent-white-bg">
					<div class="p-1 bg-info d-flex text-white justify-content-center">
						<strong>{$Setting.custom_login_background_char ? $Setting.custom_login_background_char :
							$Setting.company_name}</strong>
					</div>
					<div class="card-body px-md-5">
						<div class="mb-3 container">
							<div class="row align-items-end">
								<div class="p-0 col-auto mr-auto">
									<h1 class="text-primary">注册账号</h1>
								</div>
								<div class="p-0 col-auto">
									<!--<h4 class="text-primary"><i class="fa-angles-right fa-solid pr-1" aria-hidden="true"></i>注册账号</h4>-->
								</div>
							</div>
						</div>
						<span class="clearfix"></span>
						<form id="registerForm" class="mb-0" method="post" action="/register?action=email">
							<div class="form-group">
								<label class="form-control-label">昵称</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg"
												width="1em" height="1em" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-user">
												<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
												<circle cx="12" cy="7" r="4"></circle>
											</svg></span>
									</div>
									<input type="text" name="username" class="form-control" id="username"
										placeholder="请输入您的昵称">
								</div>
							</div>
							<div class="form-group">
								<label class="form-control-label">邮箱</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg"
												width="1em" height="1em" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-at-sign">
												<circle cx="12" cy="12" r="4"></circle>
												<path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path>
											</svg></span>
									</div>
									<input type="email" name="email" class="form-control" id="emailInp"
										placeholder="请输入邮箱地址">
								</div>
							</div>
							{if $Verify.allow_register_email_captcha==1}
							{include file="includes/verify" type="allow_register_email_captcha" positon="top"}
							{/if}
							<div class="form-group">
								<label class="form-control-label">邮箱验证码</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg"
												width="1em" height="1em" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-code">
												<polyline points="16 18 22 12 16 6"></polyline>
												<polyline points="8 6 2 12 8 18"></polyline>
											</svg></span>
									</div>

									<input type="text" name="code" class="form-control" id="code"
										placeholder="请输入邮箱验证码">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button"
											onclick="getCode(this,'register_email_send','allow_register_email_captcha')">获取验证码</button>
									</div>
								</div>

							</div>
							<div class="form-group">
								<label class="form-control-label">密码</label>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg"
												width="1em" height="1em" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-key">
												<path
													d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4">
												</path>
											</svg></span>
									</div>
									<input type="password" name="password" class="form-control" id="emailPwd" value
										placeholder="请输入登录密码">
								</div>
							</div>
							<div class="form-group">
								<label class="form-control-label">确认密码</label>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg"
												width="1em" height="1em" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-key">
												<path
													d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4">
												</path>
											</svg></span>
									</div>
									<input type="password" name="checkPassword" class="form-control" id="emailPwdCheck"
										value placeholder="请确认登录密码">
								</div>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="customCheck1">
								<label class="custom-control-label" for="customCheck1">我已详细阅读并同意
									<a href="{$Setting.web_privacy_url}" target="_blank" class="text-primary">《服务协议》</a>
								</label>
							</div>
							<div class="row pt-2 m-0">
								<div class="p-0 col-auto mr-auto">
								</div>
								<div class="p-0 col-auto">
									<a href="/login" class="font-weight-bold">登录账号</a>
								</div>

							</div>
							<div class="mt-4">
								<button id="registerBtn" type="submit" class="btn btn-block btn-primary"
									onclick="if(!beforeSubmit(this)) {return false;}">注册</button>
							</div>
						</form>


					</div>
					<div class="p-1 bg-info d-flex flex-column text-white">
						{if $Setting.custom_login_background_description}
						<span class="text-center">{$Setting.custom_login_background_description}</span>
						{/if}
						<span class="text-center">
							注册即代表同意 <a href="{$Setting.web_privacy_url}" target="_blank" class="text-light">《服务协议》</a>
							<a href="{$Setting.web_tos_url}" target="_blank" class="text-light">《用户隐私条款》</a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

</div>
<!-- end container-fluid -->
<script src="/themes/clientarea/yunyoo/assets/js/public.js"></script>
<script>
	function beforeSubmit(_this) {
		var is_checked = $('#customCheck1:checked');
		if (is_checked.length == 0) {
			toastr.error('{$Lang.check_privacy}');
			return false;
		}

		var button = document.getElementById('registerBtn');
		var icon = document.createElement('i');
		icon.className = 'fas fa-circle-notch bx-spin mr-1';
		button.disabled = true;
		button.innerHTML = '注册中...';
		button.prepend(icon);
		var form = document.getElementById('registerForm');
		form.submit();
		setTimeout(function () {
			button.disabled = false;
			button.innerHTML = '注册';
			icon.remove();
		}, 10000);
	}
</script>