<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>找回密码</title>
<link
	href="//q.qunarzz.com/usercenter_pc/prd/styles/user-forgotpwd@10e03add5698738706076ef74fccea4f.css"
	rel="stylesheet" type="text/css">
<style id="style-1-cropbar-clipper">
.en-markup-crop-options {
	top: 18px !important;
	left: 50% !important;
	margin-left: -100px !important;
	width: 200px !important;
	border: 2px rgba(255, 255, 255, .38) solid !important;
	border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
	margin-left: 0px !important;
}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var status=0;
		
		$("#username").blur(function() {
			var username = $("#username").val();
			if (username === "") {
				$("#username_span").html("用户名不能为空");
				status = 0;
			} else {
				$.post(
					"../usernameCheckAction",
					{
						"username" : username
					},
					function(data) {
						if (data === "0") {
							$("#username_span").html("");
							status = 1;
						} else {
							$("#username_span").html("用户名不存在");
							status = 0;
						}
					},
					"json");
			}
		});


		$("#email").blur(function() {
			var username = $("#username").val();
			var ret = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
			var email = $("#email").val();
			if (email === "") {
				$("#email_span").html("邮箱不能为空");
				status = 0;
			} else {
				if (ret.test(email)) {
					$.post(
						"../emailAction",
						{
							"user.username" : username,
							"user.email" : email
						},
						function(data) {
							//alert(data.answer);
							if (data.status === "1") {
								$("#email_span").html("");
								$("#question").val(data.question);
								status = 1;
							} else {
								$("#email_span").html("该邮箱与账号所绑定的邮箱不匹配");
								status = 0;
							}
						},
						"json");
				} else {
					$("#email_span").html("邮箱格式不正确");
					status = 0;
				}

			}

		});

		$("#answer").blur(function() {
			var username = $("#username").val();
			var answer = $("#answer").val();
			//alert("123");
			if(username===""){
				$("#answer_span").html("请先输入用户名");
				status = 0;
				//alert("请先输入用户名");
			}
			else if (answer === "") {
				$("#answer_span").html("答案不能为空");
				status = 0;
				//alert("答案不能为空");
			} else {
				$.post(
					"../answerAction",
					{
						"user.username":username,
						"user.answer":answer
					},
					function(data){
						if(data==="0"){
							$("#answer_span").html("答案不正确");
							status = 0;
						}
						else{
							$("#answer_span").html("");
							status = 1;
						}
					},"json"

				);
			}


		});

		$("form").submit(function(){
			if(status==0){
				alert("no");
				return false;
			}else{
				alert("ok");
				return true;
			}
		
		});
	});
</script>
</head>

<body>
	<script type="text/javascript"
		src="//rmcsdf.qunar.com/js/device.js?orgId=ucenter.sendVcode&amp;sessionId=98a5d4d5-fe93-47e5-bdb8-8e9b33cf418d&amp;auto=false"></script>
	<div class="fp-page">
		<div class="fp-header">
			<div class="fp-header-content">
				<div class="qn_page_tit">
					<div class="qn_tit">找回密码</div>
				</div>
			</div>
		</div>

		<!--找回密码填写要找回的账号信息-->
		<form action="../resetPasswordAction" method="post">
			<div class="fp-body fp-main" id="forgotPwdPage"
				data-viewmodel="ForgotPwdViewModel">
				<div class="fp-body-content" style="height:137%;">
					<div class="fp-body-title">请输入您需要找回登录密码的账户名</div>
					<div class="fp-body-form">
						<div class="textbox-group" data-model="loginName"
							data-controltype="TextBoxGroup" id="forgotPwdPage_loginName_1">
							<label class="label">账户名</label> <input class="textbox"
								type="text" id="username" name="user.username" placeholder="请输入用户名"
								autocomplete="off"> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span id="username_span" style="color:red;"></span>
						</div>
						<div class="textbox-group textbox-group-inter-mobile">
							<label></label> <span></span>
						</div>
						<div class="textbox-group" data-model="loginName"
							data-controltype="TextBoxGroup" id="forgotPwdPage_loginName_1">
							<label class="label">邮&nbsp;&nbsp;&nbsp;箱</label> <input
								class="textbox" type="text" id="email" name="user.email" placeholder="请输入邮箱"
								autocomplete="off"> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span id="email_span" style="color:red;"></span>
						</div>
						<div class="textbox-group textbox-group-inter-mobile">
							<label></label> <span></span>
						</div>
						<div class="textbox-group" data-model="loginName"
							data-controltype="TextBoxGroup" id="forgotPwdPage_loginName_1">
							<label class="label">问&nbsp;&nbsp;&nbsp;提</label> <input
								class="textbox" type="text" id="question" placeholder="注册时填写的问题"
								autocomplete="off" readonly="readonly"> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span id="question_span" style="color:red;"></span>
						</div>
						<div class="textbox-group textbox-group-inter-mobile">
							<label></label> <span></span>
						</div>
						<div class="textbox-group" data-model="loginName"
							data-controltype="TextBoxGroup" id="forgotPwdPage_loginName_1">
							<label class="label">答&nbsp;&nbsp;&nbsp;案</label> <input
								class="textbox" type="text" id="answer"
								placeholder="请输入注册时填写的问题答案" autocomplete="off"> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span id="answer_span" style="color:red;"></span>
						</div>
						<div class="textbox-group textbox-group-inter-mobile">
							<label></label> <span></span>
						</div>

						<div class="textbox-group textbox-group-submit">
							<input class="btn btn-orange" data-model="submitBtn"
								data-controltype="Button" type="submit"
								id="forgotPwdPage_submitBtn_1" value="提交" />
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--<script type="text/javascript" src="https://rmcsdf.qunar.com/js/df.js?org_id=ucenter.sendVcode&amp;js_type=0"></script>-->
		<script type="text/javascript"
			src="//q.qunarzz.com/jquery/prd/jquery-1.7.2.js"></script>
		<script type="text/javascript"
			src="//q.qunarzz.com/usercenter_pc/prd/scripts/user-modifysensitive@beacb6a3b04a96bbc62d24571cfb26b8.js"></script>
	
	</div>
</body> 

</html>
