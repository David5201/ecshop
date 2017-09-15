<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
		<meta http-equiv=x-ua-compatible content="ie=edge">
		<meta name=viewport content="width=device-width,initial-scale=1">
		<title>用户中心</title>
		<link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
		<link href="//s.happymmall.com/mmall_fe/dist/css/user-center.css?9dd65f513c150dbd6188" rel="stylesheet">
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
                    <input class=search-input id=search-input placeholder=请输入商品名称 />
                    <button class=search-btn id=search-btn style="height: 41px">搜索</button>
                </div>
            </div>
		</div>
		
		<div class="crumb">
			<div class="w">
				<div class="crumb-list">
					<a href="../mainpage/homepage.jsp" class="crumb-item">ecshop</a>
					<span>></span>
					<span class="crumb-item">个人中心</span>
				</div>
			</div>
		</div>
		
		<div class="pass-update-wrap w">
			<div class="left-con">
				<ul class="menu">
					<li class="menu-item active">
						<a class="link" href="user-center.jsp">个人中心</a>
					</li>
					<li class="menu-item">
						<a class="link" href="order-list.jsp">我的订单</a>
					</li>
					<li class="menu-item">
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
						我的信息
					</div>
					<div class="panel-body">
						<!--<div class="loading">
							
						</div>-->
						<div class="user-info"> 
                    		<div class="text-line"> 
                    			<span class="text-label">用户名：</span> 
                    			<span class="text">${user.username}</span> 
                    		</div> 
                    		<div class="text-line"> 
                    			<span class="text-label">电 &nbsp;&nbsp;话：</span> 
                    			<span class="text">${user.phone}</span> 
                    		</div> <div class="text-line">
                    			<span class="text-label">邮 &nbsp;&nbsp;箱：</span> 
                    			<span class="text">${user.email}</span>
                    		</div> 
                    		<div class="text-line">
                    			<span class="text-label">问 &nbsp;&nbsp;题：</span> 
                    			<span class="text">${user.question}</span> 
                    		</div> <div class="text-line"> 
                    			<span class="text-label">答 &nbsp;&nbsp;案：</span> 
                    			<span class="text">${user.answer}</span> 
                    		</div> 
                    		<div class="text-line"> 
                    				<br>
                    			<a href="user-info-update.jsp" class="btn btn-mini btn-submit">编辑</a>
                    		</div> 
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
