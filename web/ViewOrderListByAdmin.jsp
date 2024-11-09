<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Course Order List</title>
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
            form {
                margin-bottom: 20px;
            }
            label {
                margin-right: 10px;
            }
            input[type="date"], input[type="number"] {
                padding: 8px;
                margin-right: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            input[type="submit"] {
                padding: 8px 12px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            /* Table styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
                color: #555;
            }
            td {
                color: #333;
            }
            /* Pagination */
            .pagination {
                margin-top: 20px;
                text-align: center;
            }
            .pagination a {
                margin: 0 5px;
                padding: 8px 12px;
                color: #007bff;
                text-decoration: none;
            }
            .pagination a:hover {
                text-decoration: underline;
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
            <h1>Course Order List</h1>

            <!-- Filter Form -->
            <div class="card">
                <form action="ViewOrderListByAdmin" method="get">
                    <label for="startDate">Start Date:</label>
                    <input type="date" name="startDate" value="${startDate}" />

                    <label for="endDate">End Date:</label>
                    <input type="date" name="endDate" value="${endDate}" />

                    <label for="minMoney">Min Money:</label>
                    <input type="number" name="minMoney" step="0.01" value="${minMoney}" />

                    <label for="maxMoney">Max Money:</label>
                    <input type="number" name="maxMoney" step="0.01" value="${maxMoney}" />

                    <input type="submit" value="Filter" />
                </form>
            </div>

            <!-- Order List Table -->
            <div class="card">
                <table>
                    <tr>
                        <th>Order ID</th>
                        <th>Username</th> <!-- Username column -->
                        <th>Order Date</th>
                        <th>Total Money</th>
                        <th>Action</th> <!-- Action column for details -->
                    </tr>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.accountId}</td> <!-- Assuming accountId now contains username -->
                            <td>${order.orderDate}</td>
                            <td>${order.totalMoney}</td>
                            <td><a href="ViewOrderDetailByAdmin?orderId=${order.orderId}">Show Detail</a></td> <!-- Detail link -->
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <!-- Pagination Controls -->
            <c:if test="${totalPages > 1}">
                <div class="pagination">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <a href="ViewOrderListByAdmin?page=${i}&startDate=${startDate}&endDate=${endDate}&minMoney=${minMoney}&maxMoney=${maxMoney}">${i}</a>
                    </c:forEach>
                </div>
            </c:if>
        </div>

    </body>
</html>
