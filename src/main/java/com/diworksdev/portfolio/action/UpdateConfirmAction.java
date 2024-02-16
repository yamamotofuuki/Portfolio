package com.diworksdev.portfolio.action;

import com.opensymphony.xwork2.ActionSupport;

public class UpdateConfirmAction extends ActionSupport  {
	
	private String loginPassword;
	private String userName;
	
    public String execute() {
    	return SUCCESS;
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
