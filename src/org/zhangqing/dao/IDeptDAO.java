package org.zhangqing.dao;

import java.util.List;

import org.zhangqing.vo.Dept;

public interface IDeptDAO extends IDAO<Integer, Dept> {
	public List<Dept> findAllDetails() throws Exception;
	public Dept findByIdDetails(Integer id) throws Exception;
}
