<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard - Course List</title>
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
                height: 100vh;
            }
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
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
            .content {
                flex: 1;
                padding: 20px;
            }
            .content h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
                text-align: center;
            }
            .search-bar {
                text-align: center;
                margin-bottom: 20px;
            }
            .search-bar input[type="text"] {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                width: 300px;
            }
            .search-bar button {
                padding: 8px 16px;
                background-color: #2980b9;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 5px;
                font-size: 14px;
            }
            .search-bar button:hover {
                background-color: #3498db;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #2c3e50;
                color: #fff;
                font-weight: bold;
            }
            tr:hover {
                background-color: #f2f2f2;
            }
            .pagination {
                text-align: center;
                margin-top: 20px;
            }
            .pagination a {
                color: #2980b9;
                margin: 0 5px;
                text-decoration: none;
                font-weight: bold;
                font-size: 14px;
            }
            .pagination a:hover {
                text-decoration: underline;
            }
            .button {
                padding: 8px 12px;
                color: #fff;
                background-color: #2980b9;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
            }
            .button:hover {
                background-color: #3498db;
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

        <!-- Main Content -->
        <div class="content">
            <h1>Course List</h1>

            <!-- Search form -->
            <form action="viewcourselistbyadmin" method="get" class="search-bar">
                <input type="text" name="search" value="${searchKeyword}" placeholder="Search by Course Name or Description">
                <button type="submit">Search</button>
            </form>

            <!-- Course Table -->
            <table>
                <thead>
                    <tr>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty courseList}">
                        <c:forEach var="course" items="${courseList}">
                            <tr>
                                <td>${course.courseId}</td>
                                <td>${course.courseName}</td>
                                <td>${course.description}</td>
                                <td>$${course.price}</td>
                                <td>
                                    <form action="addcategorytocourse" method="post">
                                        <input type="hidden" name="courseId" value="${course.courseId}" />
                                        <select name="categoryId">
                                            <c:forEach var="category" items="${categoryMap[course.courseId]}">
                                                <option value="${category.categoryId}">${category.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                        <button type="submit" class="button">Add Category</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty courseList}">
                        <tr>
                            <td colspan="5" style="text-align: center;">No courses available</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

            <!-- Pagination controls -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="viewcourselistbyadmin?search=${searchKeyword}&page=${currentPage - 1}">Previous</a>
                </c:if>
                Page ${currentPage} of ${totalPages}
                <c:if test="${currentPage < totalPages}">
                    <a href="viewcourselistbyadmin?search=${searchKeyword}&page=${currentPage + 1}">Next</a>
                </c:if>
            </div>
        </div>
    </body>
</html>
