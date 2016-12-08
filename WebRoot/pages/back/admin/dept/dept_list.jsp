<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%@ page import="org.zhangqing.factory.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String editPreUrl = basePath + "pages/back/admin/dept/dept_edit.jsp";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/back/dept/dept_list.js"></script>
<style type="text/css">
tr:hover {
	background-color: #FFFFFF;
}
</style>
</head>

<body>
	<h1>部门列表</h1>
	<%
		List<Dept> all = ServiceFactory.getIDeptServiceInstance().list();
		Iterator<Dept> iter = all.iterator();
	%>
	<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
		cellspacing="0">
		<tr>
			<td><input type="checkbox" id="selAll"></td>
			<td>部门编号</td>
			<td>部门名称</td>
			<td>部门位置</td>
			<td>操作</td>
		</tr>
		<%
			while(iter.hasNext()){
				Dept vo = iter.next();
				%>
				<tr>
					<td><input type="checkbox" id="deptno" value="<%=vo.getDeptno()%>"></td>
					<td><%=vo.getDeptno() %></td>
					<td><%=vo.getDname() %></td>
					<td><%=vo.getLoc() %></td>
					<td><a href="<%=editPreUrl%>?deptno=<%=vo.getDeptno()%>">修改</a></td>
				</tr>
				<%
			}
		%>
	</table>
	<input type="button" value="删除所选数据" id="delAll">
</body>
</html>
