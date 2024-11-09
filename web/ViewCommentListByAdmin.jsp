<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.CommentControlByAdmin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Comment List</title>
        <style>
            /* Reset margin and padding */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                display: flex;
                min-height: 100vh;
            }
            /* Sidebar styles matching the Admin Dashboard */
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: #fff;
                display: flex;
                flex-direction: column;
                padding-top: 20px;
                position: fixed;
                height: 100%;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            }
            .sidebar h2 {
                text-align: center;
                font-size: 24px;
                padding: 10px 0;
                border-bottom: 1px solid #34495e;
            }
            .sidebar a {
                color: #ecf0f1;
                padding: 15px 20px;
                text-decoration: none;
                font-size: 18px;
                display: block;
                transition: background 0.3s;
            }
            .sidebar a:hover {
                background-color: #34495e;
            }
            /* Main content */
            .content {
                margin-left: 250px;
                padding: 20px;
                flex-grow: 1;
            }
            .content h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }
            .card {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            /* Table styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            /* Form styling */
            form {
                margin-bottom: 20px;
            }
            label {
                margin-right: 10px;
            }
            input[type="text"], input[type="date"], select {
                padding: 8px;
                margin-right: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            button {
                padding: 8px 12px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
            /* Pagination controls */
            .pagination {
                margin-top: 20px;
                text-align: center;
            }
            .pagination a, .pagination span {
                margin: 0 5px;
                padding: 8px 12px;
                text-decoration: none;
                color: #007bff;
            }
            .pagination a:hover {
                text-decoration: underline;
            }
            .pagination span {
                font-weight: bold;
                color: #333;
            }
        </style>
    </head>
    <body>

        <!-- Sidebar -->
        <div class="sidebar">
            <h2>EduFlex Admin</h2>
          
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/adminhomeservlet">Home</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewaccountlistbyadmin">View Account List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcommentlistbyadmin">View Comment List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcourselistbyadmin">View Course List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/ViewOrderListByAdmin">View Order List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewsubjectbyadmin">View Category List</a>
                    <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/revenueChart">Revenue</a>
        </div>

        <!-- Main content area -->
        <div class="content">
            <h1>Comment List</h1>

            <!-- Search Form -->
            <div class="card">
                <form action="viewcommentlistbyadmin" method="get">
                    <label for="keyword">Keyword:</label>
                    <input type="text" name="keyword" placeholder="Search by Account Name, Lesson Name, or Comment..." value="${keyword}">
                    <button type="submit">Search</button>
                </form>

                <!-- Filter Form -->
                <form action="viewcommentlistbyadmin" method="get">
                    <label for="status">Status:</label>
                    <select name="status">
                        <option value="">All</option>
                        <option value="1" ${status == '1' ? 'selected' : ''}>Active</option>
                        <option value="0" ${status == '0' ? 'selected' : ''}>Blocked</option>
                    </select>

                    <label for="startCommentDate">Start Comment Date:</label>
                    <input type="date" name="startCommentDate" value="${startCommentDate}">

                    <label for="endCommentDate">End Comment Date:</label>
                    <input type="date" name="endCommentDate" value="${endCommentDate}">

                    <label for="startReportDate">Start Report Date:</label>
                    <input type="date" name="startReportDate" value="${startReportDate}">

                    <label for="endReportDate">End Report Date:</label>
                    <input type="date" name="endReportDate" value="${endReportDate}">

                    <label for="reportedOnly">Reported Comments Only:</label>
                    <input type="checkbox" name="reportedOnly" value="true" ${reportedOnly ? "checked" : ""}>

                    <button type="submit">Apply Filters</button>
                </form>
            </div>

            <!-- Comment Table -->
            <div class="card">
                <table>
                    <tr>
                        <th>Comment ID</th>
                        <th>Account Name</th>
                        <th>Lesson Name</th>
                        <th>Comment</th>
                        <th>Comment Date</th>
                        <th>Status</th>
                        <th>Cause</th>
                        <th>Report Date</th>
                        <th>Change Status</th>
                    </tr>
                    <c:forEach var="comment" items="${comments}">
                        <tr>
                            <td>${comment.commentId}</td>
                            <td>${accountNames[comment.accountId]}</td>
                            <td>${lessonNames[comment.lessonId]}</td>
                            <td>${comment.comment}</td>
                            <td>${comment.commentDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${comment.status == 'active'}">active</c:when>
                                    <c:otherwise>blocked</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${comment.cause}</td>
                            <td>${comment.reportDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${comment.status == 'active'}">
                                        <a href="changestatuscommentbyadmin?commentId=${comment.commentId}&newStatus=0">Block</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="changestatuscommentbyadmin?commentId=${comment.commentId}&newStatus=1">Activate</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <!-- Pagination Controls -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="viewcommentlistbyadmin?page=${currentPage - 1}">Previous</a>
                </c:if>
                <span>Page ${currentPage}</span>
                <c:if test="${comments.size() == 10}">
                    <a href="viewcommentlistbyadmin?page=${currentPage + 1}">Next</a>
                </c:if>
            </div>
        </div>
    </body>
</html>
