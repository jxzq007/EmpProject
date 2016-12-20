<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%@ page import="org.zhangqing.factory.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String editPreUrl = basePath + "pages/back/admin/emp/emp_edit.jsp";
	String url = "pages/back/admin/emp/emp_list.jsp";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/back/emp/emp_list.js"></script>
<style type="text/css">
tr:hover {
	background-color: #FFFFFF;
}
</style>
</head>

<body>
	<h1>雇员列表</h1>
	<%
		List<Emp> all = ServiceFactory.getIEmpServiceInstance().list();
		Iterator<Emp> iter = all.iterator();
	%>
	<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
		cellspacing="0">
		<tr>
			<td><input type="checkbox" id="selAll"></td>
			<td>雇员编号</td>
			<td>雇员姓名</td>
			<td>雇员职位</td>
			<td>雇佣日期</td>
			<td>基本工资</td>
			<td>雇员佣金</td>
			<td>照片</td>
			<td>简介</td>
			<td>操作</td>
		</tr>
		<%
			while(iter.hasNext()){
				Emp vo = iter.next();
				%>
				<tr>
					<td><input type="checkbox" id="empno" value="<%=vo.getEmpno()%>:<%=vo.getPhoto()%>"></td>
					<td><%=vo.getEmpno() %></td>
					<td><%=vo.getEname() %></td>
					<td><%=vo.getJob() %></td>
					<td><%=vo.getHiredate() %></td>
					<td><%=vo.getSal() %></td>
					<td><%=vo.getComm() %></td>
					<td><img src="upload/emp/<%=vo.getPhoto()%>" style="height:50px; width:50px;"></td>
					<td><%=vo.getNote()%></td>
					<td><a href="<%=editPreUrl%>?empno=<%=vo.getEmpno()%>&retUrl=<%=url%>">修改</a></td>
				</tr>
				<%
			}
		%>
	</table>
	<input type="button" value="删除所选数据" id="delAll">
</body>
</html>
