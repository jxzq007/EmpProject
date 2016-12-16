package org.zhangqing.factory;

import org.zhangqing.service.IDeptService;
import org.zhangqing.service.IEmpService;
import org.zhangqing.service.IMemberService;
import org.zhangqing.service.impl.DeptServiceImpl;
import org.zhangqing.service.impl.EmpServiceImpl;
import org.zhangqing.service.impl.MemberServiceImpl;

public class ServiceFactory {
	public static IDeptService getIDeptServiceInstance() {
		return new DeptServiceImpl();
	}

	public static IEmpService getIEmpServiceInstance() {
		return new EmpServiceImpl();
	}

	public static IMemberService getIMemberServiceInstance() {
		return new MemberServiceImpl();
	}
}
