<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account List by Admin</title>
    </head>
    <body>
        <h1>Account List by Admin</h1>
        <!-- Add New Account Button -->
        <div>
            <form action="addaccountbyadmin" method="get">
                <input type="submit" value="Add New Account" />
            </form>
        </div>
        </br> 

        <% 
     String statusMessage = request.getParameter("statusMessage");
     if (statusMessage != null) {
        %>
        <div class="alert alert-info"><%= statusMessage %></div>
        <% 
            } 
        %>

        <!-- Search and Filter Form -->
        <form method="get" action="accountcontrollerbyadmin">
            Search: <input type="text" name="searchQuery" value="${param.searchQuery}" />
            <button type="submit">Search</button>
            <br/><br/>

            Role: 
            <select name="role">
                <option value="">All</option>
                <!-- Duyệt qua danh sách roles để tạo các tùy chọn -->
                <c:forEach var="role" items="${roles}">
                    <option value="${role.role_Id}" ${param.role == role.role_Id ? 'selected' : ''}>${role.role_Name}</option>
                </c:forEach>
            </select>

            Status: 
            <select name="status">
                <option value="">All</option>
                <option value="1" ${param.status == '1' ? 'selected' : ''}>Active</option>
                <option value="0" ${param.status == '0' ? 'selected' : ''}>Inactive</option>
            </select>

            <button type="submit">Filter</button>
            <button type="reset" onclick="window.location.href = 'accountcontrollerbyadmin'">Clear</button>
        </form>

        <br/>

        <!-- Account Table with Role and Status Change Options -->
        <table border="1">
            <thead>
                <tr>
                    <th>Account ID</th>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Role Name</th>
                    <th>Status</th>
                    <th>Options</th>
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

                        <!-- Options for changing role and status -->
                        <td>
                            <form method="post" action="changeroleaccountbyadmin" onsubmit="return confirmChange()">
                                <input type="hidden" name="accountId" value="${account.account_id}" />

                                <!-- Dropdown for changing role -->
                                <label>Role:</label>
                                <select name="newRoleId">
                                    <c:forEach var="role" items="${roles}">
                                        <option value="${role.role_Id}" ${account.role_id == role.role_Id ? 'selected' : ''}>${role.role_Name}</option>
                                    </c:forEach>
                                </select>

                                <!-- Dropdown for changing status -->
                                <label>Status:</label>
                                <select name="newStatus">
                                    <option value="1" ${account.active == 1 ? 'selected' : ''}>Active</option>
                                    <option value="0" ${account.active == 0 ? 'selected' : ''}>Inactive</option>
                                </select>

                                <!-- Checkbox for sending mail -->
                                <br>
                                <input type="checkbox" name="sendMail" value="true"> Send Mail
                                </td>

                                <!-- Save button to submit changes -->
                                <td>
                                    <button type="submit">Save</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


        <!-- JavaScript for confirmation dialog -->
        <!-- JavaScript for confirmation dialog -->
        <script>
            function confirmChange() {
                return confirm("Are you sure you want to apply these changes?");
            }
        </script>

        <!-- Pagination Links -->
        <div>
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
    </body>
</html>
