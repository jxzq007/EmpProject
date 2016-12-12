<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.factory.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String returnUrl = basePath + request.getParameter("retUrl");
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
</head>
<%
	String[] result = request.getParameter("ids").split("\\|");
	Set<Integer> ids = new HashSet<Integer>();
	for (String str : result) {
		ids.add(Integer.parseInt(str));
	}
	String msg = "雇员删除失败";
	boolean flag = false;
	if (ServiceFactory.getIEmpServiceInstance().rm(ids)) {
		flag = true;
		msg = "雇员删除成功";
	}
%>
<body>
</body>
<script type="text/javascript">
	window.alert("<%=msg%>");
	window.location = "<%=returnUrl%>";
</script>
</html>
