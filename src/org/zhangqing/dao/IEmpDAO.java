package org.zhangqing.dao;

import java.util.Set;

import org.zhangqing.vo.Emp;

public interface IEmpDAO extends IDAO<Integer, Emp> {
	public void doRemoveByDeptno(Set<Integer> ids) throws Exception;
}
