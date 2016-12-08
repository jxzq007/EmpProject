package org.zhangqing.service;

import java.util.List;

import org.zhangqing.vo.Dept;

public interface IDeptService {
	public boolean add(Dept vo) throws Exception;
	public List<Dept> list() throws Exception;
	public Dept editPre(int id) throws Exception;
	public boolean edit(Dept vo) throws Exception;
}
