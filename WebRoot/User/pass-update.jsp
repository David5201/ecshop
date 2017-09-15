<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        <meta http-equiv=x-ua-compatible content="ie=edge"> 
        <meta name=viewport content="width=device-width,initial-scale=1">
        <title>修改密码</title>
	    <link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
	    <link href="//s.happymmall.com/mmall_fe/dist/css/pass-update.css?9dd65f513c150dbd6188" rel="stylesheet">
  		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  		<script type="text/javascript">
  		$(function(){
  			$("#password").blur(function() {
			var username = $("#username").val();
			var password = $("#password").val();
			if (password === "") {
				$("#password_span").html("原始密码输入框不能为空");
				status = 0;
			} else {
					$.post(
						"../passwordAction",
						{
							"user.username" : username,
							"user.password" : password
						},
						function(data) {
							//alert(data);
							if (data === "1") {
								$("#password_span").html("ok");
								status = 1;
							} else {
								$("#password_span").html("你所输入的与原始密码不匹配");
								status = 0;
							}
						},
						"json");
			}

		});
  		
  		});
  			
  		
  		</script>
  </head>
  
  <body>
		<div class=site-nav>
            <div class=w>
                <div class=user-info> 
                <c:if test="${empty sessionScope.user}">
	                <span class="not-login"> 
	                      <a href="../User/login.jsp" id="login" class="link" style="text-decoration: none;">登录</a>   
	                      <a href="../User/register.jsp" id="register" class="link" style="text-decoration: none;">注册</a> 
	                </span> 
                </c:if> 
                <c:if test="${!empty sessionScope.user}">
	                <span class="login"> 
	                        <a href="/" id="welcome" class="link" style="text-decoration: none;">欢迎，<span class=username>${user.username}</span></a>    
	                        <a href="../loginoutAction" id="loginout" class="link" style="text-decoration: none;">退出</a> 
	                </span>
                </c:if>
                </div>
                <ul class=nav-list>
                    <li class=nav-item>
                        <a class=link href="/">   <i class="fa fa-shopping-cart"></i> 购物车(<span class=cart-count>0</span>)</a>
                    </li>
                    <li class=nav-item> <a class=link href="/">我的订单</a> 
                    </li>
                    <li class=nav-item> <a class=link href="/">我的ecshop</a> 
                    </li>
                    <li class=nav-item> <a class=link href="/">关于ecshop</a> 
                    </li>
                </ul>
            </div>
        </div>
		<div class=header>
			 <div class=w> <a class=logo href="../mainpage/homepage.jsp">ecshop</a> 
                <div class=search-form>
                    <input class=search-input id=search-input placeholder=请输入商品名称 style="width:574px;"/>
                    <button class=search-btn id=search-btn style="height: 41px">搜索</button>
                </div>
            </div>
		</div>
		
		<div class="crumb">
			<div class="w">
				<div class="crumb-list">
					<a href="../mainpage/homepage.jsp" class="crumb-item">ecshop</a>
					<span>></span>
					<span class="crumb-item">修改密码</span>
				</div>
			</div>
		</div>
		
		<div class="pass-update-wrap w">
			<div class="left-con">
				<ul class="menu">
					<li class="menu-item ">
						<a class="link" href="user-center.jsp">个人中心</a>
					</li>
					<li class="menu-item ">
						<a class="link" href="order-list.jsp">我的订单</a>
					</li>
					<li class="menu-item active">
						<a class="link" href="pass-update.jsp">修改密码</a>
					</li>
					<li class="menu-item">
						<a class="link" href="about.jsp">关于ecshop</a>
					</li>
				</ul>
			</div>

			<div class="right-con">
				<div class="panel">
					<div class="panel-title">
						修改密码
					</div>
					<div class="panel-body">
						<div class="pass-info">
							
                            <div class="text-line">
                                <span class="text">原始密码：</span>
                                <input type="password" class="password" id="password" autocomplete="off"/>
                                <span id="password_span" style="color:red;"></span>
                            </div>
                            <form action="../updatePasswordAction" method="post">
                            <input type="hidden" value="${user.username}" name="user.username" id="username"/>
                            <div class="text-line">
                                <span class="text">新的密码：</span>
                                <input type="password" class="password" name="user.password" id="password-new" autocomplete="off"/>
                                <span id="password-new_span" style="color:red;"></span>
                            </div>
                            <div class="text-line">
                                <span class="text">确认密码：</span>
                                <input type="password" class="password" id="password-confirm" autocomplete="off"/>
                                <span id="password-confirm_span" style="color:red;"></span>
                            </div>
                            <div class="text-line">
                            	<br>
                                <input type="submit" class="btn btn-mini btn-submit" value="提交修改">
                            </div>
                            </form>
                        </div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class=footer>
			<div class=w>
				<div class=links>
                	<a class=link href=//www.vip.com/>唯品会</a>|
                	<a class=link href=//www.taobao.com/>淘宝</a>|
                	<a class=link href=//www.jd.com/>京东</a>|
                	<a class=link href=//www.yhd.com/>一号店</a> 
                </div>
				<p class=copyright> Copyright © 2017 Designed By lbcto.com All Rights Reserved </p>
			</div>
		</div>
	</body>
</html>
