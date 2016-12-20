<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%@ page import="org.zhangqing.factory.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String showUrl = basePath + "pages/back/admin/emp/emp_show.jsp";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/back/emp/emp_show.js"></script>
</head>

<body>
	<%
		int empno = Integer.parseInt(request.getParameter("empno"));
		Emp vo = ServiceFactory.getIEmpServiceInstance().show(empno);
		if(vo != null) {
	%>
		<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
			cellspacing="0">
			<tr>
				<td colspan="3">雇员信息显示页面</td>
			</tr>
			<tr>
				<td width="15%">雇员编号：</td>
				<td width="50%"><%=vo.getEmpno() %></td>
				<td width="35%" rowspan="8"><img src="upload/emp/<%=vo.getPhoto()%>" class="img"></td>
			</tr>
			<tr>
				<td>雇员姓名：</td>
				<td><%=vo.getEname()%></td>
			</tr>
			<tr>
				<td>雇员职位：</td>
				<td><%=vo.getJob()%></td>
			</tr>
			<tr>
				<td>雇员领导：</td>
				<td><a href="<%=showUrl%>?empno=<%=vo.getMgr().getEmpno()%>">
					<%=vo.getMgr().getEmpno().equals(0)?"":vo.getMgr().getEname() %>
				</td>
			</tr>
			<tr>
				<td>雇佣日期：</td>
				<td><%=vo.getHiredate()%></td>
			</tr>
			<tr>
				<td>基本工资：</td>
				<td><%=vo.getSal()%></td>
			</tr>
			<tr>
				<td>雇员佣金：</td>
				<td><%=vo.getComm()%></td>
			</tr>
			<tr>
				<td>简介：</td>
				<td><%=vo.getNote()%></td>
			</tr>

		</table>
		<%
		}
		%>
</body>
</html>
