<%-- 
    Document   : home
    Created on : Nov 12, 2024, 2:12:03 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="EduChamp-Template/assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="EduChamp-Template/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduFlex : Home </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="EduChamp-Template/assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="EduChamp-Template/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="EduChamp-Template/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="EduChamp-Template/assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="EduChamp-Template/assets/css/color/color-1.css">

        <!-- REVOLUTION SLIDER CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="EduChamp-Template/assets/vendors/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="EduChamp-Template/assets/vendors/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="EduChamp-Template/assets/vendors/revolution/css/navigation.css">
        <!-- REVOLUTION SLIDER END -->
        <style>
            .limited-height {
                display: flex;
                flex-direction: column;
                height: 70px;
            }
        </style>
    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <jsp:include page="header.jsp"></jsp:include> 
                <!-- Content -->
                <div class="page-content bg-white">
                    <!-- Main Slider -->
                    <div class="section-area section-sp1 ovpr-dark bg-fix online-cours" style="background-image:url(EduChamp-Template/assets/images/background/bg1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-center text-white">
                                    <h2>Online Courses To Learn</h2>
                                    <h5>Own Your Feature Learning New Skills Online</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p>${message}</p>
                <!-- Main Slider -->
                <div class="content-block">
                   
                    <!-- Popular Courses -->
                    <div class="section-area section-sp2 popular-courses-bx">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 heading-bx left">
                                    <h2 class="title-head">Best Rating <span>Courses</span></h2>
                                    <p>It is a long established fact that a reader will be distracted by the readable content of a page</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="courses-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                    <jsp:useBean id="s" class="dto.CourseDAO" scope="request"/>
                                    <c:forEach var="i" items="${s.top5MostRatedCourses}">
                                        <!--Single Course-->
                                        <div class="item">
                                            <div class="cours-bx">
                                                <div class="action-box">
                                                    <img src="${i.image}" alt="Image: ${i.image}" style="height: 200px">
                                                    <a href="coursedetail?course_id=${i.course_id}" class="btn">Read More</a>
                                                </div>
                                                <div class="info-bx text-center">
                                                    <h5><a href="coursedetail?course_id=${i.course_id}" class="limited-height">${i.course_name}</a></h5>
                                                    <span>By ${i.instructor_name}</span>
                                                </div>
                                                <div class="cours-more-info">
                                                    <div class="review">
                                                        <span>Course rate: ${i.getFormattedRateCourse()}</span>
                                                        <ul class="cours-star">
                                                            <c:forEach begin="1" end="5" varStatus="loop">
                                                                <c:choose>
                                                                    <c:when test="${loop.index <= Math.floor(i.rate_course)}">
                                                                        <li class="active">
                                                                            <i class="fa fa-star"></i>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:when test="${loop.index == Math.ceil(i.rate_course) && i.rate_course % 1 != 0}">
                                                                        <li class="active">
                                                                            <i class="fa fa-star-half"></i>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <li>
                                                                            <i class="fa fa-star"></i>
                                                                        </li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                    <div class="price">
                                                        <del>$${i.price}</del>
                                                        <h5>$${i.price - i.price*i.discount/100}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Signle Course End-->
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Popular Courses END -->
                    <div class="section-area section-sp2 bg-fix ovbl-dark join-bx text-center" style="background-image:url(assets/images/background/bg1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="join-content-bx text-white">
                                        <h2>Learn a new skill online on <br> your time</h2>
                                        <h4><span class="counter">57,000</span> Online Courses</h4>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        <c:if test="${sessionScope.account == null}">
                                            <a href="login" class="btn button-md">Join Now</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Form END -->
                    
                     <!-- Popular Courses -->
                    <div class="section-area section-sp2 popular-courses-bx">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 heading-bx left">
                                    <h2 class="title-head">Recent <span>Courses</span></h2>
                                    <p>It is a long established fact that a reader will be distracted by the readable content of a page</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="courses-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                    <c:forEach var="i" items="${s.top4NewestCourse}">
                                        <!--Single Course-->
                                        <div class="item">
                                            <div class="cours-bx">
                                                <div class="action-box">
                                                    <img src="${i.image}" alt="Image: ${i.image}" style="height: 200px">
                                                    <a href="coursedetail?course_id=${i.course_id}" class="btn">Read More</a>
                                                </div>
                                                <div class="info-bx text-center">
                                                    <h5><a href="coursedetail?course_id=${i.course_id}" class="limited-height">${i.course_name}</a></h5>
                                                    <span>By ${i.instructor_name}</span>
                                                </div>
                                                <div class="cours-more-info">
                                                    <div class="review">
                                                        <span>Course rate: ${i.getFormattedRateCourse()}</span>
                                                        <ul class="cours-star">
                                                            <c:forEach begin="1" end="5" varStatus="loop">
                                                                <c:choose>
                                                                    <c:when test="${loop.index <= Math.floor(i.rate_course)}">
                                                                        <li class="active">
                                                                            <i class="fa fa-star"></i>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:when test="${loop.index == Math.ceil(i.rate_course) && i.rate_course % 1 != 0}">
                                                                        <li class="active">
                                                                            <i class="fa fa-star-half"></i>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <li>
                                                                            <i class="fa fa-star"></i>
                                                                        </li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                    <div class="price">
                                                        <del>$${i.price}</del>
                                                        <h5>$${i.price - i.price*i.discount/100}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Signle Course End-->
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Popular Courses END -->


                </div>
                <!-- contact area END -->
            </div>
            <!-- Content END-->
            <!-- Footer ==== -->
            <jsp:include page="footer.jsp"></jsp:include> 
            <!-- Footer END ==== -->
            <button class="back-to-top fa fa-chevron-up" ></button>
        </div>

        <!-- External JavaScripts -->
        <script src="EduChamp-Template/assets/js/jquery.min.js"></script>
        <script src="EduChamp-Template/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="EduChamp-Template/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="EduChamp-Template/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="EduChamp-Template/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="EduChamp-Template/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="EduChamp-Template/assets/vendors/counter/waypoints-min.js"></script>
        <script src="EduChamp-Template/assets/vendors/counter/counterup.min.js"></script>
        <script src="EduChamp-Template/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="EduChamp-Template/assets/vendors/masonry/masonry.js"></script>
        <script src="EduChamp-Template/assets/vendors/masonry/filter.js"></script>
        <script src="EduChamp-Template/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="EduChamp-Template/assets/js/functions.js"></script>
        <script src="EduChamp-Template/assets/js/contact.js"></script>
    </body>
</html>
