package com.diworksdev.portfolio.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.diworksdev.portfolio.dao.LoginDAO;
import com.diworksdev.portfolio.dto.LoginDTO;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {
	
	private String loginUserId;
	private String loginPassword;
	
	public Map<String,Object>session;
	
	private LoginDAO loginDAO = new LoginDAO();
	
	public String execute() {
		String result = ERROR;
		
		// ログイン時はハッシュ化されたパスワードを取得
        //String hashedPassword = PasswordHasher.hashPassword(loginPassword);

        // ユーザーが入力したIDとハッシュ化されたPWに基づくユーザー情報を取得しセッションに格納
        //LoginDTO loginDTO = loginDAO.getLoginUserInfo(loginUserId, hashedPassword);
        LoginDTO loginDTO = loginDAO.getLoginUserInfo(loginUserId, loginPassword);
        session.put("loginUser",loginDTO);
        System.out.println("データベースから取得したハッシュ値: " + loginDTO.getLoginPassword());
        
		//ユーザーが入力したIDとPWに基づくユーザー情報を取得しセッションに格納
		//LoginDTO loginDTO = loginDAO.getLoginUserInfo(loginUserId,loginPassword);
		//session.put("loginUser",loginDTO);

	  //ログイン認証が成功した場合、ユーザーIDをセッションに格納
		if (loginDTO != null && loginDTO.getLoginId() != null) {
			result = SUCCESS;
			session.put("login_user_id",loginDTO.getLoginId());
		}
	  return result;
	}
	
	public String getLoginUserId() {
		return loginUserId;
	}

	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	@Override
	public void setSession(Map<String,Object>session){
		this.session = session;
	}

}

