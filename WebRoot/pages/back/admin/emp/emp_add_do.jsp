<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%@ page import="org.zhangqing.factory.*"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String returnUrl = basePath + "pages/back/admin/emp/emp_add.jsp";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
</head>

<body>
	<%
		Emp vo = new Emp();
		vo.setEmpno(Integer.parseInt(request.getParameter("empno")));
		vo.setEname(request.getParameter("ename"));
		vo.setJob(request.getParameter("job"));
		vo.setHiredate(new SimpleDateFormat("yyy-MM-dd").parse(request.getParameter("hiredate")));
		vo.setSal(Double.parseDouble(request.getParameter("sal")));
		vo.setComm(Double.parseDouble(request.getParameter("comm")));
		int mgrno = Integer.parseInt(request.getParameter("mgr"));
		if(mgrno != 0) {
			Emp mgr = new Emp();
			mgr.setEmpno(mgrno);
			vo.setMgr(mgr);
		}
		String msg = "雇员增加失败";
		boolean flag = false;
		if (ServiceFactory.getIEmpServiceInstance().add(vo)) {
			flag = true;
			msg = "雇员增加成功";
		}
	%>
	<script type="text/javascript">
		window.alert("<%=msg%>");
		window.location = "<%=returnUrl%>";
	</script>
</body>
</html>
