<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <title>EduChamp : Education HTML Template</title>

        <!-- MOBILE SPECIFIC -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

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

        <!-- TITLE -->
        <title>Add Course To Category</title>

        <!-- CSS -->
        <style>
            /* Định nghĩa bố cục chung */
            .layout {
                display: flex;
                flex-direction: column;
                height: 100vh;
            }

            /* Header */
            .header {
                flex: 0 0 auto;
                height: 60px; /* Chiều cao cố định cho header */
                background-color: #f1f1f1; /* Màu nền cho header */
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            /* Content Wrapper */
            .content-wrapper {
                display: flex;
                flex: 1;
                overflow: hidden;
            }

            /* Sidebar */
            .sidebar {
                flex: 0 0 250px; /* Chiều rộng cố định cho sidebar */
                background-color: #2c3e50; /* Màu nền cho sidebar */
                color: #fff;
                overflow-y: auto; /* Cuộn nếu nội dung quá dài */
                padding: 10px;
            }

            /* Main Content */
            .main-content {
                flex: 1; /* Chiếm toàn bộ không gian còn lại */
                background-color: #ecf0f1; /* Màu nền cho nội dung chính */
                padding: 20px;
                overflow-y: auto; /* Cuộn nếu nội dung quá dài */
            }

            /* Bảng trong nội dung chính */
            .main-content table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .main-content table th,
            .main-content table td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
            }

            .main-content table th {
                background-color: #34495e;
                color: #fff;
            }

            /* Nút và form trong main content */
            .main-content form {
                margin-bottom: 20px;
            }

            .main-content button {
                background-color: #3498db;
                color: #fff;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }

            .main-content button:hover {
                background-color: #2980b9;
            }
        </style>
    </head>
    <body>
        <div class="layout">
            <!-- Header -->
            <div class="header">
                <jsp:include page="header3.jsp"></jsp:include>
                </div>

                <!-- Content Wrapper -->
                <div class="content-wrapper">
                    <!-- Sidebar -->
                    <div class="sidebar">
                    <jsp:include page="sidebarleft.jsp"></jsp:include>
                    </div>

                    <!-- Main Content -->
                    <div class="main-content">
                        <br>
                        <br><!-- comment -->
                       <h1 style="text-align: center; margin-bottom: 10px;">Add Course To Category</h1>
                        <canvas id="roleChart"></canvas>



                        <!-- Notifications -->
                    <c:if test="${not empty sessionScope.success}">
                        <p>${sessionScope.success}</p>
                        <c:remove var="success" scope="session" />
                    </c:if>
                    <c:if test="${not empty sessionScope.error}">
                        <p>${sessionScope.error}</p>
                        <c:remove var="error" scope="session" />
                    </c:if>

                   
                    <!-- Search Form -->
                    <form action="addcoursetocategory" method="get">
                        <input type="hidden" name="category_id" value="${categoryId}">
                        <input type="text" name="searchQuery" value="${searchQuery}" placeholder="Search courses...">
                        <button type="submit">Search</button>
                    </form>
                    <!-- Back Button -->
                    <a href="viewcourseofcategory?category_id=${categoryId}">Back to Course List</a>
                    <!-- Course List -->
                    <c:if test="${not empty coursesNotInCategory}">
                        <form action="addcoursetocategory" method="post">
                            <input type="hidden" name="category_id" value="${categoryId}">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Select</th>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="course" items="${coursesNotInCategory}">
                                        <tr>
                                            <td><input type="checkbox" name="course_id" value="${course.id}"></td>
                                            <td>${course.id}</td>
                                            <td>${course.name}</td>
                                            <td>${course.description}</td>
                                            <td>${course.price}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <button type="submit">Add Selected Courses</button>
                        </form>
                    </c:if>

                    <!-- Pagination -->
                    <c:if test="${totalPages > 1}">
                        <div>
                            <a href="addcoursetocategory?category_id=${categoryId}&searchQuery=${searchQuery}&page=${currentPage - 1}">&lt;&lt; Previous</a>
                            <c:forEach begin="1" end="${totalPages}" var="page">
                                <a href="addcoursetocategory?category_id=${categoryId}&searchQuery=${searchQuery}&page=${page}">${page}</a>
                            </c:forEach>
                            <a href="addcoursetocategory?category_id=${categoryId}&searchQuery=${searchQuery}&page=${currentPage + 1}">Next &gt;&gt;</a>
                        </div>
                    </c:if>

                    <!-- No Courses Message -->
                    <c:if test="${empty coursesNotInCategory}">
                        <p>No courses found.</p>
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
