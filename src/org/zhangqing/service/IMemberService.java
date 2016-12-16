package org.zhangqing.service;

import org.zhangqing.vo.Member;

public interface IMemberService {
	public boolean login(Member vo) throws Exception;
}
