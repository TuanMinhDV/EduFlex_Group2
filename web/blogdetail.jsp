<%-- 
    Document   : blogdetail
    Created on : Sep 19, 2023, 12:15:35 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
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
        <title>EduFlex : Blog Details </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
                                <h1 class="text-white">Blog Details</h1>
                            </div>
                        </div>
                    </div>
                    <!-- Breadcrumb row -->
                    <div class="breadcrumb-row">
                        <div class="container">
                            <ul class="list-inline">
                                <li><a href="#">Home</a></li>
                                <li>Blog Details</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Breadcrumb row END -->
                    <div class="content-block">
                        <div class="section-area section-sp1">
                            <div class="container">
                                <div class="row">
                                    <!-- Left part start -->
                                    <div class="col-lg-8 col-xl-8">
                                        <!-- blog start -->
                                        <div class="recent-news blog-lg">
                                            <div class="action-box blog-lg">
                                                <img src="${detail.image}" alt="">
                                        </div>
                                        <div class="info-bx">
                                            <ul class="media-post">
                                                <li><a href="#"><i class="fa fa-calendar"></i>${detail.created_date}</a></li>
                                                <li><a href="#">By ${detail.fullname}</a></li>
                                            </ul>
                                            <h5 class="post-title"><a href="#">${detail.title}</a></h5>
                                            <p>${detail.description}</p>
                                            <p>${detail.content}</p>
                                            <div class="ttr-divider bg-gray"><i class="icon-dot c-square"></i></div>
                                        </div>
                                    </div>

                                    <!-- blog END -->
                                    <div class="col-lg-12 m-b20">
                                        <div class="pagination-bx rounded-sm gray clearfix">
                                            <ul class="pagination">
                                                <c:if test="${detail.id > 1}">
                                                    <li class="previous">
                                                        <a href="blogdetail?id=${preblog.id}"><i class="ti-arrow-left"></i> Prev</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${detail.id < total}">
                                                    <li class="next">
                                                        <a href="blogdetail?id=${nextblog.id}">Next <i class="ti-arrow-right"></i>
                                                    </li>
                                                </c:if>
                                            </ul>

                                        </div>

                                    </div>

                                </div>
                                <!-- Left part END -->
                                <!-- Side bar start -->
                                <div class="col-lg-4 col-xl-4">
                                    <aside  class="side-bar sticky-top">
                                        <div class="widget">
                                            <h6 class="widget-title">Search</h6>
                                            <div class="search-bx style-1">
                                                <form role="search" method="post">
                                                    <div class="input-group">
                                                        <input name="text" class="form-control" placeholder="Enter your keywords..." type="text">
                                                        <span class="input-group-btn">
                                                            <button type="submit" class="fa fa-search text-primary"></button>
                                                        </span> 
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="widget recent-posts-entry">
                                            <h6 class="widget-title">Recent Posts</h6>
                                            <div class="widget-post-bx">
                                                <c:forEach items="${listB1}" var="m">
                                                    <div class="widget-post clearfix">
                                                        <div class="ttr-post-media">
                                                            <img src="${m.image}" width="200" height="143" alt=""/>
                                                        </div>
                                                        <div class="ttr-post-info">
                                                            <div class="ttr-post-header">
                                                                <h6 class="post-title"><a href="blogdetail?id=${m.id}">${m.title}</a></h6>
                                                            </div>
                                                            <ul class="media-post">
                                                                <li><i class="fa fa-calendar"></i> ${m.created_date}</li>
                                                                <li><i class="fa fa-comments-o"></i> By ${m.fullname}</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </c:forEach>  

                                            </div>
                                        </div>

                                    </aside>
                                </div>
                                <!-- Side bar END -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content END-->


            <!-- scroll top button -->
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
