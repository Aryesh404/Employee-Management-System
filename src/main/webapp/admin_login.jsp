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
<%@ include file="navbar.jsp" %>
<section class="vh-100 bg-image"
		style="background-color: #370a6b;">
		<div class="mask d-flex align-items-center h-100 gradient-custom-3">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-9 col-lg-7 col-xl-6">
						<div class="card" style="border-radius: 15px;">
							<div class="card-body p-5">
								<h2 class="text-uppercase text-center mb-5"> admin login 
									</h2>

								<form action="Admin_LoginServlet" method="post">

									<div class="form-outline mb-4">
										<input type="text" name="username" id="form3Example1cg"
											class="form-control form-control-lg" /> <label
											class="form-label" for="form3Example1cg">Your Name</label>
									</div>



									<div class="form-outline mb-4">
										<input type="password" name="password" id="form3Example4cg"
											class="form-control form-control-lg" /> <label
											class="form-label" for="form3Example4cg">Password</label>
									</div>



									<div class="d-flex justify-content-center">
										<button type="submit"
											class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">login</button>
									</div>



								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>