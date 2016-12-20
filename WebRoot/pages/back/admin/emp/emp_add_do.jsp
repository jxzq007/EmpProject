<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.zhangqing.vo.*"%>
<%@ page import="org.zhangqing.factory.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String returnUrl = basePath + "pages/back/admin/emp/emp_add.jsp";
	SmartUpload smart = new SmartUpload();
	smart.initialize(config, request, response);
	smart.upload();
%>

<html>
<head>
<base href="<%=basePath%>">

<title>雇员-部门管理项目</title>
</head>

<body>
	<%
		Emp vo = new Emp();
		vo.setEmpno(Integer.parseInt(smart.getRequest().getParameter("empno")));
		vo.setEname(smart.getRequest().getParameter("ename"));
		vo.setJob(smart.getRequest().getParameter("job"));
		vo.setHiredate(new SimpleDateFormat("yyy-MM-dd").parse(smart.getRequest().getParameter("hiredate")));
		vo.setSal(Double.parseDouble(smart.getRequest().getParameter("sal")));
		vo.setComm(Double.parseDouble(smart.getRequest().getParameter("comm")));
		int mgrno = Integer.parseInt(smart.getRequest().getParameter("mgr"));
		if (mgrno != 0) {
			Emp mgr = new Emp();
			mgr.setEmpno(mgrno);
			vo.setMgr(mgr);
		}
		int deptno = Integer.parseInt(smart.getRequest().getParameter("deptno"));
		if (deptno != 0) {
			Dept dept = new Dept();
			dept.setDeptno(deptno);
			vo.setDept(dept);
		}
		vo.setNote(smart.getRequest().getParameter("note"));
		vo.setPhoto("nophoto.jpg");
		if (smart.getFiles().getSize() > 0) {//有上传文件
			SmartFile file = smart.getFiles().getFile(0);
			if (file.getContentType().contains("image/")) {//是图片
				vo.setPhoto(UUID.randomUUID() + "." + file.getFileExt());
			}
		}

		String msg = "雇员增加失败";
		boolean flag = false;
		if (ServiceFactory.getIEmpServiceInstance().add(vo)) {
			flag = true;
			msg = "雇员增加成功";
			if (smart.getFiles().getSize() > 0) {//有上传文件
				SmartFile file = smart.getFiles().getFile(0);
				if (file.getContentType().contains("image/")) {//是图片
					String filePath = this.getServletContext().getRealPath("/upload/emp/");
					file.saveAs(filePath + vo.getPhoto());
				}
			}
		}
	%>
	<script type="text/javascript">
		window.alert("<%=msg%>");
		window.location = "<%=returnUrl%>";
	</script>
</body>
</html>
