<%-- 
    Document   : index
    Created on : Mar 17, 2026, 9:37:04 AM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APU ASC - Automotive Service Centre</title>
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

        <section class="banner-section fix">
            <div class="slider-area">
                <div class="swiper banner2-slider">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="banner-wrapper style2 bg-img">
                                <div class="overlay"></div>
                                <div class="banner-container">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-12 col-xxl-6">
                                                <div class="banner-title-area">
                                                    <div class="banner-style1">
                                                        <div class="section-title">
                                                            <h6 class="sub-title" data-animation="slideInRight" data-duration="2s" data-delay=".3s"> WELCOME TO APU-ASC </h6>
                                                            <h1 class="title" data-animation="slideInRight" data-duration="2s" data-delay=".5s">
                                                                EXPERT CAR REPAIR & MAINTENANCE
                                                            </h1>
                                                            <a class="theme-btn" href="login.jsp" data-animation="slideInRight" data-duration="2s" data-delay=".7s">BOOK SERVICE <i class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-xl-6 d-none d-xxl-block">
                                                <div class="banner-thumb-area" data-tilt data-animation="slideInRight" data-duration="2s" data-delay=".9s">
                                                    <img src="static/img/banner/bannerThumb1.png" alt="car">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="offer-section fix bg-color3 mt-5">
            <div class="offer-wrapper">
                <div class="container">
                    <div class="row gy-4">
                        <div class="col-lg-6 col-xl-4">
                            <div class="offer-card style1 wow fadeInUp" data-wow-delay="0.2s" style="background-image: url(static/img/bg/offerBG2_1.jpg);">
                                <div class="offer-content">
                                    <h6 class="text-white">Starting at RM 180</h6>
                                    <h3>FULL SYNTHETIC OIL CHANGE</h3>
                                    <p class="text-white">Limited Time Offer</p>
                                    <a href="login.jsp" class="theme-btn style5"> BOOK NOW <i class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-4">
                            <div class="offer-card style1 wow fadeInUp" data-wow-delay="0.5s" style="background-image: url(static/img/bg/offerBG2_2.png);">
                                <div class="offer-content">
                                    <h6>Free with Major Service</h6>
                                    <h3>WHEEL ALIGNMENT & BALANCING</h3>
                                    <p>Safety First</p>
                                    <a href="login.jsp" class="theme-btn style4"> BOOK NOW <i class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-4">
                            <div class="offer-card style1  wow fadeInUp" data-wow-delay="0.7s" style="background-image: url(static/img/bg/offerBG2_3.jpg);">
                                <div class="offer-content">
                                    <h6 class="text-white">Summer Promo</h6>
                                    <h3>AIRCOND GAS REFILL & SERVICE</h3>
                                    <p class="text-white">Stay Cool All Year</p>
                                    <a href="login.jsp" class="theme-btn style4"> BOOK NOW <i class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="about-us-section fix section-padding pt-0">
            <div class="about-wrapper style2">
                <div class="container">
                    <div class="about-us section-padding">
                        <div class="row d-flex align-items-center">
                            <div class="col-lg-6 d-flex align-items-center justify-content-center justify-content-xl-start">
                                <div class="about-thumb mb-5 mb-lg-0">
                                    <img src="static/img/about/aboutThumb2_1.png" alt="mechanic">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="title-area">
                                    <div class="sub-title text-start wow fadeInUp" data-wow-delay="0.5s">
                                        <img class="me-1" src="static/img/icon/titleIcon.svg" alt="icon">ABOUT APU-ASC<img class="ms-1" src="static/img/icon/titleIcon.svg" alt="icon">
                                    </div>
                                    <h2 class="title text-start wow fadeInUp" data-wow-delay="0.7s">
                                        Keeping Your Vehicle in Peak Condition
                                    </h2>
                                    <div class="text text-start wow fadeInUp" data-wow-delay="0.8s">
                                        Your safety on the road is our priority. With state-of-the-art diagnostic tools and certified technicians, we ensure your vehicle runs smoothly, efficiently, and safely.
                                    </div>
                                </div>
                                <div class="fancy-box-wrapper">
                                    <div class="fancy-box">
                                        <div class="item"><i class="fa-solid fa-gears fa-2x text-primary"></i></div>
                                        <div class="item">
                                            <h6>Premium Spare Parts</h6>
                                            <p>We use only OEM and high-quality aftermarket parts.</p>
                                        </div>
                                    </div>
                                    <div class="fancy-box">
                                        <div class="item"><i class="fa-solid fa-wrench fa-2x text-primary"></i></div>
                                        <div class="item">
                                            <h6>Certified Mechanics</h6>
                                            <p>Our team has decades of combined experience.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="marquee-wrapper style-1 text-slider section-padding pt-0">
                <div class="marquee-inner to-left">
                    <ul class="marqee-list d-flex">
                        <li class="marquee-item style1">
                            <span class="text-slider"></span><span class="text-slider text-style">OIL CHANGE</span>
                            <span class="text-slider"></span><span class="text-slider text-style">WHEEL ALIGNMENT</span>
                            <span class="text-slider"></span><span class="text-slider text-style">ENGINE DIAGNOSTICS</span>
                            <span class="text-slider"></span><span class="text-slider text-style">BATTERY REPLACEMENT</span>
                            <span class="text-slider"></span><span class="text-slider text-style">BRAKE INSPECTION</span>
                            <span class="text-slider"></span><span class="text-slider text-style">AIRCOND SERVICE</span>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <section class="contact-section fix bg-color3">
            <div class="contact-wrapper style1 section-padding ">
                <div class="container">
                    <div class="row g-5 d-flex justify-content-center">
                        <div class="col-xl-6 d-flex align-items-center justify-content-center justify-content-md-start z-3">
                            <div class="testimonial-card-wrap">
                                <div class="title-area">
                                    <div class="sub-title text-white text-start wow fadeInUp" data-wow-delay="0.5s">
                                        <img class="me-1" src="static/img/icon/titleIconWhite.svg" alt="icon">APPOINTMENTS<img class="ms-1" src="static/img/icon/titleIconWhite.svg" alt="icon">
                                    </div>
                                    <h2 class="title text-start text-white wow fadeInUp" data-wow-delay="0.7s">
                                        Book Your Service Today
                                    </h2>
                                </div>

                                <div class="contact-form style1">
                                    <form class="row g-3">
                                        <div class="col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                                            <label for="date" class="form-label">Preferred Date*</label>
                                            <input type="date" class="form-control" id="date" required>
                                        </div>
                                        <div class="col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                                            <label for="time" class="form-label">Preferred Time*</label>
                                            <input type="time" class="form-control" id="time" required>
                                        </div>
                                        <div class="col-md-12 wow fadeInUp" data-wow-delay="0.6s">
                                            <label for="service" class="form-label">Type Of Service*</label>
                                            <input class="form-control" id="service" placeholder="e.g. Major Service, Brake Check" required>
                                        </div>
                                        <div class="col-md-12 wow fadeInUp" data-wow-delay="0.8s">
                                            <label for="message" class="form-label">Vehicle Details / Issues</label>
                                            <textarea id="message" class="form-control" placeholder="Tell us your car model and what needs checking..." rows="4"></textarea>
                                        </div>
                                        <div class="col-12 wow fadeInUp" data-wow-delay="0.9s">
                                            <a href="login.jsp" class="theme-btn style5 w-100 text-center">
                                                CONFIRM APPOINTMENT<i class="fa-sharp fa-regular fa-arrow-right ms-2"></i>
                                            </a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

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
