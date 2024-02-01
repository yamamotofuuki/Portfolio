package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.diworksdev.portfolio.util.DBConnector;
import com.diworksdev.portfolio.util.DateUtil;

public class UserCreateCompleteDAO {
	
	private DBConnector dbConnector = new DBConnector();
	
	private Connection connection = dbConnector.getConnection();
	
	private DateUtil dateUtil = new DateUtil();
	
	private String sql = "INSERT INTO webaccount (password,user_name,insert_date) VALUES(?,?,?)";
	
	public void cerateUser(String loginPassword, String userName) throws SQLException{
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
	        
	        preparedStatement.setString(1, loginPassword);
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
