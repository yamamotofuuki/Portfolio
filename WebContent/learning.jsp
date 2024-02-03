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
  margin-top: 70px;
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
  
  .accordion-content label {
  text-align: left;
  display: block;
  cursor: pointer;
  }
  .accordion-content label:hover {
  color: blue; /* カーソルが合わさったときの文字色 */
  }
  
  
</style>
</head>

<body>
  
  <div id="main">
    <div id="top">
      <h1>～学習内容を選択して下さい～</h1>
    </div>
    
    <div class="accordion">
    
      <div class="accordion-item">
        <div class="accordion-label" onclick="toggleAccordion(this)">決算に関する<span class="accordion-icon">▼</span></div>
        <div class="accordion-content">
          <s:form action="LearningAction">
            <label onclick="submitForm('確定申告書')">確定申告書</label><br>
            <label onclick="submitForm('決算書')">決算書</label>
          </s:form>
        </div>
      </div>
      
      <div class="accordion-item">
        <div class="accordion-label" onclick="toggleAccordion(this)">会計全般に関する<span class="accordion-icon">▼</span></div>
        <div class="accordion-content">
          
        </div>
      </div>
      
      <div class="accordion-item">
        <div class="accordion-label" onclick="toggleAccordion(this)">勘定科目に関する<span class="accordion-icon">▼</span></div>
        <div class="accordion-content">
          
        </div>
      </div>
    
    </div>
    
    <div>
      <s:form action ="LearningAction">
      
        <!-- インボイスとはボタン -->
         <s:submit name="learningContent" value="インボイスとは"/>
    	
    	 <!-- 消費税とはボタン -->
    	 <s:submit name="learningContent" value="消費税とは"/>     
        
      </s:form>
      
      
      <div>
        <p>トップに戻る場合は<a href='<s:url action="GoHomeAction"/>'>こちら</a></p>
        <p>お気に入り一覧は<a href='<s:url action="MyPageAction"/>'>こちら</a></p>
      </div>
      
    </div>
  </div>
    
</body>
</html>
