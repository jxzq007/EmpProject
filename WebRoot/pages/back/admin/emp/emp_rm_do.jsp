<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.factory.*"%>
<%@ page import="java.io.*"%>
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
	Set<String> pics = new HashSet<String>();
	for (String str : result) {
		String temp[] = str.split(":");
		ids.add(Integer.parseInt(temp[0]));
		if (!"nophoto.jpg".equals(temp[1])) {
			pics.add(temp[1]);
		}

	}
	String msg = "雇员删除失败";
	boolean flag = false;
	if (ServiceFactory.getIEmpServiceInstance().rm(ids)) {
		flag = true;
		msg = "雇员删除成功";
		Iterator<String> iter = pics.iterator();
		String filepath = this.getServletContext().getRealPath("/upload/emp/");
		while (iter.hasNext()) {
			File file = new File(filepath + iter.next());
			if (file.exists()) {
				file.delete();
			}
		}
	}
%>
<body>
</body>
<script type="text/javascript">
	window.alert("<%=msg%>");
	window.location = "<%=returnUrl%>";
</script>
</html>
