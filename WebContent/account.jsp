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
  
  
</style>
  
</head>
<body>
 
  <div id="main">

    <h1>アカウント管理</h1>
    
    <!-- 取得したユーザー情報を表示 -->
    <p>パスワード: <s:property value="account.password" /></p>
    <p>ユーザー名: <s:property value="account.username" /></p>

  </div>

</body>
</html>



