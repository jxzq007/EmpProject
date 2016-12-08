<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.factory.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String returnUrl = basePath + "pages/back/admin/dept/dept_list.jsp";
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
	String msg = "部门删除失败";
	boolean flag = false;
	if (ServiceFactory.getIDeptServiceInstance().rm(ids)) {
		flag = true;
		msg = "部门删除成功";
	}
%>
<body>
</body>
<script type="text/javascript">
	window.alert("<%=msg%>");
	window.location = "<%=returnUrl%>";
</script>
</html>
