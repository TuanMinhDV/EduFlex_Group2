<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dal.CourseDAO" %>
<%@ page import="model.Course" %>
<%@ page import="model.Category" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduFlex - Course List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://s1.1zoom.me/big0/175/Still-life_Lamp_Book_Old_603338_1280x854.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: white;
        }
        .navbar {
            background-color: rgba(51, 51, 51, 0.8); /* Slight transparency */
            padding: 15px;
        }
        .navbar .logo {
            color: #ffcc00;
            font-size: 30px;
            font-weight: bold;
            text-transform: uppercase;
            margin-right: 20px;
        }
        .navbar-nav .nav-link {
            color: white;
            padding: 14px 20px;
            transition: background-color 0.3s, color 0.3s;
        }
        .navbar-nav .nav-link:hover {
            background-color: #575757;
            color: #ffcc00;
        }
        .container {
            padding: 50px;
        }
        h1 {
            margin-bottom: 20px;
        }
        table {
            background-color: rgba(255, 255, 255, 0.9); /* Slight background for better readability */
            color: black;
        }
        th, td {
            padding: 10px;
        }
    </style>
</head>
<body>

    <!-- Navbar with logo and menu links -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand logo" href="#">EduFlex</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/EduFlexInter2/index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/EduFlexInter2/about">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/EduFlexInter2/courses">Courses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/EduFlexInter2/subject">View Subject List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/EduFlexInter2/commentcontroller">View Comment Report</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main content -->
    <div class="container">
        <h1>List of Courses</h1>

        <!-- Form tìm kiếm -->
        <form action="course" method="get" class="mb-4">
            <div class="input-group">
                <input type="text" name="searchTerm" value="${searchTerm}" class="form-control" placeholder="Search courses..." />
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>

        <!-- Hiển thị danh sách khóa học -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Change Category</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.courseId}</td>
                        <td>${course.courseName}</td>
                        <td>${course.description}</td>
                        <td>${course.category}</td>
                        <td>
                            <!-- Form để đổi Category -->
                            <form action="course" method="post">
                                <input type="hidden" name="courseId" value="${course.courseId}" />
                                <select name="newCategory" class="form-select">
                                    <c:forEach var="cat" items="${categories}">
                                        <option value="${cat.categoryId}" 
                                            <c:if test="${cat.categoryName == course.category}">selected</c:if>>
                                            ${cat.categoryName}
                                        </option>
                                    </c:forEach>
                                </select>
                                <button type="submit" class="btn btn-sm btn-success mt-2">Change</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Phân trang -->
        <div class="d-flex justify-content-between">
            <c:if test="${currentPage > 1}">
                <a href="course?page=${currentPage - 1}&searchTerm=${searchTerm}" class="btn btn-primary">Previous</a>
            </c:if>
            <a href="course?page=${currentPage + 1}&searchTerm=${searchTerm}" class="btn btn-primary">Next</a>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
