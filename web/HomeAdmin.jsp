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
        <!-- CSS here -->
        <link rel="stylesheet" href="courses-master/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/slicknav.css">
        <link rel="stylesheet" href="courses-master/assets/css/flaticon.css">
        <link rel="stylesheet" href="courses-master/assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="courses-master/assets/css/gijgo.css">
        <link rel="stylesheet" href="courses-master/assets/css/animate.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/animated-headline.css">
        <link rel="stylesheet" href="courses-master/assets/css/magnific-popup.css">
        <link rel="stylesheet" href="courses-master/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="courses-master/assets/css/themify-icons.css">
        <link rel="stylesheet" href="courses-master/assets/css/slick.css">
        <link rel="stylesheet" href="courses-master/assets/css/nice-select.css">
        <link rel="stylesheet" href="courses-master/assets/css/style.css">
        <link rel="stylesheet" href="./css/slider.css">
        <link rel="stylesheet" href="./css/time.css">
        <style>
            /* Reset margin and padding */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            .content-admin {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                display: flex;
                height: 100vh;
            }
            .sidebar {
                width: 250px;
                background-color: #ffffff;
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
            /* Main content */
            .contentadmin {
                flex: 1;
                padding: 20px;
            }
            .contentadmin h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }
            .cardadmin {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .cardadmin h3 {
                margin-bottom: 10px;
                color: #2c3e50;
            }
            .stats-grid {
                display: flex; /* Hiển thị các mục cùng hàng */
                gap: 20px; /* Khoảng cách giữa các mục */
                flex-wrap: wrap; /* Cho phép các mục xuống dòng nếu không đủ không gian */
            }
            .stat-item {
                background-color: #f8f9fa; /* Màu nền */
                padding: 15px; /* Khoảng cách nội dung */
                border: 1px solid #ddd; /* Viền */
                border-radius: 12px; /* Bo tròn góc */
                text-align: center; /* Căn giữa nội dung */
                font-weight: bold;
                flex: 1; /* Cho phép mỗi khối mở rộng đều nhau */
                min-width: 150px; /* Đặt chiều rộng tối thiểu cho các khối */
                max-width: 200px; /* Đặt chiều rộng tối đa cho các khối */
                transition: all 0.3s ease; /* Hiệu ứng mượt mà khi thay đổi kích thước */
            }
            .stat-item:hover {
                transform: scale(1.05); /* Tạo hiệu ứng phóng to khi di chuột qua */
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Đổ bóng khi hover */
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include> 
            <main>
                <section style="background-color: #00A8FF; height: 100px;">
                    <div class="slider-active">
                        <div class="single-slider slider-height d-flex align-items-center">
                            <div class="container">
                            </div>          
                        </div>
                    </div>
                </section>
                <div class="content-admin">
                    <!-- Sidebar -->
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

                    <!-- Main Content -->
                    <div class="admin">
                        <h1>Dashboard</h1>
                        <div class="cardadmin">
                            <h3>Welcome, Admin!</h3>
                            <p>This is your admin dashboard where you can manage accounts, comments, courses, orders, and categories.</p>
                        </div>

                        <div class="cardadmin">
                            <h3>Quick Stats</h3>
                            <div class="stats-grid">
                                <div class="stat-item">TotalAccounts:${totalAccounts}</div>
                            <div class="stat-item">TotalLearner:${totalLearner}</div>
                            <div class="stat-item">TotalCourses:${totalCourse}</div>
                            <div class="stat-item">TotalCategories:${totalCategories}</div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!-- JS here -->
        <script src="courses-master/assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="https://kit.fontawesome.com/79182c8e6c.js" crossorigin="anonymous"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="courses-master/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="courses-master/assets/js/popper.min.js"></script>
        <script src="courses-master/assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="courses-master/assets/js/jquery.slicknav.min.js"></script>
        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="courses-master/assets/js/owl.carousel.min.js"></script>
        <script src="courses-master/assets/js/slick.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="courses-master/assets/js/wow.min.js"></script>
        <script src="courses-master/assets/js/animated.headline.js"></script>
        <script src="courses-master/assets/js/jquery.magnific-popup.js"></script>
        <!-- Date Picker -->
        <script src="courses-master/assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="courses-master/assets/js/jquery.nice-select.min.js"></script>
        <script src="courses-master/assets/js/jquery.sticky.js"></script>
        <!-- Progress -->
        <script src="./assets/js/jquery.barfiller.js"></script>
        <!-- counter , waypoint,Hover Direction -->
        <script src="courses-master/assets/js/jquery.counterup.min.js"></script>
        <script src="courses-master/assets/js/waypoints.min.js"></script>
        <script src="courses-master/assets/js/jquery.countdown.min.js"></script>
        <script src="courses-master/assets/js/hover-direction-snake.min.js"></script>
        <!-- contact js -->
        <script src="courses-master/assets/js/contact.js"></script>
        <script src="courses-master/assets/js/jquery.form.js"></script>
        <script src="courses-master/assets/js/jquery.validate.min.js"></script>
        <script src="courses-master/assets/js/mail-script.js"></script>
        <script src="courses-master/assets/js/jquery.ajaxchimp.min.js"></script>
        <!-- Jquery Plugins, main Jquery -->	
        <script src="courses-master/assets/js/plugins.js"></script>
        <script src="courses-master/assets/js/main.js"></script>
    </body>
</html>
