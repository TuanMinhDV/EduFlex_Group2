

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>


<html class="no-js" lang="zxx">
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
        <title>EduChamp : Education HTML Template </title>

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
        <style>
            .limited-height {
                display: flex;
                flex-direction: column;
                height: 70px;
            }

            .properties__caption {
                flex-grow: 1; /* This will make the description take up available space */
                overflow: hidden;
                text-overflow: ellipsis;
            }

        </style>
    </head>

    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <jsp:include page="header.jsp"></jsp:include> 
                <!-- Content -->
                <div class="page-content bg-white">
                    <!-- inner page banner -->
                    <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner3.jpg);">
                        <div class="container">
                            <div class="page-banner-entry">
                                <h1 class="text-white">Our Courses</h1>
                            </div>
                        </div>
                    </div>
                    <!-- Breadcrumb row -->
                    <div class="breadcrumb-row">
                        <div class="container">
                            <ul class="list-inline">
                                <li><a href="#">Home</a></li>
                                <li>Our Courses</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Breadcrumb row END -->
                    <!-- inner page banner END -->
                    <div class="content-block">
                        <!-- About Us -->
                        <div class="section-area section-sp1">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                        <div class="widget courses-search-bx placeani">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <label>Search Courses</label>
                                                    <input name="dzName" type="text" required class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget widget_archive">
                                            <h5 class="widget-title style-1">All Courses</h5>
                                            <ul>
                                                <li class="active"><a href="#">General</a></li>
                                                <li><a href="#">IT & Software</a></li>
                                                <li><a href="#">Photography</a></li>
                                                <li><a href="#">Programming Language</a></li>
                                                <li><a href="#">Technology</a></li>
                                            </ul>
                                        </div>
                                    <c:if test="${sessionScope.account == null}">
                                        <div class="widget">
                                            <a href="login"><img src="assets/images/adv/adv.jpg" alt=""/></a>
                                        </div>
                                    </c:if>

                                    <!--Recent Course-->

                                    <div class="widget recent-posts-entry widget-courses">
                                        <h5 class="widget-title style-1">Recent Courses</h5>
                                        <div class="widget-post-bx">
                                            <c:forEach var="k" items="${requestScope.recentCourse}" >
                                                <div class="widget-post clearfix">
                                                    <div class="ttr-post-media"> <img src="${k.image}" width="200" height="143" alt=""> </div>
                                                    <div class="ttr-post-info">
                                                        <div class="ttr-post-header">
                                                            <h6 class="post-title"><a href="coursedetail?course_id=${k.course_id}">${k.course_name}</a></h6>
                                                        </div>
                                                        <div class="ttr-post-meta">
                                                            <ul>
                                                                <li class="price">
                                                                    <c:if test="${k.price == 0}">
                                                                        <h5 class="free">Free</h5>
                                                                    </c:if>
                                                                    <c:if test="${k.price != 0}">
                                                                        <c:if test="${k.price == k.price - k.price*k.discount/100}">
                                                                            <h5>$${k.price}</h5>
                                                                        </c:if>
                                                                        <c:if test="${k.price != k.price - k.price*k.discount/100}">
                                                                            <del>$${k.price}</del>
                                                                            <h5>$${k.price - k.price*k.discount/100}</h5>
                                                                        </c:if>
                                                                    </c:if>

                                                                </li>
                                                                <!--<li class="review">By ${k.instructor_name}</li>-->
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <div class="row">
                                        <c:forEach var="i" items="${requestScope.listCE}" >
                                            <!--Single Course Start-->
                                            <div class="col-md-6 col-lg-4 col-sm-6 m-b30">
                                                <div class="cours-bx">
                                                    <div class="action-box">
                                                        <img src="${i.image}" alt="${i.image}" style="height: 200px">
                                                        <a href="coursedetail?course_id=${i.course_id}" class="btn">Read More</a>
                                                    </div>
                                                    <div class="info-bx text-center align-content-center">
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
                                            <!--Single Course End-->
                                        </c:forEach>
                                        <input type="hidden" id="account_id" name="account_id" value="${sessionScope.account.account_id}">
                                        <!--Phân trang-->
                                        <div class="col-lg-12 m-b20">
                                            <div class="pagination-bx rounded-sm gray clearfix">
                                                <ul class="pagination">
                                                    <li class="previous"><a href="#"><i class="ti-arrow-left"></i> Prev</a></li>
                                                    <li class="active"><a href="#">1</a></li>
                                                    <li><a href="#">2</a></li>
                                                    <li><a href="#">3</a></li>
                                                    <li class="next"><a href="#">Next <i class="ti-arrow-right"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- contact area END -->
                <jsp:include page="footer.jsp"></jsp:include>  
            </div>
            <!-- Content END-->
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
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
    </body>
</html>

