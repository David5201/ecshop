<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登录</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#submit").click(function() {
			var username=$("#username").val();
			var password=$("#password").val();
			if(username===""||password===""){
				$("#tip").html("用户名或密码不能为空");
				$("#tip").css("color","red");
			}else{
			$.post(
				"../loginAction",
				{
					"user.username" : username,
					"user.password" : password
				},
				function(data) {
					if(data==="0"){
						$("#tip").html("用户名或密码不正确");
						$("#tip").css("color","red");
						$("#username").val("");
						$("#password").val("");
					}else{
						window.location.href="../mainpage/homepage.jsp";
					}
				
				}, "json"

			);
			}

		});
		
	});
</script>
</head>
<body>
	<header>
	<div class="header-content">
		<span>欢迎登录</span>
	</div>
	</header>
	<main> <section>
	<div class="login-content">
		<div class="login-content-top">
			<a href="javascript:void(0);">账户登录</a>
		</div>
		<div class="login-content-notice">
			<i></i> <span id="tip">公共场所不建议自动登录，以防账号丢失</span>
		</div>
		<form>
			<div class="form-item">
				<label for="userlog"></label> <input type="text" id="username"
					name="user.username" placeholder="用户名/邮箱/已验证手机">
			</div>
			<div class="form-item">
				<label for="userlog1"></label> <input type="password" id="password"
					name="user.password" placeholder="密码    ">
			</div>
			<div class="form-check">
				<input type="checkbox" id="checkbox"><label for="checkbox">自动登录</label>
				<a href="findpassword.jsp">忘记密码</a>
			</div>
			<input type="button" value="登 录" id="submit" />
		</form>
		<div class="login-content-bottom">
			<a href="javascript:void(0);"><i></i>QQ</a><span></span> <a
				href="javascript:void(0);"><i></i>微信</a><span></span> <a
				href="javascript:void(0);">京东钱包</a> <a href="register.jsp"><i></i>立即注册</a>
		</div>
	</div>
	</section> </main>
	<footer>
	<p>
		<a href="javascript:void(0);">关于我们</a><span></span> <a
			href="javascript:void(0);">联系我们</a><span></span> <a
			href="javascript:void(0);">人才招聘</a><span></span> <a
			href="javascript:void(0);">商家入驻</a><span></span> <a
			href="javascript:void(0);">广告服务</a><span></span> <a
			href="javascript:void(0);">友情链接</a><span></span> <a
			href="javascript:void(0);">销售联盟</a><span></span> <a
			href="javascript:void(0);">English Site</a>
	</p>
	<p>版权所有</p>
	</footer>
</body>
</html>
