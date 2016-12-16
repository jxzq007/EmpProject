package org.zhangqing.service.impl;

import org.zhangqing.dbc.DatabaseConnection;
import org.zhangqing.factory.DAOFactory;
import org.zhangqing.service.IMemberService;
import org.zhangqing.vo.Member;

public class MemberServiceImpl implements IMemberService {
	private DatabaseConnection dbc = new DatabaseConnection();

	@Override
	public boolean login(Member vo) throws Exception {
		try {
			return DAOFactory.getIMemberDAOInstance(this.dbc.getConnection())
					.findLogin(vo);
		} catch (Exception e) {

		} finally {
			this.dbc.close();
		}
		return false;

	}

}
