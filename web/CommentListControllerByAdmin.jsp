<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Comment Management</title>
    </head>
    <body>
        <h1>Comment List</h1>

        <!-- Form Search -->
        <form method="get" action="commentcontrollerbyadmin">
            <h2>Search</h2>
            <label for="searchKeyword">Search:</label>
            <input type="text" id="searchKeyword" name="searchKeyword" value="${searchKeyword}" placeholder="Username, Lesson, Comment">
            <button type="submit" name="action" value="search">Search</button>
        </form>
        <hr>

        <!-- Form Filter -->
        <form method="get" action="commentcontrollerbyadmin">
            <h2>Filter</h2>
            <label for="startDate">Comment Start Date:</label>
            <input type="date" id="startDate" name="startDate" value="${startDate}">

            <label for="endDate">Comment End Date:</label>
            <input type="date" id="endDate" name="endDate" value="${endDate}">

            <label for="startReportDate">Report Start Date:</label>
            <input type="date" id="startReportDate" name="startReportDate" value="${startReportDate}">

            <label for="endReportDate">Report End Date:</label>
            <input type="date" id="endReportDate" name="endReportDate" value="${endReportDate}">

            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="">All</option>
                <option value="1" ${status == '1' ? 'selected' : ''}>Active</option>
                <option value="0" ${status == '0' ? 'selected' : ''}>Blocked</option>
            </select>

            <label>
                <input type="checkbox" name="onlyReported" value="true" ${onlyReported == 'true' ? 'checked' : ''}>
                Only Reported Comments
            </label>

            <div>
                <button type="submit" name="action" value="filter">Apply Filter</button>
                <button type="submit" name="action" value="clearFilter">Clear Filter</button>
            </div>
        </form>
        <hr>

        <!-- Bảng danh sách bình luận -->
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Comment ID</th>
                    <th>Username</th>
                    <th>Lesson Name</th>
                    <th>Comment</th>
                    <th>Comment Date</th>
                    <th>Status</th>
                    <th>Report Date</th>
                    <th>Cause</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="comment" items="${comments}">
                    <tr>
                        <td>${comment.commentId}</td>
                        <td>${comment.accountName}</td>
                        <td>${comment.lessonName}</td>
                        <td>${comment.comment}</td>
                        <td>${comment.commentDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${comment.status == '1'}">Active</c:when>
                                <c:otherwise>Blocked</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${comment.reportDate}</td>
                        <td>${comment.cause}</td>
                        <td>
                            <form method="post" action="changeaccountstatusbyadmin">
                                <input type="hidden" name="commentId" value="${comment.commentId}">
                                <input type="hidden" name="status" value="${comment.status}">
                                <button type="submit" class="btn btn-sm ${comment.status == '1' ? 'btn-danger' : 'btn-success'}">
                                    <c:choose>
                                        <c:when test="${comment.status == '1'}">Block</c:when>
                                        <c:otherwise>Activate</c:otherwise>
                                    </c:choose>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </table>

    <!-- Phân trang -->
    <div>
        <c:if test="${currentPage > 1}">
            <a href="<c:url value='commentcontrollerbyadmin'>
                   <c:param name='page' value='${currentPage - 1}'/>
                   <c:param name='startDate' value='${startDate}'/>
                   <c:param name='endDate' value='${endDate}'/>
                   <c:param name='status' value='${status}'/>
                   <c:param name='onlyReported' value='${onlyReported}'/>
                   <c:param name='searchKeyword' value='${searchKeyword}'/>
                   <c:param name='startReportDate' value='${startReportDate}'/>
                   <c:param name='endReportDate' value='${endReportDate}'/>
               </c:url>">
                &lt;&lt; Previous
            </a>
        </c:if>

        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <c:choose>
                <c:when test="${pageNum == currentPage}">
                    <strong>${pageNum}</strong>
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='commentcontrollerbyadmin'>
                           <c:param name='page' value='${pageNum}'/>
                           <c:param name='startDate' value='${startDate}'/>
                           <c:param name='endDate' value='${endDate}'/>
                           <c:param name='status' value='${status}'/>
                           <c:param name='onlyReported' value='${onlyReported}'/>
                           <c:param name='searchKeyword' value='${searchKeyword}'/>
                           <c:param name='startReportDate' value='${startReportDate}'/>
                           <c:param name='endReportDate' value='${endReportDate}'/>
                       </c:url>">
                        ${pageNum}
                    </a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="<c:url value='commentcontrollerbyadmin'>
                   <c:param name='page' value='${currentPage + 1}'/>
                   <c:param name='startDate' value='${startDate}'/>
                   <c:param name='endDate' value='${endDate}'/>
                   <c:param name='status' value='${status}'/>
                   <c:param name='onlyReported' value='${onlyReported}'/>
                   <c:param name='searchKeyword' value='${searchKeyword}'/>
                   <c:param name='startReportDate' value='${startReportDate}'/>
                   <c:param name='endReportDate' value='${endReportDate}'/>
               </c:url>">
                Next &gt;&gt;
            </a>
        </c:if>
    </div>
</body>
</html>
