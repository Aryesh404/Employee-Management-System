<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="  java.sql.PreparedStatement"%>
<%@page import=" java.sql.ResultSet "%>

<%@page import=" java.io.PrintWriter"%>

<%@page import=" jakarta.servlet.ServletException"%>


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
	<!-- start navber  -->
	<%@ include file="admin_navbar.jsp"%>
	<!-- close navber  -->

	<section class="vh-40 bg-image"
		style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
		<br> <br> <br>
		<div class="mask d-flex align-items-center h-100 gradient-custom-3">

			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-9 col-lg-7 col-xl-6">
						<div class="card" style="border-radius: 15px;">
							<div class="card-body p-5">
								<h2 class="text-uppercase text-center mb-5">Update Form</h2>

								<%
								String idString = request.getParameter("u");
								int id = Integer.parseInt(idString);

								try {
									Class.forName("com.mysql.cj.jdbc.Driver");

									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "");

									String sql = "SELECT * FROM `employee_details` WHERE id = '" + id + "'  ";

									PreparedStatement pwst = conn.prepareStatement(sql);

									ResultSet rs = pwst.executeQuery(sql);

									/*	PrintWriter out = response.getWriter(); */

									while (rs.next()) {
								%>
<form action="update" method="post">
    <input type="hidden" name="id" value="<%= rs.getString("id") %>" />
    <div class="form-outline mb-4">
        <input type="text" name="name" value="<%= rs.getString("name") %>" id="form3Example1cg" class="form-control form-control-lg" />
        <label class="form-label" for="form3Example1cg">Your Name</label>
    </div>

    <div class="form-outline mb-4">
        <input type="password" name="password" value="<%= rs.getString("password") %>" id="form3Example4cg" class="form-control form-control-lg" />
        <label class="form-label" for="form3Example4cg">Password</label>
    </div>

    <div class="form-outline mb-4">
        <input type="text" name="email" value="<%= rs.getString("email") %>" id="form3ExampleEmail" class="form-control form-control-lg" />
        <label class="form-label" for="form3ExampleEmail">Email</label>
    </div>

    <div class="form-outline mb-4">
        <input type="text" name="designation" value="<%= rs.getString("designation") %>" id="form3ExampleDesignation" class="form-control form-control-lg" />
        <label class="form-label" for="form3ExampleDesignation">Designation</label>
    </div>

    <div class="form-outline mb-4">
        <input type="text" name="salary" value="<%= rs.getString("salary") %>" id="form3ExampleSalary" class="form-control form-control-lg" />
        <label class="form-label" for="form3ExampleSalary">Salary</label>
    </div>

    <div class="d-flex justify-content-center">
        <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Update</button>
    </div>
</form>

								
								<%
								}
								} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								}
								%>




							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<br> <br> <br>
	</section>

	<!-- footer -->
	<%@ include file="footer.jsp"%>

</body>
</html>