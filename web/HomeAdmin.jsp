<%-- 
    Document   : HomeAdmin
    Created on : Nov 9, 2024, 2:11:45 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
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
                height: 100vh;
            }
            /* Sidebar */
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: #fff;
                display: flex;
                flex-direction: column;
                padding-top: 20px;
            }
            .sidebar h2 {
                text-align: center;
                font-size: 24px;
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
            /* Main content */
            .content {
                flex: 1;
                padding: 20px;
            }
            .content h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }
            .card {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .card h3 {
                margin-bottom: 10px;
                color: #2c3e50;
            }
        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>EduFlex Admin</h2>
            <a href="http://localhost:8080/FinalVersionEduFlex/viewaccountlistbyadmin">View Account List</a>
            <a href="http://localhost:8080/FinalVersionEduFlex/viewcommentlistbyadmin">View Comment List</a>
            <a href="http://localhost:8080/FinalVersionEduFlex/viewcourselistbyadmin">View Course List</a>
            <a href="http://localhost:8080/FinalVersionEduFlex/ViewOrderListByAdmin">View Order List</a>
            <a href="http://localhost:8080/FinalVersionEduFlex/viewsubjectbyadmin">View Category List</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h1>Dashboard</h1>
            <div class="card">
                <h3>Welcome, Admin!</h3>
                <p>This is your admin dashboard where you can manage accounts, comments, courses, orders, and categories.</p>
            </div>
            
            <div class="card">
                <h3>Quick Stats</h3>
                <p>Total Accounts: 120</p>
                <p>Total Comments: 500</p>
                <p>Total Courses: 35</p>
                <p>Total Orders: 78</p>
                <p>Total Categories: 12</p>
            </div>
        </div>
    </body>
</html>
