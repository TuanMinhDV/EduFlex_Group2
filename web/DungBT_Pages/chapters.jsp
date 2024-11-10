<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Chapter Management - Course</title>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="./DungBT_Pages/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./DungBT_Pages/assets/css/main.css" rel="stylesheet">
    </head>
    <body class="chapter-page">
        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container-fluid container-xl position-relative d-flex align-items-center">
                <a href="#" class="logo d-flex align-items-center me-auto">
                    <h1 class="sitename">Chapter Management</h1>
                </a>
                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="#">Dashboard</a></li>
                        <li><a href="listCourse">Courses</a></li>
                        <li><a href="#" class="active">Chapters</a></li>
                        <li><a href="#">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="main">
            <div class="row mb-4">
                <div class="col-lg-6 mx-auto">
                    <form class="input-group" method="post" action="listChapter">
                        <input type="hidden" name="type" value="search"/>
                        <input type="hidden" name="courseId" value="${course.course_id}"/>
                        <input type="text" class="form-control" placeholder="Search for a Chapter..." name="nameSearch" aria-label="Search">
                        <button class="btn btn-primary" type="submit">Search</button>
                    </form>
                </div>
            </div>
            <!-- End of Search Form -->

            <section id="chapters" class="chapters section">
                <div class="container">
                    <!-- Course Info -->
                    <div class="row mb-4">
                        <div class="col-lg-12">
                            <p>Manage chapters for the course <strong>${course.course_name}</strong>.</p>
                        </div>
                    </div>

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
                                <form method="post" action="listChapter">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm Chapter Mới</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="type" value="add"/>
                                        <input type="hidden" name="courseId" value="${course.course_id}"/>
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
                                    <c:forEach items="${listChapter}" var="ch">
                                        <c:if test="${ch.isDisable != 1}">
                                            <tr>
                                                <td>${ch.chapter_no}</td>
                                                <td><a href="listLession?chID=${ch.chapter_no}">${ch.chapter_name}</a></td>
                                                <td>
                                                    <form action="listChapter" method="post" style="display:inline;">
                                                        <input type="hidden" name="courseId" value="${course.course_id}"/>
                                                        <input type="hidden" name="type" value="delete">
                                                        <input type="hidden" name="chapterId" value="${ch.chapter_id}">
                                                        <button type="submit" class="btn btn-danger" onclick="return confirmDelete();">Delete</button>
                                                    </form>
                                                    <button type="button" class="btn btn-primary btn-edit-chapter" data-id="${ch.chapter_id}" data-name="${ch.chapter_name}">Edit</button>
                                                    <button type="button" class="btn btn-primary"><a style="color: white" href="listQuizz?chapID=${ch.chapter_id}">Manage Quizz</a></button>
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
                    <form method="post" action="listChapter">
                        <div class="modal-header">
                            <h5 class="modal-title">Chỉnh sửa Chapter</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="edit"/>
                            <input type="hidden" name="chapterId" id="chapter-id"/>
                            <input type="text" name="courseId" value="${course.course_id}"/>
                            <div class="form-group">
                                <label for="chapter-name">Chapter Name</label>
                                <input type="text" class="form-control" name="chapterName" id="chapter-name"/>
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
            <div class="container">
                <div class="footer-top">
                    <div class="row">
                        <div class="col-lg-4 footer-contact">
                            <h3>Course Management</h3>
                            <p>FPT University<br/>DungBT - HE170922<br/>Phone: 039 4458 719<br/>Email: dungbthe170922@fpt.edu.vn</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
