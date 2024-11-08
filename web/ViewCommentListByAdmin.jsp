<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CommentControlByAdmin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comment List</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>

        <h1>Comment List</h1>

        <!-- Form tìm kiếm -->
        <form action="viewcommentlistbyadmin" method="get">
            <label for="keyword">Keyword:</label>
            <input type="text" name="keyword" placeholder="Search by Account Name, Lesson Name, or Comment..." value="${keyword}">
            <button type="submit">Search</button>
        </form>


        <!-- Form lọc -->
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

        <br>

        <!-- Table hiển thị bình luận -->
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
                    <td><c:choose>
                            <c:when test="${comment.status == 'active'}">active</c:when>
                            <c:otherwise>blocked</c:otherwise>
                        </c:choose></td>
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

        <!-- Điều hướng phân trang -->
        <div>
            <c:if test="${currentPage > 1}">
                <a href="viewcommentlistbyadmin?page=${currentPage - 1}">Previous</a>
            </c:if>
            <span>Page ${currentPage}</span>
            <c:if test="${comments.size() == 10}">
                <a href="viewcommentlistbyadmin?page=${currentPage + 1}">Next</a>
            </c:if>
        </div>

    </body>
</html>
