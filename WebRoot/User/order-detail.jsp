<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
  		<base href="<%=basePath%>">
		<meta http-equiv=x-ua-compatible content="ie=edge">
		<meta name=viewport content="width=device-width,initial-scale=1">
		<title>订单详情</title>
		<link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
		<link href="//s.happymmall.com/mmall_fe/dist/css/order-detail.css?9dd65f513c150dbd6188" rel="stylesheet">
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
			 <div class=w> <a class=logo href="#">ecshop</a> 
                <div class=search-form>
                    <input class=search-input id=search-input placeholder=请输入商品名称 />
                    <button class=search-btn id=search-btn style="height: 41px">搜索</button>
                </div>
            </div>
		</div>
		
		<div class="crumb">
			<div class="w">
				<div class="crumb-list">
					<a href="#p" class="crumb-item">ecshop</a>
					<span>></span>
					<span class="crumb-item">我的订单</span>
				</div>
			</div>
		</div>
		
		<div class="pass-update-wrap w">
			<div class="left-con">
				<ul class="menu">
					<li class="menu-item ">
						<a class="link" href="User/user-center.jsp">个人中心</a>
					</li>
					<li class="menu-item active">
						<a class="link" href="User/order-list.jsp">我的订单</a>
					</li>
					<li class="menu-item">
						<a class="link" href="User/pass-update.jsp">修改密码</a>
					</li>
					<li class="menu-item">
						<a class="link" href="User/about.jsp">关于ecshop</a>
					</li>
				</ul>
			</div>

		<div class="right-con">
			<div class="panel">
				<div class="panel-title">订单信息</div>
				<div class="panel-body">
					<div class="order-info">
						<div class="text-line">
							<span class="text">订单号：${sessionScope.order.orderNo}</span> <br>
							<span class="text">创建时间：${sessionScope.order.createTime}</span>
						</div>
						<div class="text-line">
							<span class="text">收件人：${sessionScope.order.endTime} </span><br>
							<span class="text">地址： ${sessionScope.address.province} ${sessionScope.address.city} ${sessionScope.address.district}${sessionScope.address.address} </span>
						</div>
						<div class="text-line">
							<span class="text">订单状态：未支付</span>
						</div>
						<div class="text-line">
							<a class="btn btn-mini"
								href="javascript:void(0);">去支付</a> <a
								class="btn btn-mini order-cancel">取消订单</a>
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-title">商品清单</div>
				<div class="panel-body">
					<table class="order-list-table header">
						<tbody>
							<tr>
								<th class="order-list-cell cell-img">&nbsp;</th>
								<th class="order-list-cell cell-info">商品信息</th>
								<th class="order-list-cell cell-price">单价</th>
								<th class="order-list-cell cell-count">数量</th>
								<th class="order-list-cell cell-total">合计</th>
							</tr>
						</tbody>
					</table>
					<table class="order-list-table order-item">
						<tbody>
							<c:forEach items="${sessionScope.orderDetaillist}" var="orderDetaillist">
							<tr>
								<td class="order-list-cell cell-img"><a
									href="./detail.html?productId=39" target="_blank"><img
										class="p-img"
										src="${orderDetaillist.productImage}"
										alt="${orderDetaillist.productName}"></a>
								</td>
								<td class="order-list-cell cell-info"><a
									class="link p-name" href="./detail.html?productId=39"
									target="_blank">${orderDetaillist.productName}</a></td>
								<td class="order-list-cell cell-price">￥${orderDetaillist.unitPrice}</td>
								<td class="order-list-cell cell-count">x${orderDetaillist.quantity}</td>
								<td class="order-list-cell cell-total">￥${orderDetaillist.totalPrice}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<p class="total pull-right">
						<span>订单总价：</span> <span class="enhance">￥${sessionScope.order.payment}</span>
					</p>
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
