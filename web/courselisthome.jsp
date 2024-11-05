

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>


<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Courses | Education</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <main>
            <jsp:include page="header.jsp"></jsp:include> 
                <!--? slider Area Start-->
                <section class="slider-area slider-area2">
                    <div class="slider-active">
                        <!-- Single Slider -->
                        <div class="single-slider slider-height2">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-8 col-lg-11 col-md-12">
                                        <div class="hero__caption hero__caption2">
                                            <h1 data-animation="bounceIn" data-delay="0.2s">Our subject</h1>
                                            <!-- breadcrumb Start-->
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                    <li class="breadcrumb-item"><a href="#">Services</a></li> 
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
                <!-- slider area end -->
                <!-- Courses area start -->
                <div class="courses-area section-padding40 fix" id="subject">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-7 col-lg-8">
                                <div class="section-tittle text-center mb-55">
                                    <h2>Our featured Subjects</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-lg-3">
                                <div class="blog_right_sidebar">
                                    <aside class="single_sidebar_widget search_widget">
                                        <form action="#">
                                            <div class="form-group">
                                                <div class="input-group mb-3">
                                                    <input name="txt" type="text" class="form-control search_key_name" placeholder='Search Keyword'
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


                                </div>
                                <div class="blog_right_sidebar">
                                    <h4 class="widget_title" style="color: #2d2d2d;">Filter</h4>
                                    <aside class="single_sidebar_widget search_widget">
                                        <div class="border-bottom mb-4 pb-4">
                                            <h5 class="font-weight-semi-bold mb-4">Category</h5>
                                            <form id="category-form" action="">
                                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                                    <input type="checkbox" class="custom-control-input filter_subject" id="category-all" checked="checked" name="category" value="All">
                                                    <label class="custom-control-label" for="category-all">All Category</label>
                                                </div>
                                            <c:set var="categories" value="${requestScope.listCY}"/>
                                            <c:forEach begin="0" end="${categories.size()-1}" var="i">

                                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                                    <input type="checkbox" class="custom-control-input filter_subject" id="${categories.get(i).getCategory_id()}" name="category" value="${categories.get(i).getCategory_name()}">
                                                    <label class="custom-control-label" for="${categories.get(i).getCategory_id()}">${categories.get(i).getCategory_name()}</label>
                                                </div>
                                            </c:forEach>
                                        </form>
                                    </div>
                                </aside>
                                <aside class="single_sidebar_widget post_category_widget">
                                    <!-- Price Start -->
                                    <c:set var="listPrice" value="${requestScope.listPrice}"/>
                                    <div class="border-bottom mb-4 pb-4">
                                        <h5 class="font-weight-semi-bold mb-4">Price</h5>
                                        <form id="price_form" action="">
                                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                                <input type="checkbox" class="custom-control-input filter_subject" checked="checked" name="price" id="price-all" value="${0}">
                                                <label class="custom-control-label" for="price-all">All Price</label>
                                            </div>
                                            <c:forEach begin="0" end="3" var="i">                                    
                                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                                    <input type="checkbox" class="custom-control-input filter_subject" id="price${(i+1)}" name="price" value="${(i+1)}">
                                                    <label class="custom-control-label" for="price${(i+1)}">${listPrice[i]}</label>
                                                </div>
                                            </c:forEach>
                                        </form>
                                    </div>
                                    <!-- Price End -->

                                </aside>


                            </div>

                            <!-- Category End -->



                        </div>

                        <div class="col-lg-9"> 
                            <div class="row">
                                <hr>
                                <div class="col-md-12">
                                    <div class="dropdown ml-4 text-lg-right">
                                        <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                            Sort by
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                            <li class="dropdown-item latest">Latest</li>
                                            <li class="dropdown-item cheapest">Cheapest</li>
                                            <li class="dropdown-item most_expensive">Most expensive</li>
                                        </ul>
                                    </div>
                                    <hr>
                                    <div class="courses-actives">
                                        <div id="list-subject" class="row">
                                            <c:forEach var="i" items="${requestScope.listCE}">
                                                <div class="properties pb-20 subject_card">
                                                    <div class="properties__card">
                                                        <div class="properties__img overlay1">
                                                            <a href="#"><img src="data:image/jpeg;base64,${i.image}" alt=""></a>
                                                        </div>
                                                        <div class="properties__caption">
                                                            <!--<p>User Experience</p>-->
                                                            <h3 class="text-nowrap text-truncate"><a href="#">${i.course_name}</a></h3>
                                                            <p class="limited-height">
                                                                ${i.description}          
                                                            </p>
                                                            <div class="properties__footer d-flex justify-content-between align-items-center">
                                                                <div class="restaurant-name">
                                                                    <div class="rating">
                                                                        <c:forEach begin="1" end="${Math.floor(i.rate_course)}" varStatus="loop">
                                                                            <i class="fa fa-star"></i>
                                                                        </c:forEach>
                                                                        <c:if test="${i.rate_course > Math.floor(i.rate_course) && i.rate_course < Math.floor(i.rate_course) + 1}">
                                                                            <i class="fa fa-star-half"></i>
                                                                        </c:if>
                                                                        <c:forEach begin="${Math.ceil(i.rate_course) + 1}" end="5" varStatus="loop">
                                                                            <span class="star-icon">
                                                                                <i class="fa fa-star"></i>
                                                                            </span>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <p><span>(${i.rate_course})</span> rating</p>
                                                                </div>
                                                                <div class="price">
                                                                    <span>$${i.price}</span>
                                                                </div>
                                                            </div>
                                                            <a href="coursedetail?course_id=${i.course_id}" class="border-btn border-btn2">Find out more</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <input type="hidden" id="account_id" name="account_id" value="${sessionScope.account.account_id}">
                                        </div>
                                    </div>
                                    

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 pb-1 text-lg-right">

                        <nav aria-label="..." >
                            <ul class="pagination " id="pages">
                                <li class="page-item pageInfo" style="padding-right: 30px ;padding-top: 5px">Page 1</li>

                                <li class="page-item ">
                                    <input type="button" class="page-link goPrevious" value="Previous">

                                </li>

                                <li class="page-item active">
                                    <a class="page-link currentPage" id="currentPage" href="#"><span class="sr-only">(current)</span></a>
                                </li>

                                <li class="page-item">

                                    <input type="button" class="page-link goNext" value="Next">
                                </li>
                            </ul>
                        </nav>
                    </div>

                </div>
            </div>
            <!-- Courses area End -->

        </main>
        <jsp:include page="footer.jsp"></jsp:include>  
        <!-- Scroll Up -->
        <div id="back-top" >
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>

        <!-- JS here -->
        <script src="assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/slick.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/animated.headline.js"></script>
        <script src="assets/js/jquery.magnific-popup.js"></script>

        <!-- Date Picker -->
        <script src="assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <script src="assets/js/jquery.sticky.js"></script>
        <!-- Progress -->
        <script src="assets/js/jquery.barfiller.js"></script>

        <!-- counter , waypoint,Hover Direction -->
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <script src="assets/js/hover-direction-snake.min.js"></script>

        <!-- contact js -->
        <script src="assets/js/contact.js"></script>
        <script src="assets/js/jquery.form.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/mail-script.js"></script>
        <script src="assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->	
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/pagingsubjectlist.js"></script>
        <script src="assets/js/jqBootstrapValidation.min.js"></script>




    </body>
</html>

