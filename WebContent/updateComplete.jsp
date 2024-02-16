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
<title>アカウント編集完了画面</title>

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
  }  
  
</style>

</head>
<body>

  <h1>更新が完了しました。</h1>
  
  <s:form action="LoginAction">
    <input type="submit" class="botton" value="完了" />
  </s:form>


</body>
</html>