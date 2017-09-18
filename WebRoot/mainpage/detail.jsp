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
		<title>商品详情</title>
		<link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
		<link href="//s.happymmall.com/mmall_fe/dist/css/detail.css?9dd65f513c150dbd6188" rel="stylesheet">
		<script type="text/javascript" src="User/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".plus").click(function(){
					var count = $(".p-count").val();
					count++;
					$(".p-count").val(count);
				});
				
				$(".minus").click(function(){
					var count = $(".p-count").val();
					if(count==1){
						$(".p-count").val("1");
					}else{
						count--;
						$(".p-count").val(count);
					}
				});
				
				$(".p-img").mouseover(function(){
					$(".main-img").attr('src',this.src); 
				});
			
				$(".cart-add").click(function(){
					var id = $("#productId").val(); 
					var count = $(".p-count").val();
					window.location.href="addCart?productId="+id+"&count="+count;
				
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
					<span class="crumb-item">商品详情</span>
				</div>
			</div>
		</div>
		
		<div class="page-container w">
			<div class="intro-wrap clear">
				<div class="p-img-wrap">
					<input type="hidden" value="${sessionScope.product.id}" id="productId"/>
					<div class="main-img-con"> <img class="main-img" src="${sessionScope.product.mainImage}"> </div>
					<ul class="p-img-list">
						<li class="p-img-item"> <img class="p-img" src="${sessionScope.product.mainImage}"> </li>
						<li class="p-img-item"> <img class="p-img" src="http://img.happymmall.com/ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg"> </li>
						<li class="p-img-item"> <img class="p-img" src="http://img.happymmall.com/4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg"> </li>
						<li class="p-img-item"> <img class="p-img" src="http://img.happymmall.com/36bdb49c-72ae-4185-9297-78829b54b566.jpeg"> </li>
					</ul>
				</div>
				<div class="p-info-wrap">
					<p class="p-name">${sessionScope.product.subtitle}</p>
					<p class="p-subtitle">送品牌烤箱，五一大促</p>
					<div class="info-item p-price-con"> <span class="label">价格:</span> <span class="p-price">￥${sessionScope.product.price}</span> </div>
					<div class="info-item p-quantity-con"> <span class="label">库存:</span> <span class="p-price">${sessionScope.product.stock}</span> </div>
					<div class="info-item"> 
					<span class="label">数量:</span> 
						<input class="p-count" value="1" readonly="readonly"> 
						<span class="p-count-btn plus" data-opera-type="plus">+</span> 
						<span class="p-count-btn minus" data-opera-type="minus">-</span> 
					</div>
					<div class="info-item">
						<a class="btn cart-add">加入购物车</a>
					</div>
				</div>
			</div>
			<div class="detail-wrap">
				<div class="detail-tab-con">
					<ul class="tab-list">
						<li class="tab-item active">商品详情</li>
					</ul>
				</div>
				<div class="detail-con">
					<p><img alt="miaoshu.jpg" src="http://img.happymmall.com/9c5c74e6-6615-4aa0-b1fc-c17a1eff6027.jpg" width="790" height="444"><br></p>
					<p><img alt="miaoshu2.jpg" src="http://img.happymmall.com/31dc1a94-f354-48b8-a170-1a1a6de8751b.jpg" width="790" height="1441">
					<img alt="miaoshu3.jpg" src="http://img.happymmall.com/7862594b-3063-4b52-b7d4-cea980c604e0.jpg" width="790" height="1442">
					<img alt="miaoshu4.jpg" src="http://img.happymmall.com/9a650563-dc85-44d6-b174-d6960cfb1d6a.jpg" width="790" height="1441"><br></p>
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

