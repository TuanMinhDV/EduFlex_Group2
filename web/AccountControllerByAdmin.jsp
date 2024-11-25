<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account List by Admin</title>
        
        <!-- META -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- All PLUGINS CSS -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/typography.css">

        <!-- SHORTCODES -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="admin/assets/css/color/color-1.css">

        <style>
            .layout {
                display: grid;
                grid-template-areas: 
                    "header header"
                    "sidebar main";
                grid-template-columns: 250px 1fr;
                grid-template-rows: auto 1fr;
                height: 100vh;
            }

            .header {
                grid-area: header;
                background-color: #f4f4f4;
                padding: 10px;
                text-align: center;
            }

            .sidebar {
                grid-area: sidebar;
                background-color: #333;
                color: white;
                padding: 10px;
                overflow-y: auto;
            }

            .main-content {
                grid-area: main;
                padding: 20px;
                background-color: #fff;
                overflow-y: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            table th, table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }

            table th {
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>
        
        <div class="layout">
            <!-- Header -->
            <div class="header">
                <jsp:include page="header3.jsp"></jsp:include>
            </div>

            <!-- Sidebar -->
            <div class="sidebar">
                <jsp:include page="sidebarleft.jsp"></jsp:include>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <br>
                <h1 style="text-align: center;">Account List by Admin</h1>
                
                <!-- Add New Account Button -->
                <form action="addaccountbyadmin" method="get" style="margin-bottom: 20px;">
                    <button type="submit" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; cursor: pointer;">Add New Account</button>
                </form>

                <!-- Status Message -->
                <% 
                    String statusMessage = request.getParameter("statusMessage");
                    if (statusMessage != null) {
                %>
                <div class="alert alert-info"><%= statusMessage %></div>
                <% } %>

                <!-- Search and Filter Form -->
                <form method="get" action="accountcontrollerbyadmin" style="margin-bottom: 20px;">
                    <label>Search:</label>
                    <input type="text" name="searchQuery" value="${param.searchQuery}" />
                    <label>Role:</label>
                    <select name="role">
                        <option value="">All</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.role_Id}" ${param.role == role.role_Id ? 'selected' : ''}>${role.role_Name}</option>
                        </c:forEach>
                    </select>
                    <label>Status:</label>
                    <select name="status">
                        <option value="">All</option>
                        <option value="1" ${param.status == '1' ? 'selected' : ''}>Active</option>
                        <option value="0" ${param.status == '0' ? 'selected' : ''}>Inactive</option>
                    </select>
                    <button type="submit" style="background-color: #007BFF; color: white; padding: 5px 10px; border: none;">Filter</button>
                    <button type="reset" onclick="window.location.href='accountcontrollerbyadmin'" style="background-color: #DC3545; color: white; padding: 5px 10px; border: none;">Clear</button>
                </form>

                <!-- Account Table -->
                <table>
                    <thead>
                        <tr>
                            <th>Account ID</th>
                            <th>Username</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="account" items="${data}">
                            <tr>
                                <td>${account.account_id}</td>
                                <td>${account.username}</td>
                                <td>${account.fullname}</td>
                                <td>${account.email}</td>
                                <td>${account.phone}</td>
                                <td>${account.roleName}</td>
                                <td>${account.active == 1 ? "Active" : "Inactive"}</td>
                                <td>
                                    <form method="post" action="changeroleandstatusaccount" onsubmit="return confirm('Are you sure you want to apply these changes?')">
                                        <input type="hidden" name="accountId" value="${account.account_id}" />
                                        <label>Role:</label>
                                        <select name="newRoleId">
                                            <c:forEach var="role" items="${roles}">
                                                <option value="${role.role_Id}" ${account.role_id == role.role_Id ? 'selected' : ''}>${role.role_Name}</option>
                                            </c:forEach>
                                        </select>
                                        <label>Status:</label>
                                        <select name="newStatus">
                                            <option value="1" ${account.active == 1 ? 'selected' : ''}>Active</option>
                                            <option value="0" ${account.active == 0 ? 'selected' : ''}>Inactive</option>
                                        </select>
                                       
                                        <input type="checkbox" name="sendMail" value="true"> Send Mail
                                       
                                        <button type="submit" style="background-color: #28A745; color: white; padding: 5px 10px; border: none;">Save</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div style="text-align: center;">
                    <c:if test="${currentPage > 1}">
                        <a href="accountcontrollerbyadmin?page=${currentPage - 1}&searchQuery=${param.searchQuery}&role=${param.role}&status=${param.status}">&lt;&lt; Previous</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="pageNum">
                        <c:choose>
                            <c:when test="${pageNum == currentPage}">
                                <strong>${pageNum}</strong>
                            </c:when>
                            <c:otherwise>
                                <a href="accountcontrollerbyadmin?page=${pageNum}&searchQuery=${param.searchQuery}&role=${param.role}&status=${param.status}">${pageNum}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="accountcontrollerbyadmin?page=${currentPage + 1}&searchQuery=${param.searchQuery}&role=${param.role}&status=${param.status}">Next &gt;&gt;</a>
                    </c:if>
                </div>
            </div>
        </div>
                    
                    
    </body>
</html>
