<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh Sách Đơn Hàng</title>
</head>
<body>

    <h1>Danh Sách Đơn Hàng</h1>
    <form action="ViewOrderListByAdmin" method="get">
        Start Date: <input type="date" name="startDate" value="${startDate}" />
        End Date: <input type="date" name="endDate" value="${endDate}" />
        Min Money: <input type="number" name="minMoney" step="0.01" value="${minMoney}" />
        Max Money: <input type="number" name="maxMoney" step="0.01" value="${maxMoney}" />
        <input type="submit" value="Filter" />
    </form>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Order ID</th>
            <th>Username</th> <!-- Đổi từ Account ID thành Username -->
            <th>Order Date</th>
            <th>Total Money</th>
            <th>Action</th> <!-- New column for actions -->
        </tr>
        <c:forEach var="order" items="${orderList}">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.accountId}</td> <!-- `accountId` giờ chứa username -->
                <td>${order.orderDate}</td>
                <td>${order.totalMoney}</td>
                <td><a href="ViewOrderDetailByAdmin?orderId=${order.orderId}">Show Detail</a></td> <!-- Link to detail page -->
            </tr>
        </c:forEach>
    </table>

    <c:if test="${totalPages > 1}">
        <div>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <a href="ViewOrderListByAdmin?page=${i}&startDate=${startDate}&endDate=${endDate}&minMoney=${minMoney}&maxMoney=${maxMoney}">${i}</a>
            </c:forEach>
        </div>
    </c:if>
</body>
</html>
