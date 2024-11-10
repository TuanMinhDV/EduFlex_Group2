<%-- 
    Document   : quizzes
    Created on : Nov 6, 2024, 12:24:18 PM
    Author     : dungm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Quiz Management - Chapter</title>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="./DungBT_Pages/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./DungBT_Pages/assets/css/main.css" rel="stylesheet">
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
    <body class="quiz-page">
        <header class="header d-flex align-items-center sticky-top">
            <div class="container d-flex align-items-center">
                <a href="#" class="logo me-auto">
                    <h1 class="sitename">Quizz Management</h1>
                </a>
                <nav class="navmenu">
                    <ul>
                        <li><a href="#">Dashboard</a></li>
                        <li><a href="listCourse">Courses</a></li>
                        <li><a href="#" onclick="goBack()">Chapters</a></li>
                        <li><a href="#" class="active">Quizzes</a></li>
                        <li><a href="#">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main class="main">
            <section class="quizzes section">
                <div class="container">
                    <!-- Chapter Info -->
                    <div class="row mb-4">
                        <div class="col-lg-12">
                            <p>Manage quizzes for the chapter <strong>${chapter.chapter_name}</strong>.</p>
                        </div>
                    </div>

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
                                        <th>Quiz ID</th>
                                        <th>Quiz Title</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listQuizz}" var="quiz">
                                        <c:if test="${quiz.isDisable != 1}">
                                            <tr>
                                                <td>${quiz.quiz_id}</td>
                                                <td>${quiz.name}</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-view-questions" data-id="${quiz.quiz_id}">
                                                        <a href="listQuestion?quizzID=${quiz.quiz_id}" style="color: white">View Questions</a>
                                                    </button>
                                                    <button type="button" class="btn btn-success btn-edit-quiz" data-id="${quiz.quiz_id}" data-title="${quiz.name}">Edit</button>
                                                    <form action="listQuizz" method="post" style="display:inline;">
                                                        <input type="hidden" name="type" value="delete">
                                                        <input type="hidden" name="quizId" value="${quiz.quiz_id}">
                                                        <input type="hidden" value="${quiz.isDisable}">
                                                        <input type="hidden" name="chapterId" value="${chapter.chapter_id}">
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
                    <form method="post" action="listQuizz">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Quizz</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="edit"/>
                            <input type="hidden" id="edit-quiz-id" name="quizId"/>
                            <input type="text" name="chapterId" value="${chapter.chapter_id}"/>
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
                    <form method="post" action="listQuizz">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Quiz</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="type" value="add"/>
                            <input type="hidden" name="chapterID" value="${chapter.chapter_id}"/>
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

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
                                                            }
        </script>
    </body>
</html>
