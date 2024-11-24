<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course To Category</title>
    </head>
    <body>
        
        
        <h1>Add Courses To Category</h1>

        <!-- Hiển thị thông báo -->
        <c:if test="${not empty sessionScope.success}">
            <p>${sessionScope.success}</p>
            <c:remove var="success" scope="session" />
        </c:if>
        <c:if test="${not empty sessionScope.error}">
            <p>${sessionScope.error}</p>
            <c:remove var="error" scope="session" />
        </c:if>

        <!-- Form tìm kiếm -->
        <form action="addcoursetocategory" method="get">
            <input type="hidden" name="category_id" value="${categoryId}">
            <input type="text" name="searchQuery" value="${searchQuery}" placeholder="Search courses...">
            <button type="submit">Search</button>
        </form>

        <!-- Hiển thị danh sách khóa học -->
        <c:if test="${not empty coursesNotInCategory}">
            <form action="addcoursetocategory" method="post">
                <input type="hidden" name="category_id" value="${categoryId}">
                <table border="1">
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

        <!-- Hiển thị phân trang -->
        <c:if test="${totalPages > 1}">
            <div>
                <a href="addcoursetocategory?category_id=${categoryId}&searchQuery=${searchQuery}&page=${currentPage - 1}">&lt;&lt; Previous</a>

                <c:forEach begin="1" end="${totalPages}" var="page">
                    <a href="addcoursetocategory?category_id=${categoryId}&searchQuery=${searchQuery}&page=${page}">${page}</a>
                </c:forEach>

                <a href="addcoursetocategory?category_id=${categoryId}&searchQuery=${searchQuery}&page=${currentPage + 1}">Next &gt;&gt;</a>
            </div>
        </c:if>

        <!-- Thông báo nếu không có khóa học -->
        <c:if test="${empty coursesNotInCategory}">
            <p>No courses found.</p>
        </c:if>

        <!-- Nút quay lại -->
        <a href="viewcourseofcategory?category_id=${categoryId}">Back to Course List</a>
    </body>
</html>
