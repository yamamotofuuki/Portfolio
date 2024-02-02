package com.diworksdev.portfolio.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.diworksdev.portfolio.dao.UserCreateCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class UserCreateCompleteAction extends ActionSupport implements SessionAware {
	
	private String loginPassword;
	private String userName;
	
	public Map<String,Object> session;
	
	private UserCreateCompleteDAO userCreateCompleteDAO = new UserCreateCompleteDAO();

	public String execute() throws SQLException{
		
		// パスワードをハッシュ化してセッションに格納
	    //String hashedPassword = PasswordHasher.hashPassword(loginPassword);
	    //session.put("hashedPassword", hashedPassword);
		
		//DAOを経由して入力された内容をDBに登録
		//userCreateCompleteDAO.cerateUser(loginPassword, userName);
		
		userCreateCompleteDAO.cerateUser(
				session.get("loginPassword").toString(),
				session.get("userName").toString());
		
		String result = SUCCESS;
		return result ;
	}
	
	public String getLoginPassword() {
		return loginPassword;
	}
	
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Override
	public void setSession(Map<String,Object>session){
		this.session = session;
	}
	
}
