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
  font-size: 50px;
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
  font-size: 23px;
  color: white;
  background-color: blue;
  }
  
  #image img {
  width: 120px;
  margin-top: 60px;
  }
  
  #image {
  float: left;
  margin-right: 0px; /* テキストとの間隔を調整 */
  }
  
  #image2 img{
  margin-top: 0px;
  float: left;
  width: 200px;
  }
  
  #text {
  float: left;
  margin-top: 110px;
  }
  
  #text h3 {
  border-bottom: 2px solid skyblue;
  font-size: 22px;
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
      
      <!-- 画像１ -->
      <div id="image">
        <img src="image/tori_no1.png" alt="ofuse-piyo">
      </div>
      
      <div id="text">
        <h3>会計用語を知れば知るほど更に知りたくなる！？</h3>
        <h3>初学者の基礎を集めた「会計用語」アプリです！</h3><br>
      </div>
      
      <br>
      
      <!-- 画像２ -->
      <div id="image">
        <img src="image/tori_no2.png" alt="ofuse-piyo">
      </div>
      
      <div id="text">
        <h3>学習した会計用語をお気に入り登録し、</h3>
        <h3>[お気に入り一覧]機能で復習ができる！</h3><br>
      </div>
      
      <br>
      
      <!-- 画像３ -->
      <div id="image">
        <img src="image/tori_no3.png" alt="ofuse-piyo">
      </div>
      
      <div id="text">
        <h3>お好きな[ユーザー名・パスワード]で始めれる！</h3><br>
      </div>
      
      <!-- 画像４ -->
      <div id="image2">
        <img src="image/ofuse-piyo.png" alt="ofuse-piyo">
      </div>
      
      <div id="text">
        「学習を始める」からスタート♪
      </div>
      
    </div>
  </div>
  
  <div id="footer">
    <div id="pr">
  </div>

</body>
</html>
