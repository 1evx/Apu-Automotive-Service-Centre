<%-- 
    Document   : manager_dashboard
    Created on : Mar 21, 2026, 10:50:30 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="model.Manager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <jsp:include page="component/offcanvas.jsp" />

        
       <!-- Header Section Start -->
        <jsp:include page="component/dashboardNavbar.jsp" />


        <!-- Search Area Start -->
        <jsp:include page="component/search.jsp" />


        <!-- Dashboard Section S T A R T -->
        <div class="shop-section section-padding fix">
            <div class="shop-wrapper style1">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-xl-9 col-lg-8 order-1 order-md-2 wow fadeInUp" data-wow-delay=".5s">
                                                        
                            <!-- Main Record Block -->
                            <!--
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-grid" role="tabpanel"
                                        aria-labelledby="pills-grid-tab" tabindex="0">
                                        <div class="dishes-card-wrap style2">
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.2s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_1.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Pizza</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$24.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.4s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_2.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Egg and Cucumber</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$28.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.6s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_3.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Fried Rice</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$20.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.8s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_4.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Leg Piece</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$58.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dishes-card-wrap style2">
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.2s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_1.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Pizza</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$24.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.4s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_2.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Egg and Cucumber</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$28.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.6s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_3.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Fried Rice</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$20.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.8s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_4.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Leg Piece</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$58.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dishes-card-wrap style2">
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.2s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_4.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Pizza</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$24.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.4s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_5.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Egg and Cucumber</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$28.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.6s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_3.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Fried Rice</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$20.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.8s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_4.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Leg Piece</h3>
                                                    </a>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">The registration fee</div>
                                                    <h6>$58.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-list" role="tabpanel" aria-labelledby="pills-list-tab"
                                        tabindex="0">
                                        <div class="dishes-card-wrap style3">
                                            <div class="dishes-card style4 wow fadeInUp" data-wow-delay="0.2s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_1.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Pizza</h3>
                                                    </a>
                                                    <div class="icon">
                                                        <a href="#"> <i class="fa-regular fa-heart"></i></a>
                                                    </div>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">Neque porro est qui dolorem ipsum quia quaed inventor
                                                        veritatis et
                                                        quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus
                                                        quis enim
                                                        var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is
                                                        simply
                                                        dummy text of the printing and typesetting industry.When an unknown
                                                        printer took
                                                        a galley of type</div>
                                                    <h6>$24.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style4 wow fadeInUp" data-wow-delay="0.4s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_2.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Egg and Cucumber</h3>
                                                    </a>
                                                    <div class="icon">
                                                        <a href="#"> <i class="fa-regular fa-heart"></i></a>
                                                    </div>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">Neque porro est qui dolorem ipsum quia quaed inventor
                                                        veritatis et
                                                        quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus
                                                        quis enim
                                                        var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is
                                                        simply
                                                        dummy text of the printing and typesetting industry.When an unknown
                                                        printer took
                                                        a galley of type</div>
                                                    <h6>$28.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style4 wow fadeInUp" data-wow-delay="0.6s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_3.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Fried Rice</h3>
                                                    </a>
                                                    <div class="icon">
                                                        <a href="#"> <i class="fa-regular fa-heart"></i></a>
                                                    </div>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">Neque porro est qui dolorem ipsum quia quaed inventor
                                                        veritatis et
                                                        quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus
                                                        quis enim
                                                        var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is
                                                        simply
                                                        dummy text of the printing and typesetting industry.When an unknown
                                                        printer took
                                                        a galley of type</div>
                                                    <h6>$20.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style4 wow fadeInUp" data-wow-delay="0.8s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_4.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Leg Piece</h3>
                                                    </a>
                                                    <div class="icon">
                                                        <a href="#"> <i class="fa-regular fa-heart"></i></a>
                                                    </div>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">Neque porro est qui dolorem ipsum quia quaed inventor
                                                        veritatis et
                                                        quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus
                                                        quis enim
                                                        var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is
                                                        simply
                                                        dummy text of the printing and typesetting industry.When an unknown
                                                        printer took
                                                        a galley of type</div>
                                                    <h6>$58.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                            <div class="dishes-card style4 wow fadeInUp" data-wow-delay="0.2s">
                                                <div class="dishes-thumb">
                                                    <img src="static/img/dishes/dishes2_1.png" alt="thumb">
                                                    <div class="circle-shape"><img class="cir36"
                                                            src="static/img/food-items/circleShape.png" alt="shape"></div>
                                                </div>
                                                <div class="dishes-content">
                                                    <a href="shop-details.html">
                                                        <h3>Chicken Pizza</h3>
                                                    </a>
                                                    <div class="icon">
                                                        <a href="#"> <i class="fa-regular fa-heart"></i></a>
                                                    </div>
                                                    <div class="star"><img src="static/img/icon/star2.svg" alt="icon"></div>
                                                    <div class="text">Neque porro est qui dolorem ipsum quia quaed inventor
                                                        veritatis et
                                                        quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus
                                                        quis enim
                                                        var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is
                                                        simply
                                                        dummy text of the printing and typesetting industry.When an unknown
                                                        printer took
                                                        a galley of type</div>
                                                    <h6>$24.00</h6>
                                                    <a href="shop-details.html" class="theme-btn style6"> Order Now <i
                                                            class="fa-regular fa-basket-shopping"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                            -->
                            
                            
                            <!-- Business Report Block -->
                            <div id="dashboard-home" class="dashboard-section">
                                <div class="single-sidebar-widget mb-4">
                                    
                                    <div class="sort-bar">
                                        <div class="row g-sm-0 gy-20 justify-content-between align-items-center">
                                            
                                            <div class="col-md">
                                                <h4 class="widget-title"><i class="fa-solid fa-chart-pie me-2"></i> System Overview</h4>
                                            </div>

                                            <!-- Drop Down For Sorting -->
                                            <div class="col-md-auto">
                                                <form class="woocommerce-ordering" method="get">
                                                    <select name="orderby" class="single-select" aria-label="Shop order">
                                                        <option value="menu_order" selected="selected">Default Sorting</option>
                                                        <option value="popularity">Sort by popularity</option>
                                                        <option value="rating">Sort by average rating</option>
                                                        <option value="date">Sort by latest</option>
                                                        <option value="price">Sort by price: low to high</option>
                                                        <option value="price-desc">Sort by price: high to low</option>
                                                    </select>
                                                </form>
                                            </div>

                                            <!-- Switch Layout Icon -->
                                            <div class="col-md-auto">
                                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link active" id="pills-grid-tab" data-bs-toggle="pill"
                                                            data-bs-target="#pills-grid" type="button" role="tab"
                                                            aria-controls="pills-grid" aria-selected="true"><i
                                                                class="fa-solid fa-grid"></i></button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="pills-list-tab" data-bs-toggle="pill"
                                                            data-bs-target="#pills-list" type="button" role="tab"
                                                            aria-controls="pills-list" aria-selected="false"><i
                                                                class="fa-solid fa-list"></i></button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row text-center mt-4">
                                        <div class="col-md-4 mb-3">
                                            <div class="p-4 border rounded bg-light shadow-sm">
                                                <h2 class="text-primary fw-bold">128</h2>
                                                <p class="text-muted mb-0 fw-bold">Jobs Completed</p>
                                            </div>
                                        </div>

                                        <div class="col-md-4 mb-3">
                                            <div class="p-4 border rounded bg-light shadow-sm">
                                                <h2 class="text-success fw-bold">RM 4,250</h2>
                                                <p class="text-muted mb-0 fw-bold">Revenue</p>
                                            </div>
                                        </div>

                                        <div class="col-md-4 mb-3">
                                            <div class="p-4 border rounded bg-light shadow-sm">
                                                <h2 class="text-warning fw-bold">14</h2>
                                                <p class="text-muted mb-0 fw-bold">Active Staff</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4 p-4 border rounded text-center">
                                        <i class="fa-solid fa-chart-line fa-3x text-muted mb-3 opacity-50"></i>
                                        <h5 class="text-muted">Financial charts will appear here</h5>
                                    </div>
                                </div>
                            </div>

                            <!-- Manage Stuff Block -->
                            <div id="manage-staff" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    
                                    <div class="card-header bg-white p-4 d-flex justify-content-between align-items-center border-bottom">                      
                                        <div class="col-md">
                                            <h4 class="widget-title"><i class="fa-solid fa-users-gear me-2"></i> Manage Staff</h4>
                                        </div>
                                        
                                        <div class="col-md-auto">
                                            <button class="btn btn-primary fw-bold p-3 mb-3" data-bs-toggle="modal" 
                                                    data-bs-target="#registerStaffModal">
                                                <i class="fa-solid fa-user-plus me-2"></i> Add Staff
                                            </button>
                                        </div>
                                        
                                        <!-- Layout Switch Button -->
                                        <div class="col-md-auto ms-3">
                                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="pills-grid-tab" data-bs-toggle="pill"
                                                            data-bs-target="#pills-grid" type="button" role="tab"
                                                            aria-controls="pills-grid" aria-selected="true"><i
                                                            class="fa-solid fa-grid"></i></button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="pills-list-tab" data-bs-toggle="pill"
                                                            data-bs-target="#pills-list" type="button" role="tab"
                                                            aria-controls="pills-list" aria-selected="false"><i
                                                            class="fa-solid fa-list"></i></button>
                                                </li>
                                            </ul>
                                        </div>

                                    </div>

                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="ps-4 py-3">Full Name</th>
                                                        <th>System Role</th>
                                                        <th>Email Address</th>
                                                        <th class="text-end pe-4">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:choose>

                                                        <c:when test="${empty sessionScope.staffList}">
                                                            <tr>
                                                                <td colspan="4" class="text-center py-5 text-muted">
                                                                    <i class="fa-solid fa-folder-open fa-2x mb-3 opacity-50"></i>
                                                                    <p class="mb-0">No staff records found in the system.</p>
                                                                </td>
                                                            </tr>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <c:forEach items="${sessionScope.staffList}" var="staff">
                                                                <tr>
                                                                    <td class="ps-4 fw-bold text-dark">${staff.fullName}</td>

                                                                    <td><span class="badge bg-secondary">${staff.class.simpleName}</span></td>

                                                                    <td class="text-muted">${staff.email}</td>

                                                                    <td class="text-end pe-4">
                                                                        <button class="btn btn-sm btn-outline-primary me-1 edit-staff-btn" 
                                                                                title="Edit Staff" 
                                                                                data-bs-toggle="modal" 
                                                                                data-bs-target="#editStaffModal"
                                                                                data-id="${staff.id}"
                                                                                data-name="${staff.fullName}"
                                                                                data-email="${staff.email}"
                                                                                data-role="${staff.role}">
                                                                            <i class="fa-solid fa-pen"></i>
                                                                        </button>

                                                                        <a href="DeleteUserServlet?id=${staff.id}" class="btn btn-sm btn-outline-danger" 
                                                                           onclick="return confirm('Are you absolutely sure you want to delete ${staff.fullName}? This cannot be undone.');" title="Delete Staff">
                                                                            <i class="fa-solid fa-trash"></i>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:otherwise>

                                                    </c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            

                            <!-- Service Pricing Block -->
                            <div id="service-pricing" class="dashboard-section" style="display: none;">
                                <div class="single-sidebar-widget mb-4">
                                    <h4 class="widget-title"><i class="fa-solid fa-tags me-2"></i> Service Pricing</h4>
                                    <p class="mt-3 text-muted">Pricing update form coming soon...</p>
                                </div>
                            </div>

                            <!-- View Feedback Block -->
                            <div id="view-feedback" class="dashboard-section" style="display: none;">
                                <div class="single-sidebar-widget mb-4">
                                    <h4 class="widget-title"><i class="fa-solid fa-comments me-2"></i> Customer Feedback</h4>
                                    <p class="mt-3 text-muted">Feedback records coming soon...</p>
                                </div>
                            </div>
                            
                            <!-- Bottom Navigation -->
                            <div class="page-nav-wrap text-center">
                                <ul>
                                    <li><a class="previous" href="shop.html"><i
                                                class="fa-sharp fa-light fa-arrow-left-long"></i></a></li>
                                    <li><a class="page-numbers" href="shop.html">1</a></li>
                                    <li><a class="page-numbers active" href="shop.html">2</a></li>
                                    <li><a class="page-numbers" href="shop.html">3</a></li>
                                    <li><a class="page-numbers" href="shop.html">...</a></li>
                                    <li><a class="next" href="shop.html"><i
                                                class="fa-sharp fa-light fa-arrow-right-long"></i></a></li>
                                </ul>
                            </div>
                        
                            
                            
                        </div>
                        
                        <!-- Left Side Bar -->
                        <div class="col-xl-3 col-lg-4 order-2 order-md-1 wow fadeInUp" data-wow-delay=".3s">
                            <div class="main-sidebar">
                                <div class="single-sidebar-widget">
                                    <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.2s">
                                        <div class="dishes-thumb">
                                            <img src="static/img/dishes/dishes2_1.png" alt="thumb">
                                            <div class="circle-shape"><img class="cir36"
                                                    src="static/img/food-items/circleShape.png" alt="shape"></div>
                                        </div>
                                        <div class="dishes-content">
                                            <a href="shop-details.html">
                                                <h3>${sessionScope.currentUser.fullName}</h3>
                                            </a>
                                            <div class="text">Manager</div>
                                            <a href="#dashboard-home" class="theme-btn style6 sidebar-btn active">
                                                <i class="fa-solid fa-chart-pie fa-fw"></i> Business Reports
                                            </a>

                                            <a href="#manage-staff" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-users-gear fa-fw"></i> Manage Staff
                                            </a>

                                            <a href="#service-pricing" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-tags fa-fw"></i> Service Pricing
                                            </a>

                                            <a href="#view-feedback" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-comments fa-fw"></i> Customer Feedback
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="single-sidebar-widget">
                                    <h5 class="widget-title">
                                        Search
                                    </h5>
                                    <div class="search-widget">
                                        <form action="#">
                                            <input type="text" placeholder="Search here">
                                            <button><i class="fa-light fa-magnifying-glass"></i></button>
                                        </form>
                                    </div>
                                </div>
                                
                                <div class="single-sidebar-widget">
                                    <h5 class="widget-title">
                                        Search
                                    </h5>
                                    <ul class="tagcloud">
                                        <li><a href="shop.html">Cheese</a></li>
                                        <li><a href="shop.html">Cocktail</a></li>
                                        <li><a href="shop.html">Drink</a></li>
                                        <li><a href="shop.html">Uncategorized</a></li>
                                        <li><a href="shop.html">Pizza</a></li>
                                        <li><a href="shop.html">Non Veg</a></li>
                                    </ul>
                                </div>
                                
                                <div class="single-sidebar-widget">
                                    <h5 class="widget-title">
                                        Filter By Price
                                    </h5>

                                    <div class="recent-box">
                                        <div class="recent-thumb">
                                            <img src="static/img/shop/recentThumb1_1.png" alt="menu-thumb">
                                        </div>
                                        <div class="recent-content">
                                            <a href="shop.html"> Ruti With Beef Slice </a>
                                            <div class="star"><img src="static/img/icon/star3.svg" alt="icon"></div>
                                            <div class="price">
                                                <div class="regular-price">35$</div>
                                                <div class="offer-price">25$</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-box">
                                        <div class="recent-thumb">
                                            <img src="static/img/shop/recentThumb1_2.png" alt="menu-thumb">
                                        </div>
                                        <div class="recent-content">
                                            <a href="shop.html"> Fast Food Combo </a>
                                            <div class="star"><img src="static/img/icon/star3.svg" alt="icon"></div>
                                            <div class="price">
                                                <div class="regular-price">95$</div>
                                                <div class="offer-price">75$</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-box">
                                        <div class="recent-thumb">
                                            <img src="static/img/shop/recentThumb1_3.png" alt="menu-thumb">
                                        </div>
                                        <div class="recent-content">
                                            <a href="shop.html"> divicious Salad </a>
                                            <div class="star"><img src="static/img/icon/star3.svg" alt="icon"></div>
                                            <div class="price">
                                                <div class="regular-price">65$</div>
                                                <div class="offer-price">55$</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-box">
                                        <div class="recent-thumb">
                                            <img src="static/img/shop/recentThumb1_4.png" alt="menu-thumb">
                                        </div>
                                        <div class="recent-content">
                                            <a href="shop.html"> Chiness Pasta </a>
                                            <div class="star"><img src="static/img/icon/star3.svg" alt="icon"></div>
                                            <div class="price">
                                                <div class="regular-price">45$</div>
                                                <div class="offer-price">35$</div>
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

        <!-- PopUp Start -->
        <jsp:include page="component/staffCreationPopUp.jsp" />
        <jsp:include page="component/staffUpdatePopUp.jsp" />
        
        <!-- Footer Start -->
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
        
        <!-- Custom Script -->
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                
                // -------------------------------------------------
                // 1. SIDEBAR TAB SWITCHER
                // -------------------------------------------------
                const sidebarButtons = document.querySelectorAll('.sidebar-btn');
                const dashboardSections = document.querySelectorAll('.dashboard-section');

                sidebarButtons.forEach(button => {
                    button.addEventListener('click', function(event) {
                        event.preventDefault(); 
                        const targetId = this.getAttribute('href').substring(1);

                        sidebarButtons.forEach(btn => btn.classList.remove('active'));
                        this.classList.add('active');

                        dashboardSections.forEach(section => section.style.display = 'none');
                        document.getElementById(targetId).style.display = 'block';
                    });
                });

                // -------------------------------------------------
                // 2. EDIT STAFF MODAL DATA TRANSFER
                // -------------------------------------------------
                const editModal = document.getElementById('editStaffModal');
                
                // Only run this if the modal actually exists on the page
                if (editModal) {
                    editModal.addEventListener('show.bs.modal', function (event) {
                        // Find the button that was clicked
                        const button = event.relatedTarget;
                        
                        // Extract data from the button
                        const id = button.getAttribute('data-id');
                        const name = button.getAttribute('data-name');
                        const email = button.getAttribute('data-email');
                        const role = button.getAttribute('data-role');
                        
                        // Inject data into the input fields
                        document.getElementById('edit-staff-id').value = id;
                        document.getElementById('edit-staff-name').value = name;
                        document.getElementById('edit-staff-email').value = email;
                        document.getElementById('edit-staff-role').value = role;
                    });
                }
                
            });
        </script>
        
    </body>
</html>