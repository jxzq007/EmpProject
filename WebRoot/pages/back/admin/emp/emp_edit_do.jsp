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
	StringBuffer returnUrl = new StringBuffer();
	returnUrl.append(request.getParameter("retUrl")).append("?");
	returnUrl.append("col=").append(request.getParameter("col")).append("&");
	returnUrl.append("kw=").append(request.getParameter("kw")).append("&");
	returnUrl.append("cp=").append(request.getParameter("cp"));
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
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		if (deptno != 0) {
			Dept dept = new Dept();
			dept.setDeptno(deptno);
			vo.setDept(dept);
		}
		String msg = "雇员修改失败";
		boolean flag = false;
		if (ServiceFactory.getIEmpServiceInstance().edit(vo)) {
			flag = true;
			msg = "雇员修改成功";
		}
	%>
	<script type="text/javascript">
		window.alert("<%=msg%>");
		window.location = "<%=returnUrl%>";
	</script>
</body>
</html>
