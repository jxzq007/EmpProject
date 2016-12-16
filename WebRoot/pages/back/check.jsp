<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%@ page import="org.zhangqing.factory.*"%>
<%@ page import="org.zhangqing.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
</head>
<%	String rand = (String) session.getAttribute("rand");
	String msg = "验证码错误";
	String url = "pages/back/login.jsp";
	if(rand.equalsIgnoreCase(request.getParameter("code"))) { //验证码正确
		Member vo = new Member();
		vo.setMid(request.getParameter("mid"));
		vo.setPassword(new MD5Code().getMD5ofStr(request.getParameter("password")));
		msg = "用户登录失败";
		//url = "pages/back/login.jsp";
		if(ServiceFactory.getIMemberServiceInstance().login(vo)) {
			msg = "用户登录成功";
			session.setAttribute("mid", vo.getMid());
			url = "pages/back/admin/index.jsp";
		}
	}
%>
<body>
</body>
<script type="text/javascript">
		window.alert("<%=msg%>");
		window.location = "<%=url%>";
</script>
</html>
