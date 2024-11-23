<%-- 
    Document   : blog
    Created on : Sep 18, 2023, 10:59:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
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
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduFlex : My Enrolled Courses </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="admin/assets/css/color/color-1.css">
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <jsp:include page="header2.jsp"></jsp:include>  
        <jsp:include page="sidebarleft.jsp"></jsp:include>  
            <main class="ttr-wrapper">
                <div class="container-fluid">
                    <div class="db-breadcrumb">
                        <ul class="db-breadcrumb-list">
                            <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                            <li>My Courses</li>
                        </ul>
                    </div>	
                    <div class="row">
                        <!-- Your Profile Views Chart -->
                        <div class="col-lg-12 m-b30">
                            <div class="widget-box">
                                <div class="wc-title">
                                    <h4>My Enrolled Courses</h4>
                                </div>
                                <div class="widget-inner">
                                <c:forEach var="m" items="${requestScope.listLC}" >
                                    <div class="card-courses-list bookmarks-bx">
                                        <div class="card-courses-media">
                                            <img src="${m.image}" alt="${m.image}"/>
                                        </div>
                                        <div class="card-courses-full-dec">
                                            <div class="card-courses-title">
                                                <h4 class="m-b5">${m.course_name}</h4>
                                            </div>
                                            <div class="card-courses-list-bx">
                                                <ul class="card-courses-view">
                                                    <li class="card-courses-categories">
                                                        <h5><i class="fa fa-calendar"></i> ${m.enrolled_date}</h5>
                                                        <h4>By ${m.instructor_name}</h4>
                                                    </li>
                                                    <li class="card-courses-review">
                                                        <h5>My Rating: ${m.rate}</h5>
                                                        <ul class="cours-star">
                                                            <c:forEach begin="1" end="5" varStatus="loop">
                                                                <c:choose>
                                                                    <c:when test="${loop.index <= Math.floor(m.rate)}">
                                                                        <li class="active">
                                                                            <i class="fa fa-star"></i>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:when test="${loop.index == Math.ceil(m.rate) && m.rate % 1 != 0}">
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
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="row card-courses-dec">
                                                <div class="col-md-12">
                                                    <p>${m.description}</p>	
                                                </div>
                                                <div class="col-md-12">
                                                    <c:if test="${m.status == 1}">
                                                        <a href="" class="btn-link">View Certificate</a>
                                                        <a href="coursedetail?course_id=${m.course_id}" class="btn radius-xl">Review</a>
                                                    </c:if>
                                                    <c:if test="${m.status != 1}">
                                                        <a href="coursedetail?course_id=${m.course_id}" class="btn radius-xl">Continue</a>
                                                    </c:if>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>
    </main>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    <!-- JS here -->
    <script src="admin/assets/js/jquery.min.js"></script>
    <script src="admin/assets/vendors/bootstrap/js/popper.min.js"></script>
    <script src="admin/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="admin/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="admin/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
    <script src="admin/assets/vendors/magnific-popup/magnific-popup.js"></script>
    <script src="admin/assets/vendors/counter/waypoints-min.js"></script>
    <script src="admin/assets/vendors/counter/counterup.min.js"></script>
    <script src="admin/assets/vendors/imagesloaded/imagesloaded.js"></script>
    <script src="admin/assets/vendors/masonry/masonry.js"></script>
    <script src="admin/assets/vendors/masonry/filter.js"></script>
    <script src="admin/assets/vendors/owl-carousel/owl.carousel.js"></script>
    <script src='admin/assets/vendors/scroll/scrollbar.min.js'></script>
    <script src="admin/assets/js/functions.js"></script>
    <script src="admin/assets/vendors/chart/chart.min.js"></script>
    <script src="admin/assets/js/admin.js"></script>

</body>
<script>
    $(".custom-carousel").owlCarousel({
        autoWidth: true,
        loop: true
    });
    $(document).ready(function () {
        $(".custom-carousel .item").click(function () {
            $(".custom-carousel .item").not($(this)).removeClass("active");
            $(this).toggleClass("active");
        });
    });

</script>
</html>
