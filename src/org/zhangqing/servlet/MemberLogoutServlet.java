package org.zhangqing.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zhangqing.factory.ServiceFactory;
import org.zhangqing.util.BasePath;
import org.zhangqing.util.MD5Code;
import org.zhangqing.vo.Member;

@SuppressWarnings("serial")
public class MemberLogoutServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String msg = "注销成功";
		String url = "pages/back/login.jsp";
		request.getSession().invalidate();
		request.setAttribute("msg", msg);
		request.setAttribute("url", BasePath.getBasePath(request) + url);
		request.getRequestDispatcher("/pages/forward.jsp").forward(request,
				response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
