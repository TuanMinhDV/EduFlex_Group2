<%-- 
    Document   : blogdetail
    Created on : Sep 19, 2023, 12:15:35 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Slider | Detail</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="./css/slider.css">
        <link rel="stylesheet" href="./css/time.css">
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>  

            <!-- Header End -->
            <main>
                <!--? slider Area Start-->
                <section class="slider-area slider-area2">
                    <div class="slider-active">
                        <!-- Single Slider -->
                        <div class="single-slider slider-height2">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-8 col-lg-11 col-md-12">
                                        <div class="hero__caption hero__caption2">
                                            <h1 data-animation="bounceIn" data-delay="0.2s">Slider Detail</h1>
                                            <!-- breadcrumb Start-->
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                    <li class="breadcrumb-item"><a href="sliderlist">Slider</a></li> 
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
                <!--? Blog Area Start -->
                <section class="blog_area single-post-area section-padding">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 posts-list">
                                <div class="single-post">
                                    <h1 style="color: #2d2d2d;">${detail.title}
                                </h1>
                                <div class="feature-img">
                                    <img class="img-fluid" src="data:image/jpeg;base64,${detail.image}" alt="">
                                </div>
                                <div class="blog_details">
                                    <ul class="blog-info-link mt-3 mb-4">
                                        <li><a href="#"><i class="fa fa-user"></i>${detail.fullname}</a></li>
                                        <li><a href="#"> ${detail.type}</a></li>
                                    </ul>
                                    <p class="excert">
                                        ${detail.description}
                                    </p>
                                    <c:if test="${detail.type == 'Discount'}">
                                        <div  class="row">

                                            <c:forEach items="${requestScope.disAu}" var="s">
                                                <div class="col-lg-4 mb-5">
                                                    <div class="card border-0 bg-light shadow-sm pb-2">
                                                        <img class="card-img-top mb-2" src="data:image/jpeg;base64,${s.image}" alt="">
                                                        <div class="card-body text-center">
                                                            <h4 class="card-title">${s.subject_name}</h4>

                                                        </div>
                                                        <div class="card-footer bg-transparent py-4 px-5">

                                                            <div class="row border-bottom">
                                                                <div class="col-6 py-1 text-right border-right"><strong>Lecturer 👩‍🏫</strong></div>
                                                                <div class="col-6 py-1"> ${s.lecturer_name} / ${s.lecturer_id} </div>
                                                            </div>

                                                            <div class="row border-bottom">
                                                                <div class="col-6 py-1 text-right border-right"><strong> Date📆</strong></div>
                                                                <div class="col-6 py-1">${s.created_date}</div>
                                                            </div>
                                                            <div class="row border-bottom">
                                                                <div class="col-6 py-1 text-right border-right"><strong>Discount</strong></div>
                                                                <div class="col-6 py-1"><fmt:formatNumber value="${s.discount}"/>%</div>
                                                            </div>
                                                            <div class="row border-bottom">
                                                                <div class="col-6 py-1 text-right border-right"><strong> Fee 💵</strong></div>
                                                                <c:if test="${s.discount > 0}">
                                                                    <div class="col-6 py-1"><span><del style="font-size: 16px;">$<fmt:formatNumber value="${s.price}"/></del> <span 
                                                                                style="color: red; font-size: 10px; font-weight: bold; padding: 1px 2px; border: 1px solid red; border-radius: 3px;"><fmt:formatNumber value="${s.discount}"/>%</span> 
                                                                            <span style="color: green; font-weight: bold;font-size: 18px">$<fmt:formatNumber value="${s.price*(1-s.discount/100)}"/></span></span>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${s.discount == 0}">
                                                                    <div style="color: green; font-weight: bold;font-size: 18px" class="col-6 py-1">$${s.price}</div>
                                                                </c:if>
                                                            </div>
                                                            <div class="row border-bottom">
                                                                <div class="col-6 py-1 text-right border-right"><strong>Sold</strong></div>
                                                                <div class="col-6 py-1">${s.sold}</div>
                                                            </div>
                                                            <div class="row border-bottom">
                                                                <div class="col-6 py-1 text-right border-right"><strong> Learners👨‍🎓</strong></div>
                                                                <div class="col-6 py-1">${s.sold}</div>
                                                            </div>
                                                            <div class="row border-bottom">
                                                                <div class="col-6 py-1 text-right border-right"><strong>Rate ⭐</strong></div>
                                                                <div class="col-6 py-1">${s.rate_subject}</div>
                                                            </div>
                                                        </div>
                                                        <a href="subjectdetail?category_id=${s.category_id}&subject_id=${s.subject_id}" class="btn btn-primary px-4 mx-auto mb-4">View</a>
                                                        <a href="buysubject?category_id=${s.category_id}&subject_id=${s.subject_id}" class="btn btn-primary px-4 mx-auto mb-4 btn fa fa-shopping-bag">Add To Cart</a>

                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        &nbsp; &nbsp; &nbsp;
                                        <p style="font-family: Roboto, sans-serif; font-size: 20px; color: #ff3333">Time Reamining</p>
                                        <time class="countdown" date-time="${detail.endtime} 23:59:59" style="--accent: red"></time>
                                        &nbsp; &nbsp;
                                    </c:if>
                                </div>
                            </div>
                            <div class="navigation-top">
                                <div class="d-sm-flex justify-content-between text-center">
                                    <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> </p>
                                    <div class="col-sm-4 text-center my-2 my-sm-0">
                                        <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                                    </div>
                                    <ul class="social-icons">
                                        <li><a href="https://www.facebook.com/sai4ull"><i class="fab fa-facebook-f"></i></a></li>
                                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                                        <li><a href="#"><i class="fab fa-behance"></i></a></li>
                                    </ul>
                                </div>
                                <div class="navigation-area">
                                    <div class="row">

                                    </div>
                                </div>
                            </div>



                        </div>
                        <div class="col-lg-4">
                            <div class="blog_right_sidebar">
                                <a href="${detail.link}">
                                    <c:if test="${detail.type == 'Subject'}">
                                        &nbsp; &nbsp; &nbsp;
                                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn">Go to Course</button>
                                        &nbsp; &nbsp;
                                    </c:if>
                                    <c:if test="${detail.type == 'Blog'}">
                                        &nbsp; &nbsp; &nbsp;
                                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn">View Blog</button>
                                        &nbsp; &nbsp;
                                    </c:if>                                   
                                    <c:if test="${detail.type == 'Discount'}">
                                        &nbsp; &nbsp; &nbsp;
                                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn">View Offer</button>
                                        &nbsp; &nbsp;
                                    </c:if>
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
                <c:if test="${detail.type == 'Subject'}">
                    <section class="game-section">
                        <h2 class="line-title" style="font-family: Roboto, sans-serif; font-size: 20px;">Related Subject Slider</h2>
                        <div class="owl-carousel custom-carousel owl-theme" >                   
                            <c:forEach items="${requestScope.listS}" var="m">
                                <div class="item" style="background-image: url(data:image/jpeg;base64,${m.image});">
                                    <div class="item-desc">
                                        <h3 style="font-family: Roboto, sans-serif; font-size: 25px; color: white">${m.title}</h3>                           
                                        <a href="sliderdetail?id=${m.id}" class="genric-btn link" style="font-family: Roboto, sans-serif; font-size: 15px; background-color: black; color: #FFF">View Detail</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </section>
                </c:if>

                <c:if test="${detail.type == 'Blog'}">
                    <div class="game-section">
                        <h2 class="line-title" style="font-family: Roboto, sans-serif; font-size: 20px;">Related Blog Slider</h2>
                        <div class="owl-carousel custom-carousel owl-theme">
                            <c:forEach items="${requestScope.listS1}" var="m">
                                <div class="item" style="background-image: url(data:image/jpeg;base64,${m.image});">
                                    <div class="item-desc">
                                        <h3 style="font-family: Roboto, sans-serif; font-size: 25px; color: white">${m.title}</h3>
                                        <p style="font-family: Roboto, sans-serif; font-size: 16px; color: white">${m.fullname}</p>
                                        <a href="sliderdetail?id=${m.id}" class="genric-btn link" style="font-family: Roboto, sans-serif; font-size: 15px; background-color: black; color: #FFF">View Detail</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>

                <c:if test="${detail.type == 'Discount'}">
                    <div class="game-section" >
                        <h2 class="line-title" style="font-family: Roboto, sans-serif; font-size: 20px;">Season Discount</h2>

                        <div class="courses-area section-padding40 fix">
                            <div class="container">

                                <div class="courses-actives">
                                    <!-- Single -->
                                    <c:forEach items="${listS2}" var="m">
                                        <div class="properties pb-20">
                                            <div class="properties__card">
                                                <div class="properties__img overlay1">
                                                    <a href="#"><img src="data:image/jpeg;base64,${m.image}" alt=""></a>
                                                </div>
                                                <div class="properties__caption">
                                                    <p style="font-family: Roboto, sans-serif; font-size: 20px;">${m.title}</p>
                                                    <p style="font-family: Roboto, sans-serif; font-size: 20px; color: #ff3333">Time Reamining</p>
                                                    <time class="countdown" date-time="${m.endtime} 23:59:59" style="--accent: red"></time>
                                                    <a href="sliderdetail?id=${m.id}" class="border-btn border-btn2">Find out more</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- Single -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <section class="game-section">
                        <h2 class="line-title" style="font-family: Roboto, sans-serif; font-size: 20px;">Preferential Subject</h2>
                        <div class="owl-carousel custom-carousel owl-theme" >                   
                            <c:forEach items="${requestScope.listS}" var="m">
                                <div class="item" style="background-image: url(data:image/jpeg;base64,${m.image});">
                                    <div class="item-desc">
                                        <h3 style="font-family: Roboto, sans-serif; font-size: 25px; color: white">${m.title}</h3>                           
                                        <a href="${m.link}" class="genric-btn link" style="font-family: Roboto, sans-serif; font-size: 15px; background-color: black; color: #FFF">View Detail</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </section>
                </c:if>
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
    <script>
        class Countdown {
            constructor(el) {
                this.el = el;
                this.targetDate = new Date(el.getAttribute("date-time"));
                this.createCountDownParts();
                this.countdownFunction();
                this.countdownLoopId = setInterval(this.countdownFunction.bind(this), 1000);
            }
            createCountDownParts() {
                ["days", "hours", "minutes", "seconds"].forEach(part => {
                    const partEl = document.createElement("div");
                    partEl.classList.add("part", part);
                    const textEl = document.createElement("div");
                    textEl.classList.add("text");
                    textEl.innerText = part;
                    const numberEl = document.createElement("div");
                    numberEl.classList.add("number");
                    numberEl.innerText = 0;
                    partEl.append(numberEl, textEl);
                    this.el.append(partEl);
                    this[part] = numberEl;
                })
            }

            countdownFunction() {
                const currentDate = new Date();
                if (currentDate > this.targetDate)
                    return clearInterval(this.intervalId);
                const remaining = this.getRemaining(this.targetDate, currentDate);
                Object.entries(remaining).forEach(([part, value]) => {
                    this[part].style.setProperty("--value", value)
                    this[part].innerText = value
                })
            }

            getRemaining(target, now) {
                let seconds = Math.floor((target - (now)) / 1000);
                let minutes = Math.floor(seconds / 60);
                let hours = Math.floor(minutes / 60);
                let days = Math.floor(hours / 24);
                hours = hours - (days * 24);
                minutes = minutes - (days * 24 * 60) - (hours * 60);
                seconds = seconds - (days * 24 * 60 * 60) - (hours * 60 * 60) - (minutes * 60);
                return {days, hours, minutes, seconds}
            }

        }

        const countdownEls = document.querySelectorAll(".countdown") || [];
        countdownEls.forEach(countdownEl => new Countdown(countdownEl))

    </script>
</html>
