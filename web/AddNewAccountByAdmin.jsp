<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Account</title>

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

            form {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
                border-radius: 5px;
            }

            form label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            form input, form select, form button {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            form button {
                background-color: #007BFF;
                color: white;
                border: none;
                cursor: pointer;
                padding: 10px;
            }

            form button:hover {
                background-color: #0056b3;
            }

            .error {
                color: red;
                font-size: 12px;
            }

            .success {
                color: green;
                font-size: 14px;
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
                <jsp:include page="sidebarleft2.jsp"></jsp:include>
                </div>

                <!-- Main Content -->
                <div class="main-content">
                    <br>
                    <h1 style="text-align: center;">Add New Account</h1>

                    <!-- Back to Account List -->
                    <form action="accountcontrollerbyadmin" method="get" style="margin-bottom: 20px; text-align: center;">
                        <button type="submit" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none;">Back To Account List</button>
                    </form>

                    <!-- Status Messages -->
                    <div style="text-align: center; margin-bottom: 20px;">
                    <c:if test="${not empty error}">
                        <p class="error" style="font-size: 18px; color: red;">${error}</p>
                    </c:if>
                    <c:if test="${not empty success}">
                        <p class="success" style="font-size: 18px; color: green;">${success}</p>
                    </c:if>
                </div>


                <!-- Add Account Form -->
                <form action="addaccountbyadmin" method="POST">
                    <!-- Username -->
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${username}" required pattern="[0-9A-Za-z]+" title="Only letters and numbers allowed."/>
                    <c:if test="${not empty usernameError}">
                        <p class="error">${usernameError}</p>
                    </c:if>

                    <!-- Fullname -->
                    <label for="fullname">Fullname:</label>
                    <input type="text" id="fullname" name="fullname" value="${fullname}" required/>

                    <!-- Email -->
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${email}" required/>
                    <c:if test="${not empty emailError}">
                        <p class="error">${emailError}</p>
                    </c:if>

                    <!-- Phone -->
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="${phone}" required/>
                    <c:if test="${not empty phoneError}">
                        <p class="error">${phoneError}</p>
                    </c:if>

                    <!-- Role -->
                    <label for="role">Role:</label>
                    <select id="role" name="role" required>
                        <option value="">Select Role</option>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.role_Id}" ${role.role_Id == roleId ? 'selected' : ''}>${role.role_Name}</option>
                        </c:forEach>
                    </select>

                    <!-- Status -->
                    <label for="status">Status:</label>
                    <select id="status" name="status" required>
                        <option value="">Select Status</option>
                        <option value="1" ${status == '1' ? 'selected' : ''}>Active</option>
                        <option value="0" ${status == '0' ? 'selected' : ''}>Inactive</option>
                    </select>

                    <!-- Send Email -->
                    <label for="sendEmail">Send Email:</label>
                    <input type="checkbox" id="sendEmail" name="sendEmail" value="true"/>

                    <!-- Submit Button -->
                    <button type="submit">Add Account</button>
                </form>
            </div>
        </div>
    </body>
</html>
