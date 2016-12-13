package org.zhangqing.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.zhangqing.dao.IDeptDAO;
import org.zhangqing.vo.Dept;

public class DeptDAOImpl implements IDeptDAO {
	private Connection			conn;
	private PreparedStatement	pstmt;

	public DeptDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean doCreate(Dept vo) throws Exception {
		String sql = "INSERT INTO dept(deptno,dname,loc) VALUES(?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getDeptno());
		this.pstmt.setString(2, vo.getDname());
		this.pstmt.setString(3, vo.getLoc());
		return this.pstmt.executeUpdate() > 0;
	}

	@Override
	public boolean doUpdate(Dept vo) throws Exception {
		String sql = "UPDATE dept SET dname=?,loc=? WHERE deptno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getDname());
		this.pstmt.setString(2, vo.getLoc());
		this.pstmt.setInt(3, vo.getDeptno());
		return this.pstmt.executeUpdate() > 0;
	}

	@Override
	public boolean doRemove(Set<Integer> ids) throws Exception {
		StringBuffer buf = new StringBuffer(
				"DELETE FROM dept WHERE deptno IN(");
		Iterator<Integer> iter = ids.iterator();
		while (iter.hasNext()) {
			buf.append(iter.next()).append(",");
		}
		buf.delete(buf.length() - 1, buf.length()).append(")");
		this.pstmt = this.conn.prepareStatement(buf.toString());
		return this.pstmt.executeUpdate() == ids.size();
	}

	@Override
	public Dept findById(Integer id) throws Exception {
		Dept vo = null;
		String sql = "SELECT deptno,dname,loc FROM dept WHERE deptno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			vo = new Dept();
			vo.setDeptno(rs.getInt(1));
			vo.setDname(rs.getString(2));
			vo.setLoc(rs.getString(3));
		}
		return vo;
	}

	@Override
	public List<Dept> findAll() throws Exception {
		List<Dept> all = new ArrayList<Dept>();
		String sql = "SELECT deptno,dname,loc FROM dept";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Dept vo = new Dept();
			vo.setDeptno(rs.getInt(1));
			vo.setDname(rs.getString(2));
			vo.setLoc(rs.getString(3));
			all.add(vo);
		}
		return all;
	}

	@Override
	public List<Dept> findAllSplit(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception {
		throw new Exception("此方法未实现");
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		throw new Exception("此方法未实现");
	}

	@Override
	public List<Dept> findAllDetails() throws Exception {
		List<Dept> all = new ArrayList<Dept>();
		String sql = " SELECT d.deptno,d.dname,d.loc,temp.count,temp.avg,temp.sum,temp.max,temp.min,temp.avgyears FROM dept d,( "
				+ "		SELECT deptno dno,COUNT(*) count,TRUNC(AVG(sal)) avg,SUM(sal) sum,MAX(sal) max,MIN(sal) min,TRUNC(AVG(MONTHS_BETWEEN(SYSDATE,hiredate)/12)) avgyears "
				+ "		FROM emp "
				+ "		GROUP BY deptno)temp "
				+ " WHERE d.deptno=temp.dno(+) ";
//		System.out.println("************************************");
//		System.out.println(sql);
//		System.out.println("************************************");
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		Dept vo = null;
		while (rs.next()) {
			vo = new Dept();
			vo.setDeptno(rs.getInt(1));
			vo.setDname(rs.getString(2));
			vo.setLoc(rs.getString(3));
			Map<String, Object> stat = new HashMap<String, Object>();
			stat.put("count", rs.getInt(4));
			stat.put("avg", rs.getDouble(5));
			stat.put("sum", rs.getDouble(6));
			stat.put("max", rs.getDouble(7));
			stat.put("min", rs.getDouble(8));
			stat.put("avgyear", rs.getInt(9));
			vo.setStat(stat);
			all.add(vo);
		}
		return all;
	}

	@Override
	public Dept findByIdDetails(Integer id) throws Exception {
		Dept vo = null;
		String sql = " SELECT d.deptno,d.dname,d.loc,temp.count,temp.avg,temp.sum,temp.max,temp.min,temp.avgyears FROM dept d,( "
				+ "		SELECT deptno dno,COUNT(*) count,TRUNC(AVG(sal)) avg,SUM(sal) sum,MAX(sal) max,MIN(sal) min,TRUNC(AVG(MONTHS_BETWEEN(SYSDATE,hiredate)/12)) avgyears "
				+ "		FROM emp "
				+ "		GROUP BY deptno)temp "
				+ " WHERE d.deptno=temp.dno(+) AND d.deptno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			vo = new Dept();
			vo.setDeptno(rs.getInt(1));
			vo.setDname(rs.getString(2));
			vo.setLoc(rs.getString(3));
			Map<String, Object> stat = new HashMap<String, Object>();
			stat.put("count", rs.getInt(4));
			stat.put("avg", rs.getDouble(5));
			stat.put("sum", rs.getDouble(6));
			stat.put("max", rs.getDouble(7));
			stat.put("min", rs.getDouble(8));
			stat.put("avgyear", rs.getInt(9));
			vo.setStat(stat);
		}
		return vo;
	}

}
