

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <style>

        </style>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Login - EduFlex</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">


        <!-- CSS here -->
        <!-- Favicons -->
        <link href="NiceAdmin/assets/img/favicon.png" rel="icon">
        <link href="NiceAdmin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="NiceAdmin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="NiceAdmin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="NiceAdmin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="NiceAdmin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="NiceAdmin/assets/vendor/simple-datatables/style.css" rel="stylesheet">
        <!-- Template Main CSS File -->
        <link href="NiceAdmin/assets/css/style.css" rel="stylesheet">
        <script>
            function closeMessage() {
                document.querySelector('.success-message').style.display = 'none';
            }
        </script>
        <style>
            .container {
                max-width: 100%;
                max-height: 100%;
            }
            .close-button {
                background-color: #f44336; /* Red background color */
                color: white; /* White text color */
                border: none; /* Remove borders */
                padding: 5px 10px; /* Add some padding */
                font-size: 14px; /* Set font size */
                cursor: pointer; /* Add a pointer cursor on hover */
                border-radius: 3px; /* Optional: Add some border radius */
            }

            .close-button:hover {
                background-color: #d32f2f; /* Darker red on hover */
            }
        </style>
    </head>
    <body >
        <main>
            <div class="container">

                <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                                <div class="d-flex justify-content-center py-4">
                                    <a href="index.html" class="logo d-flex align-items-center w-auto">
                                        <img src="assets/img/logo.png" alt="">
                                        <span class="d-none d-lg-block">NiceAdmin</span>
                                    </a>
                                </div><!-- End Logo -->

                                <div class="card mb-3">

                                    <div class="card-body">

                                        <div class="pt-4 pb-2">
                                            <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                            <p class="text-center small">Enter your username & password to login</p>
                                        </div>
                                        <% 
                                            String successMessage = (String) request.getSession().getAttribute("successMessage");
                                            if (successMessage != null) { 
                                        %>
                                        <div class="success-message" style="color:white;">
                                            <%= successMessage %>
                                            <button onclick="closeMessage()">X</button>
                                        </div>
                                        <% } %>

                                        <form class="row g-3 needs-validation" method="POST" novalidate>

                                            <div class="col-12">
                                                <label for="yourUsername" class="form-label">Username</label>
                                                <div class="input-group has-validation">
                                                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                    <input type="text" value="${cookie.cuser.value}" name="user" class="form-control" id="yourUsername" required>
                                                    <div class="invalid-feedback">Please enter your username.</div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label for="yourPassword" class="form-label">Password</label>
                                                <input type="password" value="${cookie.cpass.value}" name="pass" class="form-control" id="yourPassword" required>
                                                <div class="invalid-feedback">Please enter your password!</div>
                                            </div>
                                            <div class="col-12">
                                                <h3 class="text-danger">${mess}</h3>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="remember" value="on" ${cookie.crem != null ?'checked':''} id="rememberMe">
                                                    <label class="form-check-label" for="rememberMe">Remember me</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button class="btn btn-primary w-100" type="submit">Login</button>
                                            </div>
                                            <div class="col-12">
                                                <p class="small mb-0">Don't have account? <a href="register">Create an account</a></p>
                                            </div>
                                            <div class="col-12">
                                                <p class="small mb-0">Forget password <a href="forget">Forget password</a></p>
                                            </div>
                                        </form>

                                    </div>
                                </div>

                                <div class="credits">
                                    <!-- All the links in the footer should remain intact. -->
                                    <!-- You can delete the links only if you purchased the pro version. -->
                                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                                    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                                </div>

                            </div>
                        </div>
                    </div>

                </section>
            </div>
        </main>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <!-- Template Main JS File -->
        <script src="NiceAdmin/assets/js/main.js"></script>
    </body>
</html>