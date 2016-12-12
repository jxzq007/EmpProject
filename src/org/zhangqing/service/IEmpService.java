package org.zhangqing.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.zhangqing.vo.Emp;

public interface IEmpService {
	public boolean add(Emp vo) throws Exception;

	public List<Emp> list() throws Exception;

	public Map<String, Object> list(String column, String keyWord,
			int currentPage,
			int lineSize) throws Exception;

	public Emp editPre(int id) throws Exception;

	public boolean edit(Emp vo) throws Exception;

	public boolean rm(Set<Integer> ids) throws Exception;
}
