<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
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

        <title>Comment Management - EduChamp</title>

        <!-- MOBILE SPECIFIC -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSS FILES -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/vendors/calendar/fullcalendar.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="admin/assets/css/color/color-1.css">

        <!-- Custom CSS -->
        <style>
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

            .search-filter-section {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .search-filter-section form {
                margin-bottom: 15px;
            }

            .search-filter-section input,
            .search-filter-section select {
                margin: 5px;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .comment-table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
            }

            .comment-table th,
            .comment-table td {
                padding: 12px;
                border: 1px solid #ddd;
            }

            .comment-table th {
                background-color: #f4f4f4;
            }

            .pagination {
                margin-top: 20px;
                text-align: center;
            }

            .pagination a {
                padding: 8px 16px;
                margin: 0 4px;
                border: 1px solid #ddd;
                text-decoration: none;
            }

            .pagination a:hover {
                background-color: #f4f4f4;
            }

            .btn-action {
                padding: 6px 12px;
                border-radius: 4px;
                border: none;
                cursor: pointer;
            }

            .btn-block {
                background-color: #dc3545;
                color: white;
            }

            .btn-activate {
                background-color: #28a745;
                color: white;
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
                    <br>
                    <h1 class="mb-4">Comment Management</h1>

                <c:if test="${param.success == '1'}">
                    <div class="alert alert-success">Comment status updated successfully!</div>
                </c:if>
                <c:if test="${param.error == '1'}">
                    <div class="alert alert-danger">Failed to update comment status. Please try again!</div>
                </c:if>

                <div class="search-filter-section">
                    <!-- Search Form -->
                    <form method="get" action="commentcontrollerbyadmin" class="mb-3">
                        <h4>Search Comments</h4>
                        <input type="text" id="searchKeyword" name="searchKeyword" value="${searchKeyword}" placeholder="Username, Lesson, Comment">
                        <button type="submit" name="action" value="search" class="btn-action">Search</button>
                    </form>

                    <!-- Filter Form -->
                    <form method="get" action="commentcontrollerbyadmin">
                        <h4>Filter Options</h4>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Comment Date Range:</label>
                                <input type="date" id="startDate" name="startDate" value="${startDate}" class="form-control">
                                <input type="date" id="endDate" name="endDate" value="${endDate}" class="form-control mt-2">
                            </div>

                            <div class="col-md-3">
                                <label>Report Date Range:</label>
                                <input type="date" id="startReportDate" name="startReportDate" value="${startReportDate}" class="form-control">
                                <input type="date" id="endReportDate" name="endReportDate" value="${endReportDate}" class="form-control mt-2">
                            </div>

                            <div class="col-md-3">
                                <label>Status:</label>
                                <select id="status" name="status" class="form-control">
                                    <option value="">All</option>
                                    <option value="1" ${status == '1' ? 'selected' : ''}>Active</option>
                                    <option value="0" ${status == '0' ? 'selected' : ''}>Blocked</option>
                                </select>
                            </div>

                            <div class="col-md-3">
                                <div class="form-check mt-4">
                                    <input type="checkbox" class="form-check-input" name="onlyReported" value="true" ${onlyReported == 'true' ? 'checked' : ''}>
                                    <label class="form-check-label" style="margin-left: 20px;">Only Reported Comments</label>
                                </div>

                            </div>
                        </div>

                        <div class="mt-3">
                            <button type="submit" name="action" value="filter" class="btn btn-primary">Apply Filter</button>
                            <button type="submit" name="action" value="clearFilter" class="btn btn-secondary">Clear Filter</button>
                        </div>
                    </form>
                </div>

                <!-- Comment Table -->
                <table class="comment-table">
                    <thead>
                        <tr>
                            <th>Comment ID</th>
                            <th>Username</th>
                            <th>Lesson Name</th>
                            <th>Comment</th>
                            <th>Comment Date</th>
                            <th>Status</th>
                            <th>Report Date</th>
                            <th>Cause</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="comment" items="${comments}">
                            <tr>
                                <td>${comment.commentId}</td>
                                <td>${comment.accountName}</td>
                                <td>${comment.lessonName}</td>
                                <td>${comment.comment}</td>
                                <td>${comment.commentDate}</td>
                                <td>
                                    <span class="badge ${comment.status == '1' ? 'badge-success' : 'badge-danger'}">
                                        ${comment.status == '1' ? 'Active' : 'Blocked'}
                                    </span>
                                </td>
                                <td>${comment.reportDate}</td>
                                <td>${comment.cause}</td>
                                <td>
                                    <form method="post" action="changestatuscommentbyadmin">
                                        <input type="hidden" name="commentId" value="${comment.commentId}">
                                        <input type="hidden" name="status" value="${comment.status}">
                                        <button type="submit" class="btn-action ${comment.status == '1' ? 'btn-block' : 'btn-activate'}">
                                            ${comment.status == '1' ? 'Block' : 'Activate'}
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="<c:url value='commentcontrollerbyadmin'>
                               <c:param name='page' value='${currentPage - 1}'/>
                               <c:param name='startDate' value='${startDate}'/>
                               <c:param name='endDate' value='${endDate}'/>
                               <c:param name='status' value='${status}'/>
                               <c:param name='onlyReported' value='${onlyReported}'/>
                               <c:param name='searchKeyword' value='${searchKeyword}'/>
                               <c:param name='startReportDate' value='${startReportDate}'/>
                               <c:param name='endReportDate' value='${endReportDate}'/>
                           </c:url>">&lt; Previous</a>
                    </c:if>

                    <c:forEach begin="1" end="${totalPages}" var="pageNum">
                        <a href="<c:url value='commentcontrollerbyadmin'>
                               <c:param name='page' value='${pageNum}'/>
                               <c:param name='startDate' value='${startDate}'/>
                               <c:param name='endDate' value='${endDate}'/>
                               <c:param name='status' value='${status}'/>
                               <c:param name='onlyReported' value='${onlyReported}'/>
                               <c:param name='searchKeyword' value='${searchKeyword}'/>
                               <c:param name='startReportDate' value='${startReportDate}'/>
                               <c:param name='endReportDate' value='${endReportDate}'/>
                           </c:url>" ${pageNum == currentPage ? 'class="active"' : ''}>
                            ${pageNum}
                        </a>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <a href="<c:url value='commentcontrollerbyadmin'>
                               <c:param name='page' value='${currentPage + 1}'/>
                               <c:param name='startDate' value='${startDate}'/>
                               <c:param name='endDate' value='${endDate}'/>
                               <c:param name='status' value='${status}'/>
                               <c:param name='onlyReported' value='${onlyReported}'/>
                               <c:param name='searchKeyword' value='${searchKeyword}'/>
                               <c:param name='startReportDate' value='${startReportDate}'/>
                               <c:param name='endReportDate' value='${endReportDate}'/>
                           </c:url>">Next &gt;</a>
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