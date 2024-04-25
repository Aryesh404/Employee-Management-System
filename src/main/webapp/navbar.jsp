<% 
    String username = (String) session.getAttribute("username");
    boolean isLoggedIn = (username != null);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ASDevelops</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.js">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-white bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ASDevelops</a>

        <!-- Button for mobile navigation -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation links -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="about_us.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="contact.jsp">Contact Us</a>
                </li>

                <% if(isLoggedIn) { %>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="logout.jsp">Logout</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="logout.jsp">
                            Welcome <%= session.getAttribute("username") %>
                        </a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="login.jsp">Employee login</a>
                    </li>
                    
                <% } %>
            </ul>
           <li class="nav-item d-md-block"> <!-- Show on medium and larger screens -->
                <a class="nav-link active" aria-current="page" href="admin_login.jsp">Admin Login</a>
            </li>
           
        </div>
    </div>
</nav>

<!-- Side menu for mobile -->
<div class="container-fluid d-lg-none"> <!-- Show on small screens and hide on large screens -->
    <div class="sidenav">
        <a href="home.jsp">Home</a>
        <a href="about_us.jsp">About</a>
        <a href="contact.jsp">Contact Us</a>
        <% if(isLoggedIn) { %>
            <a href="logout.jsp">Logout</a>
            <a href="logout.jsp">Welcome <%= session.getAttribute("username") %></a>
        <% } else { %>
            <a href="login.jsp">Employee login</a>
            <a href="registration.jsp">Employee Registration</a>
        <% } %>
        <a href="admin_login.jsp">Admin Login</a>
    </div>
</div>

</body>
</html>
