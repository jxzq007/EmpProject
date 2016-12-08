package org.zhangqing.dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String	DBDRIVER	= "oracle.jdbc.driver.OracleDriver";
	private static final String	DBURL		= "jdbc:oracle:thin:@localhost:1521:ORCL";
	private static final String	DBUSER		= "scott";
	private static final String	DBPASSWORD	= "tiger";
	private Connection			conn;

	public DatabaseConnection() {
		try {
			Class.forName(DBDRIVER);
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return this.conn;
	}

	public void close() {
		if (this.conn != null) {
			try {
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
