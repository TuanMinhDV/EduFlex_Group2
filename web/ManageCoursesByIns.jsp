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
                flex-direction: column; /* S?p x?p c�c th�nh ph?n theo c?t */
                justify-content: space-between; /* Ph�n b? ??u kho?ng tr?ng gi?a c�c th�nh ph?n */
                align-items: center; /* C?n gi?a n?i dung theo chi?u ngang */
                border: 1px solid #ddd; /* ???ng vi?n nh?t cho t?ng h?p */
                border-radius: 8px; /* Bo g�c */
                padding: 20px; /* Th�m kho?ng c�ch b�n trong */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Hi?u ?ng b�ng */
                background-color: #fff; /* M�u n?n */
                height: 370px; /* Gi? nguy�n chi?u cao */
                box-sizing: border-box; /* T�nh padding v�o k�ch th??c t?ng */
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            /* Hi?u ?ng khi hover v�o t?ng card */
            .cours-bx:hover {
                transform: translateY(-10px); /* N�ng card l�n khi hover */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            }

            /* Ph?n h�nh ?nh */
            .action-box img {
                width: 100%; /* H�nh ?nh full chi?u r?ng */
                border-radius: 8px 8px 0 0; /* Bo g�c tr�n */
                object-fit: cover; /* Duy tr� t? l?, c?t n?u c?n */
                height: 150px; /* Chi?u cao c?a ?nh */
            }

            /*             N�t "Read More" 
                        .action-box .btn {
                            position: absolute;
                            bottom: 10px;
                            left: 50%;
                            transform: translateX(-50%);
                            background-color: #007bff;  M�u n?n n�t 
                            color: #fff;  M�u ch? 
                            border: none;
                            padding: 8px 16px;
                            border-radius: 4px;
                            cursor: pointer;
                            font-size: 14px;
                            text-transform: uppercase;
                            transition: background-color 0.3s ease;
                        }*/

            /* Hi?u ?ng hover cho n�t "Read More" */
            .action-box .btn:hover {
                background-color: #0056b3;
            }

            /* Th�ng tin kho� h?c */
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

            /* N�t "Edit Course" */
            .cours-more-info .btn {
                margin-top: auto; /* ??y n�t xu?ng ?�y c?a card */
                width: 100%; /* ?? r?ng c?a n�t */
                padding: 10px 10px; /* ?? cao n�t */
                background-color: #e0a800; /* M�u xanh l� */
                color: white; /* M�u ch? */
                font-size: 16px;
                border: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }

            /* Hi?u ?ng hover cho n�t "Edit Course" */
            .cours-more-info .btn:hover {
                background-color: #218838; /* M�u ??m h?n khi hover */
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
                                <li><a href="home">Home</a></li>
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
                                                    <form action="courseManage" method="POST" style="display: flex; align-items: center; gap: 10px;">
                                                        <input type="hidden" name="type" value="search">
                                                        <input id="searchInput" name="searchName" type="text" required class="form-control" placeholder="Enter course name">
                                                        <button type="submit" class="btn btn-primary">Search</button>
                                                    </form>
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
                                                            <a href="detailCourseIns?cID=${course.id}" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="detailCourseIns?cID=${course.id}">${course.name}</a></h5>
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
                                                        <a href="chapterManage?cID=${course.id}" style="display: block; margin-top: 10px" type="button" class="btn btn-primary btn-lg">Manage Chapters</a>
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
