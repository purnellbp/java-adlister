package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.*;
import java.util.Properties;
import java.util.logging.Logger;


public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver() {
                connection =DriverManager.getConnection(
                        config.getUrl(),
                        config.getUrl(),
                        config.getPassword());
            };
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public User findByUsername(String username) throws SQLException {
        PreparedStatement stmt;
        User user = null;
        try {
            String sql = "SELECT * FROM users WHERE username = ?;";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            user = extractUser(rs);

        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }

        return user;
    }

    private User extractUser(ResultSet rs) {
        if (!rs.next()) return null;
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("emial"),
                rs.getString("password")
        );
    }

    @Override
    public Long insert(User user) {
        long id = -1;
        try {
            PreparedStatement stmt = connection.prepareStatement(getInsertQuery(), Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            rs.getLong(1);

        } catch (SQLException e) {
            System.err.printf(e.getMessage());

        }
        return id;
    }

    private String getInsertQuery() {
        return "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
    }

}
