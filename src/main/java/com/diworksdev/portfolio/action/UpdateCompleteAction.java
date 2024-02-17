package com.diworksdev.portfolio.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.diworksdev.portfolio.dao.UpdateCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateCompleteAction extends ActionSupport implements SessionAware {
	
	private UpdateCompleteDAO updateCompleteDAO = new UpdateCompleteDAO();
	private Map<String,Object> session;
	
	@Override
	public String execute(){
		System.out.println("UpdateCompleteAction execute() called");
		if(session != null && session.containsKey("loginPassword") && session.containsKey("userName")) {
			System.out.println("Session contains loginUser");
			
			String loginPassword = (String) session.get("loginPassword");
			String userName = (String) session.get("userName");
			System.out.println("LoginPassword: " + loginPassword);
			System.out.println("UserName: " + userName);
			
			try {
				updateCompleteDAO.updateUser(loginPassword, userName);
				System.out.println("User update successful");
				return SUCCESS;
			}catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL Exception occurred");
				return ERROR;
			}
			
		}else {
			System.out.println("Session does not contain loginPassword or userName");
			return ERROR;
		}
	}
	
	@Override
	public void setSession(Map<String,Object>session){
		this.session = session;
	}

}