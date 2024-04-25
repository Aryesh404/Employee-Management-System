<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>

    <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/css/bootstrap.js">

</head>
<body>
    <%@ include file="admin_navbar.jsp" %>
    <section class="vh-100 bg-image"
        style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
        <div class="mask d-flex align-items-center h-100 gradient-custom-3">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-5">
                                <h2 class="text-uppercase text-center mb-5">Create an account</h2>

                                <form action="Registration_servlet" method="post">

                                    <div class="form-outline mb-4">
                                        <input type="text" name="name" id="form3Example1cg"
                                            class="form-control form-control-lg" />
                                        <label class="form-label" for="form3Example1cg">Your Name</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" name="password" id="form3Example4cg"
                                            class="form-control form-control-lg" />
                                        <label class="form-label" for="form3Example4cg">Password</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" name="email" id="form3Example2cg"
                                            class="form-control form-control-lg" />
                                        <label class="form-label" for="form3Example2cg">Your Email</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" name="designation" id="form3Example3cg"
                                            class="form-control form-control-lg" />
                                        <label class="form-label" for="form3Example3cg">Your Designation</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" name="salary" id="form3Example5cg"
                                            class="form-control form-control-lg" />
                                        <label class="form-label" for="form3Example5cg">Your Salary</label>
                                    </div>

                                    <div class="d-flex justify-content-center">
                                        <button type="submit"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
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
