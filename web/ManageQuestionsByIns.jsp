<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Question Management - Quizz</title>

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
            .question-page {
                background-color: #f0f2f5;
                padding: 20px;
            }
            .btn-primary, .btn-success, .btn-danger {
                margin-right: 5px;
            }
            .modal-header {
                background-color: #007bff;
                color: white;
            }
            .form-control, .btn {
                margin-bottom: 10px;
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
                            <h1 class="text-white">Manage questions for the quizz <strong>${quizzID}</strong></h1>
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

        <main class="main container mt-4">
            <!-- Search Bar -->
            <div class="row mb-4">
                <div class="col-lg-12">
                    <form action="questionManage" method="post">
                        <input type="hidden" name="quizzID" value="${quizzID}">
                        <input type="text" id="search-bar" name="txtSearch" class="form-control" placeholder="Search questions...">
                    </form>
                </div>
            </div>

            <!-- Add Question Button -->
            <div class="row mb-4">
                <div class="col-lg-12 text-center">
                    <button class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#add-question-modal">Add New Question</button>
                </div>
            </div>

            <!-- Questions Table -->
            <div class="row">
                <div class="col-lg-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Question Text</th>
                                <th>Options</th>
                                <th>Correct Answer</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="question-table-body">
                            <c:forEach items="${listQuestion}" var="question" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${question.content}</td>
                                    <td>
                                        A. ${question.option1} <br>
                                        B. ${question.option2} <br>
                                        C. ${question.option3} <br>
                                        D. ${question.option4}
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${question.answer == 1}">A</c:when>
                                            <c:when test="${question.answer == 2}">B</c:when>
                                            <c:when test="${question.answer == 3}">C</c:when>
                                            <c:when test="${question.answer == 4}">D</c:when>
                                            <c:otherwise>Unknown</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success btn-edit" data-id="${question.question_id}" data-text="${question.content}" data-choice-a="${question.option1}" data-choice-b="${question.option2}" data-choice-c="${question.option3}" data-choice-d="${question.option4}" data-correct="${question.answer}">Edit</button>
                                        <form method="post" action="questionManage" style="display: inline;">
                                            <input type="hidden" name="type" value="delete">
                                            <input type="hidden" name="quizzID" value="${quizzID}">
                                            <input type="hidden" name="question_id" value="${question.question_id}">
                                            <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this question?')">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

        <!-- Add Question Modal -->
        <div id="add-question-modal" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="questionManage">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Question</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="add">
                            <input type="hidden" name="quizzID" value="${quizzID}">
                            <div class="form-group">
                                <label for="question-text">Question Text</label>
                                <input type="text" id="question-text" name="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="choice-a">Choice A</label>
                                <input type="text" id="choice-a" name="option1" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="choice-b">Choice B</label>
                                <input type="text" id="choice-b" name="option2" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="choice-c">Choice C</label>
                                <input type="text" id="choice-c" name="option3" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="choice-d">Choice D</label>
                                <input type="text" id="choice-d" name="option4" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="correct-answer">Correct Answer</label>
                                <select id="correct-answer" name="correctAnswer" class="form-control" required>
                                    <option value="1">A</option>
                                    <option value="2">B</option>
                                    <option value="3">C</option>
                                    <option value="4">D</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add Question</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Update Question Modal -->
        <div id="edit-question-modal" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="questionManage">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Question</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="edit">
                            <input type="hidden" name="quizzID" value="${quizzID}">
                            <input type="hidden" id="edit-question-id" name="id">
                            <div class="form-group">
                                <label for="edit-question-text">Question Text</label>
                                <input type="text" id="edit-question-text" name="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="edit-choice-a">Choice A</label>
                                <input type="text" id="edit-choice-a" name="option1" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="edit-choice-b">Choice B</label>
                                <input type="text" id="edit-choice-b" name="option2" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="edit-choice-c">Choice C</label>
                                <input type="text" id="edit-choice-c" name="option3" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="edit-choice-d">Choice D</label>
                                <input type="text" id="edit-choice-d" name="option4" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="edit-correct-answer">Correct Answer</label>
                                <select id="edit-correct-answer" name="correctAnswer" class="form-control" required>
                                    <option value="1">A</option>
                                    <option value="2">B</option>
                                    <option value="3">C</option>
                                    <option value="4">D</option>
                                </select>
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

        <script>
                                                $(document).ready(function () {
                                                    // Edit button click event
                                                    $('.btn-edit').on('click', function () {
                                                        $('#edit-question-id').val($(this).data('id'));
                                                        $('#edit-question-text').val($(this).data('text'));
                                                        $('#edit-choice-a').val($(this).data('choice-a'));
                                                        $('#edit-choice-b').val($(this).data('choice-b'));
                                                        $('#edit-choice-c').val($(this).data('choice-c'));
                                                        $('#edit-choice-d').val($(this).data('choice-d'));
                                                        $('#edit-correct-answer').val($(this).data('correct'));
                                                        $('#edit-question-modal').modal('show');
                                                    });

                                                    // Delete button click event
                                                    $('.btn-delete').on('click', function () {
                                                        if (confirm('Are you sure you want to delete this question?')) {
                                                            var questionId = $(this).data('id');
                                                            window.location.href = 'listQuestion?type=delete&id=' + questionId + 'quizzID=${quizzID}';
                                                        }
                                                    });

                                                    // Search bar
                                                    $('#search-bar').on('keyup', function () {
                                                        var value = $(this).val().toLowerCase();
                                                        $('#question-table-body tr').filter(function () {
                                                            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                                                        });
                                                    });
                                                });
                                                function goBack() {
                                                    window.history.back();
                                                }
        </script>
    </body>
</html>
