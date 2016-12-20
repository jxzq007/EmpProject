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
	String showDeptUrl = basePath + "pages/back/admin/dept/dept_show.jsp";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/back/emp/emp_list_details.js"></script>
<style type="text/css">
tr:hover {
	background-color: #FFFFFF;
}
</style>
</head>
<%
	String url = "pages/back/admin/emp/emp_list_details.jsp";
	String keyWord = null;
	String column = "";
	String columnData = "雇员编号:empno|雇员姓名:ename|雇员职位:job";
	int currentPage = 1;
	int lineSize = 5;
	int allRecorders = 0;
%>
<%
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
		Map<String, Object> map = ServiceFactory.getIEmpServiceInstance()
				.listDetails(column, keyWord, currentPage, lineSize);
		List<Emp> all = (List<Emp>) map.get("allEmps");
		allRecorders = (Integer) map.get("empCount");
		Iterator<Emp> iter = all.iterator();
	%>
	<jsp:include page="/pages/plugins/split_page_plugin_search.jsp">
		<jsp:param name="url" value="<%=url%>" />
		<jsp:param name="columnData" value="<%=columnData%>" />
		<jsp:param name="keyWord" value="<%=keyWord%>" />
		<jsp:param name="column" value="<%=column%>" />
	</jsp:include>
	<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
		cellspacing="0">
		<tr>
			<td><input type="checkbox" id="selAll"></td>
			<td>雇员编号</td>
			<td>雇员姓名</td>
			<td>雇员职位</td>
			<td>雇员领导</td>
			<td>部门</td>
			<td>雇佣日期</td>
			<td>基本工资</td>
			<td>雇员佣金</td>
			<td>照片</td>
			<td>简介</td>
			<td>操作</td>
		</tr>
		<%
			while (iter.hasNext()) {
				Emp vo = iter.next();
		%>
		<tr>
			<td><input type="checkbox" id="empno" value="<%=vo.getEmpno()%>:<%=vo.getPhoto()%>"></td>
			<td><%=vo.getEmpno()%></td>
			<td>
				<a href="<%=showUrl%>?empno=<%=vo.getEmpno()%>"><%=vo.getEname()%></a>
			</td>
			<td><%=vo.getJob()%></td>
			<td>
				<a href="<%=showUrl%>?empno=<%=vo.getMgr().getEmpno()%>">
				<%=vo.getMgr().getEname()==null?"":vo.getMgr().getEname()%></a>
			</td>
			<td><a href="<%=showDeptUrl%>?deptno=<%=vo.getDept().getDeptno()%>">
				<%=vo.getDept().getDname()== null? "" :vo.getDept().getDname() %></a>
			</td>
			<td><%=vo.getHiredate()%></td>
			<td><%=vo.getSal()%></td>
			<td><%=vo.getComm()%></td>
			<td><img src="upload/emp/<%=vo.getPhoto()%>" style="height:50px; width:50px;"></td>
			<td><%=vo.getNote()%></td>
			<td><a href="<%=editPreUrl%>?empno=<%=vo.getEmpno()%>&retUrl=<%=url%>&col=<%=column%>&kw=<%=keyWord%>&cp=<%=currentPage%>">修改</a></td>
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
	</jsp:include>
</body>
</html>
