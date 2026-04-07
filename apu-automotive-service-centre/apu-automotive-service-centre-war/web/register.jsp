<%-- 
    Document   : register
    Created on : Mar 2, 2026, 11:10:11 AM
    Author     : guan.kiat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- REQUIRED FOR POPUP MESSAGES TO WORK --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="gramentheme">
        <meta name="description" content="Fresheat food & Restaurant Html Template">
        <title>APU CARE - Register</title>
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
                                    
                                    <form class="row" action="RegisterServlet" method="POST" onsubmit="return validatePasswordMatch();">
                                        
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
                                            <input type="text" name="address" class="form-control" placeholder="Home Address" required>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <input type="email" name="email" class="form-control" placeholder="Email" required>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <div class="form-ctl position-relative">
                                                <input type="password" id="regPassword" name="password" class="form-control" placeholder="Password" required>
                                                <div class="icon" style="cursor: pointer; position: absolute; right: 15px; top: 50%; transform: translateY(-50%);" onclick="toggleVisibility('regPassword', 'eyeIcon1')">
                                                    <i id="eyeIcon1" class="fa-sharp fa-solid fa-eye-slash text-muted"></i>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12 mb-3">
                                            <div class="form-ctl position-relative">
                                                <input type="password" id="regConfirmPassword" class="form-control" placeholder="Confirm Password" required>
                                                <div class="icon" style="cursor: pointer; position: absolute; right: 15px; top: 50%; transform: translateY(-50%);" onclick="toggleVisibility('regConfirmPassword', 'eyeIcon2')">
                                                    <i id="eyeIcon2" class="fa-sharp fa-solid fa-eye-slash text-muted"></i>
                                                </div>
                                            </div>
                                            <small id="passwordErrorMsg" class="text-danger fw-bold mt-1" style="display: none;">
                                                <i class="fa-solid fa-circle-exclamation me-1"></i> Passwords do not match!
                                            </small>
                                        </div>

                                        <div class="col-12 mt-3">
                                            <button type="submit" class="theme-btn rounded-5 w-100 mb-3">Sign Up</button>
                                        </div>
                                    </form>

                                    <h6>Already have an account? <a href="login.jsp" class="text-theme-color">Log In</a></h6>
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
        
        <%-- POPUP ALERTS --%>
        <c:if test="${not empty sessionScope.popupMessage}">
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        icon: '${not empty sessionScope.popupType ? sessionScope.popupType : "info"}', // 'success' or 'error'
                        title: '${sessionScope.popupType == "error" ? "Oops!" : "Success!"}',
                        text: '${sessionScope.popupMessage}',
                        confirmButtonColor: '#2667FF',
                        confirmButtonText: 'OK'
                    });
                });
            </script>
            
            <%-- Clear the messages from the session --%>
            <c:remove var="popupMessage" scope="session" />
            <c:remove var="popupType" scope="session" />
        </c:if>

        <%-- PASSWORD MATCH & EYE ICON LOGIC --%>
        <script>
            // Toggle eye icon and password visibility
            function toggleVisibility(inputId, iconId) {
                const inputField = document.getElementById(inputId);
                const icon = document.getElementById(iconId);

                if (inputField.type === "password") {
                    inputField.type = "text";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye", "text-primary"); 
                } else {
                    inputField.type = "password";
                    icon.classList.remove("fa-eye", "text-primary");
                    icon.classList.add("fa-eye-slash");
                }
            }

            // Stop form submission if passwords don't match
            function validatePasswordMatch() {
                const password = document.getElementById("regPassword").value;
                const confirmPassword = document.getElementById("regConfirmPassword").value;
                const errorMsg = document.getElementById("passwordErrorMsg");

                if (password !== confirmPassword) {
                    errorMsg.style.display = "block";
                    document.getElementById("regConfirmPassword").focus();
                    return false; // Stop the form!
                }
                
                errorMsg.style.display = "none";
                return true; // Go ahead and submit to the Servlet
            }
        </script>
    </body>
</html>