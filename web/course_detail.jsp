
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
        <!-- inner page banner END -->
        <div class="content-block">
            <!-- About Us -->
            <div class="section-area section-sp1">
                <div class="container">
                    <div class="row d-flex flex-row-reverse">
                        <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                            <div class="course-detail-bx">

                                <div class="course-buy-now text-center">
                                    <a href="#" class="disabled btn radius-xl text-uppercase">Available Course</a>
                                </div>
                                <hr>
                                <div class="course-buy-now text-center">
                                    <img src="data:image/jpeg;base64,${course.image}"alt="" style="border-radius: 50%; max-width: 100px; max-height: 100px;" /> 
                                </div>                                        
                                <div class="teacher-bx text-center">
                                    <div class="teacher-info">
                                        <div class="teacher-thumb">
                                            <img src="data:image/jpeg;base64,${account.avatar}" alt=""/>
                                        </div>
                                        <div class="teacher-name">
                                            <h5>${course.instructor_name}</h5>
                                            <span>Teacher</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="cours-more-info text-center">
                                    <div class="review">
                                        <span>Rate</span> ${course.rate_course}⭐
                                    </div>
                                </div>
                                <div class="course-info-list scroll-page">
                                    <ul class="navbar">
                                        <li><a class="nav-link" href="#overview"><i class="ti-zip"></i>Overview</a></li>
                                        <li><a class="nav-link" href="#curriculum"><i class="ti-bookmark-alt"></i>Curriculum</a></li>
                                        <li><a class="nav-link" href="#instructor"><i class="ti-user"></i>Instructor</a></li>
                                        <li><a class="nav-link" href="#reviews"><i class="ti-star"></i>Rate</a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-9 col-md-8 col-sm-12">
                            <div class="courses-post">
                                <div class="ttr-post-media media-effect">
                                    <a href="#"><img src="assets/images/blog/default/thum1.jpg" alt=""></a>
                                </div>
                                <div class="ttr-post-info">
                                    <div class="ttr-post-title ">
                                        <h2 class="post-title">${course.course_name}</h2>
                                    </div>
                                    <span class="course-buy-now text-center">
                                        <a class="btn radius-xl text-uppercase">Let's Study!</a>
                                    </span>
                                </div>
                            </div>
                            <hr>
                            <div class="courese-overview" id="overview">
                                <h4>Overview</h4>
                                <div class="row">
                                    <div class="col-md-12 col-lg-4">
                                        <ul class="course-features">
                                            <!--<li><i class="ti-bookmark-alt"></i> <span class="label">Major</span> <span class="value">${course.category_name}</span></li>-->
                                            <li><i class="ti-book"></i> <span class="label">Course</span> <span class="value">${course.course_name}</span></li>
                                            <li><i class="ti-pencil"></i> <span class="label">Lecturer</span> <span class="value">${course.instructor_name}</span></li>
                                            <li><i class="ti-files"></i> <span class="label">Chapter</span> <span class="value">${course.chapter_num}</span></li>
                                            <li><i class="ti-notepad"></i> <span class="label">Lesson</span> <span class="value">${course.lesson_num}</span></li>
                                            <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                            <!--<li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">${subject.sold}</span></li>-->
                                            <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-12 col-lg-8">
                                        <h5 class="m-b5">💡 Course Description</h5>

                                        <p>${course.description}</p>
                                        <h5 class="m-b5">✔ Learning Outcomes</h5>
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
                            <!-- List chapter here -->


                            <hr>
                            
                        </div>
                    </div>
                </div>
                <!-- contact area END -->

            </div>
        </div>
        <!-- Content END-->
        <!-- Class End -->

        <!-- Instructor Course Start -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8">
                    <div class="section-tittle text-center mb-55">
                        <h2>Relate Instructor Course</h2>
                    </div>
                </div>
            </div>
            <div class="courses-actives">
                <!-- Single -->
                <c:forEach var="i" items="${requestScope.listByIns}">
                    <div class="properties pb-20 subject_card" style=" margin: 25px">
                        <div class="properties__card">
                            <div class="properties__img overlay1">
                                <a href="#"><img src="data:image/jpeg;base64,${i.image}" alt="" style="width: 340px; border-radius: 5px"></a>
                            </div>
                            <div class="properties__caption" style="padding: 7px; background-color: aliceblue; border-radius: 5px">
                                <h3 class="text-nowrap text-truncate"><a href="#">${i.course_name}</a></h3>
                                <p class="limited-height" >
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
                <!-- Single -->
            </div>
        </div>
        <!-- Instructor Course End -->

        <!-- Blog Start -->

        <!-- Blog End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>  
        <!-- Footer End -->




        <!-- JS here -->
        <script src="courses-master/assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="https://kit.fontawesome.com/79182c8e6c.js" crossorigin="anonymous"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="courses-master/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="courses-master/assets/js/popper.min.js"></script>
        <script src="courses-master/assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="courses-master/assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="courses-master/assets/js/owl.carousel.min.js"></script>
        <script src="courses-master/assets/js/slick.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="courses-master/assets/js/wow.min.js"></script>
        <script src="courses-master/assets/js/animated.headline.js"></script>
        <script src="courses-master/assets/js/jquery.magnific-popup.js"></script>

        <!-- Date Picker -->
        <script src="courses-master/assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="courses-master/assets/js/jquery.nice-select.min.js"></script>
        <script src="courses-master/assets/js/jquery.sticky.js"></script>
        <!-- Progress -->
        <script src="./assets/js/jquery.barfiller.js"></script>

        <!-- counter , waypoint,Hover Direction -->
        <script src="courses-master/assets/js/jquery.counterup.min.js"></script>
        <script src="courses-master/assets/js/waypoints.min.js"></script>
        <script src="courses-master/assets/js/jquery.countdown.min.js"></script>
        <script src="courses-master/assets/js/hover-direction-snake.min.js"></script>

        <!-- contact js -->
        <script src="courses-master/assets/js/contact.js"></script>
        <script src="courses-master/assets/js/jquery.form.js"></script>
        <script src="courses-master/assets/js/jquery.validate.min.js"></script>
        <script src="courses-master/assets/js/mail-script.js"></script>
        <script src="courses-master/assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->	
        <script src="courses-master/assets/js/plugins.js"></script>
        <script src="courses-master/assets/js/main.js"></script>


    </body>

</html>
