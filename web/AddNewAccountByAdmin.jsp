<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Account</title>
    </head>
    <body>
        <h1>Add New Account</h1>
        <form action="accountcontrollerbyadmin" method="get">
            <input type="submit" value="Back To Account List" />
        </form>
        </br> 


        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>
        <c:if test="${not empty success}">
            <p style="color: green;">${success}</p>
        </c:if>


        <!-- Form thêm tài khoản -->
        <form action="addaccountbyadmin" method="POST">
            <!-- Username -->
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="${username}" required pattern="[0-9A-Za-z]+" title="Only letters and numbers allowed."/>
            <c:if test="${not empty usernameError}">
                <p style="color: red; font-size: 12px;">${usernameError}</p>
            </c:if>
            <br/>

            <!-- Fullname -->
            <label for="fullname">Fullname:</label>
            <input type="text" id="fullname" name="fullname" value="${fullname}" required/>
            <br/>

            <!-- Email -->
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${email}" required/>
            <c:if test="${not empty emailError}">
                <p style="color: red; font-size: 12px;">${emailError}</p>
            </c:if>
            <br/>

            <!-- Phone -->
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" value="${phone}" required/>
            <c:if test="${not empty phoneError}">
                <p style="color: red; font-size: 12px;">${phoneError}</p>
            </c:if>
            <br/>

            <!-- Role -->
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="">Select Role</option>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.role_Id}" ${role.role_Id == roleId ? 'selected' : ''}>${role.role_Name}</option>
                </c:forEach>
            </select>
            <br/>

            <!-- Status -->
            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="">Select Status</option>
                <option value="1" ${status == '1' ? 'selected' : ''}>Active</option>
                <option value="0" ${status == '0' ? 'selected' : ''}>Inactive</option>
            </select>
            <br/>

            <!-- Send Email -->
            <label for="sendEmail">Send Email:</label>
            <input type="checkbox" id="sendEmail" name="sendEmail" value="true"/>
            <br/>

            <button type="submit">Add Account</button>
        </form>

    </body>
</html>
