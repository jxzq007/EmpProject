package org.zhangqing.dao;

import org.zhangqing.vo.Member;

public interface IMemberDAO extends IDAO<String, Member> {
	public boolean findLogin(Member vo) throws Exception;
}
