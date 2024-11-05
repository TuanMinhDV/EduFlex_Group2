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
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>HoLaLearn | Blogs</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/hamburgers.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="stylesheet" href="./css/slider.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include> 
            <!-- Header End -->
            <main id="main">
                <!--? slider Area Start-->
                <section class="slider-area slider-area2">
                    <div class="slider-active">
                        <!-- Single Slider -->
                        <div class="single-slider slider-height2">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-8 col-lg-11 col-md-12">
                                        <div class="hero__caption hero__caption2">
                                            <h1 data-animation="bounceIn" data-delay="0.2s">Blog</h1>
                                            <!-- breadcrumb Start-->
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                    <li class="breadcrumb-item"><a href="bloglist">Blog</a></li> 
                                                </ol>
                                            </nav>
                                            <!-- breadcrumb End -->
                                        </div>
                                    </div>
                                </div>
                            </div>          
                        </div>
                    </div>
                </section>
                <!--? Blog Area Start-->
                <div class="game-section">
                    <h2 class="line-title" style="font-family: Roboto, sans-serif; font-size: 20px;">Attention Blog</h2>
                    <div class="owl-carousel custom-carousel owl-theme">

                    <c:forEach items="${requestScope.listS1}" var="m">
                        <div class="item" style="background-image: url(data:image/jpeg;base64,${m.image});">
                            <div class="item-desc">
                                <h3 style="font-family: Roboto, sans-serif; font-size: 25px; color: white">${m.title}</h3>
                                <p style="font-family: Roboto, sans-serif; font-size: 16px; color: white">${m.fullname}</p>
                                <a href="${m.link}" class="genric-btn link" style="font-family: Roboto, sans-serif; font-size: 15px; background-color: black; color: #FFF">View Detail</a>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
            <section class="blog_area section-padding">  
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mb-5 mb-lg-0">
                            <div class="single-element-widget mt-30">
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-6">
                                        <h3 class="mb-30">Order by:</h3>
                                        <div class="default-select" id="sort">
                                            <select id="sortSelect">
                                                <option value="default" class="default">Default</option>
                                                <option value="date" class="date">Created Date</option>
                                                <option value="title" class="title">Title</option>
                                                <option value="author" class="author">Author</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <pre>
                                &nbsp;
                            </pre>
                            <div class="blog_left_sidebar" id="content">

                                <!--List Blog Here-->
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="blog_right_sidebar">
                                <aside class="single_sidebar_widget search_widget">
                                    <form action="blogsearch">
                                        <div class="form-group">
                                            <div class="input-group mb-3">

                                                <input type="text" name="search" class="form-control search_key_name" placeholder='Search Keyword'
                                                       onfocus="this.placeholder = ''"
                                                       onblur="this.placeholder = 'Search Keyword'">
                                                <div class="input-group-append">
                                                    <button class="btns" type="button"><i class="ti-search"></i></button>
                                                </div>

                                            </div>
                                        </div>
                                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                                type="submit">Search</button>
                                    </form>
                                </aside>

                                <aside class="single_sidebar_widget popular_post_widget">
                                    <h3 class="widget_title" style="color: #2d2d2d;">Recent Post</h3>
                                    <div id="sub_content">
                                        <!--Recent Blog Here-->
                                    </div>             
                                </aside>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Blog Area End -->
        </main>
        <footer>
            <div class="footer-wrappper footer-bg">
                <!-- Footer Start-->
                <div class="footer-area footer-padding">
                    <div class="container">
                        <div class="row justify-content-between">
                            <div class="col-xl-4 col-lg-5 col-md-4 col-sm-6">
                                <div class="single-footer-caption mb-50">
                                    <div class="single-footer-caption mb-30">
                                        <!-- logo -->
                                        <div class="footer-logo mb-25">
                                            <a href="index.html"><img src="assets/img/logo/logo2_footer.png" alt=""></a>
                                        </div>
                                        <div class="footer-tittle">
                                            <div class="footer-pera">
                                                <p>The automated process starts as soon as your clothes go into the machine.</p>
                                            </div>
                                        </div>
                                        <!-- social -->
                                        <div class="footer-social">
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                            <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                            <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-5">
                                <div class="single-footer-caption mb-50">
                                    <div class="footer-tittle">
                                        <h4>Our solutions</h4>
                                        <ul>
                                            <li><a href="#">Design & creatives</a></li>
                                            <li><a href="#">Telecommunication</a></li>
                                            <li><a href="#">Restaurant</a></li>
                                            <li><a href="#">Programing</a></li>
                                            <li><a href="#">Architecture</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6">
                                <div class="single-footer-caption mb-50">
                                    <div class="footer-tittle">
                                        <h4>Support</h4>
                                        <ul>
                                            <li><a href="#">Design & creatives</a></li>
                                            <li><a href="#">Telecommunication</a></li>
                                            <li><a href="#">Restaurant</a></li>
                                            <li><a href="#">Programing</a></li>
                                            <li><a href="#">Architecture</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                                <div class="single-footer-caption mb-50">
                                    <div class="footer-tittle">
                                        <h4>Company</h4>
                                        <ul>
                                            <li><a href="#">Design & creatives</a></li>
                                            <li><a href="#">Telecommunication</a></li>
                                            <li><a href="#">Restaurant</a></li>
                                            <li><a href="#">Programing</a></li>
                                            <li><a href="#">Architecture</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- footer-bottom area -->
                <div class="footer-bottom-area">
                    <div class="container">
                        <div class="footer-border">
                            <div class="row d-flex align-items-center">
                                <div class="col-xl-12 ">
                                    <div class="footer-copy-right text-center">
                                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer End-->
            </div>
        </footer> 

        <!-- Scroll Up -->
        <div id="back-top" >
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>
        <!-- JS here -->

        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>

        <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>

        <!-- counter , waypoint,Hover Direction -->
        <script src="./assets/js/jquery.counterup.min.js"></script>
        <script src="./assets/js/waypoints.min.js"></script>
        <script src="./assets/js/jquery.countdown.min.js"></script>
        <script src="./assets/js/hover-direction-snake.min.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        <script src="js/blog.js"></script>

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
