package org.zhangqing.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.zhangqing.vo.Emp;

public interface IEmpService {
	public Map<String, Object> addPre() throws Exception;

	public boolean add(Emp vo) throws Exception;

	public List<Emp> list() throws Exception;

	public Map<String, Object> list(String column, String keyWord,
			int currentPage,
			int lineSize) throws Exception;
	
	public Map<String, Object> listDetails(String column, String keyWord,
			int currentPage,
			int lineSize) throws Exception;

	public Map<String,Object> editPre(int id) throws Exception;

	public boolean edit(Emp vo) throws Exception;

	public boolean rm(Set<Integer> ids) throws Exception;
	
	public Emp show(int id) throws Exception;
}
