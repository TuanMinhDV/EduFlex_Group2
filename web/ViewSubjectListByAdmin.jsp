<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List and Total Courses</title>
        <style>
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
        <!-- "Previous Page" button -->
        <c:if test="${currentPage > 1}">
            <a href="viewsubjectbyadmin?page=${currentPage - 1}&searchName=${searchName}">Previous Page</a>
        </c:if>
        <c:if test="${currentPage == 1}">
            <a class="disabled">Previous Page</a>
        </c:if>

        <!-- Page numbers -->
        <c:forEach var="i" begin="1" end="${noOfPages}">
            <a href="viewsubjectbyadmin?page=${i}&searchName=${searchName}" class="${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>

        <!-- "Next Page" button -->
        <c:if test="${currentPage < noOfPages}">
            <a href="viewsubjectbyadmin?page=${currentPage + 1}&searchName=${searchName}">Next Page</a>
        </c:if>
        <c:if test="${currentPage == noOfPages}">
            <a class="disabled">Next Page</a>
        </c:if>
    </div>
    </body>
</html>
