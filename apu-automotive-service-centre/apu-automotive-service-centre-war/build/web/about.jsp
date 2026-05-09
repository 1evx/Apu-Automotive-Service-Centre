<%-- 
    Document   : about.jsp
    Created on : Mar 20, 2026
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APU ASC - About Us</title>
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
        <button id="back-top" class="back-to-top"><i class="fa-regular fa-arrow-up"></i></button>
        
        <jsp:include page="component/offcanvas.jsp" />
        <jsp:include page="component/navbar.jsp" />
        <jsp:include page="component/search.jsp" />

        <div class="breadcumb-section">
            <div class="breadcumb-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="breadcumb-content">
                                <h1 class="breadcumb-title">About Us</h1>
                                <ul class="breadcumb-menu">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="text-white">/</li>
                                    <li class="active">About Us</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="about-us-section fix section-padding pt-5">
            <div class="about-wrapper style2">
                <div class="container">
                    <div class="row d-flex align-items-center gy-5">
                        
                        <div class="col-lg-6 d-flex align-items-center justify-content-center justify-content-xl-start">
                            <div class="position-relative w-100 px-3">
                                <img src="static/img/about/aboutThumb2_1.png" alt="APU-ASC Facility" class="img-fluid rounded-4 shadow-lg w-100" style="object-fit: cover; max-height: 600px;">
                            </div>
                        </div>
                        
                        <div class="col-lg-6">
                            <div class="title-area">
                                <div class="sub-title text-start wow fadeInUp" data-wow-delay="0.5s">
                                    <i class="fa-solid fa-car-side text-primary me-2"></i>APU-ASC<i class="fa-solid fa-car-side text-primary ms-2"></i>
                                </div>
                                
                                <h2 class="title text-start text-white wow fadeInUp" data-wow-delay="0.7s">
                                    Excellence in Automotive Engineering
                                </h2>
                                <div class="text text-start text-white opacity-75 wow fadeInUp" data-wow-delay="0.8s">
                                    At APU Automotive Service Centre, we believe every vehicle deserves expert care. Our facility is equipped with the latest diagnostic technology and staffed by industry-certified professionals dedicated to your safety on the road.
                                </div>
                            </div>
                            <div class="fancy-box-wrapper mt-4">
                                <div class="fancy-box">
                                    <div class="item"><i class="fa-solid fa-gears fa-2x text-primary"></i></div>
                                    <div class="item">
                                        <h6 class="text-white">Genuine Parts</h6>
                                        <p class="text-white opacity-75">We use only OEM-approved components.</p>
                                    </div>
                                </div>
                                <div class="fancy-box">
                                    <div class="item"><i class="fa-solid fa-award fa-2x text-primary"></i></div>
                                    <div class="item">
                                        <h6 class="text-white">Certified Experts</h6>
                                        <p class="text-white opacity-75">Highly trained and experienced mechanics.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="chefe-section fix section-padding">
            <div class="chefe-wrapper style1">
                <div class="container">
                    <div class="title-area">
                        <div class="sub-title text-center wow fadeInUp" data-wow-delay="0.5s">
                            <i class="fa-solid fa-wrench text-primary me-2"></i>OUR TEAM<i class="fa-solid fa-wrench text-primary ms-2"></i>
                        </div>
                        
                        <h2 class="title text-white wow fadeInUp" data-wow-delay="0.7s">
                            Meet Our Expert Technicians
                        </h2>
                    </div>
                    
                    <div class="chefe-card-wrap style1 pb-5">
                        <div class="row justify-content-center">

                            <c:choose>
                                <c:when test="${empty requestScope.technicianList}">
                                    <div class="col-12 text-center text-white opacity-75 py-5">
                                        <i class="fa-solid fa-users-slash fa-3x mb-3"></i>
                                        <h4>Technician data is currently unavailable.</h4>
                                        <p class="small mt-2">Please ensure you navigated here via the AboutServlet.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${requestScope.technicianList}" var="tech">
                                        <div class="col-lg-6 col-xl-4 mb-4">
                                            <div class="chefe-card style2 wow fadeInUp" data-wow-delay="0.2s">
                                                <div class="chefe-thumb">
                                                    <%-- Adjust this image path if your DB stores custom profile pictures --%>
                                                    <img src="static/img/about/technicianProfile.png" alt="Profile" class="img-fluid w-100">
                                                </div>
                                                <div class="chefe-content bg-white">
                                                    <%-- NOTE: Adjust ${tech.user.fullName} depending on how your Java Classes are linked! --%>
                                                    <h3 class="text-dark">${tech.fullName}</h3>
                                                    <p class="text-primary fw-bold mb-1">${tech.specialization != null ? tech.specialization : 'Senior Technician'}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="cta-section section-padding pt-0 fix">
            <div class="cta-wrapper style3">
                <div class="container">
                    <div class="cta-wrap section-padding pt-xl-0 pb-xl-0 style3">
                        <div class="row g-5">
                            <div class="col-xl-6 d-flex align-items-center justify-content-center order-2 order-xl-1">
                                <div class="cta-content">
                                    <h6 class="text-white wow fadeInUp" data-wow-delay="0.5s">
                                        <i class="fa-solid fa-calendar-check me-2"></i>APPOINTMENTS<i class="fa-solid fa-calendar-check ms-2"></i>
                                    </h6>
                                    <h3 class="wow fadeInUp text-white" data-wow-delay="0.7s">Ready to service your vehicle?</h3>
                                    <p class="text-white wow fadeInUp mb-4 opacity-75">Book your appointment online in under 2 minutes.</p>
                                    <a class="theme-btn wow fadeInUp" href="login.jsp">BOOK NOW <i class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="col-xl-6 d-flex align-items-center justify-content-center justify-content-xl-start order-1 order-xl-2">
                                <div class="cta-thumb">
                                    <img class="img-fluid float-bob-x" src="static/img/about/aboutThumb3_1.png" alt="thumb">
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