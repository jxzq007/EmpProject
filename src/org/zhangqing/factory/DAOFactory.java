package org.zhangqing.factory;

import java.sql.Connection;

import org.zhangqing.dao.IDeptDAO;
import org.zhangqing.dao.impl.DeptDAOImpl;

public class DAOFactory {
	public static IDeptDAO getIDeptDAOInstance(Connection conn) {
		return new DeptDAOImpl(conn);
	}
}
