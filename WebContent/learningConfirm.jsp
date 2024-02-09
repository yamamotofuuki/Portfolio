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
  
  #main h3 {
  text-align: left;
  margin-left: 20px;
  
  }
  
  #main .box {
  
  max-width: 700px;
  margin: 0 auto;
  border: 1px solid transparent;
  padding: 20px; 
  box-sizing: border-box; /* ボーダーボックスモデル */
  }
  
</style>
<script type="text/javascript">

function submitAction(url) {
	$('form').attr('action', url);
	$('form').submit();
}

//ページロード時に実行される関数
window.onload = function() {
    // ローカルストレージからお気に入りリストを取得する
    var favorites = JSON.parse(localStorage.getItem('favorites')) || [];
    
 // 各ボタンの状態を更新する
    favorites.forEach(function(item) {
        var addToFavoritesButton = document.getElementById('addToFavoritesButton_' + item.selectedButton);
        console.log("Button ID:", 'addToFavoritesButton_' + item.selectedButton);
        console.log("Button Element:", addToFavoritesButton);
        if (addToFavoritesButton) {
            addToFavoritesButton.value = "お気に入り解除";
            addToFavoritesButton.onclick = function() {
                removeFromFavorites(item.selectedButton);
            };
        }
    });
};

	// お気に入り登録関数
	function addToFavorites(selectedButton, detailInformation) {
	    
	    // ローカルストレージから既存のお気に入りリストを取得する
	    var favorites = JSON.parse(localStorage.getItem('favorites')) || [];
	    console.log("addToFavorites()が呼び出されました")
	    
        // HTMLの該当する要素から値を取得
        var selectedButtonValue = document.getElementById('selectedButton').innerText;
        var detailInformationValue = document.getElementById('detailInformation').innerText;
        console.log("詳細取得！");
	    
	    // お気に入りオブジェクトを作成してリストに追加する
	    var favoriteItem = { selectedButton: selectedButtonValue, detailInformation: detailInformationValue };
	    favorites.push(favoriteItem);
	    console.log("お気に入り！")
	    
	    // 更新されたお気に入りリストをローカルストレージに保存する
	    localStorage.setItem('favorites', JSON.stringify(favorites));
	    console.log("保存！")
	    
	    // ボタンを「お気に入り解除」に変更する
	    var addToFavoritesButton = document.getElementById('addToFavoritesButton');
	    addToFavoritesButton.value = "お気に入り解除";
	    addToFavoritesButton.onclick = function() {
	        removeFromFavorites(selectedButton);
	    };
	    
	    alert('お気に入りに追加しました！');
	}

	// お気に入り解除関数
	function removeFromFavorites(selectedButtonValue) {
	    // ローカルストレージから既存のお気に入りリストを取得する
	    var favorites = JSON.parse(localStorage.getItem('favorites')) || [];
	    console.log("addToFavorites()が呼び出されました!")
	    
	    // 指定されたselectedButtonを持つアイテムを検索して削除する
	    favorites = favorites.filter(function(item) {
	    	console.log("削除するボタンのID: ", selectedButtonValue);
	        console.log("お気に入りリストの中のボタンのID: ", item.selectedButton);
	        
	        return item.selectedButtonValue !== selectedButtonValue;
	    });

	    // 更新されたお気に入りリストをローカルストレージに保存する
	    localStorage.setItem('favorites', JSON.stringify(favorites));
	    console.log("いる？");
	    
	    // ボタンを「お気に入り登録」に戻す
	    var addToFavoritesButton = document.getElementById('addToFavoritesButton');
	    addToFavoritesButton.value = "お気に入り登録";
	    addToFavoritesButton.onclick = function() {
	        addToFavorites(selectedButton, detailInformation);
	    };
	    
	    alert('お気に入りから削除しました！');
	}
		
</script>

</head>
<body>
  
  <div id="main">
    <div id="top"></div>
	
    
    <!-- ボタンによるメッセージを表示 -->
    <s:if test="selectedButton != null">
        <h1 id="selectedButton">「<s:property value="selectedButton" />」</h1>
    </s:if>
	
    <!-- 詳細情報を表示させる -->
	<div class="box">
      <s:if test="detailInformation != null">
        <h3 id="detailInformation" style="white-space: pre-line;"><s:property value="detailInformation" /></h3>
      </s:if>
    </div>
    
    <form  method="post" id="addToFavoritesForm">
    
      <tr>
        <td>
          <input type="button" value="戻る" onclick="submitAction('HomeAction')"/>
        </td>
      
        <td>
          <input type="button" id="addToFavoritesButton" value="お気に入り登録" onclick="addToFavorites()"/>
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
