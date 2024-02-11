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
  <title>学習コンテンツ詳細画面</title>

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
  
  /* お気に入り登録ボタンのスタイル */
  #favoriteButtons input[type="button"] {
  padding: 8px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  color: white;
  }
  
  #buttonContainer {
  display: flex; /* ボタンを横並びにする */
  justify-content: center; /* 水平方向の中央揃え */
  }
  
  #addToFavoritesForm input[type="button"] {
  margin-right: 10px; /* ボタン間の間隔 */
  cursor: pointer;
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

    // 選択された項目を取得する
    var selectedButtonElement = document.getElementById('selectedButton');
    var selectedButton = selectedButtonElement ? selectedButtonElement.textContent.replace('「', '').replace('」', '') : null;

    // ボタンを動的に生成する
    var favoriteButtonContainer = document.getElementById('favoriteButtons');

    // 選択された項目に対応するボタンを生成
    if (selectedButton) {
        var button = document.createElement('input');
        button.type = 'button';
        var isFavorite = favorites.some(function(favorite) { return favorite.selectedButton === selectedButton; }); button.value = isFavorite ? 'お気に入り解除' : 'お気に入り登録';
        button.onclick = function() {
            toggleFavorite(selectedButton);
        };

     // ボタンの初期スタイルを設定
        button.style.backgroundColor = isFavorite ? '#3f8fdf' : 'blue';

        // 生成したボタンをコンテナに追加する
        favoriteButtonContainer.appendChild(button);
    }
};

//お気に入りの表示を切り替える関数
function toggleFavorite(selectedButton) {
    var selectedItem = document.getElementById('selectedItem');
    var button = document.querySelector('#favoriteButtons input[type="button"]');

    // ボタンの状態を切り替える
    if (button.value === 'お気に入り登録') {
        addToFavorites(selectedButton);
        button.value = 'お気に入り解除';
        button.style.backgroundColor = '#3f8fdf';
    } else {
        removeFromFavorites(selectedButton);
        button.value = 'お気に入り登録';
        button.style.backgroundColor = 'blue';
    }
}

	// お気に入り登録関数
	function addToFavorites(selectedButton) {
	    
	    // ローカルストレージから既存のお気に入りリストを取得する
	    var favorites = JSON.parse(localStorage.getItem('favorites')) || [];
	    console.log("addToFavorites()が呼び出されました")
	    
        // HTMLの該当する要素から値を取得
        var selectedButtonValue = selectedButton;
        var detailInformationValue = document.getElementById('detailInformation').innerText;
        console.log("詳細取得！");
	    
	    // お気に入りオブジェクトを作成してリストに追加する
	    var favoriteItem = { selectedButton: selectedButtonValue, detailInformation: detailInformationValue };
	    favorites.push(favoriteItem);
	    console.log("お気に入り！")
	    
	    // 更新されたお気に入りリストをローカルストレージに保存する
	    localStorage.setItem('favorites', JSON.stringify(favorites));
	    console.log("保存！")
	    
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
	        
	        return item.selectedButton !== selectedButtonValue;
	    });

	    // 更新されたお気に入りリストをローカルストレージに保存する
	    localStorage.setItem('favorites', JSON.stringify(favorites));
	    console.log("削除！");
	    
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
    
      <div id="buttonContainer">
        <input type="button" value="戻る" onclick="submitAction('HomeAction')"/>
        <div id="favoriteButtons"></div>
      </div>
    
    </form>
    
  </div>

</body>
</html>