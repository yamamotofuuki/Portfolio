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
  <title>アカウント削除確認画面</title>
  
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
  
  #main h2 {
  color: red;
  margin-top: 75px;
  }
  
  #Deleteform {
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
      <h2>本当にアカウントを削除しますか？</h2>
    </div>
    
    <div id="Deleteform">
    
    <s:form action="DeleteCompleteAction">
    
    <table>
    
      <tr>
        <td><label>パスワード:</label></td>
        <td>
          <s:if test="#session['loginPassword'] != null">
            <s:set var="maskedPassword" value="'*****'"/> <!-- パスワードをマスキング -->
            <s:property value="#maskedPassword" />
          </s:if>
        </td>
      </tr>
      
      <tr>
        <td><label>ユーザー名:</label></td>
        <td><s:property value="userName" escapeXml="false"/></td>
      </tr>
       
      <tr>
        <td><button type="button" class="botton" onclick="history.back();">戻る</button></td>
        <td><input type="submit" class="botton" value="はい" /></td>
      </tr>
    </table>
    
    </s:form>
    
    </div>
    
  </div>


</body>
</html>