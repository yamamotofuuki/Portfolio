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
  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5); /* テキストに影をつける */
  }
  
  #main {
  width: 100%;
  height: 500px;
  text-align: center;
  }

  #text-center {
  display: inline-block;
  text-align: center;
  }
  
  /* 項目ごとの区切り線のスタイル */
  #favoritesList li {
  border-bottom: 1px solid black; /* 区切り線のスタイルを指定 */
  padding-bottom: 5px; /* 区切り線と項目の間隔を調整 */
  margin-bottom: 5px; /* 項目間の間隔を調整 */
  }
  
  /* リンクのスタイルを調整 */
  #favoritesList a {
  text-decoration: none; /* 下線を消す */
  color: black;
  }
  
  #favoritesList a:hover {
  color: blue;
  }
  
  #text-right {
  display: flex; /* リンク横並びにする */
  }
  
  #text-right a {
  margin-right: 30px;
  color: black;
  }
  
  #text-right a:hover{
  color: blue;
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
        <p><a href ='<s:url action="HomeAction"/>'>学習内容に戻る</a></p>
        <p><a href='<s:url action="LogoutAction"/>'>ログアウト</a></p>
      </div>
      
    </div>
  </div>
  
  <script type="text/javascript">
	// ローカルストレージからお気に入りリストを取得する
	var favorites = JSON.parse(localStorage.getItem('favorites')) || [];
	
	// お気に入りリストを表示する
	var favoritesList = document.getElementById('favoritesList');

	// お気に入りリストが存在する場合
	if (favoritesList) {
		favorites.forEach(function(favorite) {
		    var listItem = document.createElement('li');
		    var link = document.createElement('a');
		    link.textContent = favorite.selectedButton;
		    // 詳細画面を表示するためのアクションに適切なURLを設定
		    link.href = 'LearningAction.action?learningContent=' + encodeURIComponent(favorite.selectedButton);
		    listItem.appendChild(link);
		    favoritesList.appendChild(listItem);
		});
	}

	if (favorites.length === 0) {
	    var noFavoritesMessage = document.createElement('li');
	    noFavoritesMessage.textContent = 'お気に入りはありません';
	    favoritesList.appendChild(noFavoritesMessage);
	}

</script>
  
</body>
</html>