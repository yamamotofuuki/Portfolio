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
			String sql = "UPDATE webaccount SET password=?, user_name=?, updated_date=? WHERE user_name=?";
			System.out.println("SQL Query: " + sql); // SQLクエリをログに出力
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, hashedPassword); // パスワードを更新
			preparedStatement.setString(2, userName); // ユーザー名を更新
			preparedStatement.setString(3, dateUtil.getDate());
			preparedStatement.setString(4, userName); // ユーザーIDをWHERE句に追加
			
			preparedStatement.executeUpdate();
			System.out.println("Update executed successfully"); // 更新が成功したことをログに出力
			
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
