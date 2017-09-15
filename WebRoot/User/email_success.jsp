<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>密码重置成功</title>
    
  </head>
  
  <body>
    <center>
    	<h3>密码已发送至您所绑定的邮箱中，请注意查收，并记得登录官网修改密码哟(u-_-u)</h3>
    	<a href="login.jsp">返回登录</a>
    </center>
  </body> 
</html>
