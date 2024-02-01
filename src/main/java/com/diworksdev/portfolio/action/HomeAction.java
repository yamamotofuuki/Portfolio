package com.diworksdev.portfolio.action;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware{
	public Map<String, Object> session;
	
	public String execute() {
		String result = "login";
		
		//ログイン済判定を行う
		if (session.containsKey("login_user_id")) {
			
			result = SUCCESS;
		}
		return result;
	}
	
	@Override
	public void setSession(Map<String, Object>session) {
		this.session = session;
	}
	
	public Map<String, Object> getSession() {
		return this.session;
	}

}
