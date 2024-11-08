<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Course List</title>
        <style>
            /* Style cho bảng dữ liệu */
        </style>
    </head>
    <body>
        <h1 style="text-align: center;">Course List</h1>

        <!-- Search form -->
        <form action="viewcourselistbyadmin" method="get" style="text-align: center; margin-bottom: 20px;">
            <input type="text" name="search" value="${searchKeyword}" placeholder="Search by Course Name or Description">
            <button type="submit">Search</button>
        </form>

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
                                    <button type="submit">Add Category</button>
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
        <div style="text-align: center; margin-top: 20px;">
            <c:if test="${currentPage > 1}">
                <a href="viewcourselistbyadmin?search=${searchKeyword}&page=${currentPage - 1}">Previous</a>
            </c:if>
            Page ${currentPage} of ${totalPages}
            <c:if test="${currentPage < totalPages}">
                <a href="viewcourselistbyadmin?search=${searchKeyword}&page=${currentPage + 1}">Next</a>
            </c:if>
        </div>
    </body>
</html>
