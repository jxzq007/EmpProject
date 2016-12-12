package org.zhangqing.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.zhangqing.dbc.DatabaseConnection;
import org.zhangqing.factory.DAOFactory;
import org.zhangqing.service.IEmpService;
import org.zhangqing.vo.Emp;

public class EmpServiceImpl implements IEmpService {
	private DatabaseConnection dbc = new DatabaseConnection();

	@Override
	public boolean add(Emp vo) throws Exception {
		try {
			if (DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.findById(vo.getEmpno()) == null) {
				return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
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
	public List<Emp> list() throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.findAll();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Map<String, Object> list(String column, String keyWord,
			int currentPage, int lineSize) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("allEmps",
					DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
							.findAllSplit(column, keyWord, currentPage,
									lineSize));
			map.put("empCount",
					DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
							.getAllCount(column, keyWord));
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return map;
	}

	@Override
	public Emp editPre(int id) throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public boolean edit(Emp vo) throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
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
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection())
					.doRemove(ids);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

}
