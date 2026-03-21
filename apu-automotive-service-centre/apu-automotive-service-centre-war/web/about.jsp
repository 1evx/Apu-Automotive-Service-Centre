<%-- 
    Document   : about.jsp
    Created on : Mar 20, 2026, 2:52:34 PM
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
                        <div class="offcanvas__top mb-5 d-flex justify-content-between align-items-center">
                            <div class="offcanvas__logo">
                                <a href="index.html">
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
                                <h1 class="breadcumb-title">About Us 02</h1>
                                <ul class="breadcumb-menu">
                                    <li><a href="index.html">Home</a></li>
                                    <li class="text-white">/</li>
                                    <li class="active">About Us 02</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Offer Section   S T A R T -->
        <div class="offer-section section-padding pb-0 fix bg-color2">
            <div class="offer-wrapper">
                <div class="container">
                    <div class="row gy-4">
                        <div class="col-lg-6 col-xl-4">
                            <div class="offer-card style1 wow fadeInUp" data-wow-delay="0.2s"
                                style="background-image: url(static/img/bg/offerBG1_1.jpg);">
                                <div class="offer-content">
                                    <h6>ON THIS WEEK</h6>
                                    <h3>SPICY FRIED CHICKEN</h3>
                                    <p>limits Time Offer</p>
                                    <a href="menu.html" class="theme-btn style4">
                                        ORDER NOW <i class="fa-sharp fa-regular fa-arrow-right"></i>
                                    </a>
                                </div>
                                <div class="offer-thumb">
                                    <img class="thumbImg" src="static/img/offer/offerThumb1_1.png" alt="thumb">
                                    <div class="shape float-bob-x"><img src="static/img/shape/offerShape1_4.png"
                                            alt="shape"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-4">
                            <div class="offer-card style1 wow fadeInUp" data-wow-delay="0.5s"
                                style="background-image: url(static/img/bg/offerBG1_1.jpg);">
                                <div class="offer-content">
                                    <h6>WELCOME FRESHEAT</h6>
                                    <h3>TODAY SPACIAL FOOD</h3>
                                    <p>limits Time Offer</p>
                                    <a href="menu.html" class="theme-btn style5">
                                        ORDER NOW <i class="fa-sharp fa-regular fa-arrow-right"></i>
                                    </a>
                                </div>
                                <div class="offer-thumb">
                                    <img class="thumbImg" src="static/img/offer/offerThumb1_2.png" alt="thumb">
                                    <div class="shape float-bob-x"><img src="static/img/shape/offerShape1_4.png"
                                            alt="shape"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-4">
                            <div class="offer-card style1  wow fadeInUp" data-wow-delay="0.7s"
                                style="background-image: url(static/img/bg/offerBG1_1.jpg);">
                                <div class="offer-content">
                                    <h6>ON THIS WEEK</h6>
                                    <h3>SPECIAL CHICKEN ROLL</h3>
                                    <p>limits Time Offer</p>
                                    <a href="menu.html" class="theme-btn style4">
                                        ORDER NOW <i class="fa-sharp fa-regular fa-arrow-right"></i>
                                    </a>
                                </div>
                                <div class="offer-thumb">
                                    <img class="thumbImg" src="static/img/offer/offerThumb1_3.png" alt="thumb">
                                    <div class="shape float-bob-x"><img src="static/img/shape/offerShape1_4.png"
                                            alt="shape"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- About Us Section   S T A R T -->
        <section class="about-us-section fix section-padding pt-0">
            <div class="about-wrapper style2">
                <div class="shape1 d-none d-xxl-block"><img src="static/img/shape/aboutShape2_1.png" alt="shape"></div>
                <div class="container">
                    <div class="about-us section-padding">
                        <div class="row d-flex align-items-center">
                            <div class="col-lg-6 d-flex align-items-center justify-content-center justify-content-xl-start">
                                <div class="about-thumb mb-5 mb-lg-0">
                                    <img src="static/img/about/aboutThumb2_1.png" alt="thumb">
                                    <div class="video-wrap">
                                        <a href="https://www.youtube.com/watch?v=f2Gzr8sAGB8"
                                            class="play-btn popup-video"><img class="cir36"
                                                src="static/img/shape/player.svg" alt="icon"></a>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <div class="title-area">
                                    <div class="sub-title text-start wow fadeInUp" data-wow-delay="0.5s">
                                        <img class="me-1" src="static/img/icon/titleIcon.svg" alt="icon">About US<img
                                            class="ms-1" src="static/img/icon/titleIcon.svg" alt="icon">
                                    </div>
                                    <h2 class="title text-start wow fadeInUp" data-wow-delay="0.7s">
                                        Variety of flavours from american cuisine
                                    </h2>
                                    <div class="text text-start wow fadeInUp" data-wow-delay="0.8s">Every dish is not just
                                        prepared it's a crafted with a savor the a utmost precision and a deep understanding
                                        sdf of flavor harmony. The experienced hands of our chefs</div>
                                </div>
                                <div class="fancy-box-wrapper">
                                    <div class="fancy-box">
                                        <div class="item"><img src="static/img/icon/aboutIcon1_1.svg" alt="icon"></div>
                                        <div class="item">
                                            <h6>super quality food</h6>
                                            <p>Served our Testy Food & good food by friendly</p>
                                        </div>
                                    </div>
                                    <div class="fancy-box">
                                        <div class="item"><img src="static/img/icon/aboutIcon1_2.svg" alt="icon"></div>
                                        <div class="item">
                                            <h6>Qualified Chef</h6>
                                            <p>Served our Testy Food & good food by friendly</p>
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
                            <span class="text-slider"></span><span class="text-slider text-style">chicken pizza</span>
                            <span class="text-slider"></span><span class="text-slider text-style">GRILLED CHICKEN</span>
                            <span class="text-slider"></span><span class="text-slider text-style">BURGER</span>
                            <span class="text-slider"></span><span class="text-slider text-style">CHICKEN PIZZA</span>
                            <span class="text-slider"></span><span class="text-slider text-style">FRESH PASTA</span>
                            <span class="text-slider"></span><span class="text-slider text-style">ITALIANO FRENCH FRY</span>
                            <span class="text-slider"></span><span class="text-slider text-style">CHICKEN FRY</span>
                            <span class="text-slider"></span><span class="text-slider text-style">chicken pizza</span>
                            <span class="text-slider"></span><span class="text-slider text-style">GRILLED CHICKEN</span>
                            <span class="text-slider"></span><span class="text-slider text-style">BURGER</span>
                            <span class="text-slider"></span><span class="text-slider text-style">CHICKEN PIZZA</span>
                            <span class="text-slider"></span><span class="text-slider text-style">FRESH PASTA</span>
                            <span class="text-slider"></span><span class="text-slider text-style">ITALIANO FRENCH FRY</span>
                            <span class="text-slider"></span><span class="text-slider text-style">CHICKEN FRY</span>
                        </li>
                    </ul>
                </div>
            </div>
        </section>


        <!-- Cta section  S T A R T -->
        <section class="cta-section fix">
            <div class="cta-wrapper style1  section-padding">
                <div class="shape1 float-bob-x d-none d-xxl-block"><img src="static/img/shape/ctaShape1_1.png" alt="shape">
                </div>
                <div class="shape2 float-bob-y d-none d-xxl-block"><img src="static/img/shape/ctaShape1_2.png" alt="shape">
                </div>
                <div class="shape3 float-bob-y d-none d-xxl-block"><img src="static/img/shape/ctaShape1_3.png" alt="shape">
                </div>
                <div class="container">
                    <div class="cta-wrap style1">
                        <div class="row">
                            <div class="col-xl-6 order-2 order-xl-1">
                                <div class="cta-content">
                                    <h6 class="wow fadeInUp" data-wow-delay="0.5s">WELCOME FRESHEAT</h6>
                                    <h3 class="wow fadeInUp" data-wow-delay="0.7s">TODAY SPACIAL FOOD</h3>
                                    <p class="wow fadeInUp" data-wow-delay="0.8s">limits Time Offer</p>
                                    <a class="theme-btn wow fadeInUp" data-wow-delay="0.9s" href="menu.html">ORDER NOW <i
                                            class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="col-xl-6 order-1 order-xl-2">
                                <div class="cta-thumb">
                                    <img class="img-fluid float-bob-x" src="static/img/cta/ctaThumb1_1.png" alt="thumb">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <!-- Chefe Section    S T A R T -->
        <section class="chefe-section fix section-padding">
            <div class="chefe-wrapper style1">
                <div class="shape1 d-none d-xxl-block"><img class="float-bob-y" src="static/img/shape/chefeShape1_1.png"
                        alt="shape"></div>
                <div class="shape2 d-none d-xxl-block"><img class="float-bob-x" src="static/img/shape/chefeShape1_2.png"
                        alt="shape"></div>
                <div class="container">
                    <div class="title-area">
                        <div class="sub-title text-center wow fadeInUp" data-wow-delay="0.5s">
                            <img class="me-1" src="static/img/icon/titleIcon.svg" alt="icon">OUR CHEFE<img class="ms-1"
                                src="static/img/icon/titleIcon.svg" alt="icon">
                        </div>
                        <h2 class="title  wow fadeInUp" data-wow-delay="0.7s">
                            Meet Our Expert Chefe
                        </h2>
                    </div>
                    <div class="chefe-card-wrap style1 pb-5">
                        <div class="row">
                            <div class="col-lg-6 col-xl-4">
                                <div class="chefe-card style1 wow fadeInUp" data-wow-delay="0.2s">
                                    <div class="chefe-thumb">
                                        <img src="static/img/chefe/chefeThumb1_1.png" alt="thumb">
                                    </div>
                                    <div class="icon">
                                        <a class="hovered-icon" href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                        <a href="#"><i class="fa-light fa-share-nodes"></i></a>
                                        <a class="hovered-icon" href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    </div>
                                    <div class="chefe-content">
                                        <a href="chef-details.html">
                                            <h3>Ralph Edwards</h3>
                                        </a>
                                        <p>Chef Lead</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-xl-4">
                                <div class="chefe-card style1 wow fadeInUp" data-wow-delay="0.4s">
                                    <div class="chefe-thumb">
                                        <img src="static/img/chefe/chefeThumb1_2.png" alt="thumb">
                                    </div>
                                    <div class="icon">
                                        <a class="hovered-icon" href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                        <a href="#"><i class="fa-light fa-share-nodes"></i></a>
                                        <a class="hovered-icon" href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    </div>
                                    <div class="chefe-content">
                                        <a href="chef-details.html">
                                            <h3>Leslie Alexander</h3>
                                        </a>
                                        <p>Chef Assistant</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-xl-4">
                                <div class="chefe-card style1 wow fadeInUp" data-wow-delay="0.5s">
                                    <div class="chefe-thumb">
                                        <img src="static/img/chefe/chefeThumb1_3.png" alt="thumb">
                                    </div>
                                    <div class="icon">
                                        <a class="hovered-icon" href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                        <a href="#"><i class="fa-light fa-share-nodes"></i></a>
                                        <a class="hovered-icon" href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                                    </div>
                                    <div class="chefe-content">
                                        <a href="chef-details.html">
                                            <h3>Ronald Richards</h3>
                                        </a>
                                        <p>Chef Assistant</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="slider-area pt-5 mt-4 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="swiper clientSliderOne">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="client-img text-center"><img src="static/img/logo/clientLogo1_1.png"
                                            alt="logo">
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="client-img text-center"><img src="static/img/logo/clientLogo1_2.png"
                                            alt="logo">
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="client-img text-center"><img src="static/img/logo/clientLogo1_3.png"
                                            alt="logo">
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="client-img text-center"><img src="static/img/logo/clientLogo1_4.png"
                                            alt="logo">
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="client-img text-center"><img src="static/img/logo/clientLogo1_5.png"
                                            alt="logo">
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="client-img text-center"><img src="static/img/logo/clientLogo1_6.png"
                                            alt="logo">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonial Section    S T A R T -->
        <section class="testimonial-section fix bg-color3">
            <div class="testimonial-wrapper style1 section-padding ">
                <div class="shape"><img src="static/img/testimonial/testimonialThumb1_1.png" alt="thumb"></div>
                <div class="shape2"><img src="static/img/shape/testimonialShape1_1.png" alt="shape"></div>
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-xl-5 d-flex align-items-center justify-content-center">
                            <div class="video-wrap cir36 ">
                                <a href="https://www.youtube.com/watch?v=f2Gzr8sAGB8" class="play-btn popup-video"><img
                                        src="static/img/shape/player.svg" alt="icon"></a>
                            </div>
                        </div>
                        <div class="col-xl-7">
                            <div class="title-area">
                                <div class="sub-title text-center wow fadeInUp" data-wow-delay="0.5s">
                                    <img class="me-1" src="static/img/icon/titleIcon.svg" alt="icon">Testimonials<img
                                        class="ms-1" src="static/img/icon/titleIcon.svg" alt="icon">
                                </div>
                                <h2 class="title text-white wow fadeInUp" data-wow-delay="0.7s">
                                    What our Clients Say
                                </h2>
                            </div>
                            <div class="slider-area">
                                <div class="swiper testmonialSliderOne">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <div class="testimonial-card style1">
                                                <div class="testimonial-header">
                                                    <div class="fancy-box">
                                                        <div class="item1"><img
                                                                src="static/img/testimonial/testimonialProfile1_1.png"
                                                                alt="thumb"></div>
                                                        <div class="item2">
                                                            <h6>Albert Flores</h6>
                                                            <p>Web Designer</p>
                                                            <div class="icon"><img src="static/img/icon/star.svg"
                                                                    alt="icon"></div>
                                                        </div>
                                                        <div class="quote"><img src="static/img/icon/quote.svg" alt="icon">
                                                        </div>
                                                    </div>
                                                </div>

                                                <p>Penatibus magnis dis point parturient montes nascetur ridiculus mus Ut id
                                                    lorem ac enim the vestibulum blandit nec sit amet felis. Fusce quis diam
                                                    odio Cras mattis mi quis tincidunt</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-wrap">
                    <div class="arrow-prev"><i class="fa-regular fa-arrow-left"></i></div>
                    <div class="arrow-next"><i class="fa-regular fa-arrow-right"></i></div>
                </div>
            </div>

            <div class="marquee-wrapper style-2 text-slider section-padding">
                <div class="marquee-inner to-left">
                    <ul class="marqee-list d-flex">
                        <li class="marquee-item style-2">
                            <span class="text-slider"></span><span class="text-slider text-style">chicken pizza</span>
                            <span class="text-slider"></span><span class="text-slider text-style">GRILLED CHICKEN</span>
                            <span class="text-slider"></span><span class="text-slider text-style">BURGER</span>
                            <span class="text-slider"></span><span class="text-slider text-style">CHICKEN PIZZA</span>
                            <span class="text-slider"></span><span class="text-slider text-style">FRESH PASTA</span>
                            <span class="text-slider"></span><span class="text-slider text-style">ITALIANO FRENCH FRY</span>
                            <span class="text-slider"></span><span class="text-slider text-style">CHICKEN FRY</span>
                            <span class="text-slider"></span><span class="text-slider text-style">chicken pizza</span>
                            <span class="text-slider"></span><span class="text-slider text-style">GRILLED CHICKEN</span>
                            <span class="text-slider"></span><span class="text-slider text-style">BURGER</span>
                            <span class="text-slider"></span><span class="text-slider text-style">CHICKEN PIZZA</span>
                            <span class="text-slider"></span><span class="text-slider text-style">FRESH PASTA</span>
                            <span class="text-slider"></span><span class="text-slider text-style">ITALIANO FRENCH FRY</span>
                            <span class="text-slider"></span><span class="text-slider text-style">CHICKEN FRY</span>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Blog Section    S T A R T -->
        <section class="blog-section section-padding fix">
            <div class="blog-wrapper style1">
                <div class="container">
                    <div class="blog-card-wrap style1">
                        <div class="title-area">
                            <div class="sub-title text-center wow fadeInUp" data-wow-delay="0.5s">
                                <img class="me-1" src="static/img/icon/titleIcon.svg" alt="icon">LATEST NEWS<img
                                    class="ms-1" src="static/img/icon/titleIcon.svg" alt="icon">
                            </div>
                            <h2 class="title wow fadeInUp" data-wow-delay="0.7s">
                                Our Latest Foods News
                            </h2>
                        </div>
                        <div class="slider-area">
                            <div class="swiper blogSliderOne">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="blog-card style1 wow fadeInUp" data-wow-delay="0.2s">
                                            <div class="blog-thumb">
                                                <img src="static/img/blog/blogThumb1_1.jpg" alt="thumb">
                                            </div>
                                            <div class="blog-content">
                                                <div class="blog-meta">
                                                    <div class="item1">
                                                        <h6>15</h6>
                                                        <p>Dec</p>
                                                    </div>
                                                    <div class="item2">
                                                        <div class="icon"><img src="static/img/icon/user.svg"
                                                                alt="icon"><span>By Admin</span></div>
                                                    </div>
                                                    <div class="item3">
                                                        <div class="icon"><img src="static/img/icon/tag.svg"
                                                                alt="icon"><span>Noodles</span></div>
                                                    </div>
                                                </div>
                                                <a href="blog-details.html">
                                                    <h3>Fast Food Frenzy a Taste of Convenience</h3>
                                                </a>
                                                <a href="blog-details.html" class="link-btn">
                                                    <span>Read More</span> <i class="fa-solid fa-arrow-right-long"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="blog-card style1 wow fadeInUp" data-wow-delay="0.4s">
                                            <div class="blog-thumb">
                                                <img src="static/img/blog/blogThumb1_2.jpg" alt="thumb">
                                            </div>
                                            <div class="blog-content">
                                                <div class="blog-meta">
                                                    <div class="item1">
                                                        <h6>17</h6>
                                                        <p>Dec</p>
                                                    </div>
                                                    <div class="item2">
                                                        <div class="icon"><img src="static/img/icon/user.svg"
                                                                alt="icon"><span>By Admin</span></div>
                                                    </div>
                                                    <div class="item3">
                                                        <div class="icon"><img src="static/img/icon/tag.svg"
                                                                alt="icon"><span>Chicken</span></div>
                                                    </div>
                                                </div>
                                                <a href="blog-details.html">
                                                    <h3>Benefits of health and safety measures</h3>
                                                </a>
                                                <a href="blog-details.html" class="link-btn">
                                                    <span>Read More</span> <i class="fa-solid fa-arrow-right-long"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="blog-card style1 wow fadeInUp" data-wow-delay="0.6s">
                                            <div class="blog-thumb">
                                                <img src="static/img/blog/blogThumb1_3.jpg" alt="thumb">
                                            </div>
                                            <div class="blog-content">
                                                <div class="blog-meta">
                                                    <div class="item1">
                                                        <h6>25</h6>
                                                        <p>Dec</p>
                                                    </div>
                                                    <div class="item2">
                                                        <div class="icon"><img src="static/img/icon/user.svg"
                                                                alt="icon"><span>By Admin</span></div>
                                                    </div>
                                                    <div class="item3">
                                                        <div class="icon"><img src="static/img/icon/tag.svg"
                                                                alt="icon"><span>Noodles</span></div>
                                                    </div>
                                                </div>
                                                <a href="blog-details.html">
                                                    <h3>Quick Cravings Unraveling Fast Food Delights</h3>
                                                </a>
                                                <a href="blog-details.html" class="link-btn">
                                                    <span>Read More</span> <i class="fa-solid fa-arrow-right-long"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-wrap">
                    <div class="arrow-prev"><i class="fa-regular fa-arrow-left"></i></div>
                    <div class="arrow-next"><i class="fa-regular fa-arrow-right"></i></div>
                </div>
            </div>
        </section>

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
