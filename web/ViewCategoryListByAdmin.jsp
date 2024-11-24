<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Management</title>
        <script>
            // Populate form for update
            function populateUpdateForm(categoryId, categoryName) {
                document.getElementById('categoryId').value = categoryId;
                document.getElementById('categoryName').value = categoryName;
                document.getElementById('addOrUpdateButton').innerText = 'Update Category';
            }

            // Reset form for adding new category
            function resetForm() {
                document.getElementById('categoryId').value = 0;
                document.getElementById('categoryName').value = '';
                document.getElementById('addOrUpdateButton').innerText = 'Add Category';
            }
        </script>
    </head>
    <body>
        <h1>Category Management</h1>

        <!-- Notification Message -->
        <c:if test="${not empty message}">
            <p style="${messageType == 'success' ? 'color: green;' : 'color: red;'}">${message}</p>
        </c:if>

        <!-- Add/Update Category Form -->
        <form action="crudcategorybyadmin" method="post">
            <input type="hidden" name="categoryId" id="categoryId" value="0"> <!-- Hidden field for ID -->
            <input type="text" name="categoryName" id="categoryName" placeholder="Category Name" required pattern="[A-Za-z0-9 ]+">
            <button type="submit" name="action" value="addOrUpdate" id="addOrUpdateButton">Add Category</button>
            <button type="button" onclick="resetForm()">Reset</button>
        </form>
        <br>
        <!-- Search Form -->
        <form method="get" action="viewcategorylistbyadmin">
            <input type="text" name="searchQuery" placeholder="Search categories..." value="${searchQuery}">
            <button type="submit">Search</button>
        </form>
        <br>
        <!-- Category List Table -->
        <table border="1" style="width: 100%; text-align: left; border-collapse: collapse; margin-top: 20px;">
            <thead>
                <tr>
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Total Courses</th>
                    <th>Updated Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categories}">
                    <tr>
                        <td>${category.id}</td>
                        <td>${category.name}</td>
                        <td>
                            <c:choose>
                                <c:when test="${totalCoursesMap[category.id] != null}">
                                    ${totalCoursesMap[category.id]}
                                </c:when>
                                <c:otherwise>
                                    0
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${category.updated_date}</td>
                        <td>
                            <!-- Edit button -->
                            <button type="button" onclick="populateUpdateForm('${category.id}', '${category.name}')">Edit</button>

                            <!-- Delete button -->
                            <form action="crudcategorybyadmin" method="post" style="display: inline;">
                                <input type="hidden" name="categoryId" value="${category.id}">
                                <button type="submit" name="action" value="delete" 
                                        onclick="return confirm('Are you sure you want to delete this category?')">Delete</button>
                            </form>

                            <form action="viewcourseofcategory" method="get" style="display: inline;">
                                <input type="hidden" name="category_id" value="${category.id}">
                                <button type="submit">Show Courses</button>
                            </form>

                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${categories == null || categories.size() == 0}">
                    <tr>
                        <td colspan="6" style="text-align: center;">No categories found</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        <!-- Pagination -->
        <div style="margin-top: 20px;">
            <c:if test="${currentPage > 1}">
                <a href="viewcategorylistbyadmin?page=${currentPage - 1}&searchQuery=${searchQuery}">&lt;&lt; Previous</a>
            </c:if>

            <c:forEach begin="1" end="${totalPages}" var="pageNum">
                <c:choose>
                    <c:when test="${pageNum == currentPage}">
                        <strong>${pageNum}</strong>
                    </c:when>
                    <c:otherwise>
                        <a href="viewcategorylistbyadmin?page=${pageNum}&searchQuery=${searchQuery}">${pageNum}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="viewcategorylistbyadmin?page=${currentPage + 1}&searchQuery=${searchQuery}">Next &gt;&gt;</a>
            </c:if>
        </div>
    </body>
</html>
