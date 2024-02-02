package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.diworksdev.portfolio.dto.LoginDTO;
import com.diworksdev.portfolio.util.DBConnector;
import com.diworksdev.portfolio.util.PasswordHasher;

public class LoginDAO {
	
	private DBConnector dbConnector = new DBConnector();
	private Connection connection = dbConnector.getConnection();
	
	//指定されたログインIDとパスワードに対するユーザー情報を取得
	public LoginDTO getLoginUserInfo(String loginUserId, String loginPassword) {
		
		LoginDTO loginDTO = new LoginDTO();
		
		String sql = "SELECT * FROM webaccount where user_name=?";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1,loginUserId);
			ResultSet resultSet = preparedStatement.executeQuery();

			// 結果が存在する場合、ユーザー情報をDTOに格納
			if(resultSet.next()) {
				
				String hashedPassword = resultSet.getString("password");
				//System.out.println("DBのハッシュ：" + hashedPassword);
				//System.out.println("入力されたパスワード：" + loginPassword);
				//System.out.println("照合結果：" + PasswordHasher.checkPassword(loginPassword, hashedPassword));
	
				// 比較したい平文の値（loginPassword）と、DBから取得したハッシュ化された値（hashedPassword）を照合
                if (PasswordHasher.checkPassword(loginPassword, hashedPassword)) {
                    loginDTO.setLoginId(resultSet.getString("user_name"));
                    loginDTO.setLoginPassword(hashedPassword);
                }
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return loginDTO;
	}

}
