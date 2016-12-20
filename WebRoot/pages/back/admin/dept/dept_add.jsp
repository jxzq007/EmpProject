<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String addUrl = basePath + "pages/back/admin/dept/DeptServlet/add";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/back/dept/dept_add.js"></script>
</head>

<body>
<form action="<%=addUrl%>" method="post" id="deptAddForm">
	<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px" cellspacing="0">
		<tr>
			<td colspan="3">增加部门页面</td>
		</tr>
		<tr>
			<td width="15%">部门编号：</td>
			<td width="50%"><input type="text" name="deptno" id="deptno" class="init"></td>
			<td width="35%"><span id="deptnoSpan"></span></td>
		</tr>
		<tr>
			<td>部门名称：</td>
			<td><input type="text" name="dname" id="dname" class="init"></td>
			<td><span id="dnameSpan"></span></td>
		</tr>
		<tr>
			<td>部门位置：</td>
			<td><input type="text" name="loc" id="loc" class="init"></td>
			<td><span id="locSpan"></span></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="submit" value="增加">
				<input type="reset" value="重置">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
