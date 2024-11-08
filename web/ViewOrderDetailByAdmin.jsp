<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            background-color: #f4f4f9;
        }
        .sidebar {
            width: 250px;
            background-color: #333;
            color: #fff;
            padding-top: 20px;
            position: fixed;
            height: 100%;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar h2 {
            text-align: center;
            font-size: 1.2em;
            color: #f4f4f9;
        }
        .sidebar a {
            display: block;
            color: #ddd;
            padding: 15px;
            text-decoration: none;
            font-size: 1em;
        }
        .sidebar a:hover {
            background-color: #575757;
            color: #fff;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .order-detail-container {
            width: 60%;
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .order-detail-container h1 {
            text-align: center;
            color: #333;
            font-size: 1.5em;
            margin-bottom: 20px;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-bottom: 15px;
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .order-table {
            width: 100%;
            border-collapse: collapse;
        }
        .order-table th, .order-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .order-table th {
            background-color: #f2f2f2;
            color: #555;
        }
        .order-table td {
            color: #333;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>Dashboard</h2>
        <a href="http://localhost:8080/FinalVersionEduFlex/viewaccountlistbyadmin">View Account List</a>
        <a href="http://localhost:8080/FinalVersionEduFlex/viewcommentlistbyadmin">View Comment List</a>
        <a href="http://localhost:8080/FinalVersionEduFlex/viewcourselistbyadmin">View Course List</a>
        <a href="http://localhost:8080/FinalVersionEduFlex/ViewOrderListByAdmin">View Order List</a>
        <a href="http://localhost:8080/FinalVersionEduFlex/viewsubjectbyadmin">View Category List</a>
    </div>

    <div class="content">
        <div class="order-detail-container">
            <h1>Order Detail</h1>
            
            <a class="back-link" href="ViewOrderListByAdmin">Back to Order List</a>
            
            <table class="order-table">
                <c:forEach var="entry" items="${orderDetailMap}">
                    <tr>
                        <th>${entry.key}</th>
                        <td>${entry.value}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</body>
</html>
