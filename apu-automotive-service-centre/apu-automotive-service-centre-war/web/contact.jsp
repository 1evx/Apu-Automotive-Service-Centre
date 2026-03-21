<%-- 
    Document   : contact
    Created on : Mar 18, 2026, 6:53:33 PM
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
        <div class="fix-area">
            <div class="offcanvas__info">
                <div class="offcanvas__wrapper">
                    <div class="offcanvas__content">
                        <div class="offcanvas__top d-flex justify-content-between align-items-center">
                            <div class="offcanvas__logo">
                                <a href="index.jsp">
                                    <img src="static/img/logo/logo.svg" alt="logo-img">
                                </a>
                            </div>
                            <div class="offcanvas__close">
                                <button>
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <p class="text d-none d-lg-block">
                            This involves interactions between a business and its customers. It's about meeting customers'
                            needs and resolving their problems. Effective customer service is crucial.
                        </p>
                        <div class="offcanvas-gallery-area d-none d-xl-block">
                            <div class="offcanvas-gallery-items">
                                <a href="static/img/header/01.jpg" class="offcanvas-image img-popup">
                                    <img src="static/img/header/01.jpg" alt="gallery-img">
                                </a>
                                <a href="static/img/header/02.jpg" class="offcanvas-image img-popup">
                                    <img src="static/img/header/02.jpg" alt="gallery-img">
                                </a>
                                <a href="static/img/header/03.jpg" class="offcanvas-image img-popup">
                                    <img src="static/img/header/03.jpg" alt="gallery-img">
                                </a>
                            </div>
                            <div class="offcanvas-gallery-items">
                                <a href="static/img/header/04.jpg" class="offcanvas-image img-popup">
                                    <img src="static/img/header/04.jpg" alt="gallery-img">
                                </a>
                                <a href="static/img/header/05.jpg" class="offcanvas-image img-popup">
                                    <img src="static/img/header/05.jpg" alt="gallery-img">
                                </a>
                                <a href="static/img/header/06.jpg" class="offcanvas-image img-popup">
                                    <img src="static/img/header/06.jpg" alt="gallery-img">
                                </a>
                            </div>
                        </div>
                        <div class="mobile-menu fix mb-3"></div>
                        <div class="offcanvas__contact">
                            <h4>Contact Info</h4>
                            <ul>
                                <li class="d-flex align-items-center">
                                    <div class="offcanvas__contact-icon">
                                        <i class="fal fa-map-marker-alt"></i>
                                    </div>
                                    <div class="offcanvas__contact-text">
                                        <a target="_blank" href="#">Main Street, Melbourne, Australia</a>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center">
                                    <div class="offcanvas__contact-icon mr-15">
                                        <i class="fal fa-envelope"></i>
                                    </div>
                                    <div class="offcanvas__contact-text">
                                        <a href="tel:+013-003-003-9993"><span
                                                class="mailto:info@enofik.com">info@fresheat.com</span></a>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center">
                                    <div class="offcanvas__contact-icon mr-15">
                                        <i class="fal fa-clock"></i>
                                    </div>
                                    <div class="offcanvas__contact-text">
                                        <a target="_blank" href="#">Mod-friday, 09am -05pm</a>
                                    </div>
                                </li>
                                <li class="d-flex align-items-center">
                                    <div class="offcanvas__contact-icon mr-15">
                                        <i class="far fa-phone"></i>
                                    </div>
                                    <div class="offcanvas__contact-text">
                                        <a href="tel:+11002345909">+11002345909</a>
                                    </div>
                                </li>
                            </ul>
                            <div class="header-button mt-4">
                                <a href="shop.html" class="theme-btn">
                                    <span class="button-content-wrapper d-flex align-items-center justify-content-center">
                                        <span class="button-icon"><i
                                                class="fa-sharp fa-regular fa-cart-shopping bg-transparent text-white me-2"></i></span>
                                        <span class="button-text">ORDER NOW</span>
                                    </span>
                                </a>
                            </div>
                            <div class="social-icon d-flex align-items-center">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="offcanvas__overlay"></div>

        <!-- Header Section Start -->
        <jsp:include page="component/navbar.jsp" />


        <!-- Search Area Start -->
        <jsp:include page="component/search.jsp" />

        <!-- Breadcumb Section   S T A R T -->
        <div class="breadcumb-section">
            <div class="breadcumb-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="breadcumb-content">
                                <h1 class="breadcumb-title">Contact us</h1>
                                <ul class="breadcumb-menu">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="text-white">/</li>
                                    <li class="active">Contact us</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Contact Us Section    S T A R T -->
        <div class="contact-us-section section-padding fix">
            <div class="contact-box-wrapper style1">
                <div class="container">
                    <div class="row gy-4">
                        <div class="col-md-6 col-xl-3">
                            <div class="contact-box style1">
                                <div class="contact-icon"><img src="static/img/icon/location.png" alt="icon"></div>
                                <h3 class="title">Our Address</h3>
                                <p>4517 Washington Ave. Manchester, Kentucky 39495</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="contact-box style1">
                                <div class="contact-icon"><img src="static/img/icon/gmail.png" alt="icon"></div>
                                <h3 class="title">info@exmple.com</h3>
                                <p>Email us anytime for any kind ofquety.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="contact-box style1">
                                <div class="contact-icon"><img src="static/img/icon/phone.png" alt="icon"></div>
                                <h3 class="title">Hot: +208-666-01112</h3>
                                <p>24/7/365 priority Live Chat and ticketing support.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3">
                            <div class="contact-box style1">
                                <div class="contact-icon"><img src="static/img/icon/clock.png" alt="icon"></div>
                                <h3 class="title">Opening Hour</h3>
                                <p>Sunday-Fri: 9 AM – 6 PM Saturday: 9 AM – 4 PM</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact Form Section    S T A R T -->
        <div class="contact-form-section section-padding pt-0 fix">
            <div class="contact-form-wrapper style2">
                <div class="container">
                    <div class="row gx-60 gy-5">
                        <div class="col-xl-6">
                            <div class="contact-form-thumb">
                                <img src="static/img/contact/contactThumb2_1.png" alt="thumb">
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="contact-form style2">
                                <h2>Get in Touch</h2>
                                <form class="row" action="#">
                                    <div class="col-md-6">
                                        <input type="text" placeholder="Full Name">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="email" placeholder="Email Address">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="number" placeholder="Phone Number">
                                    </div>
                                    <div class="col-md-6">
                                        <select name="orderby" class="single-select" aria-label="Shop order">
                                            <option value="subject" selected="selected">Subject</option>
                                            <option value="complain">Complain</option>
                                            <option value="greetings">Greetings</option>
                                            <option value="date">Expire Date</option>
                                            <option value="price">About Price</option>
                                            <option value="order">About order</option>
                                        </select>
                                    </div>
                                    <div class="col-12">
                                        <textarea id="message" class="form-control" placeholder="Write your message here..."
                                            rows="5"></textarea>
                                    </div>
                                    <div class="col-12 form-group">
                                        <input id="reviewcheck" name="reviewcheck" type="checkbox">
                                        <label for="reviewcheck">Collaboratively formulate principle capital. Progressively
                                            evolve user<span class="checkmark"></span></label>
                                    </div>
                                    <div class="col-12 form-group mb-0">
                                        <button class="theme-btn w-100">SUBMIT NOW <i
                                                class="fa-sharp fa-regular fa-arrow-right-long bg-transparent text-white"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Map Section    S T A R T -->
        <div class="map-wrapper" style="line-height: 0;">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28821.965472924858!2d89.07524545!3d25.4467646!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39fcb92fb4d9696d%3A0x74b18fed6b93e5e5!2sNobabgonj%20National%20garden!5e0!3m2!1sen!2sbd!4v1724820772279!5m2!1sen!2sbd"
                height="550" style="border:0; width: 100%;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
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
