<%-- 
    Document   : lessions
    Created on : Nov 6, 2024, 6:28:13 AM
    Author     : dungm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Lesson Management - Chapter</title>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="./DungBT_Pages/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./DungBT_Pages/assets/css/main.css" rel="stylesheet">
    </head>
    <body class="lesson-page">
        <header class="header d-flex align-items-center sticky-top">
            <div class="container d-flex align-items-center">
                <a href="#" class="logo me-auto">
                    <h1 class="sitename">Lesson Management</h1>
                </a>
                <nav class="navmenu">
                    <ul>
                        <li><a href="#">Dashboard</a></li>
                        <li><a href="listCourse">Courses</a></li>
<!--                        <li><a href="listChapter" onclick="goBack()">Chapters</a></li>
                        <li><a href="#" class="active">Lessons</a></li>-->
                        <li><a href="#">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="main">
            <section class="lessons section">
                <div class="container">
                    <!-- Chapter Info -->
                    <div class="row mb-4">
                        <div class="col-lg-12">
                            <h2>Chapter: ${chapterName}</h2>
                            <p>Manage lessons for the chapter <strong>${chapter.chapter_name}</strong>.</p>
                        </div>
                    </div>

                    <!-- Add Lesson Button -->
                    <div class="row mb-4">
                        <div class="col-lg-12 text-center">
                            <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#add-lesson-modal">Add Lesson</button>
                        </div>
                    </div>

                    <!-- Add Lesson Modal -->
                    <div id="add-lesson-modal" class="modal fade" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form method="post" action="listLession">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Thêm Lesson Mới</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="text" name="type" value="add"/>
                                        <input type="text" name="chapterId" value="${chapter.chapter_id}"/>
                                        <div class="form-group mb-3">
                                            <label for="lesson-name">Tên Lesson</label>
                                            <input type="text" class="form-control" id="lesson-name" name="lessonName" required/>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="video-file">Upload Video</label>
                                            <input type="text" class="form-control" id="video-file" name="videoFile" accept="video/*"/>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="document-file">Upload Document</label>
                                            <input type="text" class="form-control" id="document-file" name="documentFile" accept=".pdf,.doc,.docx"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                        <button type="submit" class="btn btn-primary">Thêm Lesson</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Lesson List Table -->
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Lesson no</th>
                                        <th>Lesson Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listLesson}" var="lesson">
                                        <c:if test="${lesson.isDisable != 1}">
                                            <tr>
                                                <td>${lesson.lesson_no}</td>
                                                <td><a href="${lesson.video}">${lesson.lesson_name}</a></td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-edit-lesson" 
                                                            data-id="${lesson.lesson_id}" 
                                                            data-name="${lesson.lesson_name}" 
                                                            data-video="${lesson.video}" 
                                                            data-document="${lesson.document}">
                                                        Edit
                                                    </button>
                                                    <form action="listLession" method="post" style="display:inline;">
                                                        <input type="hidden" name="type" value="delete">
                                                        <input type="hidden" name="lessonId" value="${lesson.lesson_id}">
                                                        <input type="hidden" name="chapterId" value="${chapter.chapter_id}"/>
                                                        <button type="submit" class="btn btn-danger" onclick="return confirmDelete();">Delete</button>
                                                    </form>
                                                    <!-- Delete form -->
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </main>
                </div>
            </section>
        </main>

        <!-- Edit Lesson Modal -->
        <div id="edit-lesson-modal" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="listLession">
                        <div class="modal-header">
                            <h5 class="modal-title">Chỉnh sửa Lesson</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="edit"/>
                            <input type="hidden" name="lessonId" id="edit-lesson-id"/>
                            <input type="hidden" name="chapterId" value="${chapter.chapter_id}"/>
                            <!-- Display Lesson Name -->
                            <div class="form-group mb-3">
                                <label for="edit-lesson-name">Lesson Name</label>
                                <input type="text" class="form-control" name="lessonName" id="edit-lesson-name"/>
                            </div>

                            <!-- Display Video String -->
                            <div class="form-group mb-3">
                                <label for="edit-lesson-video">Video</label>
                                <input type="text" class="form-control" name="lessonVideo" id="edit-lesson-video"/>
                            </div>

                            <!-- Display Document String -->
                            <div class="form-group mb-3">
                                <label for="edit-lesson-document">Document</label>
                                <input type="text" class="form-control" name="lessonDocument" id="edit-lesson-document"/>
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

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $('.btn-edit-lesson').on('click', function () {
                                                                    var lessonId = $(this).data('id');
                                                                    var lessonName = $(this).data('name');
                                                                    var lessonVideo = $(this).data('video');
                                                                    var lessonDocument = $(this).data('document');

                                                                    // Set values in the modal
                                                                    $('#edit-lesson-modal #edit-lesson-id').val(lessonId);
                                                                    $('#edit-lesson-modal #edit-lesson-name').val(lessonName);
                                                                    $('#edit-lesson-modal #edit-lesson-video').val(lessonVideo);
                                                                    $('#edit-lesson-modal #edit-lesson-document').val(lessonDocument);

                                                                    // Show the modal
                                                                    $('#edit-lesson-modal').modal('show');
                                                                });
                                                            });

                                                            function confirmDelete() {
                                                                return confirm("Are you sure you want to delete this lesson?");
                                                            }

                                                            function goBack() {
                                                                window.history.back();
                                                            }
        </script>
    </body>
</html>
