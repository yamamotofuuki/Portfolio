package com.diworksdev.portfolio.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.diworksdev.portfolio.dao.AccountDAO;
import com.diworksdev.portfolio.dto.AccountDTO;
import com.opensymphony.xwork2.ActionSupport;

public class AccountAction extends ActionSupport implements SessionAware {
    private Map<String, Object> session;
    private AccountDTO account;

    public String execute() {
        if (session.containsKey("loginUser")) {
            AccountDAO accountDAO = new AccountDAO();
            String userId = (String) session.get("login_user_id");
            account = accountDAO.getUserInfo(userId);
            return SUCCESS;// ログイン済みの場合は成功として処理
        } else {
            return ERROR;
        }
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public AccountDTO getAccount() {
        return account;
    }
}
