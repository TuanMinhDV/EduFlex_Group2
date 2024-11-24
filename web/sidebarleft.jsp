<%-- 
    Document   : sidebarleft
    Created on : Nov 24, 2024, 3:41:21 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            /* CSS cho giao diện cố định */
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }

            .ttr-sidebar {
                position: fixed; /* Fix sidebar tại chỗ */
                top: 0;
                left: 0;
                width: 250px; /* Chiều rộng sidebar cố định */
                height: 100%; /* Chiều cao full màn hình */
                background-color: #fff; /* Sidebar màu trắng */
                color: #000; /* Màu chữ đen */
                overflow-y: auto; /* Cuộn nếu nội dung dài */
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* Tạo hiệu ứng đổ bóng */
            }

            .ttr-sidebar-logo {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 15px;
                border-bottom: 1px solid #ddd; /* Đường viền ngăn cách */
            }

            .ttr-sidebar-logo img {
                max-width: 100%;
                height: auto;
            }

            .ttr-sidebar-navi {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            .ttr-sidebar-navi ul {
                padding: 0;
            }

            .ttr-sidebar-navi li {
                padding: 15px;
                border-bottom: 1px solid #ddd; /* Đường viền giữa các mục */
            }

            .ttr-sidebar-navi li a {
                text-decoration: none;
                color: #000; /* Màu chữ đen */
                font-size: 16px;
                display: block;
            }

            .content {
                margin-left: 250px; /* Chừa khoảng trống cho sidebar */
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-logo">
                <a href="#"><img alt="Logo" src="assets/images/logo.png" width="122" height="27"></a>
            </div>
            <!-- Sidebar menu -->
            <nav class="ttr-sidebar-navi">
                <ul>
                    <li>
                        <a href="homeadmincontroller" class="ttr-material-button">
                            <span class="ttr-label">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="accountcontrollerbyadmin" class="ttr-material-button">
                            <span class="ttr-label">View Account List</span>
                        </a>
                    </li>
                    <li>
                        <a href="viewcategorylistbyadmin" class="ttr-material-button">
                            <span class="ttr-label">View Category List</span>
                        </a>
                    </li>
                    <li>
                        <a href="accountcontrollerbyadmin" class="ttr-material-button">
                            <span class="ttr-label">View Comment List</span>
                        </a>
                    </li>
                    <li>
                        <a href="accountcontrollerbyadmin" class="ttr-material-button">
                            <span class="ttr-label">View OrderCourse List</span>
                        </a>
                    </li>
                    <li>
                        <a href="accountcontrollerbyadmin" class="ttr-material-button">
                            <span class="ttr-label">View Revenue</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- Left sidebar menu end -->

        <!-- Main content -->
        <div class="content">
            <h1>Welcome to Admin Dashboard</h1>
            <p>Here is your main content area.</p>
        </div>
    </body>
</html>
