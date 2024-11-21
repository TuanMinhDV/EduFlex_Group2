<%-- 
    Document   : header
    Created on : Nov 21, 2024, 7:47:47 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<style>
    .avatar {
        width: 70px;
        height: 70px;
        background-size: cover;
        background-position: center center;

        /*                position: absolute;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);*/
    }
    .user-avatar {
        border-radius: 50%;
        overflow: hidden;
    }
    .star-icon {
        color: black;
        opacity: 0.5;
    }
    .image-container {
        border: 5px solid #FF99CC;
        border-radius: 50%;
        padding: 2px;
        height: 260px;
        width: 260px;
    }
    .limited-height {
        max-height: 7em; /* Đặt chiều cao tối đa tương đương 3 dòng */
        overflow: hidden; /* Ẩn phần vượt quá chiều cao tối đa */
        white-space: normal; /* Cho phép xuống dòng tự động */
    }
    .subject_card:hover{
        transform: scale(1.1);
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Header Top ==== -->
        <header class="header rs-nav">
            <div class="top-bar">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div class="topbar-left">

                        </div>
                        <div class="topbar-right">
                            <c:if test="${sessionScope.account == null}">
                                <ul>
                                    <li><a href="login">Login</a></li>
                                    <li><a href="register">Register</a></li>
                                </ul>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                                <ul>
                                    <li>
                                        <c:if test="${sessionScope.account.avatar == null}">
                                            <a class="avatar">
                                                <img src="EduChamp-Template/assets/images/profile/default_profile_image.png" 
                                                     alt="profile picture" 
                                                     style="width:20px; height: 20px; border-radius: 50%">
                                            </a>
                                        </c:if>
                                        <c:if test="${sessionScope.account.avatar != null}">
                                            <!--<a href="avatar"><img src="assets/images/profiles/default_profile_image" alt="profile picture"></a>-->
                                            <div class="avatar" 
                                                 style="width: 20px; height: 20px;
                                                 border-radius: 50%;background-image:
                                                 url('data:image/jpeg;base64,${sessionScope.account.avatar}')">
                                            </div>
                                        </c:if>
                                    </li>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sticky-header navbar-expand-lg">
                <div class="menu-bar clearfix">
                    <div class="container clearfix">
                        <!-- Header Logo ==== -->
                        <div class="menu-logo">
                            <a href="home"><img src="EduChamp-Template/assets/images/favicon.png" alt=""></a>
                        </div>
                        <!-- Mobile Nav Button ==== -->
                        <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                        <!-- Navigation Menu ==== -->
                        <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                            <div class="menu-logo">
                                <a href="home"><img src="EduChamp-Template/assets/images/logo.png" alt=""></a>
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
                                <li class="add-mega-menu"><a href="javascript:;">Our Courses <i class="fa fa-chevron-down"></i></a>
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

                        </div>
                        <!-- Navigation Menu END ==== -->
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Top END ==== -->
    </body>
</html>
