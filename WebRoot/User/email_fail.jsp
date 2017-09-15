<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>密码重置失败</title>
    
  </head>
  
  <body>
    <center>
    	<h3>密码重置失败，请检查您的网络(u~_~u)</h3>
    	<a href="findpassword.jsp">返回</a>
    </center>
  </body> 
</html>
