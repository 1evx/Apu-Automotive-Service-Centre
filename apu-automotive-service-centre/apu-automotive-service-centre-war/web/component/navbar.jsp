<%-- 
    Document   : navbar
    Created on : Mar 20, 2026, 2:21:58 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <header class="header-section-2">
            <div class="black-bg"></div>
            <div class="red-bg"></div>
            <div class="container-fluid">
                <div class="main-header-wrapper-2">
                    <div class="logo-image">
                        <a href="index.jsp">
                            <img src="static/img/logo/logoWhite.svg" alt="APU-ASC Logo">
                        </a>
                    </div>
                    <div class="main-header-items">
                        <div class="header-top-wrapper-2">
                            <div class="text-white top-text">Welcome To APU Automotive Service Centre</div>
                                    <div class="text-white top-text"><i class="fa-solid fa-location-dot me-3">
                                </i> Technology Park Malaysia, Bukit Jalil, Kuala Lumpur</div>
                            <div class="social-icon d-flex align-items-center">
                                <span class="text-white top-text">Follow Us:</span>
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div id="header-sticky" class="header-2">
                            <div class="mega-menu-wrapper">
                                <div class="header-main">
                                    <div class="logo">
                                        <a href="index.jsp" class="header-logo">
                                            <img src="static/img/logo/logo.svg" alt="logo-img">
                                        </a>
                                    </div>
                                    <div class="header-left">
                                        <div class="mean__menu-wrapper">
                                            <div class="main-menu">
                                                <nav id="mobile-menu">
                                                    <ul>
                                                        <li class="has-dropdown active menu-thumb">
                                                            <a href="index.jsp">Home</a>
                                                        </li>
                                                        <li class="has-dropdown active d-xl-none">
                                                            <a href="index.jsp" class="border-none">Home</a>
                                                        </li>
                                                        <li class="has-dropdown">
                                                            <a href="About">About Us</a>
                                                        </li>
                                                        <li>
                                                            <a href="Services">Services</a>
                                                        </li>
                                                        <li>
                                                            <a href="contact.jsp">Contact Us</a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="header-right d-flex justify-content-end align-items-center">
                                        <a class="theme-btn" href="login.jsp">Login <i class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                        <div class="header__hamburger d-xl-block my-auto ms-3">
                                            <div class="sidebar__toggle">
                                                <i class="fas fa-bars"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>