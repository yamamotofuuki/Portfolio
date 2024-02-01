package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.diworksdev.portfolio.dto.LoginDTO;
import com.diworksdev.portfolio.util.DBConnector;

public class LoginDAO {
	
	private DBConnector dbConnector = new DBConnector();
	private Connection connection = dbConnector.getConnection();
	
	//指定されたログインIDとパスワードに対するユーザー情報を取得
	public LoginDTO getLoginUserInfo(String loginUserId, String loginPassword) {
		
		LoginDTO loginDTO = new LoginDTO();
		
		String sql = "SELECT * FROM webaccount where user_name=? AND password=?";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1,loginUserId);
			preparedStatement.setString(2,loginPassword);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			// 結果が存在する場合、ユーザー情報をDTOに格納
			if(resultSet.next()) {
				loginDTO.setLoginId(resultSet.getString("user_name"));
				loginDTO.setLoginPassword(resultSet.getString("password"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return loginDTO;
	}

}
