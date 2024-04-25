<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About ASDevelops</title>
    <style>
    /* styles.css */

body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
}

#header {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 20px;
}

#content {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
}

h1, h2, h3 {
    color: #333;
}

p {
    line-height: 1.6;
    color: #666;
}

ul {
    list-style-type: none;
    padding: 0;
}

#footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
    position: fixed;
    bottom: 0;
    width: 100%;
}

/* Add more styles as needed */
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
    <div id="header">
        <h1>Welcome to ASDevelops</h1>
        <p>Your Partner in Software Excellence</p>
    </div>

    <div id="content">
        <h2>About Us</h2>
        <p>
            ASDevelops is a leading software enterprise company dedicated to crafting innovative software solutions and providing expert consultancy services. With a passion for technology and a commitment to excellence, we empower businesses to thrive in the digital era.
        </p>

        <h3>Our Mission</h3>
        <p>
            At ASDevelops, our mission is to deliver cutting-edge software solutions that not only meet but exceed our clients' expectations. We strive to provide unparalleled consultancy services, guiding businesses towards success in an ever-evolving technological landscape.
        </p>

        <h3>What Sets Us Apart</h3>
        <p>
            <strong>Expertise:</strong> Our team of skilled professionals brings a wealth of experience in software development and consultancy, ensuring top-notch solutions tailored to your unique needs.
            <br>
            <strong>Innovation:</strong> We thrive on innovation, staying ahead of industry trends to deliver solutions that are both current and future-proof.
            <br>
            <strong>Collaboration:</strong> We believe in the power of collaboration, working closely with our clients to understand their goals and challenges, and delivering solutions that make a real impact.
        </p>

        <h3>Services We Offer</h3>
        <ul>
            <li>Custom Software Development</li>
            <li>Consultancy and Advisory Services</li>
            <li>Enterprise Application Integration</li>
            <li>Quality Assurance and Testing</li>
            <li>Project Management</li>
        </ul>

        <p>
            Partner with ASDevelops and let us be the catalyst for your digital transformation journey. Together, we can turn your ideas into reality and propel your business to new heights.
        </p>
    </div>

    <div id="footer">
        <p>&copy; 2024 ASDevelops. All rights reserved.</p>
    </div>
</body>
</html>
