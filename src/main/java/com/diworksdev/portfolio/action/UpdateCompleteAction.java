package com.diworksdev.portfolio.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.diworksdev.portfolio.dao.UpdateCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateCompleteAction extends ActionSupport implements SessionAware {
	
	private String loginPassword;
	private String userName;
	
	public Map<String,Object> session;
	
	private UpdateCompleteDAO updateCompleteDAO = new UpdateCompleteDAO();
	
	@Override
	public String execute(){
		
		if(session != null && session.containsKey("loginPassword") && session.containsKey("userName")) {
			
			try {
				updateCompleteDAO.updateUser(session.get("loginPassword").toString(), session.get("userName").toString());
				return SUCCESS;
			}catch (SQLException e) {
				e.printStackTrace();
				return ERROR;
			}
		}else {
			return ERROR;
		}
		
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
