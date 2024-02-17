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
	    
	    String sql = "SELECT id, user_name, password FROM webaccount WHERE user_name=?";
	    
	    try {
	        PreparedStatement preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1, loginUserId);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet.next()) {
	            String hashedPassword = resultSet.getString("password");
	            if (PasswordHasher.checkPassword(loginPassword, hashedPassword)) {
	                loginDTO.setLoginId(resultSet.getString("id")); // ユーザーIDをセット
	                loginDTO.setLoginPassword(hashedPassword);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return loginDTO;
	}


}
