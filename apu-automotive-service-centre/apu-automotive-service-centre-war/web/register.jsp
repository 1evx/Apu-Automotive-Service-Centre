<%-- 
    Document   : register
    Created on : Mar 2, 2026, 11:10:11 AM
    Author     : guan.kiat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="gramentheme">
        <meta name="description" content="Fresheat food & Restaurant Html Template">
        <title>APU CARE</title>
        <link rel="shortcut icon" href="static/img/favicon.png">
        <link rel="stylesheet" href="static/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/all.min.css">
        <link rel="stylesheet" href="static/css/animate.css">
        <link rel="stylesheet" href="static/css/magnific-popup.css">
        <link rel="stylesheet" href="static/css/meanmenu.css">
        <link rel="stylesheet" href="static/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="static/css/nice-select.css">
        <link rel="stylesheet" href="static/css/main.css">
    </head>

    <body class="bg-color2">

        <jsp:include page="component/preloader.jsp" />

        <div class="mouse-cursor cursor-outer"></div>
        <div class="mouse-cursor cursor-inner"></div>

        <button id="back-top" class="back-to-top">
            <i class="fa-regular fa-arrow-up"></i>
        </button>

        <jsp:include page="component/offcanvas.jsp" />

        
        <jsp:include page="component/navbar.jsp" />


        <jsp:include page="component/search.jsp" />


        <div class="account-section section-padding fix">
            <div class="container">
                <div class="account-wrapper bg-white p-1 p-sm-4">
                    <div class="row gx-40 gy-5 gy-md-0">
                        <div class="col-lg-6">
                            <div class="account-card bg-color2 p-3 p-sm-5">
                                <h3>Register Your Account</h3>
                                <p>Please Enter Your Details</p>
                                <div class="contact-form style2 bg-color2 p-0">
                                    <form class="row" action="RegisterServlet" method="POST">
                                        
                                        <div class="col-12 mb-3">
                                            <input type="text" name="username" class="form-control" placeholder="Username" required>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <input type="text" name="fullName" class="form-control" placeholder="Full Name" required>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <input type="text" name="phone" class="form-control" placeholder="Phone Number" required>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <input type="text" name="icNumber" class="form-control" placeholder="IC Number (e.g. 010203-14-5555)" required>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <input type="email" name="email" class="form-control" placeholder="Email" required>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <div class="form-ctl">
                                                <input type="password" name="password" class="form-control" placeholder="Password" required>
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

                                        <div class="col-12 mt-3">
                                            <button type="submit" class="theme-btn rounded-5 w-100 mb-3">Sign Up</button>
                                        </div>
                                    </form>

                                    <h6>Don’t have an account? <a href="login.jsp" class="text-theme-color">Log In</a></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center justify-content-center">
                            <div class="account-thumb">
                                <img src="static/img/profile/profile.png" alt="img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="component/footer.jsp" />




        <script src="static/js/jquery-3.7.1.min.js"></script>
        <script src="static/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/jquery.waypoints.js"></script>
        <script src="static/js/jquery.counterup.min.js"></script>
        <script src="static/js/viewport.jquery.js"></script>
        <script src="static/js/magnific-popup.min.js"></script>
        <script src="static/js/tilt.min.js"></script>
        <script src="static/js/swiper-bundle.min.js"></script>
        <script src="static/js/jquery.meanmenu.min.js"></script>
        <script src="static/js/wow.min.js"></script>
        <script src="static/js/nice-select.min.js"></script>
        <script src="static/js/main.js"></script>
        
        <%-- 
        Check if the Servlet left a pop-up message for us in the session.
        If it did, trigger a JavaScript alert and then delete the message so it doesn't repeat.
        --%>
        <c:if test="${not empty sessionScope.popupMessage}">
            <script> alert("${sessionScope.popupMessage}"); </script>
            <%-- Clear the messages from the session --%>
            <c:remove var="popupMessage" scope="session" />
            <c:remove var="popupType" scope="session" />
        </c:if>
    </body>

</html>