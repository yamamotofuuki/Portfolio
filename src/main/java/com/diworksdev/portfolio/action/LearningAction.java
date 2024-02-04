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
        buttonInfoMap.put("勘定科目", "取引で発生するお金の流れに対して、「何故その入金があったのか」\n「何に使われたのか」を示す為に用いる見出しのようなもの。\n\n（例）\n・毎月の家賃代を示す「地代家賃」\n・インターネット利用料を示す「通信費」 等");
        buttonInfoMap.put("総勘定元帳", "元帳とも呼ばれ、各勘定科目ごとの取引が記録されている会計帳簿のこと。\n会社の会計業務の中でも必ず作成しなければならない、主要簿の一つです。");
        buttonInfoMap.put("資本金", "会社を運営するにあたって元手となる資金のこと。\n\n法人設立時であれば、\n株主等の出資者から募った資金や、経営者の自己資金が資本金となります。");
        buttonInfoMap.put("固定資産", "基本的に1年以上「保有」したり「使用」したりする資産の事を指します。\n原則として取得価格が10万円以上の備品等を購入した場合は、\n固定資産として計上します。");
        buttonInfoMap.put("減価償却", "「固定資産」は取得した年に一括で全額経費計上せず、数年に渡り徐々に\n経費計上していく必要があります。\n時間の経過と共に資産価値が減少すると考えられるからでしょうか。\n\nこれが減価償却です。\n減価償却は難しい～と、頭を悩まされる担当者様もいらっしゃるでしょう。\n\nしかし、減価償却する最大のメリットは、やはり節税になることですね。\n一括償却すると翌年の利益額を抑制できず、増税されてしまうからです。");
        buttonInfoMap.put("振替伝票", "すべての取引を記載した帳簿のことを「仕訳帳」と言いますが、\n仕訳帳は日付順に記載していく必要がある為、後に順番が前後してしまったときに、取引の修正や調整が行いづらいといったデメリットもあります。\n\nその際に「振替伝票」等を作成して総勘定元帳に転記していくという仕組みが伝票制です。");
        buttonInfoMap.put("売掛金", "将来的に取引先から商品やサービスの代金を受取る権利のこと。\n「未払いの状態にある代金」と考えるとイメージしやすいでしょう。");
        buttonInfoMap.put("買掛金", "将来的に取引先から原材料等を仕入れた際の代金を支払う義務があること。\n\n未払金・未払費用との違い\n「未払金」...固定資産や外注費等の仕入に関連しない非継続的な取引の債務\n「未払費用」...給与や家賃等、仕入に関連しない継続的な取引の債務\n\n買掛金も未払金も未払費用も「購入したものの代金の支払義務」です。\n しかしながら、本業の取引に伴うものか否かという違いがあります。");
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
