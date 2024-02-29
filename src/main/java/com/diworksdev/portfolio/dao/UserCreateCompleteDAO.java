package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.diworksdev.portfolio.util.DBConnector;
import com.diworksdev.portfolio.util.DateUtil;
import com.diworksdev.portfolio.util.PasswordHasher;

public class UserCreateCompleteDAO {
	
	private DBConnector dbConnector = new DBConnector();
	
	private Connection connection = dbConnector.getConnection();
	
	private DateUtil dateUtil = new DateUtil();
	
	private String sql = "INSERT INTO webaccount (password,user_name,insert_date) VALUES(?,?,?)";
	
	public void cerateUser(String loginPassword, String userName) throws SQLException{
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			// パスワード（loginPassword）をハッシュ化してDBに格納
            String hashedPassword = PasswordHasher.hashPassword(loginPassword);
            
         // ログ出力
            System.out.println("Hashed password: " + hashedPassword);
            System.out.println("User name: " + userName);
            System.out.println("Insert date: " + dateUtil.getDate());
            System.out.println("SQL query: " + sql);
	        
	        preparedStatement.setString(1, hashedPassword);
	        preparedStatement.setString(2, userName);
	        preparedStatement.setString(3, dateUtil.getDate());
	        
	        preparedStatement.execute();
		}catch (SQLException e) {
            // SQL例外の詳細なログ
            System.err.println("SQL Exception occurred: " + e.getMessage());
            e.printStackTrace();
        } catch(Exception e) {
			e.printStackTrace();
		}finally {
			connection.close();
		}
	}
}
