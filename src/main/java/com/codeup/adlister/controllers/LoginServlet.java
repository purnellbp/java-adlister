package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // TODO: find a record in your database that matches the submitted password
        User user = null;
        try {
            User user = DaoFactory.getUserDao().findByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // TODO: make sure we find a user with that username
        if(user == null) {
response.sendRedirect("/login");
        }
        // TODO: check the submitted password against what you have in your database
        if(!password.equals(user.getPassword())){
response.sendRedirect("/login");
        }

        boolean validAttempt = false;


        } else {
            response.sendRedirect("/login");
        }
    }
}
