package com.diworksdev.portfolio.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteComfirmAction extends ActionSupport implements SessionAware {
	private String loginPassword;
	private String userName;
	private Map<String, Object> session;
	
	@Override
	public String execute() {
		
		// セッションからログインユーザーの情報を取得
		loginPassword = (String) session.get("loginPassword");
		userName = (String) session.get("login_user_name");
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
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
}
