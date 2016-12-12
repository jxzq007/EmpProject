package org.zhangqing.factory;

import org.zhangqing.service.IDeptService;
import org.zhangqing.service.IEmpService;
import org.zhangqing.service.impl.DeptServiceImpl;
import org.zhangqing.service.impl.EmpServiceImpl;

public class ServiceFactory {
	public static IDeptService getIDeptServiceInstance() {
		return new DeptServiceImpl();
	}
	public static IEmpService getIEmpServiceInstance() {
		return new EmpServiceImpl();
	}
}
