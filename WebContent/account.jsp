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
  <title>アカウント管理画面</title>
  
<script>

function changeAction(action) {
	document.getElementById('accountForm').action = action;
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
  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5); /* テキストに影をつける */
  }
  
  #loginform {
  width: 500px;
  margin: 30px auto;
  padding: 15px;
  border: 1px solid black;
  border-radius: 5px;
  }
  
  .button-container {
  display: flex;
  align-items: center; /* ボタンを中央揃え */
  }
  
  .button-group {
   margin-left: 50px; /* ボタングループを右端に寄せる */
   }
   
   .back{
   margin-left: 190px; /* バックボタンを右端に寄せる */
   }
  
  .botton {
  cursor: pointer;
  }
  
  .botton1 {
  padding: 5px 10px;
  cursor: pointer;
  color: white;
  background-color: blue;
  border-radius: 5px;
  border: none;
  }
  
  .botton2 {
  padding: 5px 10px;
  cursor: pointer;
  color: white;
  background-color: red;
  border-radius: 5px;
  border: none;
  }
  
  .error-message {
  color: red;
  font-size: 13px;
  margin-top: 5px;
  }
  
  
</style>
  
</head>
<body>
 <div id="main">
 <h1>アカウント管理</h1>

  <div id="loginform">
  
    <form id="accountForm" method="post">
      
        <!-- 取得したユーザー情報を表示 -->
        <s:if test="passwordErrorMessage != null && passwordErrorMessage != ''">
          <div class="error-message">
            <s:property value="passwordErrorMessage" escapeXml="false"/>
          </div>
        </s:if>
        <p>パスワード: <input type="password" maxlength="10" name="loginPassword" pattern="^[a-zA-Z0-9]+$" placeholder="新しいパスワードを入力" /></p>
        
        <s:if test="userNameErrorMessage != null && userNameErrorMessage != ''">
          <div class="error-message">
            <s:property value="userNameErrorMessage" escapeXml="false" />
          </div>
        </s:if>
        <p>ユーザー名: <input type="text" maxlength="10" name="userName" pattern="[\u4E00-\u9FFF\u3040-\u309Fー]*" value="<%= session.getAttribute("login_user_name") %>" /></p>
        
        <div class="button-container">
          <div class="back">
            <button type="button" class="botton" onclick="history.back();">戻る</button>
          </div>
        
          <div class="button-group">
            <input type="submit" class="botton1" value="編集" onclick="changeAction('UpdateConfirmAction')" />
            <input type="submit" class="botton2" value="削除" onclick="changeAction('DeleteComfirmAction')" />
          </div>
        </div>
    
    </form>
  
  </div>
 </div>

</body>
</html>
