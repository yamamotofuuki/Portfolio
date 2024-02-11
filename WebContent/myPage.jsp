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
  <title>お気に入り一覧</title>

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
  
  h3 {
      /*list-style: none; リストのマーカーを非表示にする */
      text-align: left;
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
  
  <div id="main">
    <div id="top">
      <h1>～お気に入り一覧～</h1>
    </div>
    
    <div id= "text-center">
    
      <h3 id="favoritesList"></h3>
      
      <div id = "text-right">
        <p>Homeへ戻る場合は<a href ='<s:url action="GoHomeAction"/>'>こちら</a></p>
        <p>ログアウトする場合は<a href='<s:url action="LogoutAction"/>'>こちら</a></p>
      </div>
      
    </div>
  </div>
    
</body>
</html>