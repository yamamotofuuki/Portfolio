package com.diworksdev.portfolio.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class UserCreateConfirmAction extends ActionSupport implements SessionAware {
	
	private String loginPassword;
	private String userName;
	
	public Map<String,Object> session;
	
	private String passwordErrorMessage;
    private String userNameErrorMessage;
	
	public String execute() {
		
		String result = SUCCESS;

	    // エラーメッセージを初期化
	    passwordErrorMessage = null;
	    userNameErrorMessage = null;
		
		if (loginPassword == null || loginPassword.trim().isEmpty()) {
            setPasswordErrorMessage("パスワードが未入力です");
            result = ERROR;
        }
		
		if (userName == null || userName.trim().isEmpty()) {
            setUserNameErrorMessage("ユーザー名が未入力です");
            result = ERROR;
        }
		
		if (result.equals(SUCCESS)) {
            // 入力が正常ならセッションに値を格納
            session.put("loginPassword",loginPassword);
            session.put("userName",userName);
        }
		
		return result;
	}
	
	public String getLoginPassword() {
		return loginPassword;
	}
	
	public void setLoginPassword(String loginPassword){
		this.loginPassword = loginPassword;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String getPasswordErrorMessage() {
        return passwordErrorMessage;
    }

    public void setPasswordErrorMessage(String passwordErrorMessage) {
        this.passwordErrorMessage = passwordErrorMessage;
    }

    public String getUserNameErrorMessage() {
        return userNameErrorMessage;
    }

    public void setUserNameErrorMessage(String userNameErrorMessage) {
        this.userNameErrorMessage = userNameErrorMessage;
    }

}
