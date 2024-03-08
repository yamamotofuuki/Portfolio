package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.diworksdev.portfolio.util.DBConnector;

public class DeleteCompleteDAO {
	
	private DBConnector dbConnector = new DBConnector();
	
	public boolean deleteAccount(String userId) {
		
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		boolean success = false;
		
		try {
			conn = dbConnector.getConnection();
			String sql = "DELETE FROM webaccount WHERE id=?";
			preparedStatement = conn.prepareStatement(sql);
			//preparedStatement.setString(1, userId);
			preparedStatement.setInt(1, Integer.parseInt(userId));//文字列型を整数型に変更
			int rowsDeleted = preparedStatement.executeUpdate();
			
			if (rowsDeleted > 0) {
				success = true; // 削除成功
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				
				if (conn != null) {
					conn.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return success;
	}
}
