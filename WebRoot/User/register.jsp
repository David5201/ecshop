<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>注册</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/register.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var status=0;
		
		$("#username").blur(function() {
			var username = $("#username").val();
			if (username === "") {
				status=0;
				$("#username_span").html("用户名不能为空");
			} else {
				$.post(
					"../usernameCheckAction",
					{
						"username" : username
					},
					function(data) {
						if (data === "0") {
							status=0;
							$("#username_span").html("用户名已存在");
						} else {
							$("#username_span").html("");
							status=1;
						}
					},
					"json");
			}
		});

		$("#password").blur(function() {
			var password = $("#password").val();
			var Repassword = $("#Repassword").val();

			if (password === "") {
				status=0;
				$("#password_span").html("密码不能为空");
			} else {
				if (Repassword != "") {
					if (password != Repassword) {
						status=0;
						$("#password_span").html("两次密码不一致");
					} else {
						$("#password_span").html("");
						$("#Repassword_span").html("");
						status=1;
					}
				} else {
					$("#password_span").html("");
					status=1;
				}
			}
		});

		$("#Repassword").blur(function() {
			var password = $("#password").val();
			var Repassword = $("#Repassword").val();


			if (Repassword === "") {
				status=0;
				$("#Repassword_span").html("密码不能为空");
			} else if (password != Repassword) {
				status=0;
				$("#Repassword_span").html("两次密码不一致");
			} else {
				$("#password_span").html("");
				$("#Repassword_span").html("");
				status=1;
			}
		});

		$("#email").blur(function() {
			var email = $("#email").val();
			var ret = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
			if (ret.test(email)) {
				$("#email_span").html("");
				status=1;
			} else {
				status=0;
				$("#email_span").html("邮箱格式不正确");
			}
		});

		$("#phone").blur(function() {
			var phone = $("#phone").val();
			var ret = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
			if (ret.test(phone)) {
				$("#phone_span").html("");
				status=1;
			} else {
				status=0;
				$("#phone_span").html("手机号码格式不正确");
			}
		});

		$("#question").blur(function() {
			var question = $("#question").val();
			if (question === "") {
				status=0;
				$("#question_span").html("密保问题不能为空");
			} else {
				$("#question_span").html("");
				status=1;
			}

		});

		$("#answer").blur(function() {
			var answer = $("#answer").val();
			if (answer === "") {
				status=0;
				$("#answer_span").html("答案不能为空");
			} else {
				$("#answer_span").html("");
				status=1;
			}

		});
		
		$("form").submit(function(){
			var username1 = $("#username").val();
			var password1 = $("#password").val();
			var Repassword1 = $("#Repassword").val();
			var email1 = $("#email").val();
			var phone1 = $("#phone").val();
			var question1 = $("#question").val();
			var answer1 = $("#answer").val();
			if(username1===""||password1===""||Repassword1===""||email1===""||phone1===""||question1===""||answer1===""){
				status=0;
			}
		
			if(status==0){
				$("#submit_span").html("存在不合法的输入，请重新输入");
				return false;
			}else{
				return true;
			}
		
		});





	});
</script>
</head>
<body>
	<header>
	<div class="header-content">
		<span>欢迎注册</span>
		<div class="login">
			已有账号？<a href="login.jsp"> 请登录</a>
		</div>
	</div>
	</header>
	<main> <section>
	<div class="main-content-L">
		<form action="../userAction" method="post">
			<div class="form-list">
				<label for="username">用 户 名</label> <input type="text" id="username"
					name="user.username" placeholder="您的账户用户名">
			</div>
			<div class="form-validate">
				<span style="color: red;" id="username_span"></span>
			</div>

			<div class="form-list">
				<label for="password">设置密码</label> <input type="password"
					id="password" name="user.password" placeholder="建议至少使用两种字符组合">
			</div>
			<div class="form-validate">
				<span style="color: red;" id="password_span"></span>
			</div>

			<div class="form-list">
				<label for="Repassword">确认密码</label> <input type="password"
					id="Repassword" placeholder="请再次输入密码">
			</div>
			<div class="form-validate">
				<span style="color: red;" id="Repassword_span"></span>
			</div>

			<div class="form-list">
				<label>邮箱地址</label> <input type="text" id="email" name="user.email"
					placeholder="请输入邮箱地址">
			</div>
			<div class="form-validate">
				<span style="color: red;" id="email_span"></span>
			</div>


			<div class="form-list">
				<label for="identifycode">手机号码</label> <input type="text" id="phone"
					name="user.phone" placeholder="请输入手机号证码">
			</div>
			<div class="form-validate">
				<span style="color: red;" id="phone_span"></span>
			</div>

			<div class="form-list">
				<label>密保问题</label> <input type="text" id="question"
					name="user.question" placeholder="请输入密保问题">
			</div>
			<div class="form-validate">
				<span style="color: red;" id="question_span"></span>
			</div>

			<div class="form-list">
				<label>密保答案</label> <input type="text" id="answer"
					name="user.answer" placeholder="请输入密保答案">
			</div>
			<div class="form-validate">
				<span style="color: red;" id="answer_span"></span>
			</div>


			<div class="form-check">
				<label><input type="checkbox" id="agree"> 我已阅读并同意 </label><a
					href="javascript:void(0);">《用户注册协议》</a>
			</div>
			<div class="form-validate">
				<span style="color: red;" id="submit_span"></span>
			</div>
			<input type="submit" class="form-submit" value="立即注册" id="submit" />
			<style>
#submit:hover {
	background: red;
}
</style>

		</form>
	</div>
	<div class="">
		<!-- <div class="companyReg">
                    <a href="#">
                    </a>
                </div>
                <div class="globalReg">
                    <a href="#">
                    </a>
                </div>-->

	</div>
	<div class="clearfix"></div>
	</section> </main>
	<footer>
	<p>
		<a href="">关于我们</a><span></span> <a href="">联系我们</a><span></span> <a
			href="">人才招聘</a><span></span> <a href="">商家入驻</a><span></span> <a
			href="">广告服务</a><span></span> <a href="">友情链接</a><span></span> <a
			href="">销售联盟</a><span></span> <a href="">English Site</a><span></span>
	</p>
	<p>版权所有</p>
	</footer>
</body>
</html>