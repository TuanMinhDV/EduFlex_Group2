
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Courses | Education</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="assets/css/gijgo.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/animated-headline.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>  

            <!-- Header Start -->
            <div style="background-image: url('https://images.pexels.com/photos/4709289/pexels-photo-4709289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')" 
                 class="container-fluid bg-primary px-0 px-md-5 mb-5">
                <div class="row align-items-center px-3">
                    <div class="col-lg-6 text-center text-lg-left">
                        <hr>
                        <h4 class="text-white mb-4 mt-5 mt-lg-0">${course.course_name}</h4>
                    <h1 class="display-3 font-weight-bold text-white">📖${course.course_name}</h1>
                    <p class="text-white mb-4">💡${course.description}</p>
                    <c:set var="active" value="${requestScope.active}"/>
                    <c:set var="cid" value="${course.course_id}"/>
                    <c:if test="${active == 1}">
                        <a href="login.jsp" class="disabled btn btn-secondary mt-1 py-3 px-5">Enrolled Course</a>
                    </c:if>
                    <c:if test="${active == 0}">
                        <a href="buycourse?&course_id=${course.course_id}" class="btn btn-secondary mt-1 py-3 px-5">Enroll</a>
                    </c:if>

                    <c:if test="${cookie.course.course_id == cid}">
                        <a href="" class="disabled btn btn-secondary mt-1 py-3 px-5"> Course Already in Cart </a>
                    </c:if>

                    <c:if test="${course.discount > 0}">
                        <a  class="disabled btn btn-secondary mt-1 py-3 px-5">
                            <i class="fas fa-dollar-sign"></i>
                            <span>
                                <span style="color: green; font-weight: bold;font-size:18px">
                                    <fmt:formatNumber value="${course.price*(1-s.discount/100)}"/>💵
                                </span>&nbsp;&nbsp;
                                <span 
                                    style="color: red; font-size: 10px;
                                    font-weight: bold;
                                    padding: 1px 2px;
                                    border: 1px solid red;
                                    border-radius: 3px;">
                                    <fmt:formatNumber value="${course.discount}"/>%
                                </span> 
                                &nbsp;&nbsp;
                                <del style="font-size: 16px;">
                                    $<fmt:formatNumber value="${course.price}"/>
                                </del>
                            </span>
                        </a>
                    </c:if>
                    <c:if test="${course.discount == 0}">
                        <a  class="disabled btn btn-secondary mt-1 py-3 px-5">
                            <i class="fas fa-dollar-sign"></i>
                            <span style="color: green; font-weight: bold;font-size: 18px">${course.price}💵</span> 
                        </a>
                    </c:if>
                </div>
                <div style="padding-top: 410px" class="col-lg-6 text-center text-lg-right">
                    <a  class="disabled btn btn-secondary mt-1 py-3 px-5"><i class=""></i>
                        <span>Rate: ${course.rate_course}⭐</span> 
                    </a>
                </div>
                <hr>
                <div class="col-lg-6 text-center text-lg-right">
                    <img class="img-fluid mt-5" src="" alt="">
                </div>
            </div>
        </div>
        <!-- Header End -->

        <!-- Class Start -->
        
        <!-- Class End -->

        <!-- Blog Start -->
        
        <!-- Blog End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>  
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary p-3 back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="template subject_detail/lib/easing/easing.min.js"></script>
        <script src="template subject_detail/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="template subject_detail/lib/isotope/isotope.pkgd.min.js"></script>
        <script src="template subject_detail/lib/lightbox/js/lightbox.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="template subject_detail/mail/jqBootstrapValidation.min.js"></script>
        <script src="template subject_detail/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="template subject_detail/js/main.js"></script>


    </body>

</html>
