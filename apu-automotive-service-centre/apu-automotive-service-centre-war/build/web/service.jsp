<%-- 
    Document   : service
    Created on : Mar 30, 2026
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APU ASC - Services</title>
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
                                <h1 class="breadcumb-title">Our Services</h1>
                                <ul class="breadcumb-menu">
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="text-white">/</li>
                                    <li class="active">Services</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="services-section style1 section-padding fix">
            <div class="services-wrapper style2">
                <div class="container">
                    <div class="title-area text-center mb-5">
                        <div class="sub-title text-center wow fadeInUp" data-wow-delay="0.5s">
                            <img class="me-1" src="static/img/icon/titleIcon.svg" alt="icon">WHAT WE DO<img class="ms-1" src="static/img/icon/titleIcon.svg" alt="icon">
                        </div>
                        <h2 class="title wow fadeInUp" data-wow-delay="0.7s">
                            Comprehensive Automotive Solutions
                        </h2>
                    </div>

                    <div class="row gy-5 gx-30">
                        
                        <%-- ============================================================ --%>
                        <%-- DYNAMIC JSTL LOOP: Renders a card for every service in DB    --%>
                        <%-- ============================================================ --%>
                        <c:choose>
                            <c:when test="${empty requestScope.serviceList}">
                                <div class="col-12 text-center text-muted py-5">
                                    <i class="fa-solid fa-gears fa-3x mb-3"></i>
                                    <h4>Service catalog is currently updating. Please check back later.</h4>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${requestScope.serviceList}" var="srv">
                                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                                        <div class="services-card style2 h-100 position-relative shadow-sm">
                                            <div class="services-card_icon">
                                                <i class="fa-solid fa-wrench fa-3x text-primary"></i>
                                            </div>
                                            <h4 class="services-card_title mt-4">
                                                <a href="login.jsp">${srv.name}</a>
                                            </h4>
                                            <p class="services-card_text">${srv.description != null ? srv.description : 'Professional automotive maintenance performed by certified experts.'}</p>
                                            
                                            <h5 class="text-primary fw-bold mt-3 border-top pt-3">
                                                RM <fmt:formatNumber value="${srv.price}" pattern="#,##0.00" />
                                            </h5>
                                            
                                            <a href="login.jsp" class="btn btn-outline-primary btn-sm mt-3 fw-bold w-100">Book Appointment</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>

        <section class="cta-section fix bg-color3 section-padding">
            <div class="cta-wrapper style1">
                <div class="container">
                    <div class="cta-wrap style1">
                        <div class="row align-items-center">
                            <div class="col-xl-8">
                                <div class="cta-content">
                                    <h6 class="wow fadeInUp text-white" data-wow-delay="0.5s">PREMIUM SERVICE</h6>
                                    <h3 class="wow fadeInUp text-white" data-wow-delay="0.7s">NEED URGENT REPAIRS?</h3>
                                    <p class="wow fadeInUp text-white opacity-75" data-wow-delay="0.8s">Our technicians are standing by. Book online to skip the queue.</p>
                                    <a class="theme-btn mt-4 wow fadeInUp" data-wow-delay="0.9s" href="login.jsp">BOOK AN APPOINTMENT <i class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="col-xl-4 text-center mt-4 mt-xl-0">
                                <i class="fa-solid fa-car-burst fa-10x text-white opacity-25"></i>
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