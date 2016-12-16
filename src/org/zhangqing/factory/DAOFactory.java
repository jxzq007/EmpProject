package org.zhangqing.factory;

import java.sql.Connection;

import org.zhangqing.dao.IDeptDAO;
import org.zhangqing.dao.IEmpDAO;
import org.zhangqing.dao.IMemberDAO;
import org.zhangqing.dao.impl.DeptDAOImpl;
import org.zhangqing.dao.impl.EmpDAOImpl;
import org.zhangqing.dao.impl.MemberDAOImpl;

public class DAOFactory {
	public static IDeptDAO getIDeptDAOInstance(Connection conn) {
		return new DeptDAOImpl(conn);
	}
	public static IEmpDAO getIEmpDAOInstance(Connection conn) {
		return new EmpDAOImpl(conn);
	}
	public static IMemberDAO getIMemberDAOInstance(Connection conn) {
		return new MemberDAOImpl(conn);
	}
}
