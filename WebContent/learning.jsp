<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="Content-Style-Type" content="text/css"/>
  <meta http-equiv="Content-Script-Type" content="text/javascript"/>
  <meta http-equiv="imagetoolbar"content="no"/>
  <meta name="description" content=""/>
  <meta name="keywords" content=""/>
  <title>学習コンテンツ画面</title>
  
  
  <script>
  function toggleAccordion(label) {
    var item = label.parentNode;
    item.classList.toggle('active');
    var icon = label.querySelector('.accordion-icon');
    icon.textContent = item.classList.contains('active') ? '▲' : '▼';
  }

  function submitForm(learningContent) {
      document.querySelector('form[action="LearningAction"] input[name="learningContent"]').value = learningContent;
      document.querySelector('form[action="LearningAction"]').submit();
    }

  function submitForm(learningContent) {
      document.querySelector('#learningForm input[name="learningContent"]').value = learningContent;
      document.querySelector('#learningForm').submit();
  }
</script>

<style type="text/css">
/ * ========TAG LAYOUT======== * /

  body {
  margin: 0;
  padding: 0;
  line-height: 1.6;
  letter-spacing: 1px;
  font-family: Verdana, Helvetica, sans-serif;
  font-size: 12px;
  color: #333;
  background: #fff;
  }
  
  table {
  text-align: center;
  margin: 0 auto;
  }

/ * ========ID LAYOUT======== * /

  #top {
  width: 780px;
  }

  #main {
  width: 100%;
  height: 500px;
  text-align: center;
  background: linear-gradient(to bottom, #ffffff, #87CEEB, #ffffff);
  }
  
  #main h1 {
  font-size: 40px;
  margin-top: 70px;
  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5); /* テキストに影をつける */
  }
  
  .accordion {
  width: 70%;
  margin: 0 auto;
  }
    
  .accordion-item {
  margin-bottom: 10px;
  }
  
  .accordion-label {
  cursor: pointer;
  padding: 10px;
  background-color: #87CEEB;
  color: #fff;
  font-weight: bold;
  font-size: 20px;
  display: flex;
  justify-content: space-between;
  }
  
  .accordion-content {
  display: none;
  padding: 10px;
  border: 1px solid #87CEEB;
  }

  .accordion-item.active .accordion-content {
  display: block;
  }
  
  .button-none {
   border: none; /* ボタンの枠を取り除く */
   cursor: pointer;
   color: black;
   display: flex;
   font-size: 17px;
   background-color: transparent;  /*ボタンの背景色 */
   }

  .button-none:hover {
   color: blue; 
   }
   
   
  #buttonContainer {
  font-size: 18px;
  display: flex; /* リンク横並びにする */
  justify-content: center; /* 水平方向の中央揃え */
  }
  
  #buttonContainer a {
  margin-right: 30px;/* リンクの間隔を調整する */
  color: black;
  }
  
  #buttonContainer a:hover{
  font-size: 19px;
  color: blue;
  }
  
  #image img {
  width: 120px;
  }
  
</style>
</head>

<body>
  
  <div id="main">
      
    <div id="top">
      <h1>学習内容を選択して下さい</h1>
    </div>
    
    <!-- 画像１ -->
      <div id="image">
        <img src="image/pcgatsugatsu.png" alt="pcgatsugatsu">
      </div>
      
      <div id="text">
        選択して用語をクリック～♪
      </div>
    
    <div class="accordion">
    
      <div class="accordion-item">
        <div class="accordion-label" onclick="toggleAccordion(this)">決算に関する<span class="accordion-icon">▼</span></div>
        <div class="accordion-content">
          <s:form action="LearningAction" id="learningForm">
          
            <button type="submit" name="learningContent" value="確定申告書" class="button-none">確定申告書</button><br>
            <button type="submit" name="learningContent" value="決算書" class="button-none">決算書</button><br>
            <button type="submit" name="learningContent" value="貸借対照表" class="button-none">貸借対照表</button><br>
            <button type="submit" name="learningContent" value="損益計算書" class="button-none">損益計算書</button>
         
          </s:form>
        </div>
      </div>
      
      <div class="accordion-item">
        <div class="accordion-label" onclick="toggleAccordion(this)">会計全般に関する<span class="accordion-icon">▼</span></div>
        <div class="accordion-content">
          <s:form action="LearningAction">
          
            <button type="submit" name="learningContent" value="勘定科目" class="button-none">勘定科目</button><br>
            <button type="submit" name="learningContent" value="総勘定元帳" class="button-none">総勘定元帳</button><br>
            <button type="submit" name="learningContent" value="資本金" class="button-none">資本金</button><br>
            <button type="submit" name="learningContent" value="固定資産" class="button-none">固定資産</button><br>
            <button type="submit" name="learningContent" value="減価償却" class="button-none">減価償却</button><br>
            <button type="submit" name="learningContent" value="振替伝票" class="button-none">振替伝票</button>
            
          </s:form>
        </div>
      </div>
      
      <div class="accordion-item">
        <div class="accordion-label" onclick="toggleAccordion(this)">勘定科目に関する<span class="accordion-icon">▼</span></div>
        <div class="accordion-content">
          <s:form action="LearningAction">
          
            <button type="submit" name="learningContent" value="売掛金" class="button-none">売掛金</button><br>
            <button type="submit" name="learningContent" value="買掛金" class="button-none">買掛金</button><br>
            <button type="submit" name="learningContent" value="事業主貸" class="button-none">事業主貸</button><br>
            <button type="submit" name="learningContent" value="事業主借" class="button-none">事業主借</button><br>
            <button type="submit" name="learningContent" value="役員貸付金" class="button-none">役員貸付金</button><br>
            <button type="submit" name="learningContent" value="役員借入金" class="button-none">役員借入金</button>
            
          </s:form>
        </div>
      </div>
      
      <div class="accordion-item">
        <div class="accordion-label" onclick="toggleAccordion(this)">税金に関する<span class="accordion-icon">▼</span></div>
        <div class="accordion-content">
          <s:form action="LearningAction">
          
            <button type="submit" name="learningContent" value="所得税" class="button-none">所得税</button><br>
            <button type="submit" name="learningContent" value="消費税" class="button-none">消費税</button><br>
            <button type="submit" name="learningContent" value="法人税" class="button-none">法人税</button><br>
            <button type="submit" name="learningContent" value="法人住民税" class="button-none">法人住民税</button><br>
            <button type="submit" name="learningContent" value="法人事業税" class="button-none">法人事業税</button><br>
            <button type="submit" name="learningContent" value="法人税等" class="button-none">法人税等</button>
            
          </s:form>
        </div>
      </div>
      
      <div class="accordion-item">
        <div class="accordion-label" onclick="toggleAccordion(this)">その他<span class="accordion-icon">▼</span></div>
        <div class="accordion-content">
          <s:form action="LearningAction">
          
            <button type="submit" name="learningContent" value="インボイス制度とは" class="button-none">インボイス制度とは</button><br>
            <button type="submit" name="learningContent" value="2割特例" class="button-none">2割特例（経過措置）</button><br>
            <button type="submit" name="learningContent" value="少額特例" class="button-none">少額特例</button><br>
            <button type="submit" name="learningContent" value="電子帳簿保存法" class="button-none">電子帳簿保存法</button>
            
          </s:form>
        </div>
      </div>
    
    </div>
    
    <div>
    
      <div id="buttonContainer">
      
        <p><a href='<s:url action="GoHomeAction"/>'>トップに戻る</a></p>
        <p><a href='<s:url action="MyPageAction"/>'>お気に入り一覧</a></p>
        <p><a href='<s:url action="AccountAction"/>'>アカウント管理</a></p>
        
        <s:if test= "#session. login_user_id != null">
          <p><a href='<s:url action="LogoutAction"/>'>ログアウト</a></p>
        </s:if>
        
      </div>
      
    </div>
  </div>
    
</body>
</html>