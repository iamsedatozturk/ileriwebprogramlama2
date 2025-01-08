package com.emredinc.app;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/signinServlet")
public class SignInServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("signin.jsp"); // Giriş sayfasına yönlendir
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kullanıcı doğrulama
        if (userService.authenticateUser(username, password)) {
            // Başarılıysa ana sayfaya yönlendir
        	HttpSession session = request.getSession();
            session.setAttribute("username", username); // Kullanıcı adını oturuma kaydediyoruz
            response.sendRedirect("index.jsp"); // Ana sayfaya yönlendir
            
        } else {
            // Başarısızsa tekrar giriş sayfasına yönlendir ve error=true parametresini ekle
            response.sendRedirect("signin.jsp?error=true");
        }
    }
}