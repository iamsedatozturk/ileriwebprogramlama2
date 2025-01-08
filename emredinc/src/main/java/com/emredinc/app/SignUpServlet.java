package com.emredinc.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/signupServlet")
public class SignUpServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("signup.jsp"); // Kayıt sayfasına yönlendir
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Formdan gelen bilgileri al
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        
        // Çoklu checkbox (hobiler) için
        String[] hobbiesArray = request.getParameterValues("hobbies");
        List<String> hobbies = new ArrayList<>();
        if (hobbiesArray != null) {
            for (String hobby : hobbiesArray) {
                hobbies.add(hobby);
            }
        }

        // Kullanıcı nesnesi oluştur ve bilgileri doldur
        UserEntity user = new UserEntity();
        user.setEmail(email);
        user.setPassword(password);
        user.setFullName(fullName);
        user.setGender(gender);
        user.setCity(city);
        user.setHobbies(hobbies);

        // Kullanıcıyı kaydet
        userService.saveUser(user);

        // Kayıt başarılı olunca giriş sayfasına yönlendir
        response.sendRedirect("index.jsp");
    }
}
