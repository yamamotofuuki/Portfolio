package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.diworksdev.portfolio.util.DBConnector;
import com.diworksdev.portfolio.util.DateUtil;

public class FavoritesDAO {
	
	// お気に入り情報をデータベースに保存するメソッド
    public void addToFavorites(String itemId, String userId) throws SQLException {
        DBConnector dbConnector = new DBConnector();
        Connection connection = dbConnector.getConnection();
        
        DateUtil dateUtil = new DateUtil();

        String sql = "INSERT INTO favorites (user_id,item_id,insert_date)VALUES(?,?,?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1,itemId);
            preparedStatement.setString(2,userId);
            preparedStatement.setString(3,dateUtil.getDate());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // 例外処理が必要な場合は適切な対応を記述
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }
}




public String addToFavorites() {
    // お気に入り情報をデータベースに保存するか、セッションなどで一時的に保持する処理を行う
    if (session != null) {
        List<String> favorites = (List<String>) session.get("favorites");
        if (favorites == null) {
            favorites = new ArrayList<>();
        }
        favorites.add(learningContent);
        session.put("favorites", favorites);
    }
    return SUCCESS;
}
