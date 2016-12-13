package org.zhangqing.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.zhangqing.dao.IEmpDAO;
import org.zhangqing.vo.Dept;
import org.zhangqing.vo.Emp;

public class EmpDAOImpl implements IEmpDAO {
	private Connection			conn;
	private PreparedStatement	pstmt;

	public EmpDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean doCreate(Emp vo) throws Exception {
		String sql = "INSERT INTO emp(empno,ename,job,hiredate,sal,comm,mgr,deptno) VALUES(?,?,?,?,?,?,?,?)";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getEmpno());
		this.pstmt.setString(2, vo.getEname());
		this.pstmt.setString(3, vo.getJob());
		this.pstmt.setDate(4, new java.sql.Date(vo.getHiredate().getTime()));
		this.pstmt.setDouble(5, vo.getSal());
		this.pstmt.setDouble(6, vo.getComm());
		if (vo.getMgr() != null) {
			this.pstmt.setInt(7, vo.getMgr().getEmpno());
		} else {
			this.pstmt.setNull(7, Types.NULL);
		}
		if (vo.getDept() != null) {
			this.pstmt.setInt(8, vo.getDept().getDeptno());
		} else {
			this.pstmt.setNull(8, Types.NULL);
		}
		return this.pstmt.executeUpdate() > 0;
	}

	@Override
	public boolean doUpdate(Emp vo) throws Exception {
		String sql = "UPDATE emp SET ename=?,job=?,hiredate=?,sal=?,comm=?,mgr=?,deptno=? WHERE empno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getEname());
		this.pstmt.setString(2, vo.getJob());
		this.pstmt.setDate(3, new java.sql.Date(vo.getHiredate().getTime()));
		this.pstmt.setDouble(4, vo.getSal());
		this.pstmt.setDouble(5, vo.getComm());
		if (vo.getMgr() != null) {
			this.pstmt.setInt(6, vo.getMgr().getEmpno());
		} else {
			this.pstmt.setInt(6, Types.NULL);
		}
		if (vo.getDept() != null) {
			this.pstmt.setInt(7, vo.getDept().getDeptno());
		} else {
			this.pstmt.setNull(7, Types.NULL);
		}
		this.pstmt.setInt(8, vo.getEmpno());
		return this.pstmt.executeUpdate() > 0;
	}

	@Override
	public boolean doRemove(Set<Integer> ids) throws Exception {
		StringBuffer buf = new StringBuffer("DELETE FROM emp WHERE empno IN(");
		Iterator<Integer> iter = ids.iterator();
		while (iter.hasNext()) {
			buf.append(iter.next()).append(",");
		}
		buf.delete(buf.length() - 1, buf.length()).append(")");
		this.pstmt = this.conn.prepareStatement(buf.toString());
		return this.pstmt.executeUpdate() == ids.size();
	}

	@Override
	public Emp findById(Integer id) throws Exception {
		String sql = "SELECT empno,ename,job,hiredate,sal,comm FROM emp WHERE empno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		Emp vo = null;
		if (rs.next()) {
			vo = new Emp();
			vo.setEmpno(rs.getInt(1));
			vo.setEname(rs.getString(2));
			vo.setJob(rs.getString(3));
			vo.setHiredate(rs.getDate(4));
			vo.setSal(rs.getDouble(5));
			vo.setComm(rs.getDouble(6));
		}
		return vo;
	}

	@Override
	public List<Emp> findAll() throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = "SELECT empno,ename,job,hiredate,sal,comm FROM emp";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Emp vo = new Emp();
			vo.setEmpno(rs.getInt(1));
			vo.setEname(rs.getString(2));
			vo.setJob(rs.getString(3));
			vo.setHiredate(rs.getDate(4));
			vo.setSal(rs.getDouble(5));
			vo.setComm(rs.getDouble(6));
			all.add(vo);
		}
		return all;
	}

	@Override
	public List<Emp> findAllSplit(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = "SELECT * FROM(SELECT empno,ename,job,hiredate,sal,comm,ROWNUM rn FROM emp WHERE "
				+ column + " LIKE ? AND ROWNUM<=? )temp WHERE temp.rn>?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setInt(2, currentPage * lineSize);
		this.pstmt.setInt(3, (currentPage - 1) * lineSize);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Emp vo = new Emp();
			vo.setEmpno(rs.getInt(1));
			vo.setEname(rs.getString(2));
			vo.setJob(rs.getString(3));
			vo.setHiredate(rs.getDate(4));
			vo.setSal(rs.getDouble(5));
			vo.setComm(rs.getDouble(6));
			all.add(vo);
		}
		return all;
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		String sql = "SELECT COUNT(*) FROM emp WHERE " + column + " LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}

	@Override
	public void doRemoveByDeptno(Set<Integer> ids) throws Exception {
		StringBuffer buf = new StringBuffer("DELETE FROM emp WHERE deptno IN(");
		Iterator<Integer> iter = ids.iterator();
		while (iter.hasNext()) {
			buf.append(iter.next()).append(",");
		}
		buf.delete(buf.length() - 1, buf.length()).append(")");
		this.pstmt = this.conn.prepareStatement(buf.toString());
		this.pstmt.executeUpdate();
	}

	@Override
	public List<Emp> findAllSplitDetails(String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = "SELECT * FROM(SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm,m.empno mno,m.ename mname,d.deptno dno,d.dname dna,ROWNUM rn FROM emp e,emp m,dept d WHERE e.mgr=m.empno(+) AND e.deptno=d.deptno(+) AND e."
				+ column + " LIKE ? AND ROWNUM<=? )temp WHERE temp.rn>?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setInt(2, currentPage * lineSize);
		this.pstmt.setInt(3, (currentPage - 1) * lineSize);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Emp vo = new Emp();
			vo.setEmpno(rs.getInt(1));
			vo.setEname(rs.getString(2));
			vo.setJob(rs.getString(3));
			vo.setHiredate(rs.getDate(4));
			vo.setSal(rs.getDouble(5));
			vo.setComm(rs.getDouble(6));
			Emp mgr = new Emp();
			mgr.setEmpno(rs.getInt(7));
			mgr.setEname(rs.getString(8));
			vo.setMgr(mgr);
			Dept dept = new Dept();
			dept.setDeptno(rs.getInt(9));
			dept.setDname(rs.getString(10));
			vo.setDept(dept);
			all.add(vo);
		}
		return all;
	}

	@Override
	public Emp findByIdDetails(Integer id) throws Exception {
		String sql = "SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm,m.empno mno,m.ename mname,d.deptno dno,d.dname dna FROM emp e,emp m,dept d WHERE e.mgr=m.empno(+) AND e.deptno=d.deptno(+) AND e.empno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		Emp vo = null;
		if (rs.next()) {
			vo = new Emp();
			vo.setEmpno(rs.getInt(1));
			vo.setEname(rs.getString(2));
			vo.setJob(rs.getString(3));
			vo.setHiredate(rs.getDate(4));
			vo.setSal(rs.getDouble(5));
			vo.setComm(rs.getDouble(6));
			Emp mgr = new Emp();
			mgr.setEmpno(rs.getInt(7));
			mgr.setEname(rs.getString(8));
			vo.setMgr(mgr);
			Dept dept = new Dept();
			dept.setDeptno(rs.getInt(9));
			dept.setDname(rs.getString(10));
			vo.setDept(dept);
		}
		return vo;
	}

	@Override
	public List<Emp> findAllByDept(Integer id,String column, String keyWord,
			Integer currentPage, Integer lineSize) throws Exception {
		List<Emp> all = new ArrayList<Emp>();
		String sql = "SELECT * FROM(SELECT e.empno,e.ename,e.job,e.hiredate,e.sal,e.comm,m.empno mno,m.ename mname,d.deptno dno,d.dname dna,ROWNUM rn FROM emp e,emp m,dept d WHERE e.mgr=m.empno(+) AND e.deptno=d.deptno(+) AND e.deptno=? AND e."
				+ column + " LIKE ? AND ROWNUM<=? )temp WHERE temp.rn>?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		this.pstmt.setString(2, "%" + keyWord + "%");
		this.pstmt.setInt(3, currentPage * lineSize);
		this.pstmt.setInt(4, (currentPage - 1) * lineSize);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Emp vo = new Emp();
			vo.setEmpno(rs.getInt(1));
			vo.setEname(rs.getString(2));
			vo.setJob(rs.getString(3));
			vo.setHiredate(rs.getDate(4));
			vo.setSal(rs.getDouble(5));
			vo.setComm(rs.getDouble(6));
			Emp mgr = new Emp();
			mgr.setEmpno(rs.getInt(7));
			mgr.setEname(rs.getString(8));
			vo.setMgr(mgr);
			Dept dept = new Dept();
			dept.setDeptno(rs.getInt(9));
			dept.setDname(rs.getString(10));
			vo.setDept(dept);
			all.add(vo);
		}
		return all;
	}

}
