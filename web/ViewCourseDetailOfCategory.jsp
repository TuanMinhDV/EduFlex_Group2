<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Details</title>
        <style>
            .btn {
                display: inline-block;
                margin: 5px;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
            }
            .btn-back {
                background-color: #007BFF;
                color: white;
            }
            .btn-delete {
                background-color: red;
                color: white;
            }
            .disabled {
                pointer-events: none;
                color: gray;
            }
        </style>
    </head>
    <body>
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

        <!-- Hiển thị thông báo thành công -->
        <c:if test="${not empty sessionScope.success}">
            <p style="color:green; font-weight: bold;">${sessionScope.success}</p>
            <c:remove var="success" scope="session" />
        </c:if>

        <!-- Hiển thị thông báo lỗi -->
        <c:if test="${not empty sessionScope.error}">
            <p style="color:red; font-weight: bold;">${sessionScope.error}</p>
            <c:remove var="error" scope="session" />
        </c:if>

        <!-- Nút Back to Category List và Add Course To Category -->
        <div>
            <a href="viewcategorylistbyadmin" class="btn btn-back">Back to Category List</a>
            <a href="addcoursetocategory?category_id=${category.id}" class="btn btn-back">Add Course To Category</a>
        </div>


        <!-- Form tìm kiếm -->
        <form action="viewcourseofcategory" method="get">
            <input type="hidden" name="category_id" value="${category.id}">
            <input type="text" name="searchQuery" value="${searchQuery}" placeholder="Search courses...">
            <button type="submit" class="btn">Search</button>
        </form>

        <br>

        <!-- Hiển thị danh sách khóa học -->
        <c:if test="${not empty courses}">
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Created Date</th>
                        <th>Updated Date</th>
                        <th>Action</th> <!-- Cột hành động -->
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
                                <!-- Nút Delete -->
                                <form action="deletecoursefromcategory" method="post" style="display:inline;">
                                    <input type="hidden" name="course_id" value="${course.id}">
                                    <input type="hidden" name="category_id" value="${category.id}">
                                    <button type="submit" class="btn btn-delete">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- Hiển thị phân trang -->
        <div>
            <c:if test="${totalPages > 1}">
                <a href="viewcourseofcategory?category_id=${category.id}&searchQuery=${searchQuery}&page=${currentPage - 1}" 
                   class="btn ${currentPage == 1 ? 'disabled' : ''}">
                    &lt;&lt; Previous
                </a>

                <c:forEach begin="1" end="${totalPages}" var="page">
                    <a href="viewcourseofcategory?category_id=${category.id}&searchQuery=${searchQuery}&page=${page}"
                       class="btn ${page == currentPage ? 'btn-back' : ''}">
                        ${page}
                    </a>
                </c:forEach>

                <a href="viewcourseofcategory?category_id=${category.id}&searchQuery=${searchQuery}&page=${currentPage + 1}" 
                   class="btn ${currentPage == totalPages ? 'disabled' : ''}">
                    Next &gt;&gt;
                </a>
            </c:if>
        </div>

        <!-- Hiển thị thông báo nếu danh sách rỗng -->
        <c:if test="${empty courses}">
            <p>No courses found in this category.</p>
        </c:if>
    </body>
</html>
