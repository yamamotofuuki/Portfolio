package com.diworksdev.portfolio.action;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

public class LearningAction extends ActionSupport {
    
    private Map<String, Object> session;
    
    private String learningContent;
    private String detailInformation;
    private String selectedButton;
    
 // 各ボタンの情報を格納するMap
    private static final Map<String, String> buttonInfoMap = new HashMap<>();
    
    static {
        // ボタンごとの情報をMapに初期化
        buttonInfoMap.put("確定申告書", "1年間の売上から経費を差し引いた所得税額を計算し申告・納税するための書類です。");
        buttonInfoMap.put("決算書", "一定期間の経営状態や財務状況を示す財務諸表のことです。正式には決算書ではなく「財務諸表」や「計算書類」といいます。");
        
    }

    public String execute() {
    	// 選択されたボタンに基づいてMapから情報を取得
        detailInformation = buttonInfoMap.get(learningContent);
        selectedButton = learningContent;

        // 詳細情報をセッションに保存
        if (session != null) {
            session.put("detailInformation", detailInformation);
            session.put("selectedButton", selectedButton);
        }

        return SUCCESS;
    }

    public String getDetailInformation() {
        return detailInformation;
    }
    
    public String getSelectedButton() {
        return selectedButton;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public void setLearningContent(String learningContent) {
        this.learningContent = learningContent;
    }
}
