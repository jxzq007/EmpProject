package org.zhangqing.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Set;

import org.zhangqing.dao.IMemberDAO;
import org.zhangqing.vo.Member;

public class MemberDAOImpl implements IMemberDAO {
	private Connection			conn;
	private PreparedStatement	pstmt;

	public MemberDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean doCreate(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean doUpdate(Member vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean doRemove(Set<String> ids) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Member findById(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> findAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> findAllSplit(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean findLogin(Member vo) throws Exception {
		String sql = "SELECT COUNT(*) FROM member WHERE mid=? AND password=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getMid());
		this.pstmt.setString(2, vo.getPassword());
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) == 1) {
				return true;
			}
		}
		return false;
	}

}
