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
        buttonInfoMap.put("確定申告書", "1月1日から12月31日までの1年間の売上から経費を差し引いた所得税額を計算し「申告」・「納税」するための書類です。\n\n個人事業主の方が行う確定申告には大きく分けて２種類あります。\n・青色申告（特別控除：55万円）\n・白色申告");
        buttonInfoMap.put("決算書", "企業の1年間の収益や費用、資産、負債を計算して損益や財産の状況を確定させ、外部に公表する資料のことです。\n\n主に社外の利害関係者（株主、取引先等）に、\n会社の財政状態と経営成績を報告することを目的としています。\n\nまた、正式には決算書ではなく「財務諸表」や「計算書類」といいます。");
        buttonInfoMap.put("貸借対照表", "貸借対照表の左側（借方〈かりかた〉）には、\n企業が保有する「資産」が記載されます。\n一方、貸借対照表の右側（貸方〈かしかた〉）には、\n資産を調達する為の資金源泉として「負債」と「純資産」が記載されます。\n\n※例えば、3月決算企業の貸借対照表では、\n3月31日時点での資産や負債の残高を確認することができます。\n\n貸借対照表は、左右が一致している必要があることから、\nバランスシート (B/S)とも呼ばれています。");
        buttonInfoMap.put("損益計算書", "損益計算書は会社がある一定期間で、\nどれくらいの「収益」をあげて、どれくらいの「費用」を負担し、\n結果的にいくら『利益』が出たのかを確認できます。\n\n会社の１年間の経営状況を判断するうえで用いられる財務諸表の1つです。");
        buttonInfoMap.put("勘定科目", "");
        buttonInfoMap.put("", "");
        buttonInfoMap.put("", "");
        
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
