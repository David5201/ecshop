<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv=x-ua-compatible content="ie=edge">
	<meta name=viewport content="width=device-width,initial-scale=1">
	<title>确认订单</title>
	<link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
	<link href="//s.happymmall.com/mmall_fe/dist/css/confirm.css?9dd65f513c150dbd6188" rel="stylesheet">
	<script type="text/javascript" src="User/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".shi").click(function(){
				$(".shi").removeClass("active");
				$(this).addClass("active");
				$(".order-submit").attr("addreID",$(this).attr("addreID"));
				
			});
			
			$(".closes").click(function(){
				$(".modal-wrap").css("display","none");
			});
			
			$(".add").click(function(){
				$(".modal-wrap").css("display","block");
			});
			
			
			/* $(".address-save").click(function(){
				$("#province").val("湖北");
			}); */
			
			$(".address-update").click(function(){
				//alert($(this).attr("receiver-id"));
				$("#receiver-id").val($(this).attr("receiver-id"));
				$("#receiver-name").val($(this).attr("receive-name"));
				$("#receiver-address").val($(this).attr("receive-address"));
				$("#receiver-phone").val($(this).attr("receive-phone"));
				$("#receiver-zip").val($(this).attr("receive-zip")); 
				$(".modal-wrap").css("display","block");
			});
			
			$(".address-delete").click(function(){
				//alert($(this).attr("receiver-id"));
				var addressID = $(this).attr("receiver-id");
				window.location.href="deleteAddress?addressID="+addressID;
			});
			
			
			$(".order-submit").click(function(){
				var addressID = $(this).attr("addreID");
				var count="";
				var payment = ${sessionScope.allTotal};
				var str = "";
				 $("input[name='productID']").each(function(){
				 	if($(this).is(":checked")){
				 		//得到选中的checkbox
				 		var id = $(this).val();
				 		var c = $(this).attr("count");
				 		str +=id+",";
				 		count +=c+",";
				 	}
				 });
				 //alert(count);
				 if(addressID==0){
				 	alert("请选择收货地址");
				 }else{
				 	window.location.href="order-list?addressID="+addressID+"&payment="+payment+"&productsID="+str+"&count="+count;
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
					<span class="not-login"> <a href="User/login.jsp" id="login"
						class="link" style="text-decoration: none;">登录</a> <a
						href="User/register.jsp" id="register" class="link"
						style="text-decoration: none;">注册</a>
					</span>
				</c:if>
				<c:if test="${!empty sessionScope.user}">
					<span class="login"> <a href="/" id="welcome" class="link"
						style="text-decoration: none;">欢迎，<span class=username>${user.username}</span></a>
						<a href="loginoutAction" id="loginout" class="link"
						style="text-decoration: none;">退出</a>
					</span>
				</c:if>
			</div>
			<ul class=nav-list>
				<li class=nav-item><a class=link href="/"> <i
						class="fa fa-shopping-cart"></i> 购物车(<span class=cart-count>0</span>)
				</a></li>
				<li class=nav-item><a class=link href="/">我的订单</a></li>
				<li class=nav-item><a class=link href="/">我的ecshop</a></li>
				<li class=nav-item><a class=link href="/">关于ecshop</a></li>
			</ul>
		</div>
	</div>
	<div class=header>
		<div class=w>
			<a class=logo href="#">ecshop</a>
			<div class=search-form>
				<input class=search-input id=search-input placeholder=请输入商品名称
					style="width:574px;" />
				<button class=search-btn id=search-btn style="height: 41px">搜索</button>
			</div>
		</div>
	</div>

	<div class="crumb">
		<div class="w">
			<div class="crumb-list">
				<a href="#" class="crumb-item">ecshop</a> <span>></span>
				<span class="crumb-item">订单确认</span>
			</div>
		</div>
	</div>
	<div class="confirm-wrap w">
			<div class="panel">
				<h2 class="panel-title">收货地址</h2>
				<div class="panel-body address-list">
				
					<c:forEach items="${sessionScope.addresslist}" var="address">
						<a class="address-item shi" style="float:left;" addreID="${address.id}">
							<div class="address-title">
								<span class="province">${address.province}</span> 
								<span class="city">${address.city}</span> 
								<span class="district">${address.district}</span>
								<span class="name">（ ${address.name} 收 ）</span>
							</div>
							<div class="address-detail" style="height:15px;">${address.address} <span class="name"> 电话： ${address.phone}</span></div>
							<div class="address-detail" style="height:15px;">邮编：${address.zip}</div>
							<div class="address-opera"> 
								<span class="link address-update" 
								receiver-id="${address.id}" receive-name="${address.name}" receive-province="${address.province}" receive-city="${address.city}" receive-district="${address.district}" receive-address="${address.address}" receive-phone="${address.phone}" receive-zip="${address.zip}" >编辑</span> 
								<span class="link address-delete" receiver-id="${address.id}">删除</span> 
							</div>
						</a>
					</c:forEach>
					
					
					<div class="address-item add">
						<div class="address-new"> <i class="fa fa-plus"></i>
							<div class="text">使用新地址</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<h2 class="panel-title">商品清单</h2>
				<div class="panel-body order-product">
					<table class="product-table" data-product-id="" data-checked="">
						<tbody>
							<tr>
								<th width="10%">&nbsp;</th>
								<th width="30%" align="left" style="font-size: 10px;">商品描述</th>
								<th width="20%" align="center" style="font-size: 10px;">价格</th>
								<th width="20%" align="center" style="font-size: 10px;">数量</th>
								<th width="20%" align="center" style="font-size: 10px;">小计</th>
							</tr>
							<c:forEach items="${sessionScope.cartVOList}" var="cartVOList">
							<tr>
								<td class="product-cell cell-img">
									<input name="productID" type="checkbox" value="${cartVOList.productId}" count="${cartVOList.count}" style="display:none;" checked="checked"/>
									<a href="/" target="_blank">
									<img class="p-img" src="${cartVOList.imgpath}" alt="${cartVOList.info}"></a>
								</td>
								<td align="left">
									<a class="link p-name" href="/" target="_blank" style="font-size: 10px;">${cartVOList.info}</a>
								</td>
								<td align="center" style="font-size: 10px;">￥${cartVOList.price}</td>
								<td align="center" style="font-size: 10px;">x${cartVOList.count}</td>
								<td align="center" style="font-size: 10px;">￥${cartVOList.total}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="submit-con"> <span>订单总价：</span> <span class="submit-total">￥${sessionScope.allTotal}</span> <span class="btn order-submit" addreID="0">提交订单</span> </div>
				</div>
			</div>
		</div>
		<div class="modal-wrap" style="display: none;">
			<div class="modal mask close">
				<div class="modal-container">
					<div class="modal-header" style="position: relative;">
						<h1>使用新地址</h1> 
						<a href="javascript:void(0);" class="closes" style="text-decoration: none;color:black;right:10px;position: absolute;top:13px;">关闭</a> 
					</div>
					<div class="modal-body">
						<form action="addAddress" method="post">
						<div class="form">
							<div class="form-line"> 
								<input type="hidden" value="" name="address.id" id="receiver-id"/>
								<label class="label"><span class="form-require">*</span>收件人姓名:</label> 
								<input class="form-item name" name="address.name" id="receiver-name" type="text" placeholder="请输入收件人姓名" value=""> 
							</div>
							<div class="form-line"> 
							<label class="label">
								<span class="form-require">*</span>所在城市:
							</label>
								<select class="form-item " name="address.province" id="province">
									<option value="请选择">请选择</option>
								</select>
								<select class="form-item " name="address.city" id="city">
									<option value="请选择">请选择</option>
								</select>
								<select class="form-item " name="address.district" id="town">
									<option value="请选择">请选择</option>
								</select>
							</div>
							<div class="form-line"> <label class="label"><span class="form-require">*</span>详细地址:</label> <input class="form-item" id="receiver-address" name="address.address" type="text" placeholder="请精确到门牌号" value=""> </div>
							<div class="form-line"> <label class="label"><span class="form-require">*</span>收件人手机号:</label> <input class="form-item" name="address.phone" id="receiver-phone" type="text" placeholder="请输入11位手机号" value=""> </div>
							<div class="form-line"> <label class="label">邮政编码:</label> <input class="form-item" name="address.zip" id="receiver-zip" type="text" placeholder="如：100000" value=""> </div>
							<div class="form-line"> 
								<br>
								<input type="submit" class="btn form-btn address-save" value="保存收货地址" />
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	<div class=footer>
		<div class=w>
			<div class=links>
				<a class=link href=//www.vip.com />唯品会</a>| 
				<a class=link href=//www.taobao.com />淘宝</a>| 
				<a class=link href=//www.jd.com />京东</a>| 
				<a class=link href=//www.yhd.com />一号店</a>
			</div>
			<p class=copyright>Copyright © 2017 Designed By lbcto.com All Rights Reserved</p>
		</div>
	</div>
	<script src="//www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script src="js/area.js"></script>
	<script src="js/select.js"></script>
</body>
</html>

