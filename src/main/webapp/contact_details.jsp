<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.IOException"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>
</head>
<body>
    <!-- header -->
    <%@ include file="admin_navbar.jsp" %>

    <div class="container mt-3">
        <table class="table table-dark">
            <thead>
                <tr>
                    
                    <th>Name</th>
                   
                    <th>Email</th>
                    
                    <th>Message</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "");
                        String sql = "SELECT * FROM `contact_us` ";
                        PreparedStatement pwst = conn.prepareStatement(sql);
                        ResultSet rs = pwst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("message") %></td>
                    
                    
                </tr>
                <%
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %>
</body>
</html>
