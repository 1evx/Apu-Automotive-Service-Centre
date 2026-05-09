<%-- 
    Document   : contact
    Created on : Mar 18, 2026
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APU CARE - Contact Us</title>
        
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

    <body class="dark-mood">

        <jsp:include page="component/preloader.jsp" />
        <div class="mouse-cursor cursor-outer"></div>
        <div class="mouse-cursor cursor-inner"></div>

        <button id="back-top" class="back-to-top">
            <i class="fa-regular fa-arrow-up"></i>
        </button>

        <jsp:include page="component/offcanvas.jsp" />
        <jsp:include page="component/navbar.jsp" />
        <jsp:include page="component/search.jsp" />

        <div class="breadcumb-section">
            <div class="breadcumb-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="breadcumb-content">
                                <h1 class="breadcumb-title">Contact Us</h1>
                                <ul class="breadcumb-menu">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="text-white">/</li>
                                    <li class="active">Contact Us</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="contact-us-section section-padding fix">
            <div class="contact-box-wrapper style1">
                <div class="container">
                    <div class="row gy-4 justify-content-center">
                        
                        <div class="col-md-6 col-xl-3">
                            <div class="contact-box style1 h-100">
                                <div class="contact-icon text-primary mb-3">
                                    <i class="fa-solid fa-location-dot fa-3x"></i>
                                </div>
                                <h3 class="title">Our Address</h3>
                                <p>Jalan Teknologi 5, Taman Teknologi Malaysia<br>57000 Kuala Lumpur</p>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-xl-3">
                            <div class="contact-box style1 h-100">
                                <div class="contact-icon text-primary mb-3">
                                    <i class="fa-solid fa-envelope-open-text fa-3x"></i>
                                </div>
                                <h3 class="title">Email Us</h3>
                                <p>support@apu-asc.com.my<br>info@apu-asc.com.my</p>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-xl-3">
                            <div class="contact-box style1 h-100">
                                <div class="contact-icon text-primary mb-3">
                                    <i class="fa-solid fa-phone-volume fa-3x"></i>
                                </div>
                                <h3 class="title">Call Desk</h3>
                                <p>Hotline: +603 1234 5678<br>Available during working hours.</p>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-xl-3">
                            <div class="contact-box style1 h-100">
                                <div class="contact-icon text-primary mb-3">
                                    <i class="fa-solid fa-clock fa-3x"></i>
                                </div>
                                <h3 class="title">Opening Hours</h3>
                                <p>Mon - Fri: 9:00 AM – 6:30 PM<br> Sat: 9:00 AM - 1:00PM</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="map-wrapper" style="line-height: 0;">
            <iframe 
                src="https://maps.google.com/maps?q=Asia%20Pacific%20University%20of%20Technology%20&%20Innovation%20(APU)&t=&z=15&ie=UTF8&iwloc=&output=embed" 
                height="550" 
                style="border:0; width: 100%;" 
                allowfullscreen="" 
                loading="lazy" 
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
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
    </body>
</html>