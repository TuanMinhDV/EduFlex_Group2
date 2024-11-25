<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Category Management</title>

        <!-- FAVICONS ICON -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/images/favicon.png" />

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
            /* Grid Layout */
            .layout {
                display: grid;
                grid-template-areas:
                    "header header"
                    "sidebar main";
                grid-template-columns: 250px 1fr;
                grid-template-rows: auto 1fr;
                min-height: 100vh;
            }

            .header {
                grid-area: header;
                background-color: #f4f4f4;
                padding: 10px;
                z-index: 100;
            }

            .sidebar {
                grid-area: sidebar;
                background-color: #333;
                color: white;
                padding: 10px;
                overflow-y: auto;
                position: sticky;
                top: 0;
                height: 100vh;
            }

            .main-content {
                grid-area: main;
                padding: 20px;
                background-color: #fff;
                overflow-y: auto;
            }

            /* Category Management Specific Styles */
            .category-form {
                background: #fff;
                padding: 15px;
                border-radius: 4px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                margin-bottom: 15px;
            }

            .search-form {
                margin: 20px 0;
                display: flex;
                gap: 10px;
            }

            .category-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                background: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .category-table th,
            .category-table td {
                padding: 12px;
                text-align: left;
                border: 1px solid #ddd;
            }

            .category-table th {
                background: #f5f5f5;
            }

            .action-buttons {
                display: flex;
                gap: 5px;
            }

            .pagination {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin: 20px 0;
            }

            .pagination a {
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                text-decoration: none;
                color: #333;
            }

            .pagination strong {
                padding: 8px 12px;
                background: #007bff;
                color: white;
                border-radius: 4px;
            }

            input[type="text"],
            button {
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
            }

            button {
                background: #007bff;
                color: white;
                border: none;
                cursor: pointer;
                transition: background 0.3s;
            }

            button:hover {
                background: #0056b3;
            }
        </style>

        <script>
            function populateUpdateForm(categoryId, categoryName) {
                document.getElementById('categoryId').value = categoryId;
                document.getElementById('categoryName').value = categoryName;
                document.getElementById('addOrUpdateButton').innerText = 'Update Category';
            }

            function resetForm() {
                document.getElementById('categoryId').value = 0;
                document.getElementById('categoryName').value = '';
                document.getElementById('addOrUpdateButton').innerText = 'Add Category';
            }
        </script>
    </head>
    <body>
        <div class="layout">
            <!-- Header -->
            <div class="header">
                <jsp:include page="header3.jsp"></jsp:include>
                </div>

                <!-- Sidebar -->
                <div class="sidebar">
                <jsp:include page="sidebarleft2.jsp"></jsp:include>
                </div>

                <!-- Main Content -->
                <div class="main-content">
                    <br>
                    <h1>Category Management</h1>

                <c:if test="${not empty message}">
                    <div class="alert alert-info">${message}</div>
                </c:if>

                <div class="category-form">
                    <div style="display: flex; align-items: center; justify-content: space-between;">
                        <!-- Form Search -->
                        <form method="get" action="viewcategorylistbyadmin" style="margin-right: 20px;">
                            <input type="text" name="searchQuery" placeholder="Search categories..." value="${searchQuery}" style="margin-right: 5px;">
                            <button type="submit">Search</button>
                        </form>

                        <!-- Form Update -->
                        <form action="crudcategorybyadmin" method="post" style="display: flex; align-items: center;">
                            <input type="hidden" name="categoryId" id="categoryId" value="0">
                            <input type="text" name="categoryName" id="categoryName" placeholder="Category Name" required pattern="[A-Za-z0-9 ]+" style="margin-right: 5px;">
                            <button type="submit" name="action" value="addOrUpdate" id="addOrUpdateButton" style="margin-right: 5px;">Add Category</button>
                            <button type="button" onclick="resetForm()">Reset</button>
                        </form>
                    </div>

                </div>

                <div class="search-form">

                </div>

                <table class="category-table">
                    <thead>
                        <tr>
                            <th>Category ID</th>
                            <th>Category Name</th>
                            <th>Total Courses</th>
                            <th>Updated Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="category" items="${categories}">
                            <tr>
                                <td>${category.id}</td>
                                <td>${category.name}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${totalCoursesMap[category.id] != null}">
                                            ${totalCoursesMap[category.id]}
                                        </c:when>
                                        <c:otherwise>0</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${category.updated_date}</td>
                                <td class="action-buttons">
                                    <button type="button" onclick="populateUpdateForm('${category.id}', '${category.name}')">Edit</button>
                                    <form action="crudcategorybyadmin" method="post" style="display: inline;">
                                        <input type="hidden" name="categoryId" value="${category.id}">
                                        <button type="submit" name="action" value="delete" onclick="return confirm('Are you sure you want to delete this category?')">Delete</button>
                                    </form>
                                    <form action="viewcourseofcategory" method="get" style="display: inline;">
                                        <input type="hidden" name="category_id" value="${category.id}">
                                        <button type="submit">Show Courses</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${categories == null || categories.size() == 0}">
                            <tr>
                                <td colspan="6">No categories found</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>

                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="viewcategorylistbyadmin?page=${currentPage - 1}&searchQuery=${searchQuery}">Previous</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="pageNum">
                        <c:choose>
                            <c:when test="${pageNum == currentPage}">
                                <strong>${pageNum}</strong>
                            </c:when>
                            <c:otherwise>
                                <a href="viewcategorylistbyadmin?page=${pageNum}&searchQuery=${searchQuery}">${pageNum}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="viewcategorylistbyadmin?page=${currentPage + 1}&searchQuery=${searchQuery}">Next</a>
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
    </body>
</html>