<%-- 
    Document   : login
    Created on : Feb 23, 2026, 11:05:54 AM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <!--<< Header Area >>-->
    <head>
        <!-- ========== Meta Tags ========== -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="gramentheme">
        <meta name="description" content="Fresheat food & Restaurant Html Template">
        <!-- ======== Page title ============ -->
        <title>APU CARE</title>
        <!--<< Favcion >>-->
        <link rel="shortcut icon" href="static/img/favicon.png">
        <!--<< Bootstrap min.css >>-->
        <link rel="stylesheet" href="static/css/bootstrap.min.css">
        <!--<< All Min Css >>-->
        <link rel="stylesheet" href="static/css/all.min.css">
        <!--<< Animate.css >>-->
        <link rel="stylesheet" href="static/css/animate.css">
        <!--<< Magnific Popup.css >>-->
        <link rel="stylesheet" href="static/css/magnific-popup.css">
        <!--<< MeanMenu.css >>-->
        <link rel="stylesheet" href="static/css/meanmenu.css">
        <!--<< Swiper Bundle.css >>-->
        <link rel="stylesheet" href="static/css/swiper-bundle.min.css">
        <!--<< Nice Select.css >>-->
        <link rel="stylesheet" href="static/css/nice-select.css">
        <!--<< Main.css >>-->
        <link rel="stylesheet" href="static/css/main.css">
    </head>

    <body class="bg-color2">

        <!-- Preloader Start -->
        <jsp:include page="component/preloader.jsp" />

        <!--<< Mouse Cursor Start >>-->
        <div class="mouse-cursor cursor-outer"></div>
        <div class="mouse-cursor cursor-inner"></div>

        <!-- Back To Top Start -->
        <button id="back-top" class="back-to-top">
            <i class="fa-regular fa-arrow-up"></i>
        </button>

        <!-- Offcanvas Area Start -->
        <jsp:include page="component/offcanvas.jsp" />

        
        <!-- Header Section Start -->
        <jsp:include page="component/navbar.jsp" />


        <!-- Search Area Start -->
        <jsp:include page="component/search.jsp" />


        <!-- Account Section    S T A R T -->
        <div class="account-section section-padding fix">
            <div class="container">
                <div class="account-wrapper bg-white p-1 p-sm-4">
                    <div class="row gx-40 gy-5 gy-md-0">
                        <div class="col-lg-6">
                            <div class="account-card bg-color2 p-3 p-sm-5">
                                <h3>Welcome Back</h3>
                                <p>Please Enter Your Details</p>
                                <div class="contact-form style2 bg-color2 p-0">
                                    <form class="row" action="LoginServlet" method="POST">
                                        <div class="col-12">
                                            <input type="email" name="email" placeholder="Email" required>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-ctl">
                                                <input type="password" name="password" placeholder="Password" required>
                                                <div class="icon"><i class="fa-sharp fa-solid fa-eye-slash"></i></div>
                                            </div>
                                        </div>
                                        <div class="col-6 form-group">
                                            <input id="reviewcheck" name="reviewcheck" type="checkbox">
                                            <label for="reviewcheck">Remember Me<span class="checkmark"></span></label>
                                        </div>
                                        <div class="col-6 d-flex justify-content-end">
                                            <a href="#" class="text-theme-color">Forgot Password?</a>
                                        </div>
                                        <div class="col-12">
                                            <button type="submit" class="theme-btn rounded-5 w-100 mb-3">Log In</button>
                                        </div>
                                        <div class="col-12">
                                            <a href="https://www.google.com"
                                                class="theme-btn rounded-5 w-100 bg-white text-center text-title fw-bold"><img
                                                    class="me-2" src="static/img/logo/googleLogo.png" alt="logo"> Log In
                                                With Google</a>
                                        </div>
                                    </form>

                                    <h6>Don’t have an account? <a href="register.jsp" class="text-theme-color">Sign Up</a></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center justify-content-center">
                            <div class="account-thumb">
                                <img src="static/img/profile/profile2.png" alt="img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Footer Section    S T A R T -->
        <jsp:include page="component/footer.jsp" />




        <!--<< All JS Plugins >>-->
        <script src="static/js/jquery-3.7.1.min.js"></script>
        <!--<< Bootstrap Js >>-->
        <script src="static/js/bootstrap.bundle.min.js"></script>
        <!--<< Waypoints Js >>-->
        <script src="static/js/jquery.waypoints.js"></script>
        <!--<< Counterup Js >>-->
        <script src="static/js/jquery.counterup.min.js"></script>
        <!--<< Viewport Js >>-->
        <script src="static/js/viewport.jquery.js"></script>
        <!--<< Magnific popup Js >>-->
        <script src="static/js/magnific-popup.min.js"></script>
        <!--<< Tilt Js >>-->
        <script src="static/js/tilt.min.js"></script>
        <!--<< Swiper Slider Js >>-->
        <script src="static/js/swiper-bundle.min.js"></script>
        <!--<< MeanMenu Js >>-->
        <script src="static/js/jquery.meanmenu.min.js"></script>
        <!--<< Wow Animation Js >>-->
        <script src="static/js/wow.min.js"></script>
        <!--<< Nice Select Js >>-->
        <script src="static/js/nice-select.min.js"></script>
        <!--<< Main.js >>-->
        <script src="static/js/main.js"></script>
    </body>

</html>
