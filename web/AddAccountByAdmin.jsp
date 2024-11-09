<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add New Account</title>
        <style>
            /* Reset margin and padding */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                display: flex;
                min-height: 100vh;
            }
            /* Sidebar styles to match the Admin Dashboard */
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: #fff;
                display: flex;
                flex-direction: column;
                padding-top: 20px;
                position: fixed;
                height: 100%;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            }
            .sidebar h2 {
                text-align: center;
                font-size: 24px;
                color: #f4f4f9;
                padding: 10px 0;
                border-bottom: 1px solid #34495e;
            }
            .sidebar a {
                color: #ecf0f1;
                padding: 15px 20px;
                text-decoration: none;
                font-size: 18px;
                display: block;
                transition: background 0.3s;
            }
            .sidebar a:hover {
                background-color: #34495e;
            }
            /* Content area styles */
            .content {
                margin-left: 250px;
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-grow: 1;
            }
            .form-container {
                width: 100%;
                max-width: 500px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            h1 {
                text-align: center;
                font-size: 1.5em;
                color: #333;
                margin-bottom: 20px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                color: #555;
            }
            input[type="text"],
            input[type="email"],
            input[type="checkbox"],
            select {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 1em;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            p {
                color: green;
                text-align: center;
            }
        </style>
        <script>
            function generateOTP() {
                let otp = '';
                for (let i = 0; i < 6; i++) {
                    otp += Math.floor(Math.random() * 10);
                }
                return otp;
            }

            function loadOTP() {
                const otpField = document.querySelector('input[name="otp"]');
                otpField.value = generateOTP();
            }

            window.onload = function () {
                loadOTP();
                setInterval(loadOTP, 30000);
            };
        </script>
    </head>
    <body>

        <!-- Sidebar for Dashboard -->
        <div class="sidebar">
            <h2>EduFlex Admin</h2>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/adminhomeservlet"><i class="fas fa-home"></i> Home</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewaccountlistbyadmin"><i class="fas fa-user"></i> View Account List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcommentlistbyadmin"><i class="fas fa-comments"></i> View Comment List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcourselistbyadmin"><i class="fas fa-book"></i> View Course List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/ViewOrderListByAdmin"><i class="fas fa-shopping-cart"></i> View Order List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewsubjectbyadmin"><i class="fas fa-chart-line"></i> View Category List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/revenueChart"><i class="fas fa-dollar-sign"></i> Revenue</a>

        </div>

        <!-- Main content area -->
        <div class="content">
            <div class="form-container">
                <h1>Add New Account</h1>

                <!-- Success or Error Message -->
                <c:if test="${not empty message}">
                    <p>${message}</p>
                </c:if>

                <!-- Account Form -->
                <form action="addaccountbyadmin" method="post">
                    <label>Username:</label>
                    <input type="text" name="username" required>

                    <label>Fullname:</label>
                    <input type="text" name="fullname" required>

                    <label>Email:</label>
                    <input type="email" name="email" required>

                    <label>Phone:</label>
                    <input type="text" name="phone" required>

                    <label>OTP:</label>
                    <input type="text" name="otp" required>

                    <label>Status:</label>
                    <select name="status">
                        <option value="">All Status</option>
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                    </select>

                    <label>Role:</label>
                    <select name="role">
                        <option value="">All Role</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.roleName}">${role.roleName}</option>
                        </c:forEach>
                    </select>
                    <label style="display: flex; align-items: center;">
                        <input type="checkbox" name="sendEmail" value="true">
                        <span style="margin-left: 5px;">Send email with account information</span>
                    </label>
                    <input type="submit" value="Add Account">
                </form>
            </div>
        </div>

    </body>
</html>
