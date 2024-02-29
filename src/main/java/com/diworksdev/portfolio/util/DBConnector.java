package com.diworksdev.portfolio.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	
	/**
	 * JDBC ドライバー名
	 */
	private static String driverName = "org.postgresql.Driver";
	
	/**
	 * データベース接続 URL
	 */
	private static String url = "jdbc:postgresql://ec2-44-211-104-233.compute-1.amazonaws.com:5432/d73aca8gtbjr00";
	
	/**
	 * データベース接続ユーザ名・パスワード
	 */
	private static String user = "lyksuhktrvypwd";
	private static String password = "0adabdc7e3eb1f3f8a67bf2e39f8bc8634852992fdb2c4c5966dd6f274b241cf";
	
	public Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName(driverName);
			con = (Connection) DriverManager.getConnection(url,user,password);
		}catch(ClassNotFoundException e ) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
}
