
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>

<html lang="en">

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
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduFlex : Course Detail </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
    </head>

    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <jsp:include page="header.jsp"></jsp:include>  

                <!-- Content -->
                <div class="page-content bg-white">
                    <!-- inner page banner -->
                    <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner2.jpg);">
                        <div class="container">
                            <div class="page-banner-entry">
                                <h1 class="text-white">Courses Details</h1>
                            </div>
                        </div>
                    </div>
                    <!-- Breadcrumb row -->
                    <div class="breadcrumb-row">
                        <div class="container">
                            <ul class="list-inline">
                                <li><a href="home">Home</a></li>
                                <li>Courses Details</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Breadcrumb row END -->
                    <!-- inner page banner END -->
                    <div class="content-block">
                        <!-- About Us -->
                    <c:set var="active" value="${requestScope.active}"/>
                    <c:set var="cid" value="${course.course_id}"/>
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row d-flex flex-row-reverse">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="course-detail-bx">
                                        <div class="course-price">
                                            <del>$${course.price}</del>
                                            <h4 class="price">$${course.price - course.price*course.discount/100}</h4>
                                        </div>	
                                        <div class="course-buy-now text-center">
                                            <c:if test="${active == 1}">
                                                <a href="" class="disabled btn radius-xl text-uppercase">Enrolled</a>
                                            </c:if>
                                            <c:if test="${active == 0}">
                                                <a href="buycourse?&course_id=${course.course_id}" class="btn radius-xl text-uppercase">Buy Now This Courses</a>
                                            </c:if>
                                            <c:if test="${cookie.course.course_id == cid}">
                                                <a href="" class="disabled btn radius-xl text-uppercase">Course Already in Cart </a>
                                            </c:if>
                                        </div>
                                        <div class="teacher-bx">
                                            <div class="teacher-info">
                                                <div class="teacher-thumb">
                                                    <c:if test="${accInstructor.avatar == null}">
                                                        <img src="EduChamp-Template/assets/images/profile/default_profile_image.png" 
                                                             alt="profile picture n" 
                                                             />
                                                    </c:if>
                                                    <c:if test="${accInstructor.avatar != null}">
                                                        <img src="data:image/jpeg;base64,${accInstructor.avatar}" 
                                                             alt="profile picture nn" 
                                                             style="width:20px; height: 20px; border-radius: 50%"/>
                                                    </c:if>
                                                </div>
                                                <div class="teacher-name">
                                                    <h5>${course.instructor_name}</h5>
                                                    <p style="word-wrap: break-word; width: 150px; font-size: 12px">${course.instructor_email}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="cours-more-info">
                                            <div class="review">
                                                <span>${course.getFormattedRateCourse()}</span>
                                                <ul class="cours-star">
                                                    <c:forEach begin="1" end="5" varStatus="loop">
                                                        <c:choose>
                                                            <c:when test="${loop.index <= Math.floor(course.rate_course)}">
                                                                <li class="active">
                                                                    <i class="fa fa-star"></i>
                                                                </li>
                                                            </c:when>
                                                            <c:when test="${loop.index == Math.ceil(course.rate_course) && course.rate_course % 1 != 0}">
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
                                            <div class="price categories">
                                                <span>Categories</span>
                                                <h5 class="text-primary">Frontend</h5>
                                            </div>
                                        </div>
                                        <div class="course-info-list scroll-page">
                                            <ul class="navbar">
                                                <li><a class="nav-link" href="#overview"><i class="ti-zip"></i>Overview</a></li>
                                                <li><a class="nav-link" href="#curriculum"><i class="ti-bookmark-alt"></i>Curriculum</a></li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <div class="courses-post">
                                        <div class="ttr-post-media media-effect">
                                            <img src="${course.image}" alt="${course.image}" style="border-radius: 15px; max-width: 700px; max-height: 500px;">
                                        </div>
                                        <div class="ttr-post-info">
                                            <div class="ttr-post-title ">
                                                <h2 class="post-title">${course.course_name}</h2>
                                            </div>
                                            <div class="ttr-post-text">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="courese-overview" id="overview">
                                        <h4>Overview</h4>
                                        <div class="row">
                                            <div class="col-md-12 col-lg-4">
                                                <ul class="course-features">
                                                    <li><i class="ti-book"></i> <span class="label">Chapter</span> <span class="value">${course.chapter_num}</span></li>
                                                    <li><i class="ti-help-alt"></i> <span class="label">Lesson</span> <span class="value">${course.lesson_num}</span></li>
                                                    <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                    <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                    <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">${course.sold}</span></li>
                                                    <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-12 col-lg-8">
                                                <h5 class="m-b5">Course Description</h5>
                                                <p>${course.description}</p>
                                                <h5 class="m-b5">Learning Outcomes</h5>
                                                <ul class="list-checked primary">
                                                    <li>Over 37 lectures and 55.5 hours of content!</li>
                                                    <li>LIVE PROJECT End to End Software Testing Training Included.</li>
                                                    <li>Learn Software Testing and Automation basics from a professional trainer from your own desk.</li>
                                                    <li>Information packed practical training starting from basics to advanced testing techniques.</li>
                                                    <li>Best suitable for beginners to advanced level users and who learn faster when demonstrated.</li>
                                                    <li>Course content designed by considering current software testing technology and the job market.</li>
                                                    <li>Practical assignments at the end of every session.</li>
                                                    <li>Practical learning experience with live project work and examples.cv</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-b30" id="curriculum">
                                        <h4>Curriculum</h4>
                                        <ul class="curriculum-list">
                                            <li>
                                                <h5>First Level</h5>
                                                <ul>
                                                    <li>
                                                        <div class="curriculum-list-box">
                                                            <span>Lesson 1.</span> Introduction to UI Design
                                                        </div>
                                                        <span>120 minutes</span>
                                                    </li>
                                                    <li>
                                                        <div class="curriculum-list-box">
                                                            <span>Lesson 2.</span> User Research and Design
                                                        </div>
                                                        <span>60 minutes</span>
                                                    </li>
                                                    <li>
                                                        <div class="curriculum-list-box">
                                                            <span>Lesson 3.</span> Evaluating User Interfaces Part 1
                                                        </div>
                                                        <span>85 minutes</span>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <h5>Second Level</h5>
                                                <ul>
                                                    <li>
                                                        <div class="curriculum-list-box">
                                                            <span>Lesson 1.</span> Prototyping and Design
                                                        </div>
                                                        <span>110 minutes</span>
                                                    </li>
                                                    <li>
                                                        <div class="curriculum-list-box">
                                                            <span>Lesson 2.</span> UI Design Capstone
                                                        </div>
                                                        <span>120 minutes</span>
                                                    </li>
                                                    <li>
                                                        <div class="curriculum-list-box">
                                                            <span>Lesson 3.</span> Evaluating User Interfaces Part 2
                                                        </div>
                                                        <span>120 minutes</span>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <h5>Final</h5>
                                                <ul>
                                                    <li>
                                                        <div class="curriculum-list-box">
                                                            <span>Part 1.</span> Final Test
                                                        </div>
                                                        <span>120 minutes</span>
                                                    </li>
                                                    <li>
                                                        <div class="curriculum-list-box">
                                                            <span>Part 2.</span> Online Test
                                                        </div>
                                                        <span>120 minutes</span>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>


                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- contact area END -->

            </div>
            <!-- Content END-->


            <!-- Footer Start -->
            <jsp:include page="footer.jsp"></jsp:include>  
            <!-- Footer End -->




            <button class="back-to-top fa fa-chevron-up" ></button>
        </div>
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
        <script src="assets/js/jquery.scroller.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
    </body>

</html>
