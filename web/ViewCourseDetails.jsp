<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Course Details</title>
    </head>
    <body>

        <h1>Course Details List</h1>
        <!-- Nút Add Course to Category -->
        <a href="viewcourselistbyadmin?categoryId=${param.categoryId}">
            <button type="button">Add Course to Category</button>
        </a>
        </br>

        <a href="viewsubjectbyadmin">Back to Category List</a><br>
        
        </br>
        <!-- Form tìm kiếm -->
        <form action="showcoursedetails" method="get">
            <input type="hidden" name="categoryId" value="${param.categoryId}" />
            <input type="text" name="keyword" placeholder="Search by name or description" value="${param.keyword}" />
            <button type="submit">Search</button>
        </form>



        <!-- Hiển thị thông báo nếu có -->
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>

        <!-- Bảng danh sách khóa học -->
        <table border="1">
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
                                <button type="submit" onclick="return confirm('Are you sure you want to remove this course from the category?');">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Điều khiển phân trang -->
        <div>
            <c:if test="${hasPreviousPage}">
                <a href="showcoursedetails?categoryId=${param.categoryId}&keyword=${param.keyword}&page=${currentPage - 1}">Previous</a>
            </c:if>
            <c:if test="${hasNextPage}">
                <a href="showcoursedetails?categoryId=${param.categoryId}&keyword=${param.keyword}&page=${currentPage + 1}">Next</a>
            </c:if>
        </div>

    </body>
</html>


