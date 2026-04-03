<%-- 
    Document   : customer_dashboard
    Created on : Mar 21, 2026, 10:51:22 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="model.Customer"%>
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
                            <div class="sort-bar">
                                <div class="row g-sm-0 gy-20 justify-content-between align-items-center">
                                    
                                    <!-- Result Count -->
                                    <div class="col-md">
                                        <p class="woocommerce-result-count">Showing 1 - 12 of 30 Results</p>
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
                                </div>
                            </div>
                            
                            <!-- Main Record Block -->
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-list" role="tabpanel" aria-labelledby="pills-list-tab"
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
                                                <h3>Student Name</h3>
                                            </a>
                                            <div class="text">Student TP Number</div>
                                            <a href="#edit-profile" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-user-pen"></i>Edit Profile
                                            </a>
                                            <a href="#service-payment" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-file-invoice-dollar"></i>Service & Payment
                                            </a>
                                            <a href="#feedback-comment" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-regular fa-comments"></i>Feedback & Comment
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


        <!-- Search Area Start -->
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
