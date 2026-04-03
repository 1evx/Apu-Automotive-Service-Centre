<%-- 
    Document   : counter_dashboard
    Created on : Mar 21, 2026, 10:51:02 PM
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
                            
                            <!-- My Profile -->
                            <div id="my-profile" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">                      
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-user-pen fa-fw me-2"></i> My Profile</h4>
                                    </div>
                                    <div class="card-body p-4">

                                        <form action="UpdateProfileServlet" method="POST">
                                            <input type="hidden" name="userId" value="${sessionScope.currentUser.id}">

                                            <div class="row">
                                                <div class="col-md-4 mb-3">
                                                    <label class="form-label fw-bold small text-muted">System Role</label>
                                                    <input type="text" class="form-control bg-light" value="${sessionScope.currentUser.class.simpleName}" readonly>
                                                </div>

                                                <div class="col-md-8 mb-3">
                                                    <label class="form-label fw-bold small text-muted">Full Name</label>
                                                    <input type="text" name="fullName" class="form-control" value="${sessionScope.currentUser.fullName}" required>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold small text-muted">Email Address</label>
                                                    <input type="email" name="email" class="form-control" value="${sessionScope.currentUser.email}" required>
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold small text-muted">Phone Number</label>
                                                    <input type="text" name="phone" class="form-control" value="${sessionScope.currentUser.phoneNumber}" placeholder="e.g., 012-3456789">
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label fw-bold small text-muted">Home Address</label>
                                                <textarea name="address" class="form-control" rows="2" placeholder="Your full address...">${sessionScope.currentUser.address}</textarea>
                                            </div>

                                            <div class="row border-top pt-4 mt-2">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold small text-muted">Preferred Shift Type</label>
                                                    <select name="shiftType" class="form-select">
                                                        <option value="Morning" ${sessionScope.currentUser.shiftType == 'Morning' ? 'selected' : ''}>Morning Shift (8 AM - 4 PM)</option>
                                                        <option value="Evening" ${sessionScope.currentUser.shiftType == 'Evening' ? 'selected' : ''}>Evening Shift (3 PM - 11 PM)</option>
                                                    </select>
                                                </div>

                                                <div class="col-md-6 mb-4">
                                                    <label class="form-label fw-bold small text-muted text-danger">Update Password (Optional)</label>
                                                    <input type="password" name="password" class="form-control" placeholder="Leave blank to keep current password">
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-primary px-4 py-2 fw-bold">
                                                <i class="fa-solid fa-save me-2"></i> Save Profile Changes
                                            </button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                            
                            <!-- Manage Customer -->
                            <div id="manage-customers" class="dashboard-section">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 d-flex justify-content-between align-items-center border-bottom">                      
                                        <div class="col-md">
                                            <h4 class="widget-title"><i class="fa-solid fa-users me-2"></i> Customer Directory</h4>
                                        </div>
                                        <div class="col-md-auto">
                                            <button class="btn btn-primary fw-bold p-2 mb-3" data-bs-toggle="modal" data-bs-target="#addCustomerModal">
                                                <i class="fa-solid fa-user-plus me-2"></i> Register Customer
                                            </button>
                                        </div>                                        
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="ps-4 py-3">Customer Name</th>
                                                        <th class="py-3">Contact Details</th>
                                                        <th class="py-3">Loyalty Points</th>
                                                        <th class="text-end pe-4 py-3">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:choose>
                                                        <c:when test="${empty sessionScope.customerList}">
                                                            <tr>
                                                                <td colspan="4" class="text-center py-5 text-muted">
                                                                    <i class="fa-solid fa-folder-open fa-2x mb-3 opacity-50"></i>
                                                                    <p class="mb-0">No customers found.</p>
                                                                </td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr><td colspan="4" class="text-center py-3 text-muted">Customer data loading...</td></tr>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Manage Appointment -->
                            <div id="manage-appointments" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 d-flex justify-content-between align-items-center border-bottom">                      
                                        <div class="col-md">
                                            <h4 class="widget-title"><i class="fa-solid fa-calendar-check me-2"></i> Service Appointments</h4>
                                        </div>
                                        <div class="col-md-auto">
                                            <button class="btn btn-primary fw-bold p-2 mb-3" data-bs-toggle="modal" data-bs-target="#bookAppointmentModal">
                                                <i class="fa-solid fa-plus me-2"></i> Book Appointment
                                            </button>
                                        </div>                                        
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="ps-4 py-3">Date & Time</th>
                                                        <th class="py-3">Customer</th>
                                                        <th class="py-3">Service</th>
                                                        <th class="py-3">Technician</th>
                                                        <th class="py-3">Status</th>
                                                        <th class="text-end pe-4 py-3">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr><td colspan="6" class="text-center py-5 text-muted">Appointment data loading...</td></tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Manage Payment -->
                            <div id="manage-payments" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">                      
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-file-invoice-dollar fa-fw me-2"></i> Payments & Billing</h4>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="ps-4 py-3">Receipt No.</th>
                                                        <th class="py-3">Appointment Ref</th>
                                                        <th class="py-3">Amount Due</th>
                                                        <th class="text-end pe-4 py-3">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr><td colspan="4" class="text-center py-5 text-muted">Payment data loading...</td></tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
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
                                            <a href="#">
                                                <h3>${sessionScope.currentUser.fullName}</h3>
                                            </a>
                                            <div class="text">Counter Staff</div>
                                            
                                            <a href="#my-profile" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-user-pen fa-fw"></i> My Profile
                                            </a>
                                            <a href="#manage-customers" class="theme-btn style6 sidebar-btn active">
                                                <i class="fa-solid fa-users fa-fw"></i> Customers
                                            </a>
                                            <a href="#manage-appointments" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-calendar-check fa-fw"></i> Appointments
                                            </a>
                                            <a href="#manage-payments" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-file-invoice-dollar fa-fw"></i> Payments
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

        <jsp:include page="component/footer.jsp" />

        <script src="static/js/jquery-3.7.1.min.js"></script>
        <script src="static/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/main.js"></script>
        
        <script>
            document.addEventListener("DOMContentLoaded", function() {
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
            });
        </script>
        
    </body>
</html>