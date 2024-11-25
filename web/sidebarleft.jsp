<%-- 
    Document   : sidebarleft
    Created on : Nov 24, 2024, 3:41:21 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <div class="ttr-sidebar-logo">
                    <!--<a href="#"><img alt="" src="assets/images/favicon.png" ></a>-->
                    <!-- <div class="ttr-sidebar-pin-button" title="Pin/Unpin Menu">
                            <i class="material-icons ttr-fixed-icon">gps_fixed</i>
                            <i class="material-icons ttr-not-fixed-icon">gps_not_fixed</i>
                    </div> -->
                    <div class="ttr-sidebar-toggle-button">
                        <i class="ti-arrow-left"></i>
                    </div>
                </div>
                <!-- side menu logo end -->
                <!-- sidebar menu start -->
                <nav class="ttr-sidebar-navi">
                    <ul>
                        <c:if test="${sessionScope.account.role_id == 1}">
                            <li>
                                <a href="homeadmincontroller" class="ttr-material-button">
                                    <span class="ttr-label">Dashboard</span>
                                </a>
                            </li>
                            <li>
                                <a href="accountcontrollerbyadmin" class="ttr-material-button">
                                    <span class="ttr-label">View Account List</span>
                                </a>
                            </li>
                            <li>
                                <a href="viewcategorylistbyadmin" class="ttr-material-button">
                                    <span class="ttr-label">View Category List</span>
                                </a>
                            </li>
                            <li>
                                <a href="commentcontrollerbyadmin" class="ttr-material-button">
                                    <span class="ttr-label">View Comment List</span>
                                </a>
                            </li>
                            <li>
                                <a href="viewordercourselistbyadmin" class="ttr-material-button">
                                    <span class="ttr-label">View OrderCourse List</span>
                                </a>
                            </li>
                            <li>
                                <a href="viewrevenuestatisticsbyadmin" class="ttr-material-button">
                                    <span class="ttr-label">View Revenue</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account.role_id == 2}">
                            <li>
                                <a href="mycourse" class="ttr-material-button">
                                    <span class="ttr-icon"><i class="ti-book"></i></span>
                                    <span class="ttr-label">My Enrolled Courses</span>
                                </a>
                            </li>
                            <li>
                                <a href="" class="ttr-material-button">
                                    <span class="ttr-icon"><i class="ti-user"></i></span>
                                    <span class="ttr-label">My Profile</span>
                                    <span class="ttr-arrow-icon"><i class="fa fa-angle-down"></i></span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="profile" class="ttr-material-button"><span class="ttr-label">My Profile Detail</span></a>
                                    </li>
                                    <li>
                                        <a href="changepassword" class="ttr-material-button"><span class="ttr-label">Change Password</span></a>
                                    </li>
                                    <li>
                                        <a href="logout" class="ttr-material-button"><span class="ttr-label">Logout</span></a>
                                    </li>
                                </ul>
                            </li>
                        </c:if>

                        <li class="ttr-seperate"></li>
                    </ul>
                    <!-- sidebar menu end -->
                </nav>
                <!-- sidebar menu end -->
            </div>
        </div>

    </body>
</html>
