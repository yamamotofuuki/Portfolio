<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type"content="text/html; charset=utf-8"/>
  <meta http-equiv="Content-Style-Type"content="text/css"/>
  <meta http-equiv="Content-Script-Type"content="text/javascript"/>
  <meta http-equiv="imagetoolbar"content="no"/>
  <meta name="description"content=""/>
  <meta name="keywords"content=""/>
  <title>アカウント編集確認画面</title>
  
  <script>
    document.addEventListener("DOMContentLoaded", function() {
        
    	var passwordField = document.getElementById('passwordField');
    	var actualPassword = "<s:property value='loginPassword' escapeXml='false'/>"; // パスワードを取得
    	// パスワードの文字数に応じて●を連結
    	var obscuredPassword = '●'.repeat(actualPassword.length);
    	passwordField.innerHTML = obscuredPassword;
    });
  </script>
  
<style type="text/css">
/ * ========TAG LAYOUT======== * /

  body {
  margin: 0;
  padding: 0;
  line-height: 1.6;
  letter-spacing: 1px;
  font-size: 12px;
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
  
  #main h3 {
  margin-top: 75px;
  }
  
  #Updateform {
  width: 500px;
  margin: 30px auto;
  padding: 15px;
  border: 1px solid black;
  border-radius: 5px;
  }
  
  .botton {
  cursor: pointer;
  display: flex;
  justify-content: space-between; /* ボタンを横に均等に配置 */
  }  
  
</style>
</head>

<body>
  
  <div id="main">
    <div id="top">
      <h3>編集する内容は以下でよろしいですか。</h3>
    </div>
    
    <div id="Updateform">
    
    <s:form action="UpdateCompleteAction">
    
    <table>
      <tr>
        <td><label>パスワード:</label></td>
        <td id="passwordField"><s:property value="loginPassword" escapeXml="false"/></td>
      </tr>
      
      <tr>
        <td><label>ユーザー名:</label></td>
        <td><s:property value="userName" escapeXml="false"/></td>
      </tr>
       
      <tr>
        <td><button type="button" class="botton" onclick="history.back();">戻る</button></td>
        <td><input type="submit" class="botton" value="完了" /></td>
      </tr>
    </table>
    
    </s:form>
    
    </div>
    
  </div>
  
</body>
</html>
