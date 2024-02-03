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
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <title>BuyItemConfirm画面</title>

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
  
  #main h1 {
  margin-top: 70px;
  }
  
</style>
<script type="text/javascript">
	function submitAction(url) {
		$('form').attr('action', url);
		$('form').submit();
	}
</script>

</head>
<body>
  
  <div id="main">
    <div id="top"></div>
	
    
    <!-- ボタンによるメッセージを表示 -->
    <s:if test="selectedButton != null">
        <h1>「<s:property value="selectedButton" />」</h1>
    </s:if>
	
    <!-- 詳細情報を表示させる -->
	<div>
      <s:if test="detailInformation != null">
        <h2><s:property value="detailInformation" /></h2>
      </s:if>
    </div>
    
    <form action="<s:url action='LearningConfirmAction'/>" method="post" id="favoriteForm">
    
      <tr>
        <td>
          <input type="button" value="戻る" onclick="submitAction('HomeAction')"/>
        </td>
      
        <td>
          <input type="submit" value="お気に入り登録"/>
	    </td>
      
      </tr>
      
    </form>
    
    <div>
      <p>Home画面は<a href='<s:url action ="GoHomeAction"/>'>こちら</a></p>
      <p>マイぺージは<a href='<s:url action ="MyPageAction"/>'>こちら</a></p>
    </div>
  </div>

</body>
</html>
