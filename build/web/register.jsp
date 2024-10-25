
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>OCMS Register Page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <!-- ? Preloader Start -->
        <div id="preloader-active">
            <div class="preloader d-flex align-items-center justify-content-center">
                <div class="preloader-inner position-relative">
                    <div class="preloader-circle"></div>
                    <div class="preloader-img pere-text">
                        <img src="assets/img/logo/loder.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- Preloader Start-->


        <!-- Register -->

        <main class="login-body" data-vide-bg="assets/img/login-bg.mp4">
            <!-- Login Admin -->
            <form class="form-default" action="register" method="POST">

                <div class="login-form">
                    <!-- logo-login -->
                    <h2>Registration Here</h2>
                    <h3 style="color: red">${err}</h3>
                    <div class="form-input">
                        <label for="name">Username
                            <span style="color: #00ff0a; font-size: 15px">*Your username can only be consecutive lowercase letters and numbers</span>
                        </label>
                        <input required type="text" name="username" placeholder="Username" value="${username}">
                    </div>
                    <div class="form-input">
                        <label for="name">
                            Password <span style="color: #00ff0a; font-size: 15px">*Your password must has at least 8 characters and contain uppercase, lowercase, number and specical syntax (!, @, #, $, %)</span>
                        </label>
                        <input required type="password" name="password" placeholder="Password" value="${password}">
                    </div>
                    <div class="form-input">
                        <label for="name">Confirm Password</label>
                        <input required type="password" name="confirm" placeholder="Confirm Password">
                    </div>
                    <div class="form-input">
                        <label for="name">Full name</label>
                        <input required type="text" name="fullname" placeholder="Full name" value="${fullname}">
                    </div>
                    <div class="form-input">
                        <label for="name">Date of birth</label>
                        <input required type="date" name="dob" placeholder="Birthday" value="${dob}">
                    </div>

                    <div class="form-input">
                        <label for="name">Email</label>
                        <input required type="email" name="email" placeholder="Email" value="${email}">
                    </div>
                    <div class="form-input pt-30">
                        <input type="submit" name="submit" value="Registration">
                    </div>

                    <div>
                        <h3 class="text-danger">${mess}</h3>
                    </div>

                    <!-- Forget Password -->
                    <a href="Login.jsp" class="registration">LOGIN</a>
                </div>
            </form>
            <!-- /end login form -->
        </main>


        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Video bg -->
        <script src="./assets/js/jquery.vide.js"></script>

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
        <!-- Progress -->
        <script src="./assets/js/jquery.barfiller.js"></script>

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
</html>
