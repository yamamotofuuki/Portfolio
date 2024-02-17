package com.diworksdev.portfolio.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.diworksdev.portfolio.dao.UpdateCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateCompleteAction extends ActionSupport implements SessionAware {
	
	private UpdateCompleteDAO updateCompleteDAO = new UpdateCompleteDAO();
	private Map<String,Object> session;
	
	// 追加：ユーザーIDを保持する変数
	private Integer userId;
	
	public Integer getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		if (userId != null && !userId.isEmpty()) {
			this.userId = Integer.parseInt(userId);
		}
	}
	
	@Override
	public String execute(){
		
		if(session != null) {
			System.out.println("userId: " + session.get("userId"));
			System.out.println("loginPassword: " + session.get("loginPassword"));
			System.out.println("userName: " + session.get("userName"));
		} else {
			System.out.println("Session is null");
		}
		
		System.out.println("UpdateCompleteAction execute() called");
		if(session != null && session.containsKey("userId") && session.containsKey("loginPassword") && session.containsKey("userName")) {
			System.out.println("Session contains loginUser");
			
			// ユーザーIDを取得
			userId = Integer.parseInt((String) session.get("login_user_id"));
			System.out.println("セッションから取得したユーザーID: " + session.get("userId"));
			
			String loginPassword = (String) session.get("loginPassword");
			String userName = (String) session.get("userName");
			System.out.println("LoginPassword: " + loginPassword);
			System.out.println("UserName: " + userName);
			
			try {
				// updateUserメソッドにユーザーIDを渡す
				updateCompleteDAO.updateUser(loginPassword, userName, userId);
				System.out.println("User update successful");
				return SUCCESS;
			}catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL Exception occurred");
				return ERROR;
			}
			
		}else {
			System.out.println("Session does not contain userId, loginPassword, or userName");
			return ERROR;
		}
	}
	
	@Override
	public void setSession(Map<String,Object> session){
		this.session = session;
	}
	
}
