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
  <title>UserCreateConfirm画面</title>
  
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
  
  #loginform {
  width: 500px;
  margin: 30px auto;
  padding: 15px;
  border: 1px solid black;
  border-radius: 5px;
  }
  
  .botton {
  cursor: pointer;
  }
  
</style>
</head>

<body>

  <div id ="header">
    <div id="pr"></div>
  </div>
  
  <div id="main">
    <div id="top">
      <h3>登録する内容は以下でよろしいですか。</h3>
    </div>
    
    <div id="loginform">

    <table>
    
    <s:form action="UserCreateCompleteAction">
    
    <tr id="box">
      <td>
        <label>パスワード:</label>
      </td>
      
      <td id="passwordField">
        <s:property value="loginPassword" escapeXml="false"/>
      </td>
    </tr>
    
    <tr id="box">
      <td>
        <label>ユーザー名:</label>
      </td>
      
      <td>
        <s:property value="userName" escapeXml="false"/>
      </td>
    </tr>
    
    <tr>
      <td>
        <s:submit class="botton" value="完了"/>
      </td>
    </tr> 
    
    </s:form>
    </table>
    </div>
    
  </div>
  
  <div id="footer">
    <div id="pr"></div>
  </div>

</body>
</html>
