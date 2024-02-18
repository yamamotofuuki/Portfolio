package com.diworksdev.portfolio.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.diworksdev.portfolio.dao.DeleteCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteCompleteAction extends ActionSupport implements SessionAware {
	
	private Map<String, Object> session;
	
	public String execute() {
		
		DeleteCompleteDAO deleteCompleteDAO = new DeleteCompleteDAO();
		String userId = (String) session.get("login_user_id");
		
		if (deleteCompleteDAO.deleteAccount(userId)) {
			return SUCCESS;
		}else {
			return ERROR;
		}
		
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
