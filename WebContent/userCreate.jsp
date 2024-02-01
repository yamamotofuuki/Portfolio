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
  <title>UserCreate画面</title>

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
  
  /* プレースホルダーテキストの色を変更する為のスタイル*/
  ::placeholder {
  color: rgba(153,153,153,0.5); /* 透明度の指定*/
  }
  
  .error-message {
  color: red;
  font-size: 13px;
  margin-top: 5px;
  }
  
</style>
</head>

<body>

  <div id = "header">
    <div id="pr"></div>
  </div>
  
  <div id="main">
    <div id="top">
      <h3>新規ユーザー登録</h3>
    </div>
    
    <div id="loginform">
      
      <table>
	    <s:form action="UserCreateConfirmAction">
	    
	      <td>
            <s:if test="passwordErrorMessage != null && passwordErrorMessage != ''">
              <div class="error-message">
                <s:property value="passwordErrorMessage" escapeXml="false"/>
              </div>
            </s:if>
          </td>
	    
	    <tr>
	      <td>
	        <label>パスワード:</label>
	      </td>
	      
	      <td><!--半角英数のみ-->
	        <input type="password" maxlength="10" name="loginPassword" placeholder="Pwssword12" pattern="^[a-zA-Z0-9]+$" value="<s:property value='loginPassword'/>"/>

	      </td>
	    </tr>
	    
	      <td>
            <s:if test="userNameErrorMessage != null && userNameErrorMessage != ''">
              <div class="error-message">
                <s:property value="userNameErrorMessage" escapeXml="false" />
              </div>
            </s:if>
          </td>
	    
	    <tr>
	      <td>
	        <label>ユーザー名 :</label>
		  </td>
		  
		  <td><!--ひらがな・漢字のみ指定-->
		    <input type="text" maxlength="10" name="userName" placeholder="山田" pattern="[\u4E00-\u9FFF\u3040-\u309Fー]*" value="<s:property value='userName'/>"/>
		  </td>
		</tr>
		
		<tr>
		  <td>
            <s:submit class="botton" value="確認"/>
          </td>
        </tr>
        
        </s:form>
	  </table>
	  
	  <div>
	    <span>前画面に戻る場合は</span>
	    <a href='<s:url action="HomeAction"/>'>こちら</a>
	  </div>
	 
    </div>
  </div>
  
  <div id="footer">
    <div id="pr"></div>
  </div>
        
</body>
</html>
