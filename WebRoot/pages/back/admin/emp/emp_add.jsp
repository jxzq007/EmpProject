<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%@ page import="org.zhangqing.factory.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String addUrl = basePath + "pages/back/admin/emp/emp_add_do.jsp";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="<%=basePath%>js/WdatePicker.js"></script>
<script type="text/javascript" src="js/back/emp/emp_add.js"></script>
</head>

<body>
	<%
		Map<String, Object> map = ServiceFactory.getIEmpServiceInstance()
				.addPre();
		List<Emp> all = (List<Emp>)map.get("allEmps");
		List<Dept> allDepts = (List<Dept>)map.get("allDepts");
		int deptno = 0 ;
		try {
			deptno = Integer.parseInt(request.getParameter("deptno"));
		}catch(Exception e){}
	%>
	<form action="<%=addUrl%>" method="post" id="empAddForm">
		<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
			cellspacing="0">
			<tr>
				<td colspan="3">雇员增加页面</td>
			</tr>
			<tr>
				<td width="15%">雇员编号：</td>
				<td width="50%"><input type="text" name="empno" id="empno"
					class="init"></td>
				<td width="35%"><span id="empnoSpan"></span></td>
			</tr>
			<tr>
				<td>雇员姓名：</td>
				<td><input type="text" name="ename" id="ename" class="init"></td>
				<td><span id="enameSpan"></span></td>
			</tr>
			<tr>
				<td>雇员职位：</td>
				<td><input type="text" name="job" id="job" class="init"></td>
				<td><span id="jobSpan"></span></td>
			</tr>
			<tr>
				<td>雇员领导：</td>
				<td>
					<select name="mgr" id="mgr">
						<option value="0">====== 没有部门 =====</option>
						<%
							Iterator<Emp> iter = all.iterator();
							while(iter.hasNext()) {
								Emp mgr = iter.next();
								%>
									<option value="<%=mgr.getEmpno()%>"><%=mgr.getEname()%></option>
								<%
							}
						%>
					</select>
				</td>
				<td><span id="mgrSpan"></span></td>
			</tr>
			<tr>
				<td>部门：</td>
				<td>
					<select name="deptno" id="deptno">
						<option value="0">====== 没有领导 =====</option>
						<%
							Iterator<Dept> iterDept = allDepts.iterator();
							while(iterDept.hasNext()) {
								Dept dept = iterDept.next();
								%>
									<option value="<%=dept.getDeptno()%>" <%=dept.getDeptno().equals(deptno)?"selected":""%>><%=dept.getDname()%></option>
								<%
							}
						%>
					</select>
				</td>
				<td><span id="deptnoSpan"></span></td>
			</tr>
			<tr>
				<td>雇佣日期：</td>
				<td><input type="text" name="hiredate" id="hiredate"
					class="init" onClick="WdatePicker()"></td>
				<td><span id="hiredateSpan"></span></td>
			</tr>
			<tr>
				<td>基本工资：</td>
				<td><input type="text" name="sal" id="sal" class="init"></td>
				<td><span id="salSpan"></span></td>
			</tr>
			<tr>
				<td>雇员佣金：</td>
				<td><input type="text" name="comm" id="comm" class="init"></td>
				<td><span id="commSpan"></span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="增加"> <input
					type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
</body>
</html>
