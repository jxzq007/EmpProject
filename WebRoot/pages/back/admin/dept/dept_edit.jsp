<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String editUrl = basePath
			+ "pages/back/admin/dept/DeptServlet/edit";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/back/dept/dept_edit.js"></script>
</head>

<body>
	<%
		Dept vo = (Dept)request.getAttribute("dept");
		if (vo != null) {
	%>
	<form action="<%=editUrl%>" method="post" id="deptEditForm">
		<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
			cellspacing="0">
			<tr>
				<td colspan="3">修改部门页面</td>
			</tr>
			<tr>
				<td width="15%">部门编号：</td>
				<td width="50%"><%=vo.getDeptno()%></td>
				<td width="35%"><span id="deptnoSpan"></span></td>
			</tr>
			<tr>
				<td>部门名称：</td>
				<td><input type="text" name="dname" id="dname" class="init" value="<%=vo.getDname()%>"></td>
				<td><span id="dnameSpan"></span></td>
			</tr>
			<tr>
				<td>部门位置：</td>
				<td><input type="text" name="loc" id="loc" class="init" value="<%=vo.getLoc()%>"></td>
				<td><span id="locSpan"></span></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="hidden" name="deptno" value="<%=vo.getDeptno()%>">
					<input type="submit" value="修改"> 
				<input
					type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%><h1>没有找到对应的数据</h1>
	<%
		}
	%>
</body>
</html>
