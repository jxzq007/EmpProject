package org.zhangqing.factory;

import org.zhangqing.service.IDeptService;
import org.zhangqing.service.impl.DeptServiceImpl;

public class ServiceFactory {
	public static IDeptService getIDeptServiceInstance() {
		return new DeptServiceImpl();
	}
}
