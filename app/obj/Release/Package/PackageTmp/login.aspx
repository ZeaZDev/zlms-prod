<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="newweb.login" %>

<title>กองบัญชาการศึกษา สํานักงานตํารวจแห่งชาติ</title>    
<link rel="icon" href="assets/lms/img/logo/logo.gif">   
<link href="assets/lms/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/lms/css/font-awesome.min.css" rel="stylesheet">
<link href="assets/lms/css/styles_login.css" rel="stylesheet">

<script src="assets/lms/js/bootstrap.min.js"></script>
<script src="assets/lms/js/jquery-1.11.1.min.js"></script>

<link href="assets/pages/css/login.min.css" rel="stylesheet" type="text/css" />


<!------ Include the above in your HEAD tag ---------->

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
			<div class="login100-pic js-tilt" data-tilt>
				<img src="assets/lms/img/logo/logo.gif" alt="IMG">
			</div>

			<form class="login-form" action="#"   id="form1" runat="server">
				<span class="login100-form-title ">
					<B>LMS POLICE</B> <p>กองบัญชาการศึกษา สํานักงานตํารวจแห่งชาติ</p>
				</span>


				<div class="wrap-input100 validate-input" >
					<input class="input100" type="text" autocomplete="off" placeholder="Username" id="txtUsername" runat="server" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-user" aria-hidden="true"></i>
					</span>
				</div>

				<div class="wrap-input100 validate-input" >
					<input class="input100" type="password" autocomplete="off" placeholder="Password" id="txtPassword" runat="server" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>

				<div class="container-login100-form-btn">
					<asp:Button ID="bnLogin" runat="server" Text="Login" class="login100-form-btn" OnClick="bnLogin_Click" />
				</div>

				<div class="text-center p-t-12">
					<a class="txt2" href="<%= ResolveUrl("~/Register.aspx") %>">
						ลงทะเบียน
					</a>
				</div>

				<div id="mdAdd" class="modal fade in" tabindex="-1" role="dialog" >
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="font-green">Forget Password ?</h3>
								<asp:Label ID="Label1" runat="server" Text="Enter your e-mail address below to reset your password."></asp:Label>
								<div class="form-group">
									<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" id="emailc" runat="server"/> </div>                               
									
								</div>
								<div class="modal-footer">
									<div class="form-actions">
										<button type="button" id="back-btn" class="btn green btn-outline" data-dismiss="modal">Back</button>
										<asp:Button ID="bnAdduser" lass="btn btn-success uppercase pull-right"   runat="server" Text="Submit" OnClick="bnSubmit_Click" />
									</div> 
									
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					
				</form>
			</div>
		</div>
	</div>

	<!-- BEGIN CORE PLUGINS -->
	
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
	<script src="assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN THEME GLOBAL SCRIPTS -->
	<script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
	<!-- END THEME GLOBAL SCRIPTS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="assets/pages/scripts/login.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME LAYOUT SCRIPTS -->
	<!-- END THEME LAYOUT SCRIPTS -->
	<script>
		$(document).ready(function () {
			$('#clickmewow').click(function () {
				$('#radio1003').attr('checked', 'checked');
			});
		})
	</script>


