<%-- 
    Document   : manager_dashboard
    Created on : Mar 21, 2026, 10:50:30 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.SystemUser"%>
<%@page import="model.Manager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APU CARE - Manager Analytics Dashboard</title>
        
        <link rel="shortcut icon" href="static/img/favicon.png">
        <link rel="stylesheet" href="static/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/all.min.css">
        <link rel="stylesheet" href="static/css/animate.css">
        <link rel="stylesheet" href="static/css/magnific-popup.css">
        <link rel="stylesheet" href="static/css/meanmenu.css">
        <link rel="stylesheet" href="static/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="static/css/nice-select.css">
        <link rel="stylesheet" href="static/css/main.css">
        
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <style>
            .nav-pills .nav-link.active { background-color: #0d6efd; color: white; border-radius: 8px; }
            .nav-pills .nav-link { color: #6c757d; border: 1px solid #dee2e6; margin-right: 8px; transition: 0.3s; }
            .nav-pills .nav-link:hover { background-color: #f8f9fa; }
            .chart-container { position: relative; height: 300px; width: 100%; }
            @media print { .main-sidebar, .back-to-top, .dashboardNavbar, .card-header, .btn-print-hide, .nav-pills { display: none !important; } }
        </style>
    </head>

    <body class="bg-color2">

        <jsp:include page="component/preloader.jsp" />
        <div class="mouse-cursor cursor-outer"></div>
        <div class="mouse-cursor cursor-inner"></div>
        <button id="back-top" class="back-to-top"><i class="fa-regular fa-arrow-up"></i></button>

        <jsp:include page="component/offcanvas.jsp" />
        <jsp:include page="component/dashboardNavbar.jsp" />

        <div class="shop-section section-padding pt-4 fix">
            <div class="shop-wrapper style1">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-xl-9 col-lg-8 order-1 order-md-2 wow fadeInUp" data-wow-delay=".5s">
                            
                            <div id="dashboard-home" class="dashboard-section">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">
                                        <h4 class="widget-title mb-3"><i class="fa-solid fa-chart-line me-2 text-primary"></i> Business Analysis Center</h4>
                                        <ul class="nav nav-pills" id="reportTabs" role="tablist">
                                            <li class="nav-item"><button class="nav-link active small fw-bold" data-bs-toggle="pill" data-bs-target="#rpt-visual">1. Visual Summary</button></li>
                                            <li class="nav-item"><button class="nav-link small fw-bold" data-bs-toggle="pill" data-bs-target="#rpt-revenue">2. Revenue Log</button></li>
                                            <li class="nav-item"><button class="nav-link small fw-bold" data-bs-toggle="pill" data-bs-target="#rpt-staff">3. Staff Efficiency</button></li>
                                            <li class="nav-item"><button class="nav-link small fw-bold" data-bs-toggle="pill" data-bs-target="#rpt-service">4. Market Popularity</button></li>
                                            <li class="nav-item"><button class="nav-link small fw-bold" data-bs-toggle="pill" data-bs-target="#rpt-feedback">5. Satisfaction</button></li>
                                        </ul>
                                    </div>
                                    
                                    <div class="card-body p-0">
                                        <div class="tab-content p-4">
                                            
                                            <div class="tab-pane fade show active" id="rpt-visual">
                                                <div class="row text-center g-3 mb-4">
                                                    <div class="col-md-4">
                                                        <div class="p-3 border rounded-3 bg-light shadow-sm">
                                                            <h3 class="text-primary mb-0">${requestScope.statJobsCompleted}</h3>
                                                            <p class="small text-muted mb-0 fw-bold">TOTAL JOBS</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="p-3 border rounded-3 bg-light shadow-sm">
                                                            <h3 class="text-success mb-0">RM <fmt:formatNumber value="${requestScope.statTotalRevenue}" maxFractionDigits="2"/></h3>
                                                            <p class="small text-muted mb-0 fw-bold">TOTAL REVENUE</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="p-3 border rounded-3 bg-light shadow-sm">
                                                            <h3 class="text-warning mb-0">${fn:length(requestScope.staffList)}</h3>
                                                            <p class="small text-muted mb-0 fw-bold">ACTIVE STAFF</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <div class="p-3 border rounded-4 bg-white shadow-sm">
                                                            <h6 class="text-center mb-3 fw-bold text-muted">Revenue by Service (%)</h6>
                                                            <canvas id="revenueChart"></canvas>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <div class="p-3 border rounded-4 bg-white shadow-sm">
                                                            <h6 class="text-center mb-3 fw-bold text-muted">Technician Productivity (Jobs)</h6>
                                                            <canvas id="staffChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="rpt-revenue">
                                                <div class="card bg-light border-0 mb-4 shadow-sm">
                                                    <div class="card-body p-3">
                                                        <div class="row g-2 align-items-center">
                                                            <div class="col-md-3">
                                                                <label class="small fw-bold text-muted d-block">Grouping Mode</label>
                                                                <select id="revenueFilter" class="form-select form-select-sm border-primary">
                                                                    <option value="daily">Daily View</option>
                                                                    <option value="monthly">Monthly View</option>
                                                                    <option value="yearly">Yearly View</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label class="small fw-bold text-muted d-block">Start Date</label>
                                                                <input type="date" id="revStartDate" class="form-control form-control-sm">
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label class="small fw-bold text-muted d-block">End Date</label>
                                                                <input type="date" id="revEndDate" class="form-control form-control-sm">
                                                            </div>
                                                            <div class="col-md-3 d-flex align-items-end gap-1">
                                                                <button class="btn btn-sm btn-outline-secondary w-100" id="resetRevFilter">Reset</button>
                                                                <button class="btn btn-sm btn-dark btn-print-hide" onclick="window.print()"><i class="fa-solid fa-print"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="table-responsive mb-4" style="max-height: 250px; overflow-y: auto;">
                                                    <table class="table table-sm table-hover border rounded bg-white" id="revenueTable">
                                                        <thead class="table-light sticky-top">
                                                            <tr><th>Date</th><th>Customer</th><th class="text-end pe-4">Amount</th></tr>
                                                        </thead>
                                                        <tbody id="revenueTableBody">
                                                            <c:forEach items="${requestScope.allPayments}" var="p">
                                                                <tr class="payment-row" 
                                                                    data-date="<fmt:formatDate value='${p.paymentDate}' pattern='yyyy-MM-dd'/>"
                                                                    data-month="<fmt:formatDate value='${p.paymentDate}' pattern='yyyy-MM'/>"
                                                                    data-year="<fmt:formatDate value='${p.paymentDate}' pattern='yyyy'/>"
                                                                    data-amount="${p.amount}">
                                                                    <td><fmt:formatDate value="${p.paymentDate}" pattern="dd MMM yyyy"/></td>
                                                                    <td>${p.appointment.customer.fullName}</td>
                                                                    <td class="fw-bold text-success text-end pe-4">RM ${p.amount}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="p-3 border rounded-4 bg-white shadow-sm">
                                                    <h6 class="text-center mb-3 fw-bold text-muted" id="revChartTitle">Daily Revenue Trend</h6>
                                                    <div style="height: 300px;">
                                                        <canvas id="dailyRevenueChart"></canvas>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="rpt-staff">
                                                <div class="row align-items-center mb-4">
                                                    <div class="col-md-6">
                                                        <h6><i class="fa-solid fa-user-check me-2 text-primary"></i>Technician Performance Leaderboard</h6>
                                                        <p class="small text-muted">Comparison of completed jobs and total revenue contribution.</p>
                                                    </div>
                                                    <div class="col-md-6 text-end">
                                                        <button class="btn btn-sm btn-outline-primary btn-print-hide" onclick="window.print()">
                                                            <i class="fa-solid fa-download me-1"></i> Export Data
                                                        </button>
                                                    </div>
                                                </div>

                                                <div class="p-3 border rounded-4 bg-white shadow-sm mb-4">
                                                    <div style="height: 350px;">
                                                        <canvas id="staffEfficiencyChart"></canvas>
                                                    </div>
                                                </div>

                                                <div class="table-responsive">
                                                    <table class="table table-sm table-hover border-top">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th>Technician</th>
                                                                <th class="text-center">Jobs Completed</th>
                                                                <th class="text-end pe-4">Revenue Contribution</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${requestScope.staffPerformance}" var="row">
                                                                <tr>
                                                                    <td class="fw-bold text-dark">${row[0]}</td>
                                                                    <td class="text-center"><span class="badge bg-primary rounded-pill">${row[1]}</span></td>
                                                                    <td class="text-end pe-4 fw-bold text-success">RM ${row[2]}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="rpt-service">
                                                <div class="row mb-4">
                                                    <div class="col-md-7">
                                                        <h6><i class="fa-solid fa-fire-flame-curved me-2 text-danger"></i>Service Demand Analysis</h6>
                                                        <p class="small text-muted">This report identifies which services are driving your business volume.</p>

                                                        <div class="table-responsive mt-3">
                                                            <table class="table table-sm table-hover border-top shadow-sm bg-white">
                                                                <thead class="table-light">
                                                                    <tr>
                                                                        <th>Service Name</th>
                                                                        <th class="text-center">Bookings</th>
                                                                        <th class="text-end pe-3">Market Share (%)</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="popularityTableBody">
                                                                    <c:forEach items="${requestScope.servicePopularity}" var="row">
                                                                        <tr>
                                                                            <td class="fw-bold text-dark">${row[0]}</td>
                                                                            <td class="text-center">${row[1]}</td>
                                                                            <td class="text-end pe-3">
                                                                                <fmt:formatNumber value="${(row[1] / requestScope.statJobsCompleted) * 100}" maxFractionDigits="1"/>%
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-5">
                                                        <div class="p-3 border rounded-4 bg-white shadow-sm h-100 d-flex flex-column align-items-center justify-content-center">
                                                            <h6 class="text-center mb-3 fw-bold text-muted">Booking Distribution</h6>
                                                            <div style="width: 100%; max-width: 280px;">
                                                                <canvas id="marketPopularityChart"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="rpt-feedback">
                                                <div class="row">
                                                    <div class="col-md-6 mb-4">
                                                        <div class="p-3 border rounded-4 bg-white shadow-sm">
                                                            <h6 class="text-center mb-3 fw-bold text-muted">Avg. Technician Rating (Stars)</h6>
                                                            <div style="height: 300px;">
                                                                <canvas id="techRatingChart"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 mb-4">
                                                        <h6><i class="fa-solid fa-star-half-stroke me-2 text-warning"></i>Leaderboard</h6>
                                                        <div class="table-responsive">
                                                            <table class="table table-sm table-hover border-top">
                                                                <thead class="table-light">
                                                                    <tr><th>Technician</th><th class="text-end">Avg Rating</th></tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${requestScope.techRatings}" var="row">
                                                                        <tr>
                                                                            <td class="fw-bold">${row[0]}</td>
                                                                            <td class="text-end text-warning fw-bold">
                                                                                <fmt:formatNumber value="${row[1]}" maxFractionDigits="1"/> / 5.0
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <hr class="my-4">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h6><i class="fa-solid fa-comments me-2 text-primary"></i>Detailed Reviews</h6>

                                                    <div class="input-group input-group-sm shadow-sm" style="width: 250px;">
                                                        <span class="input-group-text bg-white border-end-0 text-muted">
                                                            <i class="fa-solid fa-filter"></i>
                                                        </span>
                                                        <input type="text" id="techReviewSearch" class="form-control border-start-0" placeholder="Filter by Technician Name...">
                                                    </div>
                                                </div>

                                                <div class="table-responsive" style="max-height: 250px; overflow-y: auto;">
                                                    <table class="table table-sm table-hover border rounded shadow-sm" id="techReviewTable">
                                                        <thead class="table-light sticky-top">
                                                            <tr><th>Customer</th><th>Tech</th><th>Rating</th><th>Comment</th></tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${requestScope.allComments}" var="c">
                                                                <tr class="review-row">
                                                                    <td class="small">${c.appointment.customer.fullName}</td>
                                                                    <td class="small fw-bold target-tech-name">${c.appointment.technician.fullName}</td>
                                                                    <td class="text-warning small">${c.rating}★</td>
                                                                    <td class="small text-muted fst-italic">"${c.content}"</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="manage-staff" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">
                                        <h4 class="widget-title mb-4"><i class="fa-solid fa-users-gear me-2 text-primary"></i> Staff Management</h4>

                                        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
                                            <div class="d-flex flex-grow-1 gap-2" style="max-width: 700px;">
                                                <div class="input-group input-group-sm shadow-sm flex-grow-1" style="max-width: 400px;">
                                                    <span class="input-group-text bg-white border-end-0 text-muted px-3">
                                                        <i class="fa-solid fa-magnifying-glass"></i>
                                                    </span>
                                                    <input type="text" id="staffSearch" 
                                                           class="form-control border-start-0 ps-0 py-2 fw-medium" 
                                                           placeholder="Search name or email..." 
                                                           style="border-color: #e0e0e0; font-size: 0.9rem;">
                                                </div>

                                                <div class="position-relative shadow-sm" style="min-width: 180px;">
                                                    <select id="staffTypeFilter" class="form-select form-select-sm py-2 fw-semibold text-dark" 
                                                            style="border-color: #e0e0e0; font-size: 0.85rem; cursor: pointer; background-color: #fcfcfc;">
                                                        <option value="all">All System Roles</option>
                                                        <option value="Manager">Managers</option>
                                                        <option value="Technician">Technicians</option>
                                                        <option value="CounterStaff">Counter Staff</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <button class="btn btn-primary shadow-sm px-4 py-2 d-flex align-items-center fw-bold transition-all" 
                                                    data-bs-toggle="modal" data-bs-target="#registerStaffModal"
                                                    style="border-radius: 10px; font-size: 0.85rem; gap: 8px;">
                                                <i class="fa-solid fa-plus-circle fs-6"></i> Add New Staff
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0" id="staffTable">
                                                <thead class="table-light">
                                                    <tr><th>Name</th><th>System Role</th><th>Email Address</th><th class="text-end pe-4">Actions</th></tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.staffList}" var="staff">
                                                        <tr class="staff-row" data-role="${staff.class.simpleName}">
                                                            <td class="ps-4 fw-bold staff-name">${staff.fullName}</td>
                                                            <td><span class="badge bg-secondary">${staff.class.simpleName}</span></td>
                                                            <td class="text-muted staff-email">${staff.email}</td>
                                                            <td class="text-end pe-4">
                                                                <c:if test="${staff.class.simpleName ne 'SuperManager' or sessionScope.role eq 'SUPER_MANAGER'}">
                                                                    <button class="btn btn-sm btn-outline-primary edit-staff-btn" 
                                                                            data-bs-toggle="modal" data-bs-target="#editStaffModal"
                                                                            data-id="${staff.userId}" 
                                                                            data-name="${staff.fullName}"
                                                                            data-email="${staff.email}" 
                                                                            data-role="${staff.class.simpleName}"
                                                                            data-username="${staff.username}"
                                                                            data-ic="${staff.icNumber}"
                                                                            data-phone="${staff.phoneNumber}"
                                                                            data-address="${staff.address}"
                                                                            data-active="${staff.isActive}">
                                                                        <i class="fa-solid fa-pen"></i>
                                                                    </button>
                                                                    <a href="DeleteStaffServlet?id=${staff.userId}" class="btn btn-sm btn-outline-danger" 
                                                                       onclick="return confirm('Permanently delete ${staff.fullName}?');"><i class="fa-solid fa-trash"></i></a>
                                                                </c:if>

                                                                <c:if test="${staff.class.simpleName eq 'SuperManager' and sessionScope.role ne 'SUPER_MANAGER'}">
                                                                    <span class="badge bg-light text-muted border shadow-sm">
                                                                        <i class="fa-solid fa-shield-halved text-danger me-1"></i> Clearance Required
                                                                    </span>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="service-pricing" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 d-flex justify-content-between align-items-center border-bottom">                      
                                        <h4 class="widget-title mb-0">Manage Service Menu</h4>
                                        <button class="btn btn-primary fw-bold" data-bs-toggle="modal" data-bs-target="#addServiceModal">
                                            <i class="fa-solid fa-plus me-2"></i> Add Service
                                        </button>                                      
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead class="table-light">
                                                    <tr><th class="ps-4">Service Name</th><th>Price</th><th>Time Est.</th><th class="text-end pe-4">Actions</th></tr>
                                                </thead>
                                                <tbody>
                                                    <c:choose>
                                                        <c:when test="${empty requestScope.serviceList}">
                                                            <tr>
                                                                <td colspan="4" class="text-center py-5 text-muted">
                                                                    <i class="fa-solid fa-clipboard-question fa-3x mb-3 opacity-25"></i>
                                                                    <h5>No Services Found</h5>
                                                                    <p class="small">Click "Add Service" above to populate your menu.</p>
                                                                </td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${requestScope.serviceList}" var="service">
                                                                <tr>
                                                                    <td class="ps-4 fw-bold">${service.name}</td>
                                                                    <td class="text-success fw-bold">RM ${service.price}</td>
                                                                    <td>${service.durationHours} hrs</td>
                                                                    <td class="text-end pe-4">

                                                                        <button class="btn btn-sm btn-outline-primary edit-service-btn" 
                                                                                data-bs-toggle="modal" data-bs-target="#editServiceModal"
                                                                                data-id="${service.id}" data-name="${service.name}"
                                                                                data-description="${service.description}"
                                                                                data-price="${service.price}" data-duration="${service.durationHours}">
                                                                            <i class="fa-solid fa-pen"></i>
                                                                        </button>

                                                                        <a href="DeleteServiceServlet?id=${service.id}" 
                                                                           class="btn btn-sm btn-outline-danger ms-1" 
                                                                           onclick="return confirm('Are you sure you want to permanently delete ${service.name}?');">
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

                            <div id="view-appointment" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    
                                    <div class="card-header bg-white p-4 border-bottom">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="widget-title mb-0"><i class="fa-solid fa-calendar-check me-2 text-primary"></i> All Appointments</h4>
                                            <span class="badge bg-light text-dark border fw-bold px-3 py-2 shadow-sm">Total: ${fn:length(requestScope.allAppointments)}</span>
                                        </div>

                                        <div class="row g-2 align-items-center bg-light p-3 rounded-3 border">
                                            <div class="col-md-4">
                                                <label class="small fw-bold text-muted mb-1">Search Records</label>
                                                <div class="input-group input-group-sm shadow-sm">
                                                    <span class="input-group-text bg-white border-end-0 text-muted px-3"><i class="fa-solid fa-magnifying-glass"></i></span>
                                                    <input type="text" id="appSearch" class="form-control border-start-0 ps-0 py-2 fw-medium" placeholder="Search ID, Customer, Tech..." style="border-color: #e0e0e0;">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="small fw-bold text-muted mb-1">Filter by Status</label>
                                                <select id="appStatusFilter" class="form-select form-select-sm py-2 shadow-sm fw-medium text-dark" style="border-color: #e0e0e0;">
                                                    <option value="all">All Statuses</option>
                                                    <option value="Pending">Pending</option>
                                                    <option value="In Progress">In Progress</option>
                                                    <option value="Completed">Completed</option>
                                                    <option value="Paid">Paid</option>
                                                    <option value="Cancelled">Cancelled</option>
                                                </select>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="small fw-bold text-muted mb-1">Filter by Date</label>
                                                <input type="date" id="appDateFilter" class="form-control form-control-sm py-2 shadow-sm fw-medium text-dark" style="border-color: #e0e0e0;">
                                            </div>
                                            <div class="col-md-2 d-flex align-items-end">
                                                <button class="btn btn-sm btn-outline-secondary w-100 py-2 shadow-sm fw-bold transition-all" id="appClearFilters">
                                                    <i class="fa-solid fa-rotate-right me-1"></i> Reset
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body p-0">
                                        <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                                            <table class="table table-hover align-middle mb-0" id="appointmentTable">
                                                <thead class="table-light sticky-top">
                                                    <tr>
                                                        <th class="ps-4">ID</th>
                                                        <th>Date</th>
                                                        <th>Customer</th>
                                                        <th>Technician</th>
                                                        <th>Service</th>
                                                        <th>Status</th>
                                                        <th class="text-end pe-4">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.allAppointments}" var="app">
                                                        <tr class="appointment-row transition-all" 
                                                            data-status="${app.status}" 
                                                            data-date="<fmt:formatDate value='${app.appointmentDate}' pattern='yyyy-MM-dd'/>"
                                                            onclick="window.location='ViewAppointmentDetailsServlet?id=${app.id}'" style="cursor: pointer;">
                                                            
                                                            <td class="ps-4 text-muted small">#${app.id}</td>
                                                            <td class="fw-bold"><fmt:formatDate value="${app.appointmentDate}" pattern="dd MMM yyyy"/></td>
                                                            <td>${app.customer.fullName}</td>
                                                            <td>
                                                                <span class="small text-dark"><i class="fa-solid fa-wrench me-1 text-muted"></i> 
                                                                    <c:choose>
                                                                        <c:when test="${not empty app.technician}">${app.technician.fullName}</c:when>
                                                                        <c:otherwise>Unassigned</c:otherwise>
                                                                    </c:choose>
                                                                </span>
                                                            </td>
                                                            <td>${app.serviceType.name}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${app.status == 'Paid' || app.status == 'Completed'}"><span class="badge bg-success-subtle text-success px-2 border border-success-subtle">${app.status}</span></c:when>
                                                                    <c:when test="${app.status == 'Pending'}"><span class="badge bg-warning-subtle text-warning px-2 border border-warning-subtle">Pending</span></c:when>
                                                                    <c:when test="${app.status == 'Cancelled'}"><span class="badge bg-danger-subtle text-danger px-2 border border-danger-subtle">Cancelled</span></c:when>
                                                                    <c:otherwise><span class="badge bg-secondary-subtle text-secondary px-2 border">${app.status}</span></c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td class="text-end pe-4">
                                                                <i class="fa-solid fa-chevron-right text-muted small"></i>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="edit-profile" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-user-gear me-2 text-primary"></i> Profile Settings</h4>
                                    </div>
                                    <div class="card-body p-4">
                                        <form action="UpdateProfileServlet" method="POST">
                                            <input type="hidden" name="userId" value="${sessionScope.currentUser.userId}">

                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Full Name</label>
                                                    <input type="text" class="form-control" name="fullName" value="${sessionScope.currentUser.fullName}" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Username</label>
                                                    <input type="text" class="form-control bg-light" name="username" value="${sessionScope.currentUser.username}" readonly>
                                                    <small class="text-muted">Username cannot be changed.</small>
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Email Address</label>
                                                    <input type="email" class="form-control bg-light" name="email" value="${sessionScope.currentUser.email}" readonly>
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">IC / Passport Number</label>
                                                    <input type="text" class="form-control bg-light" name="icNumber" value="${sessionScope.currentUser.icNumber}" readonly>
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Phone Number</label>
                                                    <input type="text" class="form-control" name="phoneNumber" value="${sessionScope.currentUser.phoneNumber}" required>
                                                </div>
                                                <c:if test="${sessionScope.role eq 'Manager'}">
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label fw-bold">Office Location</label>
                                                        <input type="text" class="form-control" name="officeLocation" value="${sessionScope.currentUser.officeLocation}">
                                                    </div>
                                                </c:if>

                                                <c:if test="${sessionScope.role eq 'SUPER_MANAGER'}">
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label fw-bold">Master Clearance</label>
                                                        <input type="text" class="form-control" name="masterClearance" value="${sessionScope.currentUser.masterClearance}">
                                                    </div>
                                                </c:if>
                                                <div class="col-md-12 mb-3">
                                                    <label class="form-label fw-bold">Home Address</label>
                                                    <textarea class="form-control" name="address" rows="2">${sessionScope.currentUser.address}</textarea>
                                                </div>

                                                <div class="col-12 mt-3">
                                                    <div class="p-3 border rounded-3 bg-light">
                                                        <h6 class="text-danger fw-bold mb-2"><i class="fa-solid fa-lock me-2"></i>Security Update</h6>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="form-label small">New Password (Optional)</label>
                                                                <input type="password" class="form-control" name="password" placeholder="Leave blank to keep current">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label small">Confirm New Password</label>
                                                                <input type="password" class="form-control" name="confirmPassword" placeholder="Repeat new password">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="text-end mt-4 border-top pt-3">
                                                <button type="submit" class="btn btn-primary fw-bold px-5">
                                                    <i class="fa-solid fa-save me-2"></i> Save All Changes
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="ai-assistance" class="dashboard-section" style="display: none;">
                                <div class="card p-4 shadow-sm mb-4">
                                    <h5><i class="fa-solid fa-wand-magic-sparkles text-warning me-2"></i>Ask the AI Assistant</h5>
                                    <div class="input-group">
                                        <input type="text" id="aiQuery" class="form-control" placeholder="e.g., Show me total revenue by service type for this month">
                                        <button class="btn btn-dark" onclick="askAI()">Ask</button>
                                    </div>

                                    <div id="aiResults" class="mt-3 table-responsive"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xl-3 col-lg-4 order-2 order-md-1 wow fadeInUp" data-wow-delay=".3s">
                            <div class="main-sidebar mt-0">
                                <div class="single-sidebar-widget pt-4">
                                    <div class="dishes-card mt-0 pt-3 style2 text-center p-4 shadow-sm border-0 rounded-4">
                                        <div class="bg-primary bg-opacity-10 text-primary rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px; font-size: 30px;">
                                            <i class="fa-solid fa-user-tie"></i>
                                        </div>
                                        <h5 class="mb-1">${sessionScope.currentUser.fullName}</h5>
                                        <p class="small text-muted mb-4 fw-bold">SYSTEM MANAGER</p>
                                        
                                        <a href="#dashboard-home" class="theme-btn style6 sidebar-btn active w-100 mb-2">Reports Center</a>
                                        <a href="#manage-staff" class="theme-btn style6 sidebar-btn w-100 mb-2">Staff Records</a>
                                        <a href="#service-pricing" class="theme-btn style6 sidebar-btn w-100 mb-2">Pricing Manager</a>
                                        <a href="#view-appointment" class="theme-btn style6 sidebar-btn w-100 mb-2">Job Reports</a>
                                        <a href="#edit-profile" class="theme-btn style6 sidebar-btn w-100">Profile Settings</a>
                                        <a href="#ai-assistance" class="theme-btn style6 sidebar-btn w-100">AI Assistance</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="component/staffCreationPopUp.jsp" />
        <jsp:include page="component/staffUpdatePopUp.jsp" />
        <jsp:include page="component/serviceCreationPopUp.jsp" />
        <jsp:include page="component/serviceUpdatePopUp.jsp" />
        <jsp:include page="component/footer.jsp" />

        <script src="static/js/jquery-3.7.1.min.js"></script>
        <script src="static/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                // 1. Smooth Tab Switching Logic
                const sidebarButtons = document.querySelectorAll('.sidebar-btn');
                const dashboardSections = document.querySelectorAll('.dashboard-section');

                function activateTab(targetId) {
                    dashboardSections.forEach(section => section.style.display = 'none');
                    sidebarButtons.forEach(btn => btn.classList.remove('active'));
                    const targetSection = document.getElementById(targetId);
                    if (targetSection) targetSection.style.display = 'block';
                    const targetButton = document.querySelector(`.sidebar-btn[href="#${targetId}"]`);
                    if (targetButton) targetButton.classList.add('active');
                }

                sidebarButtons.forEach(button => {
                    button.addEventListener('click', function(e) {
                        e.preventDefault(); 
                        const id = this.getAttribute('href').substring(1);
                        history.pushState(null, null, '#' + id);
                        activateTab(id);
                    });
                });

                if (window.location.hash) activateTab(window.location.hash.substring(1));

                // 2. Staff Search Filtering
                const staffSearch = document.getElementById('staffSearch');
                const staffTypeFilter = document.getElementById('staffTypeFilter');

                function filterStaffTable() {
                    const searchTerm = staffSearch.value.toLowerCase();
                    const roleFilter = staffTypeFilter.value; 
                    const rows = document.querySelectorAll('.staff-row');

                    rows.forEach(row => {
                        const name = row.querySelector('.staff-name').innerText.toLowerCase();
                        const email = row.querySelector('.staff-email').innerText.toLowerCase();
                        const role = row.getAttribute('data-role'); 

                        const matchesSearch = name.includes(searchTerm) || email.includes(searchTerm);
                        const matchesRole = (roleFilter === 'all' || role === roleFilter);

                        if (matchesSearch && matchesRole) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                }

                if (staffSearch) staffSearch.addEventListener('keyup', filterStaffTable);
                if (staffTypeFilter) staffTypeFilter.addEventListener('change', filterStaffTable);

                // 3. Modal Data Population
                const editModal = document.getElementById('editStaffModal');
                if (editModal) {
                    editModal.addEventListener('show.bs.modal', function (e) {
                        const b = e.relatedTarget;

                        document.getElementById('edit-staff-id').value = b.dataset.id;
                        document.getElementById('edit-staff-name').value = b.dataset.name;
                        document.getElementById('edit-staff-email').value = b.dataset.email;
                        document.getElementById('edit-staff-role').value = b.dataset.role;
                        document.getElementById('edit-staff-username').value = b.dataset.username; 
                        document.getElementById('edit-staff-ic').value = b.dataset.ic;             
                        document.getElementById('edit-staff-phone').value = b.dataset.phone;       
                        document.getElementById('edit-staff-address').value = b.dataset.address;   
                        document.getElementById('edit-staff-active').value = b.dataset.active;     

                        // Hide all special fields first
                        document.getElementById('edit-manager-fields').style.display = 'none';
                        document.getElementById('edit-technician-fields').style.display = 'none';
                        document.getElementById('edit-counter-fields').style.display = 'none';

                        // Show the correct special fields based on role
                        if (b.dataset.role === 'Manager') {
                            document.getElementById('edit-manager-fields').style.display = 'block';
                            document.getElementById('edit-staff-office').value = b.dataset.office || '';
                        } else if (b.dataset.role === 'Technician') {
                            document.getElementById('edit-technician-fields').style.display = 'block';
                            document.getElementById('edit-staff-spec').value = b.dataset.spec || '';
                        } else if (b.dataset.role === 'CounterStaff') {
                            document.getElementById('edit-counter-fields').style.display = 'block';
                            document.getElementById('edit-staff-shift').value = b.dataset.shift || 'Morning (8AM - 4PM)';
                        }
                    });
                }

                const editSvcModal = document.getElementById('editServiceModal');
                if (editSvcModal) {
                    editSvcModal.addEventListener('show.bs.modal', function (e) {
                        const b = e.relatedTarget;
                        document.getElementById('edit-service-id').value = b.dataset.id;
                        document.getElementById('edit-service-name').value = b.dataset.name;
                        document.getElementById('edit-service-description').value = b.dataset.description;
                        document.getElementById('edit-service-price').value = b.dataset.price;
                        document.getElementById('edit-service-duration').value = b.dataset.duration;
                    });
                }

                // 4. CHART.JS ANALYTICS INITIALIZATION
                const serviceLabels = [], serviceData = [];
                <c:forEach items="${requestScope.servicePopularity}" var="row">
                    serviceLabels.push("${row[0]}");
                    serviceData.push(${row[2]});
                </c:forEach>

                const staffLabels = [], staffJobs = [];
                <c:forEach items="${requestScope.staffPerformance}" var="row">
                    staffLabels.push("${row[0]}");
                    staffJobs.push(${row[1]});
                </c:forEach>

                if (document.getElementById('revenueChart')) {
                    new Chart(document.getElementById('revenueChart'), {
                        type: 'doughnut',
                        data: {
                            labels: serviceLabels,
                            datasets: [{
                                data: serviceData,
                                backgroundColor: ['#0d6efd', '#198754', '#ffc107', '#dc3545', '#6610f2', '#fd7e14'],
                            }]
                        },
                        options: { maintainAspectRatio: true, plugins: { legend: { position: 'bottom' } } }
                    });
                }

                if (document.getElementById('staffChart')) {
                    new Chart(document.getElementById('staffChart'), {
                        type: 'bar',
                        data: {
                            labels: staffLabels,
                            datasets: [{
                                label: 'Jobs',
                                data: staffJobs,
                                backgroundColor: 'rgba(13, 110, 253, 0.7)',
                                borderColor: '#0d6efd',
                                borderWidth: 1
                            }]
                        },
                        options: { 
                            scales: { y: { beginAtZero: true, ticks: { stepSize: 1 } } },
                            plugins: { legend: { display: false } }
                        }
                    });
                }
                
                const revFilter = document.getElementById('revenueFilter');
                const revStart = document.getElementById('revStartDate');
                const revEnd = document.getElementById('revEndDate');
                const revReset = document.getElementById('resetRevFilter');
                let revChart;

                function updateRevenueReport() {
                    const mode = revFilter.value;
                    const startDate = revStart.value; 
                    const endDate = revEnd.value;     
                    const rows = document.querySelectorAll('.payment-row');
                    const revenueData = {}; 

                    if(document.getElementById('revChartTitle')) {
                        document.getElementById('revChartTitle').innerText = mode.charAt(0).toUpperCase() + mode.slice(1) + " Revenue Trend";
                    }

                    rows.forEach(row => {
                        const rowDate = row.getAttribute('data-date');
                        const amount = parseFloat(row.getAttribute('data-amount'));
                        
                        let isVisible = true;
                        if (startDate && rowDate < startDate) isVisible = false;
                        if (endDate && rowDate > endDate) isVisible = false;

                        row.style.display = isVisible ? '' : 'none';

                        if (isVisible) {
                            let key;
                            if (mode === 'daily') key = rowDate;
                            else if (mode === 'monthly') key = row.getAttribute('data-month');
                            else key = row.getAttribute('data-year');

                            revenueData[key] = (revenueData[key] || 0) + amount;
                        }
                    });

                    const labels = Object.keys(revenueData).sort();
                    const values = labels.map(label => revenueData[label]);
                    
                    if (document.getElementById('dailyRevenueChart')) {
                        const ctx = document.getElementById('dailyRevenueChart').getContext('2d');
                        if (revChart) revChart.destroy();
                        revChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: labels,
                                datasets: [{
                                    label: 'Revenue (RM)',
                                    data: values,
                                    backgroundColor: '#198754',
                                    borderRadius: 5
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: { y: { beginAtZero: true } }
                            }
                        });
                    }
                }

                if(revFilter) revFilter.addEventListener('change', updateRevenueReport);
                if(revStart) revStart.addEventListener('change', updateRevenueReport);
                if(revEnd) revEnd.addEventListener('change', updateRevenueReport);
                
                if(revReset) {
                    revReset.addEventListener('click', () => {
                        revStart.value = '';
                        revEnd.value = '';
                        revFilter.value = 'daily';
                        updateRevenueReport();
                    });
                }

                // Run on load
                updateRevenueReport();
                
                // --- STAFF EFFICIENCY ANALYTICS ---
                const staffNamesEff = [];
                const staffJobCountsEff = [];
                const staffRevenueEff = [];

                <c:forEach items="${requestScope.staffPerformance}" var="row">
                    staffNamesEff.push("${row[0]}");
                    staffJobCountsEff.push(${row[1]});
                    staffRevenueEff.push(${row[2]});
                </c:forEach>

                const ctxStaffEff = document.getElementById('staffEfficiencyChart');
                if (ctxStaffEff) {
                    new Chart(ctxStaffEff, {
                        type: 'bar',
                        data: {
                            labels: staffNamesEff,
                            datasets: [
                                {
                                    label: 'Jobs Completed',
                                    data: staffJobCountsEff,
                                    backgroundColor: '#0d6efd',
                                    borderRadius: 5,
                                    xAxisID: 'x'
                                },
                                {
                                    label: 'Revenue (RM)',
                                    data: staffRevenueEff,
                                    backgroundColor: '#198754',
                                    borderRadius: 5,
                                    xAxisID: 'x1'
                                }
                            ]
                        },
                        options: {
                            indexAxis: 'y',
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { position: 'top' },
                                tooltip: { mode: 'index', intersect: false }
                            },
                            scales: {
                                x: {
                                    beginAtZero: true,
                                    title: { display: true, text: 'Number of Jobs' }
                                },
                                x1: {
                                    beginAtZero: true,
                                    position: 'top',
                                    title: { display: true, text: 'Revenue (RM)' },
                                    grid: { drawOnChartArea: false }
                                }
                            }
                        }
                    });
                }
                
                // --- MARKET POPULARITY ANALYTICS ---
                const popularityLabels = [];
                const popularityData = [];

                <c:forEach items="${requestScope.servicePopularity}" var="row">
                    popularityLabels.push("${row[0]}");
                    popularityData.push(${row[1]});
                </c:forEach>

                const ctxPop = document.getElementById('marketPopularityChart');
                if (ctxPop) {
                    new Chart(ctxPop, {
                        type: 'doughnut',
                        data: {
                            labels: popularityLabels,
                            datasets: [{
                                label: 'Total Bookings',
                                data: popularityData,
                                backgroundColor: [
                                    '#0d6efd', '#6610f2', '#6f42c1', '#d63384', 
                                    '#dc3545', '#fd7e14', '#ffc107', '#198754'
                                ],
                                borderWidth: 2,
                                borderColor: '#ffffff',
                                hoverOffset: 15
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: true,
                            plugins: {
                                legend: {
                                    position: 'bottom',
                                    labels: { usePointStyle: true, padding: 20, font: { size: 11 } }
                                }
                            },
                            cutout: '65%'
                        }
                    });
                }
                
                // --- TECHNICIAN SATISFACTION ANALYTICS ---
                const techNames = [];
                const avgRatings = [];

                <c:forEach items="${requestScope.techRatings}" var="row">
                    techNames.push("${row[0]}");
                    avgRatings.push(${row[1]});
                </c:forEach>

                const ctxRating = document.getElementById('techRatingChart');
                if (ctxRating) {
                    new Chart(ctxRating, {
                        type: 'bar',
                        data: {
                            labels: techNames,
                            datasets: [{
                                label: 'Average Stars',
                                data: avgRatings,
                                backgroundColor: 'rgba(255, 193, 7, 0.7)',
                                borderColor: '#ffc107',
                                borderWidth: 2,
                                borderRadius: 8
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                y: { beginAtZero: true, max: 5, ticks: { stepSize: 1 } }
                            },
                            plugins: { legend: { display: false } }
                        }
                    });
                }
                
                // --- DETAILED REVIEW TABLE FILTER ---
                const techReviewSearch = document.getElementById('techReviewSearch');
                
                if (techReviewSearch) {
                    techReviewSearch.addEventListener('keyup', function() {
                        const term = this.value.toLowerCase();
                        const rows = document.querySelectorAll('#techReviewTable .review-row');
                        
                        rows.forEach(row => {
                            const techName = row.querySelector('.target-tech-name').innerText.toLowerCase();
                            if (techName.includes(term)) {
                                row.style.display = '';
                            } else {
                                row.style.display = 'none';
                            }
                        });
                    });
                }
                
                // --- 3-WAY APPOINTMENT MASTER FILTER ---
                const appSearch = document.getElementById('appSearch');
                const appStatusFilter = document.getElementById('appStatusFilter');
                const appDateFilter = document.getElementById('appDateFilter');
                const appClearFilters = document.getElementById('appClearFilters');

                function filterAppointments() {
                    const searchTerm = appSearch.value.toLowerCase();
                    const statusTerm = appStatusFilter.value;
                    const dateTerm = appDateFilter.value; 
                    const rows = document.querySelectorAll('.appointment-row');

                    rows.forEach(row => {
                        const rowText = row.innerText.toLowerCase(); 
                        const rowStatus = row.getAttribute('data-status');
                        const rowDate = row.getAttribute('data-date'); 

                        const matchesSearch = rowText.includes(searchTerm);
                        const matchesStatus = (statusTerm === 'all' || rowStatus === statusTerm);
                        const matchesDate = (!dateTerm || rowDate === dateTerm); 

                        if (matchesSearch && matchesStatus && matchesDate) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                }

                if (appSearch) appSearch.addEventListener('keyup', filterAppointments);
                if (appStatusFilter) appStatusFilter.addEventListener('change', filterAppointments);
                if (appDateFilter) appDateFilter.addEventListener('change', filterAppointments);

                if (appClearFilters) {
                    appClearFilters.addEventListener('click', () => {
                        appSearch.value = '';
                        appStatusFilter.value = 'all';
                        appDateFilter.value = '';
                        filterAppointments(); 
                    });
                }
            });
            async function askAI() {
                const query = document.getElementById('aiQuery').value;
                const resultsDiv = document.getElementById('aiResults');

                resultsDiv.innerHTML = "<p class='text-muted'><i class='fa-solid fa-spinner fa-spin me-2'></i> Thinking and querying database...</p>";

                // Send the question to your Servlet without reloading the page
                const response = await fetch('AIAssistantServlet', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'question=' + encodeURIComponent(query)
                });

                // Display the HTML table returned by the Servlet
                const html = await response.text();
                resultsDiv.innerHTML = html;
            }
        </script>
        
        <c:if test="${not empty sessionScope.popupMessage}">
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        icon: '${not empty sessionScope.popupType ? sessionScope.popupType : "info"}', 
                        title: '${sessionScope.popupType == "error" ? "Oops!" : "Success!"}',
                        
                        text: `${sessionScope.popupMessage}`, 
                        
                        confirmButtonColor: '#0d6efd',
                        confirmButtonText: 'OK'
                    });
                });
            </script>
            <c:remove var="popupMessage" scope="session" />
            <c:remove var="popupType" scope="session" />
        </c:if>
    </body>
</html>