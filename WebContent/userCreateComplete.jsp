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
  <title>UserCreateComplete画面</title>
  
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
  
</style>
</head>

<body>

  <div id="header">
    <div id="pr"></div>
  </div>
  
  <div id="main">
    <div id="top">
      <h3>ユーザーの登録が完了致しました。</h3>
    </div>
    
    <div>
      <div>
        <a href='<s:url action="HomeAction"/>'>ログインへ</a>
      </div>
    </div>
  </div>
  
  <div id="footer">
    <div id="pr"></div>
  </div>
        
</body>
</html>
