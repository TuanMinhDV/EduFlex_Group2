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

        <style>
            /* General body styling */
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                line-height: 1.6;
                background-color: #f9f9f9;
            }

            /* Main layout wrapper */
            .layout {
                display: flex;
                flex-direction: column;
                height: 100vh;
            }

            /* Content wrapper for sidebar and main content */
            .content-wrapper {
                display: flex;
                flex: 1;
                overflow: hidden;
            }

            /* Sidebar styling */
            .sidebar {
                width: 250px;
                padding: 20px;
                overflow-y: auto;
            }

            /* Main content styling */
            .main-content {
                flex: 1;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                overflow-y: auto;
                border-radius: 4px;
            }

            /* Heading styling */
            .main-content h1 {
                text-align: center;
                font-size: 1.8rem;
                margin-bottom: 20px;
                color: #333;
            }

            /* Table styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #fff;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                border-radius: 4px;
                overflow: hidden;
            }

            table th, table td {
                padding: 12px 15px;
                border: 1px solid #ddd;
                text-align: left;
            }

            table th {
                background-color: #f4f4f4;
                font-weight: bold;
                color: #333;
            }

            table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            table tr:hover {
                background-color: #f1f1f1;
            }

            /* Links styling */
            a {
                color: #007bff;
                text-decoration: none;
                font-weight: 500;
                margin-right: 10px;
            }

            a:hover {
                text-decoration: underline;
            }

            /* Button styling */
            button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 8px 12px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 0.9rem;
            }

            button:hover {
                background-color: #0056b3;
            }

            /* Form styling */
            form {
                display: flex;
                align-items: center;
                margin-top: 10px;
            }

            form input[type="text"] {
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                flex: 1;
                margin-right: 10px;
                font-size: 0.9rem;
            }

            form button {
                padding: 8px 16px;
            }

            /* Pagination styling */
            .pagination {
                margin-top: 20px;
                text-align: center;
            }

            .pagination a {
                color: #007bff;
                text-decoration: none;
                margin: 0 5px;
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 0.9rem;
                display: inline-block;
            }

            .pagination a:hover {
                background-color: #007bff;
                color: #fff;
                border-color: #007bff;
            }

            /* Success and error message styling */
            .success-message, .error-message {
                padding: 10px 15px;
                margin-bottom: 20px;
                border-radius: 4px;
                font-size: 0.9rem;
            }

            .success-message {
                background-color: #d4edda;
                color: #155724;
                border: 1px solid #c3e6cb;
            }

            .error-message {
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }
        </style>
    </head>
    <body>
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
                    <br>
                    <h1>List Course Of Category: 
                        <c:choose>
                            <c:when test="${not empty category}">
                                ${category.name}
                            </c:when>
                            <c:otherwise>
                                Unknown
                            </c:otherwise>
                        </c:choose>
                    </h1>

                    <!-- Success Message -->
                    <c:if test="${not empty sessionScope.success}">
                        <p class="success-message">${sessionScope.success}</p>
                        <c:remove var="success" scope="session" />
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty sessionScope.error}">
                        <p class="error-message">${sessionScope.error}</p>
                        <c:remove var="error" scope="session" />
                    </c:if>

                    <!-- Back and Add Buttons -->
                    <div>
                        <a href="viewcategorylistbyadmin">Back to Category List</a>
                        <a href="addcoursetocategory?category_id=${category.id}">Add Course To Category</a>
                    </div>

                    <!-- Search Form -->
                    <form action="viewcourseofcategory" method="get" style="margin-top: 20px;">
                        <input type="hidden" name="category_id" value="${category.id}">
                        <input type="text" name="searchQuery" value="${searchQuery}" placeholder="Search courses...">
                        <button type="submit">Search</button>
                    </form>

                    <!-- Courses Table -->
                    <c:if test="${not empty courses}">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Created Date</th>
                                    <th>Updated Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="course" items="${courses}">
                                    <tr>
                                        <td>${course.id}</td>
                                        <td>${course.name}</td>
                                        <td>${course.description}</td>
                                        <td>${course.price}</td>
                                        <td>${course.created_date}</td>
                                        <td>${course.updated_date}</td>
                                        <td>
                                            <form action="deletecoursefromcategory" method="post" style="display:inline;">
                                                <input type="hidden" name="course_id" value="${course.id}">
                                                <input type="hidden" name="category_id" value="${category.id}">
                                                <button type="submit">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <!-- Pagination -->
                    <div class="pagination">
                        <c:if test="${totalPages > 1}">
                            <a href="viewcourseofcategory?category_id=${category.id}&searchQuery=${searchQuery}&page=${currentPage - 1}">
                                &lt;&lt; Previous
                            </a>

                            <c:forEach begin="1" end="${totalPages}" var="page">
                                <a href="viewcourseofcategory?category_id=${category.id}&searchQuery=${searchQuery}&page=${page}">
                                    ${page}
                                </a>
                            </c:forEach>

                            <a href="viewcourseofcategory?category_id=${category.id}&searchQuery=${searchQuery}&page=${currentPage + 1}">
                                Next &gt;&gt;
                            </a>
                        </c:if>
                    </div>

                    <!-- Empty Courses Message -->
                    <c:if test="${empty courses}">
                        <p>No courses found in this category.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
