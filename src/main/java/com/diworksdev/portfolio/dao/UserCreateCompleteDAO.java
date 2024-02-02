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
			
			// パスワードをハッシュ化してデータベースに格納
            String hashedPassword = PasswordHasher.hashPassword(loginPassword);
	        
	        preparedStatement.setString(1, hashedPassword);
	        preparedStatement.setString(2, userName);
	        preparedStatement.setString(3, dateUtil.getDate());
	        
	        preparedStatement.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			connection.close();
		}
	}
}
