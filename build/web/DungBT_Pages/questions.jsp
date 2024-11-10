<%-- 
    Document   : questions
    Created on : Nov 8, 2024, 7:55:23 PM
    Author     : dungm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Manage Questions - Chapter</title>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="./DungBT_Pages/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./DungBT_Pages/assets/css/main.css" rel="stylesheet">
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
    <body class="question-page">
        <header class="header d-flex align-items-center sticky-top">
            <div class="container d-flex align-items-center">
                <h1 class="sitename me-auto">Question Management</h1>
                <button class="btn btn-secondary ms-auto" onclick="goBack()">Quay lại</button>
            </div>
        </header>

        <main class="main container mt-4">
            <!-- Search Bar -->
            <div class="row mb-4">
                <div class="col-lg-12">
                    <form action="listQuestion" method="post">
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
                                <th>Question ID</th>
                                <th>Question Text</th>
                                <th>Options</th>
                                <th>Correct Answer</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="question-table-body">
                            <c:forEach items="${listQuestion}" var="question">
                                <tr>
                                    <td>${question.question_id}</td>
                                    <td>${question.content}</td>
                                    <td>
                                        A. ${question.option1} <br>
                                        B. ${question.option2} <br>
                                        C. ${question.option3} <br>
                                        D. ${question.option4}
                                    </td>
                                    <td>${question.answer}</td>
                                    <td>
                                        <button type="button" class="btn btn-success btn-edit" data-id="${question.question_id}" data-text="${question.content}" data-choice-a="${question.option1}" data-choice-b="${question.option2}" data-choice-c="${question.option3}" data-choice-d="${question.option4}" data-correct="${question.answer}">Edit</button>
                                        <form method="post" action="listQuestion" style="display: inline;">
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
                    <form method="post" action="listQuestion">
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
                    <form method="post" action="listQuestion">
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

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
