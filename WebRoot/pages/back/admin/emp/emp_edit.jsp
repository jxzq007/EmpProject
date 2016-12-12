<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%@ page import="org.zhangqing.factory.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String editUrl = basePath + "pages/back/admin/emp/emp_edit_do.jsp";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="<%=basePath%>js/WdatePicker.js"></script>
<script type="text/javascript" src="js/back/emp/emp_edit.js"></script>
</head>

<body>
	<%
		int empno = Integer.parseInt(request.getParameter("empno"));
		Emp vo = ServiceFactory.getIEmpServiceInstance().editPre(empno);
		if(vo != null) {
	%>
	<form action="<%=editUrl%>" method="post" id="empEditForm">
		<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
			cellspacing="0">
			<tr>
				<td colspan="3">雇员修改页面</td>
			</tr>
			<tr>
				<td width="15%">雇员编号：</td>
				<td width="50%"><%=vo.getEmpno() %></td>
				<td width="35%"><span id="empnoSpan"></span></td>
			</tr>
			<tr>
				<td>雇员姓名：</td>
				<td><input type="text" name="ename" id="ename" class="init" value="<%=vo.getEname()%>"></td>
				<td><span id="enameSpan"></span></td>
			</tr>
			<tr>
				<td>雇员职位：</td>
				<td><input type="text" name="job" id="job" class="init" value="<%=vo.getJob()%>"></td>
				<td><span id="jobSpan"></span></td>
			</tr>
			<tr>
				<td>雇佣日期：</td>
				<td><input type="text" name="hiredate" id="hiredate"
					class="init" onClick="WdatePicker()"  value="<%=vo.getHiredate()%>"></td>
				<td><span id="hiredateSpan"></span></td>
			</tr>
			<tr>
				<td>基本工资：</td>
				<td><input type="text" name="sal" id="sal" class="init" value="<%=vo.getSal()%>"></td>
				<td><span id="salSpan"></span></td>
			</tr>
			<tr>
				<td>雇员佣金：</td>
				<td><input type="text" name="comm" id="comm" class="init" value="<%=vo.getComm()%>"></td>
				<td><span id="commSpan"></span></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="hidden" name="empno" id="empno" value="<%=vo.getEmpno()%>">
					<input type="hidden" name="retUrl" id="retUrl" value="<%=request.getParameter("retUrl")%>">
					<input type="hidden" name="cp" id="cp" value="<%=request.getParameter("cp")%>">
					<input type="hidden" name="col" id="col" value="<%=request.getParameter("col")%>">
					<input type="hidden" name="kw" id="kw" value="<%=request.getParameter("kw")%>">
					<input type="submit" value="修改"> 
					<input type="reset" value="重置">
				</td>
			</tr>
		</table>
		<%
		} else {
			%>
				没有找到相应的数据
			<%
		}
		%>
	</form>
</body>
</html>
