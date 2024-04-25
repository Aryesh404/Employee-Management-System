<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "");

        // Get the contact ID to be deleted from the request parameter
        int contactId = Integer.parseInt(request.getParameter("contactId"));

        // Perform the delete operation
        String sql = "DELETE FROM `contact_us` WHERE id=?";
        PreparedStatement pwst = conn.prepareStatement(sql);
        pwst.setInt(1, contactId);
        pwst.executeUpdate();

        // Redirect back to the main page after deletion
        response.sendRedirect("employeeList.jsp");
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
