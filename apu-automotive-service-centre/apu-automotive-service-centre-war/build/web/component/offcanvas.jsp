<%-- 
    Document   : Offcanvas
    Created on : Mar 20, 2026, 9:04:48 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="fix-area">
        <div class="offcanvas__info">
            <div class="offcanvas__wrapper">
                <div class="offcanvas__content">
                    <div class="offcanvas__top mb-5 d-flex justify-content-between align-items-center">
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
                        APU is one of Malaysia's premier private universities, where students are transformed into highly skilled, employable, 
                        and future-proof professionals via a unique blend of technology, innovation, and creativity.
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
                                    <a target="_blank" href="service.jsp">Kuala Lumpur, Malaysia</a>
                                </div>
                            </li>
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon mr-15">
                                    <i class="fal fa-envelope"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a href="tel:+013-003-003-9993"><span class="mailto:info@enofik.com">https://www.apu.edu.my/</span></a>
                                </div>
                            </li>
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon mr-15">
                                    <i class="fal fa-clock"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a target="_blank" href="service.jsp">Monday-Friday, 09am-05pm</a>
                                </div>
                            </li>
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon mr-15">
                                    <i class="far fa-phone"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a href="tel:+11002345909">011002345909</a>
                                </div>
                            </li>
                        </ul>
                        <div class="header-button mt-4">
                            <a href="login.jsp" class="theme-btn">
                            <span class="button-content-wrapper d-flex align-items-center justify-content-center">
                            <span class="button-icon"><i class="fa-sharp fa-regular fa-cart-shopping bg-transparent text-white me-2"></i></span>
                            <span class="button-text">LOGIN NOW</span>
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
</html>
