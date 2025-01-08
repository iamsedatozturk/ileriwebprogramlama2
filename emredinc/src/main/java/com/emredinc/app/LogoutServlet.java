package com.emredinc.app;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Oturumu sonlandır
        HttpSession session = request.getSession(false);  // Mevcut oturumu al
        if (session != null) {
            session.invalidate();  // Oturumu geçersiz kıl
        }
        response.sendRedirect("index.jsp");  // Giriş sayfasına yönlendir
    }
}