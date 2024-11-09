<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <style>
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
            }
            .card {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .message {
                font-size: 1.1em;
                margin-bottom: 15px;
                padding: 10px;
                border-radius: 5px;
                width: fit-content;
            }
            .error {
                color: red;
                background-color: #fdd;
            }
            .success {
                color: green;
                background-color: #dfd;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ccc;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
        <script>
            function editCategory(categoryId, categoryName) {
                document.getElementById("categoryId").value = categoryId;
                document.getElementById("categoryName").value = categoryName;
                document.getElementById("addOrUpdateButton").textContent = "Update";
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
            <h1>Category List and Total Courses</h1>

            <!-- Display error message -->
            <c:if test="${param.errorMessage != null}">
                <div class="message error">${param.errorMessage}</div>
            </c:if>

            <!-- Display success message -->
            <c:if test="${param.successMessage != null}">
                <div class="message success">${param.successMessage}</div>
            </c:if>

            <table>
                <tr>
                    <td>
                        <!-- Search form -->
                        <form action="viewsubjectbyadmin" method="get">
                            <input type="text" name="searchName" placeholder="Search category..." value="${searchName}">
                            <button type="submit">Search</button>
                        </form>
                    </td>
                    <td>
                        <!-- Add/update category form -->
                        <form action="viewsubjectbyadmin" method="post">
                            <input type="hidden" name="categoryId" id="categoryId" value="0">
                            <input type="text" name="categoryName" id="categoryName" placeholder="Category Name" required>
                            <button type="submit" name="action" value="addOrUpdate" id="addOrUpdateButton">Add Category</button>
                        </form>
                    </td>
                </tr>
            </table>        

            <table>
                <thead>
                    <tr>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>Total Courses</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="subject" items="${subjectList}">
                        <tr>
                            <td>${subject.categoryId}</td>
                            <td>${subject.categoryName}</td>
                            <td>${subject.totalCourses}</td>
                            <td>
                                <!-- Edit category -->
                                <button type="button" onclick="editCategory(${subject.categoryId}, '${subject.categoryName}')">Edit</button>
                                <!-- Delete category -->
                                <form action="viewsubjectbyadmin" method="post" style="display:inline;">
                                    <input type="hidden" name="categoryId" value="${subject.categoryId}">
                                    <button type="submit" name="action" value="delete" onclick="return confirm('Are you sure you want to delete?');">Delete</button>
                                </form>
                                <!-- Show course details -->
                                <form action="showcoursedetails" method="get" style="display:inline;">
                                    <input type="hidden" name="categoryId" value="${subject.categoryId}">
                                    <button type="submit">Show Detail Courses of Subject</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Pagination -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="viewsubjectbyadmin?page=${currentPage - 1}&searchName=${searchName}">Before</a>
                </c:if>
                <c:if test="${currentPage == 1}">
                    <a class="disabled">Before</a>
                </c:if>
                <c:if test="${currentPage < noOfPages}">
                    <a href="viewsubjectbyadmin?page=${currentPage + 1}&searchName=${searchName}">After</a>
                </c:if>
                <c:if test="${currentPage == noOfPages}">
                    <a class="disabled">After</a>
                </c:if>
            </div>
        </div>
    </body>
</html>
