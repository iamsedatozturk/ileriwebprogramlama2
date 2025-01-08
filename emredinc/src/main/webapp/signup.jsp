<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
	    <div class="card p-4 shadow" style="max-width: 400px; width: 100%;">
	        
		<form action="signupServlet" method="post">
        <!-- Email -->
        <div class="mb-3">
            <label for="email" class="form-label fw-bold">Email</label>
            <input type="email" class="form-control" id="email" name="email" required autofocus="autofocus">
        </div>
        
        <!-- Şifre -->
        <div class="mb-3">
            <label for="password" class="form-label fw-bold">Şifre</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <!-- Adı Soyadı -->
        <div class="mb-3">
            <label for="fullName" class="form-label fw-bold">Adı Soyadı</label>
            <input type="text" class="form-control" id="fullName" name="fullName" required>
        </div>
        
        <!-- Cinsiyet -->
        <div class="mb-3">
            <label class="form-label fw-bold">Cinsiyet</label>
            <div>
                <input type="radio" class="form-check-input" id="male" name="gender" value="male" required>
                <label class="form-check-label" for="male">Erkek</label>
            </div>
            <div>
                <input type="radio" class="form-check-input" id="female" name="gender" value="female" required>
                <label class="form-check-label" for="female">Kadın</label>
            </div>
        </div>

        <!-- Hobiler -->
        <div class="mb-3">
            <label class="form-label fw-bold">Hobiler</label>
            <div>
                <input type="checkbox" class="form-check-input" id="reading" name="hobbies" value="reading">
                <label class="form-check-label" for="reading">Okuma</label>
            </div>
            <div>
                <input type="checkbox" class="form-check-input" id="sports" name="hobbies" value="sports">
                <label class="form-check-label" for="sports">Spor</label>
            </div>
            <div>
                <input type="checkbox" class="form-check-input" id="traveling" name="hobbies" value="traveling">
                <label class="form-check-label" for="traveling">Seyahat</label>
            </div>
        </div>

        <!-- Şehir -->
        <div class="mb-3">
            <label for="city" class="form-label fw-bold">Oturduğu Şehir</label>
            <select class="form-select" id="city" name="city" required>
                <option value="" disabled selected>Şehir seçin</option>
                <option value="istanbul">İstanbul</option>
                <option value="ankara">Ankara</option>
                <option value="izmir">İzmir</option>
                <option value="bursa">Bursa</option>
            </select>
        </div>

        <!-- Kayıt Ol Butonu -->
        <button type="submit" class="btn btn-primary w-100">Kayıt Ol</button>
    </form>
	    </div>
	</div>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
