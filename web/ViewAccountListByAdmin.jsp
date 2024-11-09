<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account List</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f0f2f5;
                display: flex;
                min-height: 100vh;
            }
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: #fff;
                position: fixed;
                height: 100%;
                box-shadow: 2px 0 10px rgba(0, 0, 0, 0.15);
                padding-top: 20px;
            }
            .sidebar h2 {
                text-align: center;
                font-size: 24px;
                padding: 15px 0;
                margin-bottom: 20px;
                color: #ecf0f1;
                border-bottom: 1px solid #34495e;
            }
            .sidebar a {
                display: flex;
                align-items: center;
                color: #bdc3c7;
                padding: 15px;
                text-decoration: none;
                font-size: 18px;
                transition: background 0.3s;
                gap: 10px;
            }
            .sidebar a:hover {
                background-color: #34495e;
                color: #fff;
            }
            .content {
                margin-left: 250px;
                padding: 30px;
                flex-grow: 1;
            }
            h1 {
                font-size: 28px;
                color: #333;
                margin-bottom: 25px;
            }
            .card {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .form-container {
                display: flex;
                gap: 15px;
                justify-content: space-between;
                align-items: center;
                padding: 15px 0;
            }
            .inline-form {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .table-container {
                width: 100%;
                margin: 0 auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                font-size: 16px;
            }
            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
            }
            th {
                background-color: #34495e;
                color: #ecf0f1;
            }
            tr:nth-child(even) {
                background-color: #f8f9fa;
            }
            tr:hover {
                background-color: #eaf2f8;
            }
            button, select, input[type="text"] {
                padding: 8px 12px;
                font-size: 14px;
                border-radius: 5px;
                border: 1px solid #ddd;
                transition: 0.2s;
            }
            button:hover, select:hover, input[type="text"]:hover {
                border-color: #3498db;
            }
            .pagination {
                margin: 15px 0;
                text-align: center;
            }
            .pagination a {
                color: #3498db;
                padding: 10px 15px;
                text-decoration: none;
                transition: background 0.2s;
                margin: 0 5px;
                border-radius: 5px;
            }
            .pagination a:hover {
                background-color: #3498db;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h2>EduFlex Admin</h2>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/adminhomeservlet"><i class="fas fa-home"></i> Home</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewaccountlistbyadmin"><i class="fas fa-user"></i> View Account List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcommentlistbyadmin"><i class="fas fa-comments"></i> View Comment List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcourselistbyadmin"><i class="fas fa-book"></i> View Course List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/ViewOrderListByAdmin"><i class="fas fa-shopping-cart"></i> View Order List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewsubjectbyadmin"><i class="fas fa-chart-line"></i> View Category List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/revenueChart"><i class="fas fa-dollar-sign"></i> Revenue</a>

        </div>
        <div class="content">
            <h1>Account List</h1>
            <div class="card form-container">
                <form action="addaccountbyadmin" method="get" class="inline-form">
                    <button type="submit">Add Account</button>
                </form>
                <form action="viewaccountlistbyadmin" method="get" class="inline-form">
                    <select name="role">
                        <option value="">All Roles</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.roleName}" <c:if test="${param.role == role.roleName}">selected</c:if>>${role.roleName}</option>
                        </c:forEach>
                    </select>
                    <select name="status">
                        <option value="">All Status</option>
                        <option value="1" <c:if test="${param.status == '1'}">selected</c:if>>Active</option>
                        <option value="0" <c:if test="${param.status == '0'}">selected</c:if>>Blocked</option>
                        </select>
                        <button type="submit">Filter</button>
                    </form>
                    <form action="viewaccountlistbyadmin" method="get" class="inline-form">
                        <input type="text" name="searchName" placeholder="Enter account name" value="${param.searchName}">
                    <button type="submit">Search</button>
                </form>
            </div>
            <div class="card table-container">
                <table>
                    <tr>
                        <th>Account ID</th>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>OTP</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Change Status</th>
                    </tr>
                    <c:forEach var="account" items="${data}">
                        <tr>
                            <td>${account.accountId}</td>
                            <td>${account.username}</td>
                            <td>${account.fullname}</td>
                            <td>${account.email}</td>
                            <td>${account.phone}</td>
                            <td>${account.otp}</td>
                            <td>
                                <form action="changeroleaccountbyadmin" method="post">
                                    <input type="hidden" name="accountId" value="${account.accountId}" />
                                    <select name="newRole">
                                        <c:forEach var="role" items="${roles}">
                                            <option value="${role.roleId}" <c:if test="${role.roleName == account.roleName}">selected</c:if>>${role.roleName}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit">Change</button>
                                </form>
                            </td>
                            <td>${account.status ? 'Active' : 'Blocked'}</td>
                            <td>
                                <form action="changeAccountStatus" method="post" onsubmit="return confirm('Are you sure?');">
                                    <input type="hidden" name="accountId" value="${account.accountId}" />
                                    <input type="hidden" name="currentStatus" value="${account.status}" />
                                    <button type="submit">Toggle Status</button>
                                    <label>
                                        <input type="checkbox" name="sendEmail" value="true"> Send Email
                                    </label>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="viewaccountlistbyadmin?page=${currentPage - 1}">Previous</a>
                </c:if>
                <c:forEach var="i" begin="${1}" end="${totalPages}">
                    <a href="viewaccountlistbyadmin?page=${i}" style="${i == currentPage ? 'font-weight:bold' : ''}">${i}</a>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="viewaccountlistbyadmin?page=${currentPage + 1}">Next</a>
                </c:if>
            </div>
        </div>
    </body>
</html>
