
<% String username = (String) session.getAttribute("username");
 boolean isLoggedIn = (username != null);
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.js">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-white bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">ASDevelops</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="contact_details.jsp">Contact Details</a>
        </li>
        <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="registration.jsp">Employee Registration</a>
            </li>
         <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="home.jsp">Employee Details</a>
            </li>
        
        <%
        if(isLoggedIn){ %>
        	
        	  <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="logout.jsp">Logout</a>
            </li>
        
         <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="logout.jsp">
              
              Welcome <%= session.getAttribute("username") %>
              </a>
            </li>
            <%}  else { %>
         <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="home.jsp">Employee details</a>
            </li>
             <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="registration.jsp">Employee Registration</a>
            </li>
        
        <% }%>
        
       
       
       
       
       
      
      </ul>
      <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp">Admin Login</a>
        </li>
    </div>
  </div>
</nav>

<div class="container-fluid d-lg-none"> <!-- Show on small screens and hide on large screens -->
    <div class="sidenav">
        <a href="home.jsp">Home</a>
        <a href="about_us.jsp">About</a>
        <a href="contact_details.jsp">Contact Details</a>
        <a href="registration.jsp">Employee Registration</a>
        <a href="index.jsp">Employee Details</a>
        <% if(isLoggedIn) { %>
            <a href="logout.jsp">Logout</a>
            <a href="logout.jsp">Welcome <%= session.getAttribute("username") %></a>
        <% } else { %>
            <a href="login.jsp">Employee login</a>
            <a href="registration.jsp">Employee Registration</a>
        <% } %>
        
    </div>
</div>

</body>
</html>