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
                            <img src="static/img/logo/logoWhite.svg" alt="img">
                        </a>
                    </div>
                    <div class="main-header-items">
                        <div class="header-top-wrapper-2">
                            <div class="text-white top-text">Welcome To Asia Pacific University</div>
                            <div class="text-white top-text"><i class="fa-solid fa-location-dot me-3"></i> Jalan Teknologi 5, Taman Teknologi Malaysia, Kuala Lumpur</div>
                            <div class="social-icon d-flex align-items-center">
                                <div class="text-white pe-2 top-text"><i class="fa-solid fa-user me-3"></i> Login / Register
                                </div>
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
                                                            <a href="index.jsp">
                                                                Home
                                                            </a>
                                                        </li>
                                                        <li class="has-dropdown active d-xl-none">
                                                            <a href="index.jsp" class="border-none">
                                                                Home
                                                            </a>
                                                        </li>
                                                        <li class="has-dropdown">
                                                            <a href="about.jsp">
                                                                About Us
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="shop.html">
                                                                Service
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="contact.jsp">
                                                                Contact Us
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="header-right d-flex justify-content-end align-items-center">
                                        <a href="#0" class="search-trigger search-icon"><i class="fal fa-search"></i></a>

                                        <div class="header__cart">
                                            <a href="#"> <i class="fa-sharp fa-regular fa-cart-shopping"></i> </a>
                                            <div class="header__right__dropdown__wrapper">
                                                <div class="header__right__dropdown__inner">
                                                    <div class="single__header__right__dropdown">

                                                        <div class="header__right__dropdown__img">
                                                            <a href="#">
                                                                <img loading="lazy"
                                                                    src="static/img/blog/blogRecentThumb3_1.png"
                                                                    alt="photo">
                                                            </a>
                                                        </div>
                                                        <div class="header__right__dropdown__content">

                                                            <a href="shop.html">Fried Chicken</a>
                                                            <p>1 x <span class="price">$ 80.00</span></p>

                                                        </div>
                                                        <div class="header__right__dropdown__close">
                                                            <a href="#"><i class="icofont-close-line"></i></a>
                                                        </div>
                                                    </div>

                                                    <div class="single__header__right__dropdown">

                                                        <div class="header__right__dropdown__img">
                                                            <a href="#">
                                                                <img loading="lazy"
                                                                    src="static/img/blog/blogRecentThumb3_2.png"
                                                                    alt="photo">
                                                            </a>
                                                        </div>
                                                        <div class="header__right__dropdown__content">

                                                            <a href="shop.html">Fried Noodles</a>
                                                            <p>1 x <span class="price">$ 60.00</span></p>

                                                        </div>
                                                        <div class="header__right__dropdown__close">
                                                            <a href="#"><i class="icofont-close-line"></i></a>
                                                        </div>
                                                    </div>

                                                    <div class="single__header__right__dropdown">

                                                        <div class="header__right__dropdown__img">
                                                            <a href="#">
                                                                <img loading="lazy"
                                                                    src="static/img/blog/blogRecentThumb3_3.png"
                                                                    alt="photo">
                                                            </a>
                                                        </div>
                                                        <div class="header__right__dropdown__content">

                                                            <a href="shop.html">Special Pasta</a>
                                                            <p>1 x <span class="price">$ 70.00</span></p>

                                                        </div>
                                                        <div class="header__right__dropdown__close">
                                                            <a href="#"><i class="icofont-close-line"></i></a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <p class="dropdown__price">Total: <span>$1,100.00</span>
                                                </p>
                                                <div class="header__right__dropdown__button">
                                                    <a href="cart.html" class="theme-btn mb-2">View Cart</a>
                                                    <a href="checkout.html" class="theme-btn style3">Checkout</a>
                                                </div>
                                            </div>
                                        </div>

                                        <a class="theme-btn" href="menu.html">ORDER NOW <i
                                                class="fa-sharp fa-regular fa-arrow-right"></i></a>
                                        <div class="header__hamburger d-xl-block my-auto">
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
