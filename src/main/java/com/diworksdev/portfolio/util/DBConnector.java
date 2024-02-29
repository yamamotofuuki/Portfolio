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
	private static String url = System.getenv("JDBC_DATABASE_URL");
	
	/**
	 * データベース接続ユーザ名・パスワード
	 */
	private static String user = System.getenv("DB_USER");
	private static String password = System.getenv("DB_PASSWORD");
	
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
