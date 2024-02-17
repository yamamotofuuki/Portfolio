package com.diworksdev.portfolio.dto;

public class AccountDTO {
	private int userid;
    private String username;
    private String password;
    
    public int getUserid() {
        return userid;
    }
    
    public void setUserId(int userId) {
        this.userid = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
