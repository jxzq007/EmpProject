package org.zhangqing.service.impl;

import java.util.List;
import java.util.Set;

import org.zhangqing.dbc.DatabaseConnection;
import org.zhangqing.factory.DAOFactory;
import org.zhangqing.service.IDeptService;
import org.zhangqing.vo.Dept;

public class DeptServiceImpl implements IDeptService {
	private DatabaseConnection dbc = new DatabaseConnection();

	@Override
	public boolean add(Dept vo) throws Exception {
		try {
			if (DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.findById(vo.getDeptno()) == null) {
				return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
						.doCreate(vo);
			}
			return false;
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public List<Dept> list() throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.findAll();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Dept editPre(int id) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public boolean edit(Dept vo) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.doUpdate(vo);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public boolean rm(Set<Integer> ids) throws Exception {
		if (ids.size() == 0) {
			return false;
		}
		try {
			DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.doRemoveByDeptno(ids);
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection())
					.doRemove(ids);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

}
