package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.diworksdev.portfolio.util.DBConnector;
import com.diworksdev.portfolio.util.DateUtil;
import com.diworksdev.portfolio.util.PasswordHasher;

public class UserCreateCompleteDAO {
	
	private DBConnector dbConnector = new DBConnector();
	
	private Connection connection;
	
	private DateUtil dateUtil = new DateUtil();
	
	private String sql = "INSERT INTO webaccount (password,user_name,insert_date) VALUES(?,?,?)";
	
	public void cerateUser(String loginPassword, String userName) throws SQLException{
		
		try {
			// コネクションを取得
            connection = dbConnector.getConnection();
            
            // コネクションがnullでないことを確認
            if (connection != null) {
                System.out.println("Database connection established successfully.");
            } else {
                System.out.println("Failed to establish database connection.");
                return; // コネクションがnullの場合は処理を終了
            }
			
			// トランザクション開始
            connection.setAutoCommit(false);
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			// パスワード（loginPassword）をハッシュ化してDBに格納
            String hashedPassword = PasswordHasher.hashPassword(loginPassword);
            
	        preparedStatement.setString(1, hashedPassword);
	        preparedStatement.setString(2, userName);
	        //preparedStatement.setString(3, dateUtil.getDate());
	        preparedStatement.setTimestamp(3, Timestamp.valueOf(dateUtil.getDate())); // Timestamp型に変換
	        
	        System.out.println("Login password: " + loginPassword);
	        System.out.println("User name: " + userName);
	        System.out.println("Insert date: " + dateUtil.getDate());
	        
	        preparedStatement.executeUpdate();
	        
	     // コミット
            connection.commit();
            
		}catch (SQLException e) {
	        // エラーが発生した場合はロールバック
	        try {
	            if (connection != null) {
	                connection.rollback();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	        e.printStackTrace();
	    } finally {
	        try {
	            if (connection != null) {
	                if (!connection.getAutoCommit()) { 
	                    connection.rollback();
	                }
	                connection.setAutoCommit(true);
	                connection.close(); // コネクションをクローズ
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
        }
	}
}