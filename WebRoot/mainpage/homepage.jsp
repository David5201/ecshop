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
        <title>首页</title>
        <link href="//s.happymmall.com/mmall_fe/dist/css/common.css?9dd65f513c150dbd6188" rel="stylesheet">
        <link href="//s.happymmall.com/mmall_fe/dist/css/index.css?9dd65f513c150dbd6188" rel="stylesheet">
    	<script type="text/javascript" src="User/js/jquery-3.2.1.min.js"></script>
    </head>
     
    <body>
        <div class=site-nav>
            <div class=w>
                <div class=user-info> 
                <c:if test="${empty sessionScope.cMap}">
                	<c:redirect url="test"></c:redirect>
                </c:if>
                <c:if test="${empty sessionScope.user}">
	                <span class="not-login"> 
	                      <a href="User/login.jsp" id="login" class="link" style="text-decoration: none;">登录</a>   
	                      <a href="User/register.jsp" id="register" class="link" style="text-decoration: none;">注册</a> 
	                </span> 
                </c:if> 
                <c:if test="${!empty sessionScope.user}">
	                <span class="login"> 
	                        <a href="User/user-center.jsp" id="welcome" class="link" style="text-decoration: none;">欢迎，<span class=username>${user.username}</span></a>    
	                        <a href="loginoutAction" id="loginout" class="link" style="text-decoration: none;">退出</a> 
	                </span>
                </c:if>
                </div>
                <ul class=nav-list>
                    <li class=nav-item>
                        <a class="link" href="getCartVO"><i class="fa fa-shopping-cart"></i> 购物车(<span class=cart-count>0</span>)</a>
                    </li>
                    <li class=nav-item> <a class="link" href="User/order-list.jsp" >我的订单</a> 
                    </li>
                    <li class=nav-item> <a class="link" href="User/user-center.jsp">我的ecshop</a> 
                    </li>
                    <li class=nav-item> <a class="link" href="User/about.jsp" >关于ecshop</a> 
                    </li>
                </ul>
            </div>
        </div>
        <div class=header>
            <div class=w> <a class=logo href="mainpage/homepage.jsp">ecshop</a> 
                <div class=search-form>
                    <input class=search-input id=search-input placeholder=请输入商品名称 />
                    <button class=search-btn id=search-btn style="height: 41px">搜索</button>
                </div>
            </div>
        </div>
        <div class="w">
            <div class="cate-wrap">
                <ul class="cate-list">
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=手机">手机</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=数码">数码</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=电脑">电脑</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=办公配件">办公配件</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=电视">电视</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=空调">空调</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=冰箱">冰箱</a>
 <a class="cate-link" target="_blank"
                        href="./list.html?keyword=洗衣机">洗衣机</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=厨卫家电">厨卫家电</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=小家电">小家电</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=家居">家居</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=家具">家具</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=家装">家装</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=个护化妆">个护化妆</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=清洁">清洁</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=纸品">纸品</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=母婴">母婴</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=玩具">玩具</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=童装童鞋">童装童鞋</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=鞋靴">鞋靴</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=箱包">箱包</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=钟表">钟表</a>
 <a class="cate-link" target="_blank"
                        href="./list.html?keyword=珠宝">珠宝</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=运动户外">运动户外</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=足球">足球</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=汽车生活">汽车生活</a>
 
                    </li>
                    <li class="cate-item"> <a class="cate-link" target="_blank" href="./list.html?keyword=图书">图书</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=音像">音像</a>
 <a class="cate-link" target="_blank" href="./list.html?keyword=电子书">电子书</a>
 
                    </li>
                </ul>
            </div>
            <div class="banner-wrap">
                <div class="banner">
                    <ul>
                    	<li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img12.360buyimg.com/da/jfs/t7486/85/2097038085/41277/8dbf5f28/59a7a469N55f52c1a.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img1.360buyimg.com/da/jfs/t9034/313/1372780724/201717/2a65fd4d/59b8dc04N762072f0.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img1.360buyimg.com/da/jfs/t9325/158/982543439/92414/6c2d2f28/59ba4a8aNb799bb9e.jpg" />
                            </a>
                        </li>
                    	 <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img1.360buyimg.com/da/jfs/t9037/144/1178880257/202036/c034207d/59b60064Nb97ec546.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img11.360buyimg.com/babel/jfs/t8563/102/1393701174/88723/bda85274/59b8c3d4Nd349a04a.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img1.360buyimg.com/da/jfs/t9175/324/882302528/163890/cc6b0805/59b89c15Nb85eaac1.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img1.360buyimg.com/da/jfs/t7462/141/2922324773/100368/eef60dcc/59b77731N426fd076.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img10.360buyimg.com/babel/jfs/t8176/21/1446009464/141022/d2543fd5/59ba1ab7Nb143afa3.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img1.360buyimg.com/da/jfs/t7591/204/2966860970/185647/628adb0e/59b78d62Ne1ebdcf2.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img1.360buyimg.com/da/jfs/t9043/77/1478130387/156076/f2c8231e/59ba1d33Na47847a8.jpg" />
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" target="_blank">
                                <img class="banner-img" src="//img12.360buyimg.com/babel/jfs/t8821/344/1451687872/35248/25ac302b/59b9d5fdNbc7e74c3.jpg" />
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="banner-arrow prev" data-forword="prev" style="height:34px;"><i class="fa fa-angle-left" aria-hidden="true"></i>
                </div>
                <div class="banner-arrow next" data-forword="next" style="height:34px;"><i class="fa fa-angle-right" aria-hidden="true"></i>
                </div>
            </div>
        </div>
        <div class="w">
        	<c:forEach items="${sessionScope.cMap}" var="map">
            <div class="floor-wrap">
                 <h1 class="floor-title">★ ${map.key.name}</h1>
                <ul class="floor-con">
                	<c:forEach items="${map.value}" var="clist">
		                    <li class="floor-item">
		                        <a href="getProductList?categoryId=${clist.id}"> <span class="floor-text">${clist.name}</span>
		                            <img class="floor-img" src="${clist.pic}" alt="${clist.name}" />
		                        </a>
		                    </li>
                    </c:forEach>
                    
                </ul>
            </div>
            </c:forEach>
            
        </div>
        <div class=footer>
            <div class=w>
                <div class=links>
                	<a class=link href=//www.vip.com/>唯品会</a>|
                	<a class=link href=//www.taobao.com/>淘宝</a>|
                	<a class=link href=//www.jd.com/>京东</a>|
                	<a class=link href=//www.yhd.com/>一号店</a> 
                </div>
                <p class=copyright>Copyright © 2017  All Rights Reserved</p>
            </div>
        </div>
        <script src=//cdn.bootcss.com/jquery/1.11.3/jquery.js></script>
        <script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/base.js?9dd65f513c150dbd6188"></script>
        <script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/common.js?9dd65f513c150dbd6188"></script>
        <script type="text/javascript" src="//s.happymmall.com/mmall_fe/dist/js/index.js?9dd65f513c150dbd6188"></script>
    </body>
 
</html> 