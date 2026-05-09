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
                                <img src="static/img/logo/logo.svg" alt="APU-ASC Logo">
                            </a>
                        </div>
                        <div class="offcanvas__close">
                            <button>
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                    
                    <p class="text d-none d-lg-block">
                        Welcome to APU Automotive Service Centre. We provide top-tier vehicle maintenance, advanced diagnostics, and expert repairs by certified professionals to keep you safely on the road.
                    </p>
                    
                    <div class="mobile-menu fix mb-3"></div>
                    
                    <div class="offcanvas__contact">
                        <h4>Contact Info</h4>
                        <ul>
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon">
                                    <i class="fal fa-map-marker-alt"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a target="_blank" href="contact.jsp">Jalan Teknologi 5, Bukit Jalil, KL</a>
                                </div>
                            </li>
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon mr-15">
                                    <i class="fal fa-envelope"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a href="mailto:support@apu-asc.com.my"><span>support@apu-asc.com.my</span></a>
                                </div>
                            </li>
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon mr-15">
                                    <i class="fal fa-clock"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a target="_blank" href="contact.jsp">Mon-Fri: 9:00 AM - 6:30 PM<br>Sat: 9:00 AM - 1:00 PM</a>
                                </div>
                            </li>
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon mr-15">
                                    <i class="far fa-phone"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a href="tel:+60312345678">+603 1234 5678</a>
                                </div>
                            </li>
                        </ul>
                        <div class="header-button mt-4">
                            <a href="login.jsp" class="theme-btn">
                                <span class="button-content-wrapper d-flex align-items-center justify-content-center">
                                    <span class="button-icon"><i class="fa-solid fa-calendar-check bg-transparent text-white me-2"></i></span>
                                    <span class="button-text">BOOK APPOINTMENT</span>
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