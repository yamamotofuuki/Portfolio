package com.diworksdev.portfolio.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LearningConfirmAction extends ActionSupport implements SessionAware {
	
	private String learningContent; // 選択された学習コンテンツ
	
	// LearningActionへのアクセス
    private LearningAction learningAction;
    
    public String execute() {
        // 選択された学習コンテンツをお気に入りに追加
        learningAction.addToFavorites(learningContent);
        return SUCCESS;
    }
    
 // LearningActionへのsetter
    public void setLearningAction(LearningAction learningAction) {
        this.learningAction = learningAction;
    }

@Override
public void setSession(Map<String, Object> arg0) {
	// TODO 自動生成されたメソッド・スタブ
	
}
    

}
