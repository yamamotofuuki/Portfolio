package com.diworksdev.portfolio.util;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
    
    public Connection getConnection() throws SQLException {
        Connection con = null;
        
        try {
            String databaseUrl = System.getenv("DATABASE_URL");
            URI uri = new URI(databaseUrl);
            String username = uri.getUserInfo().split(":")[0];
            String password = uri.getUserInfo().split(":")[1];
            String dbUrl = "jdbc:postgresql://" + uri.getHost() + ":" + uri.getPort() + uri.getPath();
            
            con = DriverManager.getConnection(dbUrl, username, password);
        } catch (URISyntaxException e) {
            throw new SQLException("Invalid URI: " + e.getMessage());
        } catch (SQLException e) {
            throw new SQLException("Failed to connect to database: " + e.getMessage());
        }
        
        return con;
    }
}
