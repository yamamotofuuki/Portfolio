package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.diworksdev.portfolio.util.DBConnector;
import com.diworksdev.portfolio.util.DateUtil;
import com.diworksdev.portfolio.util.PasswordHasher;

public class UpdateCompleteDAO {
	private DBConnector dbConnector = new DBConnector();
	private Connection connection = dbConnector.getConnection();
	private DateUtil dateUtil = new DateUtil();
	
	public void updateUser(String loginPassword, String userName) throws SQLException {
		PreparedStatement preparedStatement = null;
		
		try {
			String hashedPassword = PasswordHasher.hashPassword(loginPassword);
			String sql = "UPDATE webaccount SET password=?, user_name=?, updated_date=? WHERE id";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, hashedPassword);
			preparedStatement.setString(2, userName);
			preparedStatement.setString(3, dateUtil.getDate());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}
}
