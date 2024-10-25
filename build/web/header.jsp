
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<!-- ? Preloader Start -->
<!--<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="assets/img/logo/loder.png" alt="">
            </div>
        </div>
    </div>
</div>-->
<!-- Preloader Start -->
<!-- Header Start -->
<div class="header-area header-transparent">
    <div class="main-header ">
        <div class="header-bottom  header-sticky">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <!-- Logo -->
                    <div class="col-xl-2 col-lg-2">
                        <div class="logo">
                            <a href="home"><img src="assets/img/logo/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-10 col-lg-10">
                        <div class="menu-wrapper d-flex align-items-center justify-content-end">
                            <!-- Main-menu -->
                            <div class="main-menu d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">    
                                        <!--HOME-->
                                        <li class="active" ><a href="home">Home</a></li>
                                        <li><a href="subjectlist">Subject</a></li>
                                        <li><a href="sliderlist">Slider</a>
                                            <ul class="submenu">
                                                <li><a href="sliderlist">Slider</a></li>
                                                    <c:if test="${sessionScope.account.role_id == 4}">
                                                    <li><a href="slider_marketer">Slider Edit</a></li>
                                                    </c:if>
                                            </ul>
                                        </li>
                                        <!--BLOG-->
                                        <li><a href="bloglist">Blog</a>
                                            <ul class="submenu">
                                                <li><a href="bloglist">Blog</a></li>
                                                    <c:if test="${sessionScope.account.role_id == 4}">
                                                    <li><a href="blog_marketer">Blog Edit</a></li>
                                                    </c:if>
                                            </ul>
                                        </li>
                                        <!--PHÂN QUYỀN SAU KHI ĐÃ ĐĂNG NHẬP-->
                                        <c:if test="${sessionScope.account.role_id == 3}">
                                            <li><a href="subjectmanagement">Lecturer Management</a>
                                                <ul class="submenu">
                                                    <li><a href="chart">Chart</a></li>
                                                    <li><a href="lecturersubject">Question Bank</a></li>
                                                </ul>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.account.role_id == 1}">
                                            <li><a href="manageaccount">Admin Management</a>

                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.account.role_id == 2}">
                                            <li><a href="mycourse">My Subject</a>

                                            </li>
                                        </c:if>
                                        <!--PHÂN QUYỀN NẾU CHƯA ĐĂNG NHẬP-->
                                        <c:if test="${sessionScope.account == null}">
                                            <li class="button-header"><a href="login.jsp" class="btn btn3">Log in</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.account != null}">
                                            <li>
                                                <div>
                                                    <c:if test="${sessionScope.account.avatar == null}">
                                                        <a class="avatar">
                                                            <img src="assets/images/profiles/default_profile_image.png" 
                                                                 alt="profile picture" 
                                                                 style="width: 50px; height: 50px; border-radius: 50%">
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${sessionScope.account.avatar != null}">
                                                        <!--<a href="avatar"><img src="assets/images/profiles/default_profile_image" alt="profile picture"></a>-->
                                                        <div class="avatar" 
                                                             style="width: 50px; height: 50px; 
                                                             border-radius: 50%;background-image: 
                                                             url('data:image/jpeg;base64,${sessionScope.account.avatar}')">
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <ul class="submenu" style="width: 200px">
                                                    <li><a href="profile">Profile</a></li>
                                                    <li><a href="logout">Log out</a></li>
                                                    <li><a href="changepassword">Change Password</a></li>
                                                </ul>
                                            </li>
                                        </c:if>
                                        <!--GIỎ HÀNG-->
                                        <li class="button-header"><c:set var="size" value="${sessionScope.size}"/>
                                            <div style="display: flex;justify-content: center;align-items: end;padding-top: " id="bag">
                                                <div>
                                                    <a style="height: 15px" href="cart.jsp">
                                                        <img src="img/CART.png" style="height: 50px"alt=""/>
                                                        <c:if test="${size == null}">
                                                            (0)
                                                        </c:if>
                                                        <c:if test="${size != null}">
                                                            (${size})
                                                        </c:if>
                                                    </a>
                                                </div>
                                                <!--<div >
                                                    <a style="height: 15px" href="cart.jsp">(${size})</a>
                                                </div>-->
                                            </div>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div> 
                    <div id="productExistsAlert" class="alert alert-warning" style="display: none;">
                        <span id="productExistsMessage"></span>
                        <button id="closeProductAlert" type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var productExistsMessage = "${productExistsMessage}";
    if (productExistsMessage !== "") {
        document.getElementById("productExistsMessage").textContent = productExistsMessage;
        document.getElementById("productExistsAlert").style.display = "block";
    }


    document.getElementById("closeProductAlert").addEventListener("click", function () {
        document.getElementById("productExistsAlert").style.display = "none";
    });
</script>

<!-- Header End -->




