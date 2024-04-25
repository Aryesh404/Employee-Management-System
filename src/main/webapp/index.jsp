<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ASDevelops - Software Enterprise</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        header {
            background-color: #333;
            padding: 10px;
            color: #fff;
            font-size: 24px;
        }

        section {
            margin: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .services {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .service {
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            margin: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
    <header>
        <h1>ASDevelops - Software Enterprise</h1>
    </header>

    <section>
        <div class="container">
            <h2>Welcome to ASDevelops</h2>
            <p>We develop websites and offer consultancy services to help your business grow.</p>

            <div class="services">
                <div class="service">
                    <h3>Web Development</h3>
                    <p>Expertise in creating modern and responsive websites tailored to your needs.</p>
                </div>

                <div class="service">
                    <h3>Consultancy</h3>
                    <p>Professional consultancy services to guide you through the digital landscape.</p>
                </div>
            </div>
        </div>
    </section>
<%@ include file="footer.jsp" %>
</body>
</html>
