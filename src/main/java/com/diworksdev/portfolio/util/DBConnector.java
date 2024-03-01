package com.diworksdev.portfolio.util;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	
	/**
	 * データベース接続 URL
	 */
	private static String url;
	
	/**
	 * データベース接続ユーザ名・パスワード
	 */
	private static String user;
	private static String password;
	
	static {
		try {
			// HerokuのDATABASE_URLから接続情報を取得
			URI dbUri = new URI(System.getenv("DATABASE_URL"));
			user = dbUri.getUserInfo().split(":")[0];
			password = dbUri.getUserInfo().split(":")[1];
			url = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
}
