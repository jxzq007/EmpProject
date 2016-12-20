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
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="edit/edit.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="<%=basePath%>js/WdatePicker.js"></script>
<script type="text/javascript" src="js/back/emp/emp_add.js"></script>
<script type="text/javascript" src="edit/lang/zh_CN.js"></script>
<script type="text/javascript" src="edit/kindeditor-core.js"></script>
<script type="text/javascript" src="edit/plugin-all.js"></script>
<script type="text/javascript">
KE.show({
	id : 'note',
	cssPath : '<%=basePath%>edit/index.css'
});
</script>
</head>

<body>
	<%
		int empno = Integer.parseInt(request.getParameter("empno"));
		Map<String,Object> map = ServiceFactory.getIEmpServiceInstance().editPre(empno);
		Emp vo = (Emp)map.get("emp");
		List<Emp> all = (List<Emp>)map.get("allEmps");
		List<Dept> allDepts = (List<Dept>)map.get("allDepts");
		if(vo != null) {
	%>
	<form action="<%=editUrl%>" method="post" id="empEditForm" enctype="multipart/form-data">
		<table border="1" bgColor="#F2F2F2" width="100%" cellpadding="5px"
			cellspacing="0">
			<tr>
				<td colspan="4">雇员修改页面</td>
			</tr>
			<tr>
				<td width="10%">雇员编号：</td>
				<td width="30%"><%=vo.getEmpno() %></td>
				<td width="30%"><span id="empnoSpan"></span></td>
				<td width="40%" rowspan="9"><div id="preview" class="img"><img alt="pic" src="upload/emp/<%=vo.getPhoto()%>"></div></td>
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
				<td>雇员领导：</td>
				<td>
					<select name="mgr" id="mgr">
						<option value="0">====== 没有领导 =====</option>
						<%
							Iterator<Emp> iter = all.iterator();
							while(iter.hasNext()) {
								Emp mgr = iter.next();
								if(!vo.getEmpno().equals(mgr.getEmpno())) {
								%>
									<option value="<%=mgr.getEmpno()%>" <%=vo.getMgr().getEmpno().equals(mgr.getEmpno())?"selected":"" %>><%=mgr.getEname()%></option>
								<%
								}
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
									<option value="<%=dept.getDeptno()%>" <%=vo.getDept().getDeptno().equals(dept.getDeptno())?"selected":""%>><%=dept.getDname()%></option>
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
				<td>选择雇员头像：</td>
				<td><input type="file" name="pic" id="pic" onchange="preview(this)"></td>
				<td><span id="picSpan"></span></td>
			</tr>
			<tr>
				<td colspan="4">
					雇员简介：
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="editor">
						<textarea id="note" name="note" style="width:650px;height:200px;visibility:hidden;">
						<%=vo.getNote()%>
						</textarea>
						</div>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="hidden" name="oldPic" id="oldPic" value="<%=vo.getPhoto()%>">
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
