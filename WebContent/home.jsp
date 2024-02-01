<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="Content-Style-Type" content="text/css"/>
  <meta http-equiv="Content-Script-Type" content="text/javascript"/>
  <meta http-equiv="imagetoolbar" content="no"/>
  <meta name="description" content=""/>
  <meta name="keywords" content=""/>
  <title>Home画面</title>

<style type="text/css">

  body {
  margin: 0;
  padding: 0;
  line-height: 1.6;
  letter-spacing: 1px;
  font-size: 15px;
  color: #333;
  background: linear-gradient(to bottom, #ffffff, #87CEEB, #ffffff);
  
  }
  
  table {
  text-align: center;
  margin: 0 auto;
  }
  
  / * ======== LAYOUT======== * /
  
  #top {
  width: 780px;
  margin: 30px auto;
  }
  
  #top h1 {
  margin-top: 80px;
  }
  
  #main {
  width: 100%;
  height: 500px;
  text-align: center;
  }

  #text-center {
  display: inline-block; text-align: center;
  }
  
  .botton {
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  color: white;
  background-color: blue;
  }

</style>
</head>

<body>

  <div id = "header">
    <div id="pr"></div>
  </div>
  
  <div id="main">
    <div id="top">
      <h1>会計の概念がわかる会計入門</h1>
    </div>
    
    <div id= "text-center">
      <s:form action="HomeAction">
        <s:submit class="botton" value="学習を始める"/>
      </s:form>
      
      <s:if test= "#session. login_user_id != null">
        <p>ログアウトする場合は
          <a href='<s:url action="LogoutAction"/>'>こちら</a>
        </p>
      </s:if>
      
    </div>
  </div>
  
  <div id="footer">
    <div id="pr">
  </div>

</body>
</html>
