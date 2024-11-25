<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
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

        <!-- Custom CSS -->
        <style>
            /* Grid Layout */
            .layout {
                display: grid;
                grid-template-areas: 
                    "header header"
                    "sidebar main";
                grid-template-columns: 250px 1fr; /* Sidebar cố định, nội dung chính co giãn */
                grid-template-rows: auto 1fr; /* Header tự động, nội dung chính chiếm phần còn lại */
                height: 100vh; /* Chiều cao toàn màn hình */
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
                overflow-y: auto; /* Nếu nội dung quá dài, có thể cuộn */
            }

            /* Chart canvas */
            canvas {
                max-width: 600px;
                margin: 20px auto;
                display: block;
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
            
            <br>
            <!-- Main Content -->
            <div class="main-content">
                  <br>
                  
                  
                <h3 style="text-align: center;">Account Distribution</h3>
                <!-- Canvas cho biểu đồ -->
                <canvas id="roleChart"></canvas>
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
        
        <script>
            // Lấy dữ liệu từ JSP
            const roles = <%= new Gson().toJson(request.getAttribute("roles")) %>;
            const counts = <%= new Gson().toJson(request.getAttribute("counts")) %>;

            // Tạo biểu đồ thanh
            new Chart(document.getElementById('roleChart'), {
                type: 'bar',
                data: {
                    labels: roles,
                    datasets: [{
                        label: 'Accounts',
                        data: counts,
                        backgroundColor: ['rgba(75, 192, 192, 0.5)', 'rgba(255, 159, 64, 0.5)', 'rgba(153, 102, 255, 0.5)'],
                        borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 159, 64, 1)', 'rgba(153, 102, 255, 1)'],
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
