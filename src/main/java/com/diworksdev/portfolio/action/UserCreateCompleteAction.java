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
    
    // セッションに値を設定するメソッド
    public void setSessionValues() {
        session.put("loginPassword", loginPassword);
        session.put("userName", userName);
    }
    
    // セッションから値を取得するメソッド
    public void getSessionValues() {
        loginPassword = (String) session.get("loginPassword");
        userName = (String) session.get("userName");
    }
    
    public String execute() throws SQLException {
        // セッションから値を取得
        getSessionValues();
        
        UserCreateCompleteDAO userCreateCompleteDAO = new UserCreateCompleteDAO();
        
        // DAOメソッドの呼び出し
        userCreateCompleteDAO.cerateUser(loginPassword, userName);
        
        String result = SUCCESS;
        return result;
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
