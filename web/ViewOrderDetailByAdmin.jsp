<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order Detail</title>
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
            /* Sidebar styles matching Admin Dashboard */
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
            /* Main content */
            .content {
                margin-left: 250px;
                padding: 20px;
                flex-grow: 1;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .order-detail-container {
                width: 100%;
                max-width: 600px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .order-detail-container h1 {
                text-align: center;
                font-size: 1.5em;
                color: #333;
                margin-bottom: 20px;
            }
            .back-link {
                display: block;
                text-align: center;
                margin-bottom: 15px;
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
            }
            .back-link:hover {
                text-decoration: underline;
            }
            .order-table {
                width: 100%;
                border-collapse: collapse;
            }
            .order-table th, .order-table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            .order-table th {
                background-color: #f2f2f2;
                color: #555;
            }
            .order-table td {
                color: #333;
            }
        </style>
    </head>
    <body>

        <!-- Sidebar for Dashboard -->
        <div class="sidebar">
            <h2>EduFlex Admin</h2>
        
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/adminhomeservlet">Home</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewaccountlistbyadmin">View Account List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcommentlistbyadmin">View Comment List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcourselistbyadmin">View Course List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/ViewOrderListByAdmin">View Order List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewsubjectbyadmin">View Category List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/revenueChart">Revenue</a>
        </div>

        <!-- Main content area -->
        <div class="content">
            <div class="order-detail-container">
                <h1>Course Order Detail</h1>

                <!-- Link to go back to the Order List -->
                <a class="back-link" href="ViewOrderListByAdmin">Back to Course Order List</a>

                <!-- Order Details Table -->
                <table class="order-table">
                    <c:forEach var="entry" items="${orderDetailMap}">
                        <tr>
                            <th>${entry.key}</th>
                            <td>${entry.value}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>
