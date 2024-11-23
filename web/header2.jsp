<%-- 
    Document   : header2
    Created on : Nov 24, 2024, 3:40:22 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <!-- header start -->
        <header class="ttr-header">
            <div class="ttr-header-wrapper">
                <!--sidebar menu toggler start -->
                <div class="ttr-toggle-sidebar ttr-material-button">
                    <i class="ti-close ttr-open-icon"></i>
                    <i class="ti-menu ttr-close-icon"></i>
                </div>
                <!--sidebar menu toggler end -->
                <!--logo start -->
                <div class="ttr-logo-box">
                    <div>
                        <a href="index.html" class="ttr-logo">
                            <img alt="" class="ttr-logo-mobile" src="assets/images/logo-mobile.png" width="30" height="30">
                            <img alt="" class="ttr-logo-desktop" src="assets/images/logo-white.png" width="160" height="27">
                        </a>
                    </div>
                </div>
                <!--logo end -->
                <div class="ttr-header-menu">
                    <!-- header left menu start -->
                    <ul class="ttr-header-navigation">
                        <li>
                            <a href="home" class="ttr-material-button ttr-submenu-toggle">HOME</a>
                        </li>
                        <li>
                            <a href="#" class="ttr-material-button ttr-submenu-toggle">QUICK MENU <i class="fa fa-angle-down"></i></a>
                            <div class="ttr-header-submenu">
                                <ul>
                                    <li><a href="courselist">Our Courses</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <!-- header left menu end -->
                </div>
                <div class="ttr-header-right ttr-with-seperator">
                    <!-- header right menu start -->
                    <ul class="ttr-header-navigation">

                        <li>
                            <c:if test="${sessionScope.account.avatar == null}">
                                <a class="ttr-material-button ttr-submenu-toggle">
                                    <span class="ttr-user-avatar">
                                        <img src="EduChamp-Template/assets/images/profile/default_profile_image.png" 
                                             alt="profile picture" 
                                             style="width:32px; height: 32px; border-radius: 50%">
                                    </span>

                                </a>
                            </c:if>
                            <c:if test="${sessionScope.account.avatar != null}">
                                <div class="ttr-material-button ttr-submenu-toggle" 
                                     style="width: 32px; height: 32px;
                                     border-radius: 50%;background-image:
                                     url('data:image/jpeg;base64,${sessionScope.account.avatar}')">
                                </div>
                            </c:if>
                            <div class="ttr-header-submenu">
                                <ul>
                                    <li><a href="profile">My profile</a></li>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="ttr-hide-on-mobile">
                            <a href="cart.jsp" class="ttr-material-button">
                                <img src="assets/images/icon/CART.png" style="height: 40px"alt=""/>
                                <c:if test="${size == null}">
                                    (0)
                                </c:if>
                                <c:if test="${size != null}">
                                    (${size})
                                </c:if>
                            </a>
                        </li>
                    </ul>
                    <!-- header right menu end -->
                </div>
                <!--header search panel start -->
                <div class="ttr-search-bar">
                    <form class="ttr-search-form">
                        <div class="ttr-search-input-wrapper">
                            <input type="text" name="qq" placeholder="search something..." class="ttr-search-input">
                            <button type="submit" name="search" class="ttr-search-submit"><i class="ti-arrow-right"></i></button>
                        </div>
                        <span class="ttr-search-close ttr-search-toggle">
                            <i class="ti-close"></i>
                        </span>
                    </form>
                </div>
                <!--header search panel end -->
            </div>
        </header>
        <!-- header end -->
    </body>
</html>
