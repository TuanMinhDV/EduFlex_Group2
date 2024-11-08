<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard - Account List</title>
        <style>
            /* Reset margin and padding */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                display: flex;
                min-height: 100vh;
                margin: 0;
            }
            /* Sidebar */
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
                font-size: 1.5em;
                color: #f4f4f9;
                padding: 15px 0;
                border-bottom: 1px solid #575757;
            }
            .sidebar a {
                display: block;
                color: #ddd;
                padding: 15px;
                text-decoration: none;
                font-size: 1em;
                transition: background 0.3s;
            }
            .sidebar a:hover {
                background-color: #575757;
                color: #fff;
            }
            /* Main content */
            .content {
                margin-left: 250px;
                padding: 20px;
                flex-grow: 1;
            }
            .content h1 {
                text-align: center;
                font-size: 2em;
                color: #333;
                margin-bottom: 20px;
            }
            .card {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                max-width: 800px;
                margin: 0 auto;
            }
            .filter-form, .search-form, .pagination {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }
            button, select, input[type="text"] {
                padding: 8px;
                font-size: 14px;
                margin-right: 10px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 12px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
                color: #555;
            }
        </style>
    </head>
    <body>

        <!-- Sidebar for Dashboard -->
        <div class="sidebar">
            <h2>EduFlex Admin</h2>
            <a href="http://localhost:8080/FinalVersionEduFlex/viewaccountlistbyadmin">View Account List</a>
            <a href="http://localhost:8080/FinalVersionEduFlex/viewcommentlistbyadmin">View Comment List</a>
            <a href="http://localhost:8080/FinalVersionEduFlex/viewcourselistbyadmin">View Course List</a>
            <a href="http://localhost:8080/FinalVersionEduFlex/ViewOrderListByAdmin">View Order List</a>
            <a href="http://localhost:8080/FinalVersionEduFlex/viewsubjectbyadmin">View Category List</a>
        </div>

        <!-- Main content area -->
        <div class="content">
            <h1>Account List</h1>

            <!-- Filter and Search Forms -->
            <div class="filter-form">
                <form action="viewaccountlistbyadmin" method="get">
                    <select name="role">
                        <option value="">All Roles</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.roleName}" <c:if test="${param.role == role.roleName}">selected</c:if>>
                                ${role.roleName}
                            </option>
                        </c:forEach>
                    </select>
                    <select name="status">
                        <option value="">All Status</option>
                        <option value="1" <c:if test="${param.status == '1'}">selected</c:if>>Active</option>
                        <option value="0" <c:if test="${param.status == '0'}">selected</c:if>>Blocked</option>
                    </select>
                    <button type="submit">Filter</button>
                </form>
            </div>

            <div class="search-form">
                <form action="viewaccountlistbyadmin" method="get">
                    <input type="text" name="searchName" placeholder="Enter account name to search" 
                           value="${param.searchName}" style="width: 300px;">
                    <button type="submit">Search</button>
                </form>
            </div>

            <!-- Table displaying account list -->
            <div class="card">
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
                        <th>Change Role</th>
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
                                            <option value="${role.roleId}" <c:if test="${role.roleName == account.roleName}">selected</c:if>>
                                                ${role.roleName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit">Change</button>
                                </form>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${account.status}">Active</c:when>
                                    <c:otherwise>Blocked</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <form action="changeAccountStatus" method="post" onsubmit="return confirm('Are you sure you want to change the account status?');">
                                    <input type="hidden" name="accountId" value="${account.accountId}" />
                                    <input type="hidden" name="currentStatus" value="${account.status}" />
                                    <button type="submit">Change</button>
                                    <input type="checkbox" name="sendEmail" value="true"> Send Email
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <!-- Pagination control -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="viewaccountlistbyadmin?page=${currentPage - 1}&pageSize=10&searchName=${param.searchName}&role=${param.role}&status=${param.status}">Previous</a>
                </c:if>

                <c:forEach var="i" begin="${currentPage - 1}" end="${currentPage + 1}">
                    <c:if test="${i >= 1 && i <= totalPages}">
                        <a href="viewaccountlistbyadmin?page=${i}&pageSize=10&searchName=${param.searchName}&role=${param.role}&status=${param.status}"
                           style="${i == currentPage ? 'font-weight: bold;' : ''}">${i}</a>
                    </c:if>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a href="viewaccountlistbyadmin?page=${currentPage + 1}&pageSize=10&searchName=${param.searchName}&role=${param.role}&status=${param.status}">Next</a>
                </c:if>
            </div>

        </div>
    </body>
</html>
