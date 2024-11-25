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
        <title>EduFlex : Blogs </title>

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
                <div class="page-content bg-white">
                    <!-- inner page banner -->
                    <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                        <div class="container">
                            <div class="page-banner-entry">
                                <h1 class="text-white">Our Blogs</h1>
                            </div>
                        </div>
                    </div>
                    <!-- Breadcrumb row -->
                    <div class="breadcrumb-row">
                        <div class="container">
                            <ul class="list-inline">
                                <li><a href="home">Home</a></li>
                                <li>Our Blogs</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Breadcrumb row END -->
                    <div class="content-block">
                        <div class="section-area section-sp1">
                            <div class="container">
                                <div class="row">
                                    <!-- left part start -->
                                    <div class="col-lg-8 col-xl-8 col-md-7">
                                        <!-- blog grid -->
                                        <div id="masonry" class="ttr-blog-grid-3 row">
                                        <c:forEach items="${listBlog}" var="m">
                                            <div class="post action-card col-xl-6 col-lg-6 col-md-12 col-xs-12 m-b40">
                                                <div class="recent-news">
                                                    <div class="action-box">
                                                        <img src="${m.image}" alt="postimageURL" style="height: 200px;">
                                                    </div>
                                                    <div class="info-bx">
                                                        <ul class="media-post">
                                                            <li><i class="fa fa-calendar"></i> ${m.created_date}</li>
                                                            <li><i class="fa fa-user"></i> By ${m.fullname}</li>
                                                        </ul>
                                                        <div  style="height: 250px">
                                                            <h5 class="post-title"><a href="blogdetail?id=${m.id}">${m.title}</a></h5>
                                                            <p>${m.description}</p>
                                                        </div>

                                                        <div class="post-extra">
                                                            <a href="blogdetail?id=${m.id}" class="btn-link">READ MORE</a>
                                                            <!--<a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>20 Comment</a>-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>  
                                    </div>
                                    <!-- blog grid END -->
                                    <!-- Pagination -->
                                    <!--                                    <div class="pagination-bx rounded-sm gray clearfix">
                                                                            <ul class="pagination">
                                                                                <li class="previous"><a href="#"><i class="ti-arrow-left"></i> Prev</a></li>
                                                                                <li class="active"><a href="#">1</a></li>
                                                                                <li><a href="#">2</a></li>
                                                                                <li><a href="#">3</a></li>
                                                                                <li class="next"><a href="#">Next <i class="ti-arrow-right"></i></a></li>
                                                                            </ul>
                                                                        </div>-->
                                    <!-- Pagination END -->
                                </div>
                                <!-- left part END -->
                                <!-- Side bar start -->
                                <div class="col-lg-4 col-xl-4 col-md-5 sticky-top">
                                    <aside class="side-bar sticky-top">
                                        <!--                                        <div class="widget">
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
                                                                                </div>-->
                                        <div class="widget recent-posts-entry">
                                            <h6 class="widget-title">Recent Posts</h6>
                                            <div class="widget-post-bx">

                                                <c:forEach items="${listRecentBlog}" var="m">
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
            <!-- Left & right section END -->
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
