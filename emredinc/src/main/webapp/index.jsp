<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.emredinc.app.UserService"%>
<%@ page import="com.emredinc.app.UserEntity"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mezunlar Portalı</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #e1bee7);
            color: #444;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background: #6a1b9a;
        }
        .navbar-brand {
            font-weight: bold;
            color: #fff;
        }
        .nav-link {
            color: #ffcc80 !important;
        }
        .nav-link:hover {
            color: #ffffff !important;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid d-flex align-items-center">
            <!-- Sol taraf (Logo) -->
            <a class="navbar-brand" href="index.jsp">Mezunlar Portalı</a>

            <!-- Sağ taraf (Bağlantılar) -->
            <div class="ms-auto d-flex align-items-center">
                <%
				    if (session.getAttribute("username") != null) {
				%>
				    <span class="navbar-brand">Hoşgeldiniz, <strong><%= session.getAttribute("username") %></strong>!</span>
				    <a class="nav-link" href="logoutServlet">Çıkış Yap</a>
				<%
				    } 
				%>
            </div>
        </div>
    </nav>

    <!-- Ana İçerik -->
	<div class="container d-flex justify-content-center align-items-center vh-100">
	    <div class="card p-4 shadow w-100">
	            <!-- Hata Mesajı -->
	            <%
           	 	if (session.getAttribute("username") == null) {
	                if (request.getParameter("error") != null) {
		            %>
		                <div class="alert alert-danger mt-3">
		                    Geçersiz kullanıcı adı veya şifre!
		                </div>
		            <%
	                }
	            %>
	
		        <h1 class="text-center mb-4">Mezunlar Portalına Hoş Geldiniz</h1>
		        <p class="text-center">Bu portal sayesinde eski arkadaşlarınızı bulabilir, mezunlar topluluğunun bir parçası olabilirsiniz.</p>

	            <!-- Giriş Formu -->
	            <form action="signinServlet" method="post">
	                <div class="mb-3">
	                    <label for="username" class="form-label">Kullanıcı Adı</label>
	                    <input type="text" class="form-control" id="username" name="username" required>
	                </div>
	                <div class="mb-3">
	                    <label for="password" class="form-label">Şifre</label>
	                    <input type="password" class="form-control" id="password" name="password" required>
	                </div>
	                <div class="d-grid gap-3">
	                    <!-- Giriş Yap Butonu -->
	                    <button type="submit" class="btn btn-primary btn-lg">Giriş Yap</button>
	                    <!-- Kayıt Ol Butonu -->
	                    <a href="signupServlet" class="btn btn-success btn-lg">Kayıt Ol</a>
	                </div>
	            </form>

				<%
				    } else {
				        UserService userService = new UserService();
				%>
				<!-- Kullanıcı Tablosu -->
				<div class="container">
					<h1 class="text-center mb-4">Kullanıcı Listesi</h1>
				    <table class="table table-hover table-bordered align-middle text-center">
				        <thead class="table-dark">
				            <tr>
				                <th>Email</th>
				                <th>Adı Soyadı</th>
				                <th>Cinsiyet</th>
				                <th>Şehir</th>
				                <th>Hobiler</th>
				            </tr>
				        </thead>
				        <tbody>
				            <%
				                for (UserEntity user : userService.getUserList()) {
				            %>
				            <tr>
				                <td><%= user.getEmail() %></td>
				                <td><%= user.getFullName() %></td>
				                <td>
				                    <%= user.getGender().equals("male") ? "Erkek" : "Kadın" %>
				                </td>
				                <td><%= user.getCity() %></td>
				                <td>
				                    <ul class="list-unstyled">
				                        <%
				                            for (String hobby : user.getHobbies()) {
				                        %>
				                        <li><%= hobby %></li>
				                        <%
				                            }
				                        %>
				                    </ul>
				                </td>
				            </tr>
				            <%
				                }
				            %>
				        </tbody>
				    </table>
				</div>
				<%
				    }
				%>

	    </div>
	</div>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
