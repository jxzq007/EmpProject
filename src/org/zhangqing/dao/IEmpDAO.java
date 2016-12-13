package org.zhangqing.dao;

import java.util.List;
import java.util.Set;

import org.zhangqing.vo.Emp;

public interface IEmpDAO extends IDAO<Integer, Emp> {
	public void doRemoveByDeptno(Set<Integer> ids) throws Exception;

	public List<Emp> findAllSplitDetails(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception;
	
	public Emp findByIdDetails(Integer id) throws Exception;
	
	public List<Emp> findAllByDept(Integer id,String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception;
}
