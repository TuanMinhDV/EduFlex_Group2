<%-- 
    Document   : test
    Created on : Nov 9, 2024, 2:18:53 PM
    Author     : dungm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
