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
		<title>购物车</title>
		<link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
		<link href="//s.happymmall.com/mmall_fe/dist/css/cart.css?9dd65f513c150dbd6188" rel="stylesheet">
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
					<span class="crumb-item">我的购物车</span>
				</div>
			</div>
		</div>
	<div class="cart-wrap w">
		<c:if test="${empty sessionScope.cartVOList}">
			 <p class="err-tip"> 
			 	<span>您的购物车空空如也，</span> 
			 	<a href="mainpage/homepage.jsp">立即去购物</a> 
			 </p>
		</c:if>
		<c:if test="${not empty sessionScope.cartVOList}">
		<div class="cart-header">
			<table class="cart-table">
				<tbody>
					<tr>
						<th class="cart-cell cell-check">
							<label> 
								<input type="checkbox" class="cart-select-all" checked="checked">
								<span style="font-size: 10px;">全选</span>
							</label>
						</th>
						<th class="cart-cell cell-info" style="font-size: 10px;">商品信息</th>
						<th class="cart-cell cell-price" style="font-size: 10px;">单价</th>
						<th class="cart-cell cell-count" style="font-size: 10px;">数量</th>
						<th class="cart-cell cell-total" style="font-size: 10px;">合计</th>
						<th class="cart-cell cell-opera" style="font-size: 10px;">操作</th>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="cart-list">
			<table class="cart-table" data-product-id="27" data-checked="1">
				<tbody>
					<c:forEach items="${sessionScope.cartVOList}" var="cartVOList">
					<tr>
						<td class="cart-cell cell-check">
							<input type="checkbox" class="cart-select" checked="checked">
						</td>
						<td class="cart-cell cell-img">
							<a href="./detail.html?productId=27" target="_blank">
							<img class="p-img" src="${cartVOList.imgpath}"
									alt="${cartVOList.info}">
							</a>
						</td>
						<td class="cart-cell cell-info">
						<a class="link p-name" href="./detail.html?productId=27" target="_blank" style="font-size: 10px;">${cartVOList.info}</a>
						</td>
						<td class="cart-cell cell-price" style="font-size: 10px;">￥${cartVOList.price}</td>
						<td class="cart-cell cell-count">
						<span class="count-btn" data-opera-type="minus">-</span> 
						<input class="count-input" data-max="9952" value="${cartVOList.count}"> 
						<span class="count-btn" data-opera-type="plus">+</span>
						</td>
						<td class="cart-cell cell-total" style="font-size: 10px;">￥${cartVOList.total}</td>
						<td class="cart-cell cell-opera"><a class="link cart-delete" style="font-size: 10px;">删除</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="cart-footer clear">
			<div class="select-con">
				<label> <input type="checkbox" class="cart-select-all"
					checked="checked"> <span>全选</span>
				</label>
			</div>
			<div class="delete-con">
				<a class="cart-delete-seleced link"> <i class="fa fa-trash-o"
					aria-hidden="true"></i> <span>删除选中</span>
				</a>
			</div>
			<div class="submit-con">
				<span>总价：</span> <span class="submit-total">￥9897</span> <span
					class="btn submit-btn">去结算</span>
			</div>
		</div>
		</c:if>
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

