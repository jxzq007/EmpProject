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
	String showUrl = basePath + "pages/back/admin/emp/emp_show.jsp";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/back/dept/dept_show.js"></script>
<style type="text/css">
tr:hover {
	background-color: #FFFFFF;
}
</style>
</head>
<%
	String url = "pages/back/admin/dept/dept_show.jsp";
	String keyWord = null;
	String column = "";
	String columnData = "雇员编号:empno|雇员姓名:ename|雇员职位:job";
	int currentPage = 1;
	int lineSize = 5;
	int allRecorders = 0;
	int deptno = 0;
%>
<%
	try{
		deptno = Integer.parseInt(request.getParameter("deptno"));
	}catch(Exception e) {}
	try {
		column = request.getParameter("col");
	} catch (Exception e) {
	}
	try {
		keyWord = request.getParameter("kw");
	} catch (Exception e) {
	}
	try {
		currentPage = Integer.parseInt(request.getParameter("cp"));
	} catch (Exception e) {
	}
%>
<%
	if (column == null || "".equals(column)) {
		column = "ename";
	}
	if (keyWord == null) {
		keyWord = "";
	}
%>
<body>
	<h1>雇员列表</h1>
	<%
		Dept dept = ServiceFactory.getIDeptServiceInstance()
				.show(deptno,column, keyWord, currentPage, lineSize);
		List<Emp> all = dept.getEmps();
		allRecorders = (Integer) dept.getStat().get("count");
		Iterator<Emp> iter = all.iterator();
	%>
	<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
		cellspacing="0">
		<tr>
			<td>部门编号</td>
			<td>部门名称</td>
			<td>部门位置</td>
			<td>人数</td>
			<td>平均工资</td>
			<td>每月总支出</td>
			<td>最高工资</td>
			<td>最低工资</td>
			<td>平均服务年数</td>
		</tr>
		<tr>
			<td><%=dept.getDeptno() %></td>
			<td><%=dept.getDname() %></td>
			<td><%=dept.getLoc() %></td>
			<td><%=dept.getStat().get("count") %></td>
			<td><%=dept.getStat().get("avg") %></td>
			<td><%=dept.getStat().get("sum") %></td>
			<td><%=dept.getStat().get("max") %></td>
			<td><%=dept.getStat().get("min") %></td>
			<td><%=dept.getStat().get("avgyear") %></td>
		</tr>
		</table><br><br><br><br><br><h2>部门员工列表</h2>
	<jsp:include page="/pages/plugins/split_page_plugin_search.jsp">
		<jsp:param name="url" value="<%=url%>" />
		<jsp:param name="columnData" value="<%=columnData%>" />
		<jsp:param name="keyWord" value="<%=keyWord%>" />
		<jsp:param name="column" value="<%=column%>" />
	</jsp:include>
		<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
		cellspacing="0">
		<tr>
			<td>雇员编号</td>
			<td>雇员姓名</td>
			<td>雇员职位</td>
			<td>雇员领导</td>
			<td>部门</td>
			<td>雇佣日期</td>
			<td>基本工资</td>
			<td>雇员佣金</td>
		</tr>
		<%
			while (iter.hasNext()) {
				Emp vo = iter.next();
		%>
		<tr>
			<td><%=vo.getEmpno()%></td>
			<td>
				<a href="<%=showUrl%>?empno=<%=vo.getEmpno()%>"><%=vo.getEname()%></a>
			</td>
			<td><%=vo.getJob()%></td>
			<td>
				<a href="<%=showUrl%>?empno=<%=vo.getMgr().getEmpno()%>">
				<%=vo.getMgr().getEname()==null?"":vo.getMgr().getEname()%></a>
			</td>
			<td>
				<%=vo.getDept().getDname()== null? "" :vo.getDept().getDname() %>
			</td>
			<td><%=vo.getHiredate()%></td>
			<td><%=vo.getSal()%></td>
			<td><%=vo.getComm()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<input type="button" value="删除所选数据" id="delAll">
	<jsp:include page="/pages/plugins/split_page_plugin_bar.jsp">
		<jsp:param name="url" value="<%=url%>" />
		<jsp:param name="currentPage" value="<%=currentPage%>" />
		<jsp:param name="lineSize" value="<%=lineSize%>" />
		<jsp:param name="allRecorders" value="<%=allRecorders%>" />
		<jsp:param name="keyWord" value="<%=keyWord%>" />
		<jsp:param name="column" value="<%=column%>" />
		<jsp:param name="paramName" value="deptno" />
		<jsp:param name="paramValue" value="<%=deptno%>" />
	</jsp:include>
</body>
</html>
