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
public class MemberLoginServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rand = (String) request.getSession().getAttribute("rand");
		String msg = "验证码错误";
		String url = "pages/back/login.jsp";
		if (rand.equalsIgnoreCase(request.getParameter("code"))) { // 验证码正确
			Member vo = new Member();
			vo.setMid(request.getParameter("mid"));
			vo.setPassword(new MD5Code()
					.getMD5ofStr(request.getParameter("password")));
			msg = "用户登录失败";
			try {
				if (ServiceFactory.getIMemberServiceInstance().login(vo)) {
					msg = "用户登录成功";
					request.getSession().setAttribute("mid", vo.getMid());
					url = "pages/back/admin/index.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url",BasePath.getBasePath(request) + url);
		request.getRequestDispatcher("/pages/forward.jsp").forward(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
