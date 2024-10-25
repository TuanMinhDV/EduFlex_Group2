
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
            <div style="background-image: url('https://images.pexels.com/photos/4709289/pexels-photo-4709289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')  " class="container-fluid bg-primary px-0 px-md-5 mb-5">
                <div class="row align-items-center px-3">
                    <div class="col-lg-6 text-center text-lg-left">
                        <hr>
                        <h4 class="text-white mb-4 mt-5 mt-lg-0">${subject.subject_name}</h4>
                    <h1 class="display-3 font-weight-bold text-white">📖${subject.subject_name}</h1>
                    <p class="text-white mb-4">💡${subject.description}</p>
                    <c:set var="active" value="${requestScope.active}"/>
                    <c:set var="sid" value="${subject.subject_id}"/>
                    <c:if test="${active == 1}">
                        <a href="" class="disabled btn btn-secondary mt-1 py-3 px-5">Enrolled Course </a>
                    </c:if>
                    <c:if test="${active == 0}">
                        <a href="buysubject?category_id=${category_id}&subject_id=${subject.subject_id}" class="btn btn-secondary mt-1 py-3 px-5">Enroll </a>
                    </c:if>

                    <c:if test="${cookie.subject.subject_id == sid}">
                        <a href="" class="disabled btn btn-secondary mt-1 py-3 px-5"> Course Already in Cart </a>
                    </c:if>

                    <c:if test="${subject.discount > 0}">
                        <a  class="disabled btn btn-secondary mt-1 py-3 px-5"><i class="fas fa-dollar-sign"></i><span>
                                <span><span style="color: green; font-weight: bold;font-size:18px"><fmt:formatNumber value="${subject.price*(1-s.discount/100)}"/>💵</span>&nbsp;&nbsp;<span 
                                        style="color: red; font-size: 10px; font-weight: bold; padding: 1px 2px; border: 1px solid red; border-radius: 3px;"><fmt:formatNumber value="${subject.discount}"/>%</span> 
                                    &nbsp;&nbsp;<del style="font-size: 16px;">$<fmt:formatNumber value="${subject.price}"/></del></span>

                        </a>
                    </c:if>
                    <c:if test="${subject.discount == 0}">
                        <a  class="disabled btn btn-secondary mt-1 py-3 px-5">
                            <i class="fas fa-dollar-sign"></i>
                            <span style="color: green; font-weight: bold;font-size: 18px">${subject.price}💵</span> 
                        </a>
                    </c:if>
                </div>
                <div style="padding-top: 410px" class="col-lg-6 text-center text-lg-right">
                    <a  class="disabled btn btn-secondary mt-1 py-3 px-5"><i class=""></i>
                        <span>Rate: ${subject.rate_subject}⭐</span> 
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
        <div class="container-fluid pt-5">
            <div class="container">
                <div class="text-center pb-2">
                    <p class="section-title px-5"><span class="px-2">Subject Courses</span></p>
                    <h1 class="mb-4">${subject.subject_name}</h1>
                </div>
                <div class="row">
                    <c:forEach items="${listC}" var="c">
                        <div class="col-lg-4 mb-5">
                            <div class="card border-0 bg-light shadow-sm pb-2">
                                <img class="card-img-top mb-2" src="data:image/jpeg;base64,${c.image}" alt="">
                                <div class="card-body text-center">
                                    <h4 class="card-title">${c.course_name}</h4>

                                </div>
                                <div class="card-footer bg-transparent py-4 px-5">
                                    <hr>
                                    <div class="row border-bottom">
                                        <h6>💡${c.description}</h6>
                                    </div>
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Lecturer👩‍🏫</strong></div>
                                        <div class="col-6 py-1"> ${subject.lecturer_name} / ${subject.lecturer_id}  </div>
                                    </div>
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Course No</strong></div>
                                        <div class="col-6 py-1">${c.course_no} </div>
                                    </div>
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Major🗂</strong></div>
                                        <div class="col-6 py-1">${c.category_name} </div>
                                    </div>
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Chapter📚</strong></div>
                                        <div class="col-6 py-1">${c.chapter_num} </div>
                                    </div>
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Lesson📝</strong></div>
                                        <div class="col-6 py-1">${c.lesson_num} </div>
                                    </div>
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Rate⭐</strong></div>
                                        <div class="col-6 py-1">${c.rate_course}⭐</div>
                                    </div>

                                </div>
                                <c:if test="${active == 1}">
                                    <a href="coursedetail?category_id=${category_id}&subject_id=${subject.subject_id}&course_id=${c.course_id}" class="btn btn-primary px-4 mx-auto mb-4">Join Now</a>
                                </c:if>


                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
        <!-- Class End -->

        <!-- Blog Start -->
        <div class="container-fluid pt-5">
            <div class="container">
                <div class="text-center pb-2">
                    <p class="section-title px-5"><span class="px-2">Related Subject</span></p>
                    <h1 class="mb-4">Subjects</h1>
                </div>
                <div class="row pb-3">
                    <c:forEach items="${listRS}" var="s" begin="0" end="2">
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

                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
        <!-- Blog End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>  
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary p-3 back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="template subject_detail/lib/easing/easing.min.js"></script>
        <script src="template subject_detail/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="template subject_detail/lib/isotope/isotope.pkgd.min.js"></script>
        <script src="template subject_detail/lib/lightbox/js/lightbox.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="template subject_detail/mail/jqBootstrapValidation.min.js"></script>
        <script src="template subject_detail/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="template subject_detail/js/main.js"></script>


    </body>

</html>
