<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard - Course Details</title>
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
            /* Sidebar */
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
            /* Main content */
            .content {
                flex: 1;
                padding: 20px;
            }
            .content h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }
            .button {
                display: inline-block;
                padding: 8px 12px;
                margin: 5px 5px 15px 0;
                color: #fff;
                background-color: #2980b9;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                font-size: 14px;
            }
            .button:hover {
                background-color: #3498db;
            }
            .search-bar {
                display: flex;
                gap: 8px;
                margin-bottom: 15px;
            }
            .search-bar input[type="text"] {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                flex: 1;
            }
            .search-bar button {
                background-color: #2980b9;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 8px 12px;
                cursor: pointer;
                font-size: 14px;
            }
            .search-bar button:hover {
                background-color: #3498db;
            }
            .message {
                font-size: 1.1em;
                padding: 10px;
                border-radius: 5px;
                width: fit-content;
                margin-bottom: 15px;
            }
            .error {
                color: #a94442;
                background-color: #f2dede;
                border: 1px solid #ebccd1;
            }
            .success {
                color: #3c763d;
                background-color: #dff0d8;
                border: 1px solid #d6e9c6;
            }
            /* Table styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }
            th, td {
                padding: 12px 15px;
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
            .pagination a {
                color: #2980b9;
                margin: 0 5px;
                text-decoration: none;
                font-size: 14px;
                font-weight: bold;
            }
            .pagination a:hover {
                text-decoration: underline;
            }
        </style>
        <script>
            function confirmDelete() {
                return confirm('Are you sure you want to remove this course from the category?');
            }
        </script>
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
            <h1>Course of Category </h1>

            <!-- Nút Add Course to Category và Back -->
            <a href="viewcourselistbyadmin?categoryId=${param.categoryId}" class="button">Add Course to Category</a>
            <a href="viewsubjectbyadmin" class="button">Back to Category List</a>

            <!-- Form tìm kiếm -->
            <form action="showcoursedetails" method="get" class="search-bar">
                <input type="hidden" name="categoryId" value="${param.categoryId}" />
                <input type="text" name="keyword" placeholder="Search by name or description" value="${param.keyword}" />
                <button type="submit">Search</button>
            </form>

            <!-- Hiển thị thông báo nếu có -->
            <c:if test="${not empty message}">
                <p class="message ${messageType}">${message}</p>
            </c:if>

            <!-- Bảng danh sách khóa học -->
            <table>
                <thead>
                    <tr>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="course" items="${courseList}">
                        <tr>
                            <td>${course.courseId}</td>
                            <td>${course.courseName}</td>
                            <td>${course.description}</td>
                            <td>${course.price}</td>
                            <td>
                                <!-- Nút xóa -->
                                <form action="showcoursedetails" method="post" style="display:inline;">
                                    <input type="hidden" name="categoryId" value="${param.categoryId}" />
                                    <input type="hidden" name="courseId" value="${course.courseId}" />
                                    <input type="hidden" name="action" value="deleteCourse" />
                                    <button type="submit" onclick="return confirmDelete();" class="button" style="background-color: #e74c3c;">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Điều khiển phân trang -->
            <div class="pagination">
                <c:if test="${hasPreviousPage}">
                    <a href="showcoursedetails?categoryId=${param.categoryId}&keyword=${param.keyword}&page=${currentPage - 1}">Previous</a>
                </c:if>
                <c:if test="${hasNextPage}">
                    <a href="showcoursedetails?categoryId=${param.categoryId}&keyword=${param.keyword}&page=${currentPage + 1}">Next</a>
                </c:if>
            </div>
        </div>
    </body>
</html>
