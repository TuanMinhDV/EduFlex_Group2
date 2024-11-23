<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Instructor: Manage Course </title>

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
            /* ??nh d?ng chung cho t?ng h?p (card) */
            .cours-bx {
                display: flex;
                flex-direction: column; /* S?p x?p các thành ph?n theo c?t */
                justify-content: space-between; /* Phân b? ??u kho?ng tr?ng gi?a các thành ph?n */
                align-items: center; /* C?n gi?a n?i dung theo chi?u ngang */
                border: 1px solid #ddd; /* ???ng vi?n nh?t cho t?ng h?p */
                border-radius: 8px; /* Bo góc */
                padding: 20px; /* Thêm kho?ng cách bên trong */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Hi?u ?ng bóng */
                background-color: #fff; /* Màu n?n */
                height: 370px; /* Gi? nguyên chi?u cao */
                box-sizing: border-box; /* Tính padding vào kích th??c t?ng */
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            /* Hi?u ?ng khi hover vào t?ng card */
            .cours-bx:hover {
                transform: translateY(-10px); /* Nâng card lên khi hover */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            }

            /* Ph?n hình ?nh */
            .action-box img {
                width: 100%; /* Hình ?nh full chi?u r?ng */
                border-radius: 8px 8px 0 0; /* Bo góc trên */
                object-fit: cover; /* Duy trì t? l?, c?t n?u c?n */
                height: 150px; /* Chi?u cao c?a ?nh */
            }

            /*             Nút "Read More" 
                        .action-box .btn {
                            position: absolute;
                            bottom: 10px;
                            left: 50%;
                            transform: translateX(-50%);
                            background-color: #007bff;  Màu n?n nút 
                            color: #fff;  Màu ch? 
                            border: none;
                            padding: 8px 16px;
                            border-radius: 4px;
                            cursor: pointer;
                            font-size: 14px;
                            text-transform: uppercase;
                            transition: background-color 0.3s ease;
                        }*/

            /* Hi?u ?ng hover cho nút "Read More" */
            .action-box .btn:hover {
                background-color: #0056b3;
            }

            /* Thông tin khoá h?c */
            .info-bx {
                margin-top: 10px;
                text-align: center;
            }

            .info-bx h5 {
                font-size: 18px;
                color: #333;
                margin-bottom: 5px;
            }

            .info-bx span {
                font-size: 14px;
                color: #666;
                font-style: italic;
            }

            /* Nút "Edit Course" */
            .cours-more-info .btn {
                margin-top: auto; /* ??y nút xu?ng ?áy c?a card */
                width: 100%; /* ?? r?ng c?a nút */
                padding: 10px 10px; /* ?? cao nút */
                background-color: #e0a800; /* Màu xanh lá */
                color: white; /* Màu ch? */
                font-size: 16px;
                border: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }

            /* Hi?u ?ng hover cho nút "Edit Course" */
            .cours-more-info .btn:hover {
                background-color: #218838; /* Màu ??m h?n khi hover */
            }
        </style>

    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>

            <!-- Header Top ==== -->
            <header class="header rs-nav">
                <div class="top-bar">
                    <div class="container">
                        <div class="row d-flex justify-content-between">
                            <div class="topbar-left">
                                <ul>
                                    <li><a href="faq-1.html"><i class="fa fa-question-circle"></i>Ask a Question</a></li>
                                    <li><a href="javascript:;"><i class="fa fa-envelope-o"></i>Support@website.com</a></li>
                                </ul>
                            </div>
                            <div class="topbar-right">
                                <ul>
                                    <li>
                                        <select class="header-lang-bx">
                                            <option data-icon="flag flag-uk">English UK</option>
                                            <option data-icon="flag flag-us">English US</option>
                                        </select>
                                    </li>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="register.html">Register</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sticky-header navbar-expand-lg">
                    <div class="menu-bar clearfix">
                        <div class="container clearfix">
                            <!-- Header Logo ==== -->
                            <div class="menu-logo">
                                <a href="index.html"><img src="assets/images/logo.png" alt=""></a>
                            </div>
                            <!-- Mobile Nav Button ==== -->
                            <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                            <!-- Author Nav ==== -->
                            <div class="secondary-menu">
                                <div class="secondary-inner">
                                    <ul>
                                        <li><a href="javascript:;" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="javascript:;" class="btn-link"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="javascript:;" class="btn-link"><i class="fa fa-linkedin"></i></a></li>
                                        <!-- Search Button ==== -->
                                        <li class="search-btn"><button id="quik-search-btn" type="button" class="btn-link"><i class="fa fa-search"></i></button></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Search Box ==== -->
                            <div class="nav-search-bar">
                                <form action="#">
                                    <input name="search" value="" type="text" class="form-control" placeholder="Type to search">
                                    <span><i class="ti-search"></i></span>
                                </form>
                                <span id="search-remove"><i class="ti-close"></i></span>
                            </div>
                            <!-- Navigation Menu ==== -->
                            <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                                <div class="menu-logo">
                                    <a href="index.html"><img src="assets/images/logo.png" alt=""></a>
                                </div>
                                <ul class="nav navbar-nav">	
                                    <li class="active"><a href="javascript:;">Home <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="index.html">Home 1</a></li>
                                            <li><a href="index-2.html">Home 2</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:;">Pages <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="javascript:;">About<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="about-1.html">About 1</a></li>
                                                    <li><a href="about-2.html">About 2</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:;">Event<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="event.html">Event</a></li>
                                                    <li><a href="events-details.html">Events Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:;">FAQ's<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="faq-1.html">FAQ's 1</a></li>
                                                    <li><a href="faq-2.html">FAQ's 2</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:;">Contact Us<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="contact-1.html">Contact Us 1</a></li>
                                                    <li><a href="contact-2.html">Contact Us 2</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="portfolio.html">Portfolio</a></li>
                                            <li><a href="profile.html">Profile</a></li>
                                            <li><a href="membership.html">Membership</a></li>
                                            <li><a href="error-404.html">404 Page</a></li>
                                        </ul>
                                    </li>
                                    <li class="add-mega-menu"><a href="javascript:;">Manage Course <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu add-menu">
                                            <li class="add-menu-left">
                                                <h5 class="menu-adv-title">Our Courses</h5>
                                                <ul>
                                                    <li><a href="courses.html">Courses </a></li>
                                                    <li><a href="courses-details.html">Courses Details</a></li>
                                                    <li><a href="profile.html">Instructor Profile</a></li>
                                                    <li><a href="event.html">Upcoming Event</a></li>
                                                    <li><a href="membership.html">Membership</a></li>
                                                </ul>
                                            </li>
                                            <li class="add-menu-right">
                                                <img src="assets/images/adv/adv.jpg" alt=""/>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:;">Blog <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="blog-classic-grid.html">Blog Classic</a></li>
                                            <li><a href="blog-classic-sidebar.html">Blog Classic Sidebar</a></li>
                                            <li><a href="blog-list-sidebar.html">Blog List Sidebar</a></li>
                                            <li><a href="blog-standard-sidebar.html">Blog Standard Sidebar</a></li>
                                            <li><a href="blog-details.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-dashboard"><a href="javascript:;">Dashboard <i class="fa fa-chevron-down"></i></a>
                                        <ul class="sub-menu">
                                            <li><a href="admin/index.html">Dashboard</a></li>
                                            <li><a href="admin/add-listing.html">Add Listing</a></li>
                                            <li><a href="admin/bookmark.html">Bookmark</a></li>
                                            <li><a href="admin/courses.html">Courses</a></li>
                                            <li><a href="admin/review.html">Review</a></li>
                                            <li><a href="admin/teacher-profile.html">Teacher Profile</a></li>
                                            <li><a href="admin/user-profile.html">User Profile</a></li>
                                            <li><a href="javascript:;">Calendar<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="admin/basic-calendar.html">Basic Calendar</a></li>
                                                    <li><a href="admin/list-view-calendar.html">List View Calendar</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="javascript:;">Mailbox<i class="fa fa-angle-right"></i></a>
                                                <ul class="sub-menu">
                                                    <li><a href="admin/mailbox.html">Mailbox</a></li>
                                                    <li><a href="admin/mailbox-compose.html">Compose</a></li>
                                                    <li><a href="admin/mailbox-read.html">Mail Read</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <div class="nav-social-link">
                                    <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                    <a href="javascript:;"><i class="fa fa-google-plus"></i></a>
                                    <a href="javascript:;"><i class="fa fa-linkedin"></i></a>
                                </div>
                            </div>
                            <!-- Navigation Menu END ==== -->
                        </div>
                    </div>
                </div>
            </header>
            <!-- header END ==== -->
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
                            <li>Manage Courses</li>
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
                                        <h5 class="widget-title style-1">Categories</h5>
                                        <ul>
                                            <li><a href="courseManage">All</a></li>
                                            <c:forEach items="${listCategory}" var="cate">
                                                <li><a href="courseManage?cateID=${cate.id}">${cate.name}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="widget">
                                        <button class="btn btn-primary btn-add-course" data-toggle="modal" data-target="#addCourseModal">Add Course</button>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <div class="row">
                                        <c:forEach items="${listCourse}" var="course">
                                            <c:if test="${course.isDisable != 1}">
                                                <div class="col-md-6 col-lg-4 col-sm-6 m-b30">
                                                    <div class="cours-bx" style="height: 370px">
                                                        <div class="action-box">
                                                            <img src="${course.image}" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">${course.name}</a></h5>
                                                            <span>${course.cate_name != null ? course.cate_name : 'Not classified yet'}</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <button style="background-color: blue;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#editCourseModal" onclick="fillCourseData('${course.id}', '${course.name}', '${course.description}', '${course.image}')">
                                                                Edit Course
                                                            </button>
                                                            <form action="courseManage" method="post">
                                                                <input type="hidden" name="type" value="delete">
                                                                <input type="hidden" name="courseID" value="${course.id}">
                                                                <button style="background-color: red; margin-left: 10px;" type="submit" class="btn btn-danger btn-lg" onclick="return confirmDelete()" >Archive</button>
                                                            </form>
                                                        </div>
                                                        <button style="display: block; margin-top: 10px" type="button" class="btn btn-primary btn-lg">Manage Chapters</button>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- contact area END -->
            </div>
            <!-- Content END-->

            <!-- Modal Add Course -->
            <div class="modal fade" id="addCourseModal" tabindex="-1" role="dialog" aria-labelledby="addCourseModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addCourseModalLabel">Add New Course</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h2 style="color: red;">${error}</h2>
                            <form id="addCourseForm" action="courseManage" method="post">
                                <input type="hidden" name="type" value="add"/>
                                <!--<input type="hidden" name="type" value="add"/>-->
                                <div class="form-group">
                                    <label for="courseName">Course Name</label>
                                    <input type="text" class="form-control" name="courseName" required>
                                </div>
                                <div class="form-group">
                                    <label for="courseDescription">Description</label>
                                    <textarea class="form-control" name="courseDescription" rows="3" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="courseImage">Course Image URL</label>
                                    <input type="text" class="form-control-file" name="courseImage" required>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <input type="submit" value="Save" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal for Edit Course -->
            <div class="modal fade" id="editCourseModal" tabindex="-1" role="dialog" aria-labelledby="editCourseModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editCourseModalLabel">Edit Course</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Edit Course Form -->
                            <h2 style="color: red;">${error}</h2>
                            <form action="courseManage" method="post">
                                <input type="hidden" name="type" value="edit">
                                <input type="hidden" name="courseID" id="courseIDEdit">
                                <div class="form-group">
                                    <label for="courseName">Course Name</label>
                                    <input type="text" class="form-control" id="courseNameEdit" name="courseName" required>
                                </div>
                                <div class="form-group">
                                    <label for="courseCategory">Description</label>
                                    <textarea class="form-control" id="courseCategoryEdit" name="courseDescription" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="courseImage">Course Image URL</label>
                                    <input type="text" class="form-control" id="courseImageEdit" name="courseImage" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

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
        <script src='assets/vendors/switcher/switcher.js'></script>
        <script>

                                                                    // Function to fill the form with course data
                                                                    function fillCourseData(courseID, courseName, courseCategory, courseImage) {
                                                                        document.getElementById('courseIDEdit').value = courseID;
                                                                        document.getElementById('courseNameEdit').value = courseName;
                                                                        document.getElementById('courseCategoryEdit').value = courseCategory;
                                                                        document.getElementById('courseImageEdit').value = courseImage;
                                                                    }

                                                                    // Event handler for the Archive confirmation button
                                                                    document.getElementById('confirmArchiveBtn').addEventListener('click', function () {
                                                                        // Logic to handle archiving (e.g., calling API, hiding the course, etc.)
                                                                        alert('Course archived successfully!');
                                                                        $('#archiveCourseModal').modal('hide'); // Close the modal after archiving
                                                                    });
        </script>
        <script type="text/javascript">
            function confirmDelete() {
                return confirm("Do you want to archive this course?");
            }
        </script>
    </body>

</html>
