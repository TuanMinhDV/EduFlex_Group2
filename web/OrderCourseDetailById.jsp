<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- META -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/images/favicon.png" />

        <!-- PAGE TITLE -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/typography.css">

        <!-- SHORTCODES -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="admin/assets/css/color/color-1.css">
        <style>
            /* Bố cục grid layout */
            .layout {
                display: grid;
                grid-template-areas: 
                    "header header"
                    "sidebar main";
                grid-template-columns: 250px 1fr;
                grid-template-rows: auto 1fr;
                height: 100vh;
            }
            .header {
                grid-area: header;
                background-color: #f4f4f4;
                padding: 10px;
                text-align: center;
            }
            .sidebar {
                grid-area: sidebar;
                background-color: #333;
                color: white;
                padding: 10px;
                overflow-y: auto;
            }
            .main-content {
                grid-area: main;
                padding: 20px;
                background-color: #fff;
                overflow-y: auto;
            }
            /* Chi tiết đơn hàng */
            .order-container {
                max-width: 800px;
                margin: 0 auto;
                background: #fff;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h1, h2 {
                text-align: center;
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f4f4f4;
                font-weight: bold;
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
                padding: 10px 20px;
                background-color: #007BFF;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                font-size: 14px;
            }
            .back-button a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="layout">
            <!-- Header -->
            <div class="header">
                <jsp:include page="header3.jsp"></jsp:include>
            </div>
            
            <!-- Sidebar -->
            <div class="sidebar">
                <jsp:include page="sidebarleft.jsp"></jsp:include>
            </div>
            
            <!-- Main Content -->
            <div class="main-content">
                <div class="order-container">
                    <h1>Order Detail</h1>
                    <c:if test="${not empty orderDetail}">
                        <!-- Thông tin đơn hàng -->
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

                        <!-- Danh sách sản phẩm -->
                        <h2>Course List</h2>
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
            </div>
        </div>
    </body>
</html>
