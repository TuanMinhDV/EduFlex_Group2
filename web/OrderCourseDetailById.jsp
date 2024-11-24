<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order Detail</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f9f9f9;
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            .order-container {
                width: 60%;
                margin: 0 auto;
                background: #fff;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .order-info, .course-list {
                margin-bottom: 20px;
            }
            .order-info table, .course-list table {
                width: 100%;
                border-collapse: collapse;
            }
            .order-info th, .course-list th {
                text-align: left;
                padding: 10px;
                border-bottom: 2px solid #ddd;
                font-weight: bold;
            }
            .order-info td, .course-list td {
                padding: 8px;
                border-bottom: 1px solid #ddd;
            }
            .course-list th {
                background-color: #f4f4f4;
            }
            .total-money {
                font-weight: bold;
                text-align: right;
                margin-top: 20px;
                font-size: 16px;
                color: #333;
            }
            .back-button {
                text-align: center;
                margin-top: 30px;
            }
            .back-button a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007BFF;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                font-size: 14px;
                font-weight: bold;
            }
            .back-button a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="order-container">
            <h1>Order Detail</h1>
            <c:if test="${not empty orderDetail}">
                <!-- Thông tin đơn hàng -->
                <div class="order-info">
                    <table>
                        <tr>
                            <th>Order ID</th>
                            <td>${orderDetail.orderId}</td>
                        </tr>
                        <tr>
                            <th>Username</th>
                            <td>${orderDetail.username}</td>
                        </tr>
                        <tr>
                            <th>Full Name</th>
                            <td>${orderDetail.fullName}</td>
                        </tr>
                        <tr>
                            <th>Role</th>
                            <td>${orderDetail.roleName}</td>
                        </tr>
                        <tr>
                            <th>Order Date</th>
                            <td>${orderDetail.orderDate}</td>
                        </tr>
                    </table>
                </div>

                <!-- Danh sách sản phẩm -->
                <div class="course-list">
                    <h2 style="text-align: center;">Course List</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Course Name</th>
                                <th>Price (USD)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="course" items="${orderDetail.courses}">
                                <tr>
                                    <td>${course.courseName}</td>
                                    <td>${course.price}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Tổng tiền -->
                <div class="total-money">
                    Total Money: ${orderDetail.totalMoney} USD
                </div>
            </c:if>
            <c:if test="${empty orderDetail}">
                <p style="text-align: center; color: red;">Order not found.</p>
            </c:if>

            <!-- Nút quay lại -->
            <div class="back-button">
                <a href="viewordercourselistbyadmin">Back to Order List</a>
            </div>
        </div>
    </body>
</html>
