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
                    <th>ID</th>
                    <th>Name</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Designation</th>
                    <th>Salary</th>
                    <th>Action</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "");
                        String sql = "SELECT * FROM `employee_details` WHERE 1";
                        PreparedStatement pwst = conn.prepareStatement(sql);
                        ResultSet rs = pwst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("password") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("designation") %></td>
                    <td>₹<%= rs.getString("salary") %></td>
                    <td><a href="update_record.jsp?u=<%= rs.getString("id") %>">Update</a></td>
                    <td>
                        <form action="delete" method="post">
                            <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                            <input type="submit" name="delete" value="Delete">
                        </form>
                    </td>
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
