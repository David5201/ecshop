<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  		<base href="<%=basePath%>">
		<meta http-equiv=x-ua-compatible content="ie=edge">
		<meta name=viewport content="width=device-width,initial-scale=1">
		<title>商品列表</title>
		<link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
		<link href="//s.happymmall.com/mmall_fe/dist/css/list.css?9dd65f513c150dbd6188" rel="stylesheet">
	</head>
  
  <body>
		<div class=site-nav>
            <div class=w>
                <div class=user-info> 
                <c:if test="${empty sessionScope.user}">
	                <span class="not-login"> 
	                      <a href="User/login.jsp" id="login" class="link" style="text-decoration: none;">登录</a>   
	                      <a href="User/register.jsp" id="register" class="link" style="text-decoration: none;">注册</a> 
	                </span> 
                </c:if> 
                <c:if test="${!empty sessionScope.user}">
	                <span class="login"> 
	                        <a href="/" id="welcome" class="link" style="text-decoration: none;">欢迎，<span class=username>${user.username}</span></a>    
	                        <a href="loginoutAction" id="loginout" class="link" style="text-decoration: none;">退出</a> 
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
			 <div class=w> 
			 <a class=logo href="mainpage/homepage.jsp">ecshop</a> 
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
					<span class="crumb-item">商品列表</span>
				</div>
			</div>
		</div>
		
		 <div class="list-wrap w">
            <ul class="sorter-con">
                <li class="sorter-item active" data-type="default">
                    <span>推荐排序</span>
                </li>
                <li class="sorter-item" data-type="price">
                    <span>价格</span>
                    <i class="fa fa-sort-asc"></i>
                    <i class="fa fa-sort-desc"></i>
                </li>
            </ul>
		<!-- list容器 -->
		<ul class="p-list-con">
		<c:forEach items="${sessionScope.plist}" var="plist">
			<li class="p-item">
				<div class="p-img-con">
					<a class="link" href="getProductDetail?productId=${plist.id}" target="_blank">
						<img class="p-img"
						src="${plist.mainImage}"
						alt="${plist.subtitle}">
					</a>
				</div>
				<div class="p-price-con">
					<span class="p-price">¥${plist.price}</span>
				</div>
				<div class="p-name-con">
					<a href="getProductDetail?productId=${plist.id}" target="_blank" class="p-name"
						title="${plist.subtitle}">${plist.subtitle}</a>
				</div>
			</li>
		</c:forEach>	
			
			
			<!-- <li class="p-item">
                    <div class="p-img-con"> 
                        <a class="link" href="./detail.html?productId=28" target="_blank">
                            <img class="p-img" src="http://img.happymmall.com/0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg" alt="【测试学习使用】4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春">
                        </a>
                    </div>
                    <div class="p-price-con">
                        <span class="p-price">¥1999</span> 
                    </div> <div class="p-name-con">
                    <a href="./detail.html?productId=28" target="_blank" class="p-name" title="【测试学习使用】4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春">【测试学习使用】4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春 
                    </a> 
                    </div> 
                </li>  -->
		</ul>
		<!-- 分页容器 -->
            <div class="pagination"></div>
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
		<script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/base.js?9dd65f513c150dbd6188"></script>
		<script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/common.js?9dd65f513c150dbd6188"></script>
		<script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/list.js?9dd65f513c150dbd6188"></script>
	</body>
</html>

