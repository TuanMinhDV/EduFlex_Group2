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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #333;
            margin: 20px 0;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }
        .form-container {
            background: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        form label {
            display: inline-block;
            width: 100px;
            margin-right: 10px;
            font-weight: bold;
        }
        form input, form button {
            padding: 8px;
            font-size: 14px;
            margin: 5px 10px 5px 0;
        }
        form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        form button:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: #fff;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a, .pagination strong {
            padding: 8px 12px;
            margin: 0 5px;
            border: 1px solid #ddd;
            text-decoration: none;
            color: #333;
        }
        .pagination strong {
            background-color: #4CAF50;
            color: white;
        }
        .pagination a:hover {
            background-color: #f4f4f4;
        }
        .sidebar {
            width: 20%;
            float: left;
        }
        .main-content {
            width: 80%;
            float: right;
        }
        .clearfix::after {
            content: "";
            display: table;
            clear: both;
        }
    </style>

    <script>
        function clearFilters() {
            window.location.href = "viewordercourselistbyadmin";
        }
    </script>
</head>
<body>
    <!-- Header -->
    <jsp:include page="header3.jsp"></jsp:include> 

    <div class="container clearfix">
        <!-- Sidebar -->
        <div class="sidebar">
            <jsp:include page="sidebarleft2.jsp"></jsp:include>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <br>
            <h1>Danh sách lịch sử đơn hàng</h1>

            <!-- Form lọc -->
            <div class="form-container">
                <form method="get" action="viewordercourselistbyadmin">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" value="${startDate}">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" value="${endDate}">
                    <label for="minMoney">Min Money:</label>
                    <input type="number" id="minMoney" name="minMoney" step="0.01" value="${minMoney}">
                    <label for="maxMoney">Max Money:</label>
                    <input type="number" id="maxMoney" name="maxMoney" step="0.01" value="${maxMoney}">
                    <button type="submit">Filter</button>
                    <button type="button" onclick="clearFilters()">Clear Filter</button>
                </form>
            </div>

            <!-- Bảng danh sách đơn hàng -->
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Account ID</th>
                        <th>Account Name</th>
                        <th>Order Date</th>
                        <th>Total Money</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.accountId}</td>
                            <td>${order.accountName}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.totalMoney}</td>
                            <td>
                                <form method="get" action="ordercoursedetailbyid">
                                    <input type="hidden" name="orderId" value="${order.orderId}">
                                    <button type="submit">Show Detail</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty orderList}">
                        <tr>
                            <td colspan="6">Không có đơn hàng nào phù hợp</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

            <!-- Phân trang -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="viewordercourselistbyadmin?page=${currentPage - 1}&startDate=${startDate}&endDate=${endDate}&minMoney=${minMoney}&maxMoney=${maxMoney}">&lt;&lt; Previous</a>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <strong>${i}</strong>
                        </c:when>
                        <c:otherwise>
                            <a href="viewordercourselistbyadmin?page=${i}&startDate=${startDate}&endDate=${endDate}&minMoney=${minMoney}&maxMoney=${maxMoney}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="viewordercourselistbyadmin?page=${currentPage + 1}&startDate=${startDate}&endDate=${endDate}&minMoney=${minMoney}&maxMoney=${maxMoney}">Next &gt;&gt;</a>
                </c:if>
            </div>
        </div>
    </div>
             <!-- External JavaScripts -->
            <script src="admin/assets/js/jquery.min.js"></script>
            <script src="admin/assets/vendors/bootstrap/js/popper.min.js"></script>
            <script src="admin/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
            <script src="admin/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
            <script src="admin/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
            <script src="admin/assets/vendors/magnific-popup/magnific-popup.js"></script>
            <script src="admin/assets/vendors/counter/waypoints-min.js"></script>
            <script src="admin/assets/vendors/counter/counterup.min.js"></script>
            <script src="admin/assets/vendors/imagesloaded/imagesloaded.js"></script>
            <script src="admin/assets/vendors/masonry/masonry.js"></script>
            <script src="admin/assets/vendors/masonry/filter.js"></script>
            <script src="admin/assets/vendors/owl-carousel/owl.carousel.js"></script>
            <script src='admin/assets/vendors/scroll/scrollbar.min.js'></script>
            <script src="admin/assets/js/functions.js"></script>
            <script src="admin/assets/vendors/chart/chart.min.js"></script>
            <script src="admin/assets/js/admin.js"></script>
            <script src='admin/assets/vendors/calendar/moment.min.js'></script>
            <script src='admin/assets/vendors/calendar/fullcalendar.js'></script>        
                    
</body>
</html>
