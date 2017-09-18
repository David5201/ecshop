<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="x-ua-compatible" content="ie=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link rel="dns-prefetch" href="//s.happymmall.com">
		<link rel="dns-prefetch" href="//cdn.bootcss.com/">
		<title>操作结果</title>
		<link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
		<link href="//s.happymmall.com/mmall_fe/dist/css/result.css?9dd65f513c150dbd6188" rel="stylesheet">
	</head>

	<body>
		<div class="header-simple">
			<div class="w">
				<a href="mainpage/homepage.jsp" class="logo">ecshop</a>
			</div>
		</div>
		<div class="result-wrap w">
			<div class="result-con cart-add-success" style="display: block;">
				<h1 class="result-title">您的商品已成功加入购物车</h1>
				<p class="result-content">
					<a class="link" href="#">继续购物</a>
					<a class="link" href="#">去购物车查看</a>
				</p>
			</div>
			<!--<div class="result-con payment-success">
				<h1 class="result-title">您的订单支付成功！</h1>
				<p class="result-content">
					<a class="link" href="#">继续购物</a>
					<a class="link my-order" href="#">查看我的订单</a>
				</p>
			</div>-->
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
		<!--<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.js"></script>
		<script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/base.js?9dd65f513c150dbd6188"></script>
		<script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/common.js?9dd65f513c150dbd6188"></script>
		<script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/result.js?9dd65f513c150dbd6188"></script>-->

	</body>

</html>
