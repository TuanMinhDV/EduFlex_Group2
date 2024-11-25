<%-- 
    Document   : ViewRevenueStatisticsByAdmin
    Created on : Nov 24, 2024, 5:49:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="Revenue, Statistics, EduChamp" />
        <meta name="author" content="admin" />
        <meta name="robots" content="index, follow" />
        <meta name="description" content="EduChamp Revenue Statistics Dashboard" />

        <!-- Favicon -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/images/favicon.png" />

        <!-- Title -->
        <title>Revenue Statistics</title>

        <!-- Stylesheets -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/dashboard.css">

        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header3.jsp"></jsp:include>

            <!-- Sidebar -->
        <jsp:include page="sidebarleft2.jsp"></jsp:include>

            <!-- Main Content -->
            <div class="container" style="padding: 20px; margin-top: 20px;">
                <h1 class="text-center">Revenue Statistics by Month</h1>

                <!-- Filter Form -->
                <div class="filter-section" style="margin-bottom: 20px; text-align: center;">
                    <form method="GET" action="viewrevenuestatisticsbyadmin" style="display: inline-block;">
                        <!-- Start Date -->
                        <label for="startDate">Start Date:</label>
                        <input type="date" id="startDate" name="startDate" value="<%= request.getParameter("startDate") %>" style="margin-right: 10px;">

                    <!-- End Date -->
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" value="<%= request.getParameter("endDate") %>" style="margin-right: 10px;">

                    <!-- Filter Button -->
                    <button type="submit" style="padding: 5px 15px; cursor: pointer;">Filter</button>

                    <!-- Clear Filter Button -->
                    <a href="viewrevenuestatisticsbyadmin" style="padding: 5px 15px; background-color: #f0f0f0; border: 1px solid #ccc; text-decoration: none; color: #333; cursor: pointer;">Clear Filter</a>
                </form>
            </div>


            <!-- Total Revenue -->
            <div class="total-revenue text-center" style="margin-bottom: 30px;">
                <h2>Total Revenue: $<%= request.getAttribute("totalRevenue") %></h2>
            </div>

            <!-- Chart Section -->
            <div class="chart-section" style="text-align: center;">
                <canvas id="revenueChart" width="800" height="400"></canvas>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

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
            <script>
                // Lấy dữ liệu từ JSP
                const months = <%= new Gson().toJson(request.getAttribute("months")) %>;
                const revenues = <%= new Gson().toJson(request.getAttribute("revenues")) %>;

                // Tạo biểu đồ thanh
                new Chart(document.getElementById('revenueChart'), {
                    type: 'bar',
                    data: {
                        labels: months,
                        datasets: [{
                                label: 'Revenue',
                                data: revenues,
                                backgroundColor: 'rgba(75, 192, 192, 0.5)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
        </script>
    </body>
</html>
