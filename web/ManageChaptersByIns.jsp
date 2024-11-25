<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Chapter Management - Course</title>

        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="DungBT/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="DungBT/assets/css/main.css" rel="stylesheet">

        <!-- All PLUGINS CSS ============================================= -->

    </head>
    <body class="chapter-page">
        <jsp:include page="header.jsp"></jsp:include>
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner3.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Chapters of ${course.name}</h1>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb row -->
            <div class="breadcrumb-row">
                <div class="container">
                    <ul class="list-inline">
                        <li><a href="#">Home</a></li>
                        <li><a href="courseManage">Courses</a></li>
                        <li>Chapters</li>
                    </ul>
                </div>
            </div>
        </div>

        <main class="main">
            <div class="row mb-4">
                <div class="col-lg-6 mx-auto">
                    <form class="input-group" method="post" action="chapterManage">
                        <input type="hidden" name="type" value="search"/>
                        <input type="hidden" name="courseId" value="${course.id}"/>
                        <input type="text" class="form-control" placeholder="Search for a Chapter..." name="nameSearch" aria-label="Search">
                        <button class="btn btn-primary" type="submit">Search</button>
                    </form>
                </div>
            </div>
            <!-- End of Search Form -->

            <section id="chapters" class="chapters section">
                <div class="container">

                    <!-- Add Chapter Button -->
                    <div class="row mb-4">
                        <div class="col-lg-12 text-center">
                            <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#add-chapter-modal">Add Chapter</button>
                        </div>
                    </div>

                    <!-- Add Chapter Modal -->
                    <div id="add-chapter-modal" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <form method="post" action="chapterManage">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm Chapter Mới</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="type" value="add"/>
                                        <input type="hidden" name="courseId" value="${course.id}"/>
                                        <div class="form-group">
                                            <label for="new-chapter-name">Tên Chapter</label>
                                            <input type="text" class="form-control" id="new-chapter-name" name="chapterName" required/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                        <button type="submit" class="btn btn-primary">Thêm Chapter</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Chapter List Table -->
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Chapter no</th>
                                        <th>Chapter Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listChapters}" var="ch" varStatus="status">
                                        <c:if test="${ch.isDisable != 1}">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td><a href="lessonManage?chID=${ch.id}">${ch.name}</a></td>
                                                <td>
                                                    <form action="listChapters" method="post" style="display:inline;">
                                                        <input type="hidden" name="courseId" value="${course.id}"/>
                                                        <input type="hidden" name="type" value="delete">
                                                        <input type="hidden" name="chapterId" value="${ch.id}">
                                                        <button type="submit" class="btn btn-danger" onclick="return confirmDelete();">Delete</button>
                                                    </form>
                                                    <button type="button" class="btn btn-primary btn-edit-chapter" data-id="${ch.id}" data-name="${ch.name}">Edit</button>
                                                    <button type="button" class="btn btn-primary"><a style="color: white" href="quizManage?chapID=${ch.id}">Manage Quizz</a></button>
                                                </td>
                                            </tr>
                                        </c:if>

                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Popup chỉnh sửa chapter -->
        <div id="edit-chapter-popup" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form method="post" action="chapterManage">
                        <div class="modal-header">
                            <h5 class="modal-title">Chỉnh sửa Chapter</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="edit"/>
                            <input type="hidden" name="chapterId" id="chapter-id"/>
                            <input type="hidden" name="courseId" value="${course.id}"/>
                            <div class="form-group">
                                <label for="chapter-name">Chapter Name</label>
                                <input type="text" class="form-control" name="chapterName" id="chapter-name" required/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <footer id="footer" class="footer">
            <div class="container-fluid">
                <div class="footer-top">
                    <div class="row">
                        <div class="col-lg-4 footer-contact text-center">
                            <h3>Edu Flex</h3>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src='assets/vendors/switcher/switcher.js'></script>

        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $('.btn-edit-chapter').on('click', function () {
                                                                    var chapterId = $(this).data('id');
                                                                    var chapterName = $(this).data('name');
                                                                    $('#edit-chapter-popup #chapter-id').val(chapterId);
                                                                    $('#edit-chapter-popup #chapter-name').val(chapterName);
                                                                    $('#edit-chapter-popup').modal('show');
                                                                });
                                                                $('.btn-secondary').on('click', function () {
                                                                    e.preventDefault();
                                                                    $('#edit-chapter-popup').modal('hide');
                                                                });
                                                            });

                                                            function confirmDelete() {
                                                                return confirm("Are you sure you want to delete this chapter?");
                                                            }
        </script>
    </body>
</html>
