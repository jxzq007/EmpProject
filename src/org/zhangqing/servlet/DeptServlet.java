package org.zhangqing.servlet;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zhangqing.factory.ServiceFactory;
import org.zhangqing.util.BasePath;
import org.zhangqing.vo.Dept;

@SuppressWarnings("serial")
public class DeptServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "/pages/errors.jsp";
		String status = request.getRequestURI()
				.substring(request.getRequestURI().lastIndexOf("/") + 1);
		if ("add".equals(status)) {
			url = add(request, response);
		} else if ("editPre".equals(status)) {
			url = editPre(request, response);
		} else if ("edit".equals(status)) {
			url = edit(request, response);
		} else if ("list".equals(status)) {
			url = list(request, response);
		} else if ("rm".equals(status)) {
			url = rm(request, response);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Dept vo = new Dept();
		vo.setDeptno(Integer.parseInt(request.getParameter("deptno")));
		vo.setDname(request.getParameter("dname"));
		vo.setLoc(request.getParameter("loc"));
		String msg = "部门增加失败";
		try {
			if (ServiceFactory.getIDeptServiceInstance().add(vo)) {
				msg = "部门增加成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", BasePath.getBasePath(request)
				+ "pages/back/admin/dept/dept_add.jsp");
		return "/pages/forward.jsp";
	}

	public String editPre(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
		try {
			request.setAttribute("dept", ServiceFactory.getIDeptServiceInstance()
					.editPre(Integer.parseInt(request.getParameter("deptno"))));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/dept/dept_edit.jsp";
	}

	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Dept vo = new Dept();
		vo.setDeptno(Integer.parseInt(request.getParameter("deptno")));
		vo.setDname(request.getParameter("dname"));
		vo.setLoc(request.getParameter("loc"));
		String msg = "部门修改失败";
		try {
			if (ServiceFactory.getIDeptServiceInstance().edit(vo)) {
				msg = "部门修改成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", BasePath.getBasePath(request) + "pages/back/admin/dept/DeptServlet/list");
		return "/pages/forward.jsp";
	}

	public String list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setAttribute("allDepts", ServiceFactory.getIDeptServiceInstance().list());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/dept/dept_list.jsp";
	}

	public String rm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] result = request.getParameter("ids").split("\\|");
		Set<Integer> ids = new HashSet<Integer>();
		for (String str : result) {
			ids.add(Integer.parseInt(str));
		}
		String msg = "部门删除失败";
		boolean flag = false;
		try {
			if (ServiceFactory.getIDeptServiceInstance().rm(ids)) {
				flag = true;
				msg = "部门删除成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", BasePath.getBasePath(request) + "pages/back/admin/dept/DeptServlet/list");
		return "/pages/forward.jsp";
	}
}
