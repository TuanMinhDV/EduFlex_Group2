<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Course Management - Instructor Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="../DungBT_Pages/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../DungBT_Pages/assets/css/main.css" rel="stylesheet">
    </head>

    <body class="courses-page">
        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container-fluid container-xl position-relative d-flex align-items-center">
                <a href="#" class="logo d-flex align-items-center me-auto">
                    <h1 class="sitename">Course Management</h1>
                </a>
                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="#">Dashboard</a></li>
                        <li><a href="#" class="active">Courses</a></li>
                        <li><a href="#">Profile</a></li>
                        <li><a href="#">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="main">
            <section id="courses" class="courses section">
                <div class="container">
<!--                    <div class="row">
                        <div class="col-lg-12">
                            <h1>Courses</h1>
                            <p class="mb-0">Manage your courses as an instructor.</p>
                        </div>
                    </div>-->

                    <!-- Search Form -->
                    <div class="row mb-4">
                        <div class="col-lg-6 mx-auto">
                            <form class="input-group" method="post" action="listCourse">
                                <input type="hidden" name="type" value="search"/>
                                <input type="text" class="form-control" placeholder="Search for a course..." name="nameSearch" aria-label="Search">
                                <button class="btn btn-primary" type="submit">Search</button>
                            </form>
                        </div>
                    </div>
                    <!-- End of Search Form -->

                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Course ID</th>
                                        <th>Course Name</th>
                                        <th>Description</th>
                                        <th>Image</th>
                                        <th>Price</th>
                                        <th>Discount</th>
                                        <th>Category</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listCourse}" var="c">
                                        <c:if test="${c.isDisable != 1}">
                                            <tr>
                                                <td>${c.course_id}</td>
                                                <td><a style="color: #0d6efd;" href="listChapter?courseID=${c.course_id}">${c.course_name}</a></td>
                                                <td>${c.description}</td>
                                                <td><img style="width: 100px; height: 100px; border-radius: 10px; object-fit: cover;" src="${c.image}" alt="course"/></td>
                                                <td>${c.price}</td>
                                                <td>${c.discount}</td>
                                                <c:forEach items="${listCategory}" var="cate">
                                                    <c:if test="${c.category_id == cate.category_id}">
                                                        <td>${cate.category_name}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <td>
                                                    <a class="btn btn-primary btn-edit-course" data-id="${c.course_id}" 
                                                       data-name="${c.course_name}" 
                                                       data-description="${c.description}" 
                                                       data-image="${c.image}" 
                                                       data-price="${c.price}" 
                                                       data-discount="${c.discount}" 
                                                       data-category="${c.category_id}">Edit</a>
                                                    <form action="listCourse" method="post">
                                                        <input type="hidden" name="type" value="delete">
                                                        <input type="hidden" name="idC" value="${c.course_id}">
                                                        <button type="submit" class="btn btn-danger btn-delete-course" onclick="return confirmDelete();">Delete</button>
                                                    </form>

                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <a href="#" class="btn btn-success add-course">Add New Course</a>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Popup chỉnh sửa khóa học -->
        <div id="edit-course-popup" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form method="post" action="listCourse">
                        <div class="modal-header">
                            <h5 class="modal-title">Chỉnh sửa khóa học</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="edit">
                            <div class="form-group">
                                <label for="course-id">Course ID</label>
                                <input type="text" class="form-control" name="courseID" id="course-id" value="${courseId}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="course-name">Course Name</label>
                                <input type="text" class="form-control" name="courseName" id="course-name" value="${courseName}">
                            </div>
                            <div class="form-group">
                                <label for="course-description">Description</label>
                                <textarea class="form-control" name="courseDes" id="course-description">${courseDescription}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="course-image">Image</label>
                                <input type="text" name="courseImage" class="form-control" id="course-image" value="${courseImage}">
                            </div>
                            <div class="form-group">
                                <label for="course-price">Price</label>
                                <input type="number" name="coursePrice" class="form-control" id="course-price" value="${coursePrice}">
                            </div>
                            <div class="form-group">
                                <label for="course-discount">Discount</label>
                                <input type="number" name="courseDiscount" class="form-control" id="course-discount" value="${courseDiscount}">
                            </div>
                            <div class="form-group">
                                <label for="course-category">Category</label>
                                <select name="course_cateID" class="form-control" id="course-category">
                                    <c:forEach items="${listCategory}" var="cate">
                                        <option value="${cate.category_id}" ${courseCategory == cate.category_id ? 'selected' : ''}>${cate.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary edit-course" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary" id="save-edit-course">Lưu thay đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Popup thêm khóa học -->
        <div id="add-course-popup" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form id="add-course-form" method="post" action="listCourse">
                        <div class="modal-header">
                            <h5 class="modal-title">Thêm khóa học</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="add"/>
                            <div class="form-group">
                                <label for="course-name">Tên khóa học</label>
                                <input type="text" class="form-control" id="course-name" name="courseName" placeholder="Nhập tên khóa học">
                            </div>
                            <div class="form-group">
                                <label for="course-description">Mô tả</label>
                                <textarea class="form-control" id="course-description" name="courseDescription" placeholder="Nhập mô tả khóa học"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="course-image">Hình ảnh</label>
                                <input type="text" class="form-control" id="course-image" name="courseImage" placeholder="Nhập đường dẫn hình ảnh">
                            </div>
                            <div class="form-group">
                                <label for="course-price">Giá</label>
                                <input type="number" class="form-control" id="course-price" name="coursePrice" placeholder="Nhập giá khóa học">
                            </div>
                            <div class="form-group">
                                <label for="course-discount">Giảm giá</label>
                                <input type="number" class="form-control" id="course-discount" name="courseDiscount" placeholder="Nhập giảm giá khóa học">
                            </div>
                            <!--                            <div class="form-group">
                                                            <label for="course-category">Category</label>
                                                            <input type="text" class="form-control" id="course-category" name="courseCategory" placeholder="Nhập danh mục khóa học">
                                                        </div>-->
                            <div class="form-group">
                                <label for="course-category">Category</label>
                                <select name="courseCategory" class="form-control" id="course-category">
                                    <c:forEach items="${listCategory}" var="cate">
                                        <option value="${cate.category_id}">${cate.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary" id="save-add-course">Thêm khóa học</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Popup xóa khóa học -->
        <div id="delete-course-popup" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Xóa khóa học</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Nội dung xóa khóa học sẽ được hiển thị ở đây -->
                        <p>Bạn có chắc chắn muốn xóa khóa học này?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-danger" id="confirm-delete-course">Xóa khóa học</button>
                    </div>
                </div>
            </div>
        </div>

        <footer id="footer" class="footer position-relative light-background">
            <div class="container footer-top">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <a href="#" class="logo d-flex align-items-center">
                            <span class="sitename">Course Management</span>
                        </a>
                        <div class="footer-contact pt-3">
                            <p>FPT University</p>
                            <p>DungBT - HE170922</p>
                            <p class="mt-3"><strong>Phone:</strong> <span>039 4458 719</span></p>
                            <p><strong>Email:</strong> <span>dungbthe170922@fpt.edu.vn</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                // Khi nhấn nút chỉnh sửa khóa học
                                                                $('.btn-edit-course').on('click', function () {
                                                                    // Mở popup chỉnh sửa
                                                                    $('#edit-course-popup').modal('show');
                                                                });
                                                            });
                                                            // Khi nhấn nút đóng trong popup
                                                            $('.btn-secondary.edit-course').on('click', function (e) {
                                                                // Ngăn chặn hành động mặc định của nút
                                                                e.preventDefault();
                                                                // Đóng popup
                                                                $('#edit-course-popup').modal('hide');
                                                            });

                                                            // Khi nhấn nút thêm khóa học
                                                            $('.add-course').on('click', function () {
                                                                // Mở popup thêm khóa học
                                                                $('#add-course-popup').modal('show');
                                                            });

                                                            // Khi nhấn nút xóa khóa học
                                                            $('.btn-delete-course').on('click', function () {
                                                                console.log('Nút Delete được nhấn');
                                                                e.preventDefault();
                                                                // Mở popup xóa khóa học
                                                                $('#delete-course-popup').modal('show');
                                                            });

                                                            // Khi nhấn nút đóng trong popup thêm khóa học
                                                            $('.btn-secondary').on('click', function (e) {
                                                                // Ngăn chặn hành động mặc định của nút
                                                                e.preventDefault();
                                                                // Đóng popup thêm khóa học
                                                                $('#add-course-popup').modal('hide');
                                                            });

                                                            // Khi nhấn nút đóng trong popup xóa khóa học
                                                            $('.btn-secondary').on('click', function (e) {
                                                                // Ngăn chặn hành động mặc định của nút
                                                                e.preventDefault();
                                                                // Đóng popup xóa khóa học
                                                                $('#delete-course-popup').modal('hide');
                                                            });
    </script>
    <script type="text/javascript">
        function confirmDelete() {
            return confirm("Bạn có chắc chắn muốn xóa khóa học này không?");
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Khi nhấn nút chỉnh sửa khóa học
            $('.btn-edit-course').on('click', function () {
                // Extract course data from data attributes
                var courseId = $(this).data('id');
                var courseName = $(this).data('name');
                var courseDescription = $(this).data('description');
                var courseImage = $(this).data('image');
                var coursePrice = $(this).data('price');
                var courseDiscount = $(this).data('discount');
                var courseCategory = $(this).data('category');

                // Populate the modal fields with the course data
                $('#edit-course-popup #course-id').val(courseId);
                $('#edit-course-popup #course-name').val(courseName);
                $('#edit-course-popup #course-description').val(courseDescription);
                $('#edit-course-popup #course-image').val(courseImage);
                $('#edit-course-popup #course-price').val(coursePrice);
                $('#edit-course-popup #course-discount').val(courseDiscount);
                $('#edit-course-popup #course-category').val(courseCategory);

                // Mở popup chỉnh sửa
                $('#edit-course-popup').modal('show');
            });
        });
    </script>
</html>
