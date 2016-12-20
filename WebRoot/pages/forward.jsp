<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
</head>

<body>
	<script type="text/javascript">
		window.alert("<%=request.getAttribute("msg")%>");
		window.location = "<%=request.getAttribute("url")%>";
</script>
</body>
</html>
