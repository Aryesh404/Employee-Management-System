<%@ page import="com.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
        background-color: #370a6b;
        background-image: url("image/city1.png");
        background-size: cover;
        background-position: center center;
        background-repeat: no-repeat;
        color: #333;
    }

    .container {
        width: 600px;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 1, 0.5);
        background-color: white;
        text-align: center;
    }

    h1 {
        font-weight: bold;
        color: #007BFF;
    }

    h2 {
        margin: 20px 0;
        line-height: 1.6;
    }

    .emoji {
        font-size: 24px;
        margin-right: 5px;
    }

    .links a {
        margin: 0 10px;
        text-decoration: none;
        color: #007BFF;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    .links a:hover {
        color: #0056b3;
        font-size: 20px;
        text-transform: uppercase;
    }

    /* Styles for logout link */
    .logout-link {
        display: inline-block;
        padding: 10px 20px;
        background-color: #dc3545;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .logout-link:hover {
        background-color: #c82333;
    }
    </style>
</head>
<body>

<div class="container">
    <h1> ASDevelops Employee</h1>
    <h2>Welcome, <%= ((User)session.getAttribute("userDetails")).getName() %>!</h2>
    <h2>Email: <%= ((User)session.getAttribute("userDetails")).getEmail() %></h2>
    <h2>Designation: <%= ((User)session.getAttribute("userDetails")).getDesignation() %></h2>
    <h2>Salary: ₹<%= ((User)session.getAttribute("userDetails")).getSalary() %></h2>
    <a href="logout.jsp" class="logout-link">Logout</a>

    <!-- Display other user details as needed -->
</div>
</body>
</html>
