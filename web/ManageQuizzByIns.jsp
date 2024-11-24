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
        
        <style>
            /* Custom styling */
            .quiz-page {
                background-color: #f8f9fa;
                padding-top: 20px;
            }
            .quiz-table th, .quiz-table td {
                vertical-align: middle;
            }
            .btn-primary, .btn-success, .btn-danger {
                margin-right: 5px;
            }
            .modal-header {
                background-color: #007bff;
                color: white;
            }
            .modal-footer .btn {
                min-width: 80px;
            }
        </style>

    </head>
    <body class="chapter-page">
        <jsp:include page="header.jsp"></jsp:include>
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner3.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Manage quizzes for the chapter <strong>${chapter.name}</strong></h1>
                    </div>
                </div>
            </div>
                
            <!-- Breadcrumb row -->
            <div class="breadcrumb-row">
                <div class="container">
                    <ul class="list-inline">
                        <li><a href="#">Home</a></li>
                        <li><a href="courseManage">Courses</a></li>
                        <li><a href="courseManage">Chapters</a></li>
                        <li><a href="">Quizz</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main class="main">
            <section class="quizzes section">
                <div class="container">

                    <!-- Add Quiz Button -->
                    <div class="row mb-4">
                        <div class="col-lg-12 text-center">
                            <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#add-quiz-modal">Add Quiz</button>
                        </div>
                    </div>

                    <!-- Quiz List Table -->
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-striped quiz-table">
                                <thead>
                                    <tr>
                                        <th>Quiz no</th>
                                        <th>Quiz Title</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listQuizz}" var="quiz" varStatus="status">
                                        <c:if test="${quiz.isDisable != 1}">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${quiz.name}</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-view-questions" data-id="${quiz.quiz_id}">
                                                        <a href="quizManage?quizzID=${quiz.quiz_id}" style="color: white">View Questions</a>
                                                    </button>
                                                    <button type="button" class="btn btn-success btn-edit-quiz" data-id="${quiz.quiz_id}" data-title="${quiz.name}">Edit</button>
                                                    <form action="quizManage" method="post" style="display:inline;">
                                                        <input type="hidden" name="type" value="delete">
                                                        <input type="hidden" name="quizId" value="${quiz.quiz_id}">
                                                        <input type="hidden" value="${quiz.isDisable}">
                                                        <input type="hidden" name="chapterId" value="${chapter.id}">
                                                        <button type="submit" class="btn btn-danger" onclick="return confirmDelete();">Delete</button>
                                                    </form>
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

        <!-- Edit Quiz Modal -->
        <div id="edit-quiz-modal" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="quizManage">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Quizz</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="edit"/>
                            <input type="hidden" id="edit-quiz-id" name="quizId"/>
                            <input type="text" name="chapterId" value="${chapter.id}"/>
                            <div class="form-group mb-3">
                                <label for="edit-quiz-title">Quizz Title</label>
                                <input type="text" class="form-control" id="edit-quiz-title" name="quizTitle" required/>
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

        <!-- Add Quiz Modal -->
        <div id="add-quiz-modal" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="quizManage">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Quiz</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="add"/>
                            <input type="hidden" name="chapterID" value="${chapter.id}"/>
                            <div class="form-group mb-3">
                                <label for="quiz-title">Quiz Title</label>
                                <input type="text" class="form-control" id="quiz-title" name="quizTitle" required/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" id="save-add-course" class="btn btn-primary">Add Quiz</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- View Questions Modal -->
        <div id="view-questions-modal" class="modal fade" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Questions in Quiz</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Question List Table -->
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Question</th>
                                    <th>Choices</th>
                                    <th>Correct Answer</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="question-list">
                                <!-- This will be populated by JavaScript -->
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
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
                                                            // Open edit quiz modal and populate form fields
                                                            $('.btn-edit-quiz').on('click', function () {
                                                                var quizId = $(this).data('id');
                                                                var quizTitle = $(this).data('title');

                                                                $('#edit-quiz-id').val(quizId);
                                                                $('#edit-quiz-title').val(quizTitle);

                                                                $('#edit-quiz-modal').modal('show');
                                                            });
                                                            function goBack() {
                                                                window.history.back();
                                                            };
                                                            function confirmDelete() {
                                                                return confirm("Are you sure you want to delete this lesson?");
                                                            }
                                                            
        </script>
    </body>
</html>
