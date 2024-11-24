<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                padding: 0;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                margin-bottom: 20px;
                text-align: center;
            }
            form label {
                margin-right: 10px;
                font-weight: bold;
            }
            form input {
                margin-right: 20px;
                padding: 5px;
                font-size: 14px;
            }
            form button {
                padding: 8px 16px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 14px;
            }
            form button:hover {
                background-color: #45a049;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }
            .pagination {
                text-align: center;
                margin-top: 20px;
            }
            .pagination a, .pagination strong {
                padding: 5px 10px;
                margin: 2px;
                border: 1px solid black;
                text-decoration: none;
                background-color: #f2f2f2;
                color: black;
                font-size: 14px;
            }
            .pagination strong {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover {
                background-color: #ddd;
            }
        </style>
        <script>
            function clearFilters() {
                window.location.href = "viewordercourselistbyadmin";
            }
        </script>
    </head>
    <body>
        <h1>Danh sách lịch sử đơn hàng</h1>

        <!-- Form lọc -->
        <form method="get" action="viewordercourselistbyadmin">
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" value="${startDate}">
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" value="${endDate}">
            <label for="minMoney">Min Money:</label>
            <input type="number" id="minMoney" name="minMoney" step="0.01" value="${minMoney}">
            <label for="maxMoney">Max Money:</label>
            <input type="number" id="maxMoney" name="maxMoney" step="0.01" value="${maxMoney}">
            <button type="submit">Filter</button>
            <button type="button" onclick="clearFilters()">Clear Filter</button>
        </form>

        <!-- Bảng danh sách đơn hàng -->
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Account ID</th>
                    <th>Account Name</th>
                    <th>Order Date</th>
                    <th>Total Money</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.accountId}</td>
                        <td>${order.accountName}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.totalMoney}</td>
                        <td>
                            <form method="get" action="ordercoursedetailbyid">
                                <input type="hidden" name="orderId" value="${order.orderId}">
                                <button type="submit">Show Detail</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty orderList}">
                    <tr>
                        <td colspan="6">Không có đơn hàng nào phù hợp</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- Phân trang -->
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="viewordercourselistbyadmin?page=${currentPage - 1}&startDate=${startDate}&endDate=${endDate}&minMoney=${minMoney}&maxMoney=${maxMoney}">&lt;&lt; Previous</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${totalPages}">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <strong>${i}</strong>
                    </c:when>
                    <c:otherwise>
                        <a href="viewordercourselistbyadmin?page=${i}&startDate=${startDate}&endDate=${endDate}&minMoney=${minMoney}&maxMoney=${maxMoney}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="viewordercourselistbyadmin?page=${currentPage + 1}&startDate=${startDate}&endDate=${endDate}&minMoney=${minMoney}&maxMoney=${maxMoney}">Next &gt;&gt;</a>
            </c:if>
        </div>
    </body>
</html>
