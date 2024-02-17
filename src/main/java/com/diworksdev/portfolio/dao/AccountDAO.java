package com.diworksdev.portfolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.diworksdev.portfolio.dto.AccountDTO;
import com.diworksdev.portfolio.util.DBConnector;

public class AccountDAO {
    private DBConnector dbConnector;

    public AccountDAO() {
        dbConnector = new DBConnector();
    }

    // ユーザー情報を取得するメソッド
    public AccountDTO getUserInfo(String username) {
        AccountDTO account = new AccountDTO();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = dbConnector.getConnection();
            String sql = "SELECT id, user_name, password FROM webaccount WHERE user_name=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();

         // ユーザー情報をDTOにセット
            if (resultSet.next()) {
            	account.setUserId(resultSet.getInt("id"));
                account.setUsername(resultSet.getString("user_name"));
                account.setPassword(resultSet.getString("password"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // リソースの解放
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return account;
    }
}
