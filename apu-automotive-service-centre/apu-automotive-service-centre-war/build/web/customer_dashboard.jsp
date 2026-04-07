<%-- 
    Document   : customer_dashboard
    Created on : Mar 21, 2026, 10:51:22 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.SystemUser"%>
<%@page import="model.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APU CARE - Customer Dashboard</title>
        
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
        <jsp:include page="component/dashboardNavbar.jsp" />

        <div class="shop-section section-padding pt-4 fix">
            <div class="shop-wrapper style1">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-xl-9 col-lg-8 order-1 order-md-2 wow fadeInUp" data-wow-delay=".5s">
                            
                            <div id="edit-profile" class="dashboard-section">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-user-pen me-2"></i> Edit My Profile</h4>
                                    </div>
                                    <div class="card-body p-4">
                                        <form action="UpdateProfileServlet" method="POST">
                                            <input type="hidden" name="userId" value="${sessionScope.currentUser.userId}">

                                            <h5 class="mb-3 text-primary"><i class="fa-solid fa-address-card me-2"></i>General Information</h5>
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Full Name</label>
                                                    <input type="text" class="form-control" name="fullName" value="${sessionScope.currentUser.fullName}" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Username</label>
                                                    <input type="text" class="form-control bg-light" name="username" value="${sessionScope.currentUser.username}" readonly>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Email Address</label>
                                                    <input type="email" class="form-control bg-light" name="email" value="${sessionScope.currentUser.email}" readonly>
                                                    <small class="text-muted">Contact an admin to change your email.</small>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">IC Number</label>
                                                    <input type="text" class="form-control bg-light" name="icNumber" value="${sessionScope.currentUser.icNumber}" readonly>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Phone Number</label>
                                                    <input type="text" class="form-control" name="phoneNumber" value="${sessionScope.currentUser.phoneNumber}">
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold text-danger"><i class="fa-solid fa-lock me-1"></i> Update Password (Optional)</label>
                                                    <input type="password" class="form-control border-danger border-opacity-25" name="password" placeholder="Leave blank to keep current">
                                                </div>
                                                <div class="col-md-12 mb-3 mt-2">
                                                    <label class="form-label fw-bold">Home Address</label>
                                                    <textarea class="form-control" name="address" rows="2" placeholder="Enter your full address...">${sessionScope.currentUser.address}</textarea>
                                                </div>
                                            </div>
                                            <div class="text-end mt-4 border-top pt-3">
                                                <button type="submit" class="btn btn-primary fw-bold px-4 py-2">Save Profile Updates</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="current-appointments" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-location-crosshairs text-primary me-2"></i> Live Service Tracker</h4>
                                    </div>
                                    <div class="card-body p-4 bg-light">
                                        <c:set var="hasActive" value="false" />
                                        
                                        <c:forEach items="${requestScope.myAppointments}" var="appt">
                                            <c:if test="${appt.status == 'Scheduled' || appt.status == 'In Progress'}">
                                                <c:set var="hasActive" value="true" />
                                                <div class="card mb-4 border-0 shadow-sm rounded-4">
                                                    <div class="card-body p-4">
                                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                                            <h5 class="fw-bold mb-0">${appt.carPlateNumber} - ${appt.serviceType.name}</h5>
                                                            <span class="badge bg-${appt.status == 'Scheduled' ? 'primary' : 'warning text-dark'} fs-6 px-3 py-2">${appt.status}</span>
                                                        </div>
                                                        <div class="text-muted small mb-4">
                                                            <i class="fa-regular fa-clock me-1"></i> Booked for: <fmt:formatDate value="${appt.appointmentDate}" pattern="dd MMM yyyy" /> at ${appt.appointmentTime}
                                                        </div>
                                                        <c:set var="progress" value="0" />
                                                        <c:if test="${appt.status == 'Scheduled'}"><c:set var="progress" value="25" /></c:if>
                                                        <c:if test="${appt.status == 'In Progress'}"><c:set var="progress" value="65" /></c:if>
                                                        <div class="position-relative m-4">
                                                            <div class="progress" style="height: 8px;">
                                                                <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${progress}%;"></div>
                                                            </div>
                                                            <div class="position-absolute top-50 start-0 translate-middle bg-${progress >= 0 ? 'primary' : 'secondary'} rounded-circle" style="width: 20px; height: 20px;"></div>
                                                            <div class="position-absolute top-50 start-50 translate-middle bg-${progress >= 50 ? 'primary' : 'secondary'} rounded-circle" style="width: 20px; height: 20px;"></div>
                                                            <div class="position-absolute top-50 start-100 translate-middle bg-secondary rounded-circle" style="width: 20px; height: 20px;"></div>
                                                        </div>
                                                        <div class="d-flex justify-content-between text-muted small mt-2 fw-bold px-2">
                                                            <span>Scheduled</span>
                                                            <span>In Garage</span>
                                                            <span>Ready</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${!hasActive}">
                                            <div class="text-center py-5 text-muted">
                                                <i class="fa-solid fa-mug-hot fa-3x mb-3 opacity-25"></i>
                                                <h5>No active appointments.</h5>
                                                <p class="small">Your car is currently safe with you!</p>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="history" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom d-flex justify-content-between align-items-center row">
                                        <div class="d-flex justify-content-between align-items-center col-md-4">
                                            <h4 class="widget-title mb-0"><i class="fa-solid fa-file-invoice-dollar me-2"></i> Service History</h4>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="input-group shadow-sm">
                                                <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-solid fa-magnifying-glass"></i></span>
                                                <input type="text" id="historySearch" class="form-control border-start-0 ps-1" placeholder="Search by Plate No or Service...">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group shadow-sm">
                                                <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-regular fa-calendar"></i></span>
                                                <input type="date" id="historyDate" class="form-control border-start-0 ps-1">
                                                <button class="btn btn-primary" type="button" id="clearDateBtn" title="Clear Date"><i class="fa-solid fa-rotate-left"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body p-0">

                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0" id="historyTable">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="ps-4 py-3">Date & Time</th>
                                                        <th class="py-3">Vehicle & Service</th>
                                                        <th class="py-3">Status</th>
                                                        <th class="py-3 text-end pe-4">Action</th> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:choose>
                                                        <c:when test="${empty requestScope.myAppointments}">
                                                            <tr>
                                                                <td colspan="4" class="text-center py-5 text-muted">
                                                                    <i class="fa-solid fa-car-side fa-3x mb-3 opacity-25"></i>
                                                                    <h5>No service history found.</h5>
                                                                    <p class="small">When you book a service, it will appear here!</p>
                                                                </td>
                                                            </tr>
                                                        </c:when>
                                                        
                                                        <c:otherwise>
                                                            <c:forEach items="${requestScope.myAppointments}" var="appt">
                                                                <tr class="view-appt-row" style="cursor: pointer;"
                                                                    data-appid="${appt.id}"
                                                                    data-filterdate="<fmt:formatDate value='${appt.appointmentDate}' pattern='yyyy-MM-dd' />"
                                                                    data-date="<fmt:formatDate value='${appt.appointmentDate}' pattern='dd MMM yyyy' />"
                                                                    data-time="${appt.appointmentTime}"
                                                                    data-plate="${appt.carPlateNumber}"
                                                                    data-service="${appt.serviceType.name}"
                                                                    data-status="${appt.status}"
                                                                    data-remarks="${not empty appt.remarks ? appt.remarks : 'No additional notes provided.'}"
                                                                    data-price="${appt.serviceType.price}" 
                                                                    data-method="Online / Credit Card">
                                                                    
                                                                    <td class="ps-4">
                                                                        <div class="fw-bold"><fmt:formatDate value="${appt.appointmentDate}" pattern="dd MMM yyyy" /></div>
                                                                        <small class="text-muted"><i class="fa-regular fa-clock me-1"></i>${appt.appointmentTime}</small>
                                                                    </td>
                                                                    <td>
                                                                        <div class="fw-bold text-uppercase">${appt.carPlateNumber}</div>
                                                                        <small class="text-muted">${appt.serviceType.name}</small>
                                                                    </td>
                                                                    <td>
                                                                        <span class="badge bg-${appt.status == 'Paid' ? 'success' : (appt.status == 'Completed' ? 'info' : (appt.status == 'In Progress' ? 'warning text-dark' : 'primary'))} d-inline-block">
                                                                            ${appt.status}
                                                                        </span>
                                                                    </td>
                                                                    
                                                                    <td class="text-end pe-4">
                                                                        <div class="d-flex justify-content-end gap-2">
                                                                            
                                                                            <c:if test="${appt.status == 'Paid'}">
                                                                                <button class="btn btn-sm btn-outline-success border-opacity-50" style="font-size: 0.75rem;" onclick="event.stopPropagation(); printReceipt(
                                                                                    '${appt.id}', 
                                                                                    '<fmt:formatDate value='${appt.appointmentDate}' pattern='dd MMM yyyy' />', 
                                                                                    '${sessionScope.currentUser.fullName}', 
                                                                                    '${appt.carPlateNumber}', 
                                                                                    '${appt.serviceType.name}', 
                                                                                    'Online/Card', 
                                                                                    '${appt.serviceType.price}'
                                                                                )">
                                                                                    <i class="fa-solid fa-file-pdf me-1"></i> Receipt
                                                                                </button>
                                                                            </c:if>
                                                                            
                                                                            <%-- Review Logic --%>
                                                                            <c:set var="hasReviewed" value="false" />
                                                                            <c:set var="reviewRating" value="0" />

                                                                            <%-- 1. Search the comments quietly without printing anything yet --%>
                                                                            <c:forEach items="${requestScope.myComments}" var="comment">
                                                                                <c:if test="${comment.appointment.id eq appt.id}">
                                                                                    <c:set var="hasReviewed" value="true" />
                                                                                    <c:set var="reviewRating" value="${comment.rating}" />
                                                                                </c:if>
                                                                            </c:forEach>

                                                                            <%-- 2. Now, print EXACTLY ONE button based on what we found --%>
                                                                            <c:choose>
                                                                                <c:when test="${hasReviewed}">
                                                                                    <a href="#comment" onclick="event.stopPropagation(); activateTab('comment');" class="btn btn-sm btn-primary border-opacity-50" style="font-size: 0.75rem;">
                                                                                        <i class="fa-regular fa-comment-dots me-1"></i> View Review (${reviewRating}★)
                                                                                    </a>
                                                                                </c:when>
                                                                                <c:when test="${!hasReviewed && appt.status == 'Paid'}">
                                                                                    <button type="button" class="btn btn-sm btn-warning fw-bold border-opacity-50" style="font-size: 0.75rem;" 
                                                                                            data-bs-toggle="modal" data-bs-target="#writeReviewModal" 
                                                                                            onclick="event.stopPropagation(); document.getElementById('review-appt-id').value = '${appt.id}'; document.getElementById('review-appt-title').innerText = '${appt.serviceType.name}';">
                                                                                        <i class="fa-solid fa-star me-1"></i> Write Review
                                                                                    </button>
                                                                                </c:when>
                                                                            </c:choose>
                                                                            
                                                                        </div>
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

                            <div id="feedback" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom d-flex justify-content-between align-items-center">
                                        <h4 class="widget-title mb-0"><i class="fa-regular fa-comments me-2"></i> Technician Reports</h4>
                                    </div>
                                    <div class="card-body p-4 bg-light">
                                        <c:choose>
                                            <c:when test="${empty requestScope.myFeedback}">
                                                <div class="text-center py-5 text-muted">
                                                    <i class="fa-regular fa-comment-dots fa-3x mb-3 opacity-25"></i>
                                                    <h5>No reports found.</h5>
                                                    <p class="small">Technician remarks will appear here after service completion.</p>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${requestScope.myFeedback}" var="feedback">
                                                    <div class="card mb-3 border-0 shadow-sm" id="feedback-card-${feedback.appointment.id}">
                                                        <div class="card-body p-4">
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="d-flex align-items-center gap-3">
                                                                    <div class="bg-primary bg-opacity-10 text-primary rounded-circle p-3 d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                                                                        <i class="fa-solid fa-clipboard-check"></i>
                                                                    </div>
                                                                    <div>
                                                                        <h6 class="fw-bold mb-0">${feedback.appointment.serviceType.name} - ${feedback.appointment.carPlateNumber}</h6>
                                                                        <div class="text-muted small">Ref #APP-${feedback.appointment.id} &bull; <fmt:formatDate value="${feedback.submissionDate}" pattern="dd MMM yyyy" /></div>
                                                                    </div>
                                                                </div>
                                                                <span class="badge bg-secondary px-3 py-2">${feedback.feedbackType}</span>
                                                            </div>
                                                            <div class="bg-white p-3 rounded border border-light">
                                                                <p class="mb-0 text-dark fst-italic">"${feedback.comments}"</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="comment" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">
                                        <h4 class="widget-title mb-0"><i class="fa-regular fa-star me-2"></i> My Reviews</h4>
                                        <p class="text-muted small mb-0 mt-1">Feedback you've provided for our technicians.</p>
                                    </div>
                                    
                                    <div class="card-body p-4 bg-light">
                                        <c:choose>
                                            <c:when test="${empty requestScope.myComments}">
                                                <div class="text-center py-5 text-muted">
                                                    <i class="fa-regular fa-star-half-stroke fa-3x mb-3 opacity-25"></i>
                                                    <h5>No reviews yet.</h5>
                                                    <p class="small">After your service is paid, you can leave a review from the Service History tab!</p>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${requestScope.myComments}" var="comment">
                                                    <div class="card mb-3 border-0 shadow-sm" id="comment-card-${comment.appointment.id}">
                                                        <div class="card-body p-4">
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="d-flex align-items-center gap-3">
                                                                    <div class="bg-warning bg-opacity-10 text-warning rounded-circle p-3 d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                                                                        <i class="fa-solid fa-star"></i>
                                                                    </div>
                                                                    <div>
                                                                        <h6 class="fw-bold mb-0">${comment.appointment.serviceType.name}</h6>
                                                                        <div class="text-muted small">Appointment #APP-${comment.appointment.id} &bull; <fmt:formatDate value="${comment.commentDate}" pattern="dd MMM yyyy" /></div>
                                                                    </div>
                                                                </div>
                                                                <div class="text-warning">
                                                                    <c:forEach begin="1" end="5" var="i">
                                                                        <c:choose>
                                                                            <c:when test="${i <= comment.rating}"><i class="fa-solid fa-star"></i></c:when>
                                                                            <c:otherwise><i class="fa-regular fa-star"></i></c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                            <p class="mb-0 text-dark fst-italic">"${comment.content}"</p>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        
                        <div class="col-xl-3 col-lg-4 order-2 order-md-1 wow fadeInUp" data-wow-delay=".3s">
                            <div class="main-sidebar">
                                <div class="single-sidebar-widget">
                                    <div class="dishes-card style2">
                                        <div class="dishes-thumb">
                                            <div class="bg-primary bg-opacity-10 text-primary rounded-circle d-flex align-items-center justify-content-center mx-auto mb-3" style="width: 100px; height: 100px; font-size: 40px;">
                                                <i class="fa-solid fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="dishes-content text-center">
                                            <h3 class="mb-1">${sessionScope.currentUser.fullName}</h3>
                                            <div class="text-muted small mb-4">${sessionScope.currentUser.email}</div>
                                            
                                            <a href="#edit-profile" class="theme-btn style6 sidebar-btn active">
                                                <i class="fa-solid fa-user-pen fa-fw"></i> Edit Profile
                                            </a>
                                            <a href="#current-appointments" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-location-crosshairs fa-fw"></i> Current Service
                                            </a>
                                            <a href="#history" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-file-invoice-dollar fa-fw"></i> Service History
                                            </a>
                                            <a href="#feedback" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-clipboard-check fa-fw"></i> Technician Reports
                                            </a>
                                            <a href="#comment" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-star fa-fw"></i> My Reviews
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="viewApptDetailsModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content rounded-4 border-0 shadow">
                    <div class="modal-header border-bottom-0 pb-0">
                        <h5 class="modal-title fw-bold"><i class="fa-solid fa-circle-info text-primary me-2"></i>Service Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
                            <div>
                                <h6 class="text-muted mb-1">Appointment Ref</h6>
                                <h4 class="fw-bold mb-0 text-dark" id="modal-appt-ref"></h4>
                            </div>
                            <div class="text-end">
                                <span class="badge fs-6 mb-1" id="modal-appt-status"></span>
                                <div class="text-muted small" id="modal-appt-datetime"></div>
                            </div>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6 mb-4 mb-md-0">
                                <h6 class="fw-bold text-primary mb-3"><i class="fa-solid fa-car me-2"></i>Vehicle Info</h6>
                                <div class="mb-2"><span class="text-muted d-inline-block" style="width: 80px;">Plate No:</span> <span class="fw-bold text-dark text-uppercase border rounded px-1" id="modal-appt-plate"></span></div>
                                <div class="mb-2"><span class="text-muted d-inline-block" style="width: 80px;">Service:</span> <span class="fw-bold text-dark" id="modal-appt-service"></span></div>
                            </div>
                            <div class="col-md-6">
                                <h6 class="fw-bold text-primary mb-3"><i class="fa-solid fa-clipboard-list me-2"></i>Booking Notes</h6>
                                <p class="mb-0 text-dark small" id="modal-appt-remarks" style="white-space: pre-wrap;"></p>
                            </div>
                        </div>
                        
                        <div class="row mb-2 border-top pt-4" id="modal-payment-section" style="display: none;">
                            <div class="col-12">
                                <h6 class="fw-bold text-success mb-3"><i class="fa-solid fa-money-bill-wave me-2"></i>Payment Summary</h6>
                                <div class="d-flex justify-content-between align-items-center bg-success bg-opacity-10 p-3 rounded-3 border border-success border-opacity-25">
                                    <div>
                                        <span class="text-muted d-block small mb-1">Payment Method</span> 
                                        <span class="fw-bold text-dark" id="modal-appt-method"></span>
                                    </div>
                                    <div class="text-end">
                                        <span class="text-muted d-block small mb-1">Total Paid</span> 
                                        <span class="fw-bold text-success fs-5">RM <span id="modal-appt-price"></span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer border-top-0 pt-0 justify-content-between">
                        <button type="button" class="btn btn-outline-primary fw-bold" id="modal-view-feedback-btn" style="display: none;">
                            <i class="fa-regular fa-comment me-2"></i>View Technician Feedback
                        </button>
                        <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="writeReviewModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content rounded-4 border-0 shadow">
                    <form action="SubmitCommentServlet" method="POST">
                        <div class="modal-header border-bottom-0 pb-0">
                            <h5 class="modal-title fw-bold"><i class="fa-solid fa-star text-warning me-2"></i>Rate Your Service</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body p-4">
                            <input type="hidden" name="appointmentId" id="review-appt-id">
                            <p class="text-muted mb-4">How was your experience with the <strong id="review-appt-title" class="text-dark"></strong> service?</p>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Star Rating</label>
                                <select class="form-select border-warning" name="rating" required>
                                    <option value="5" selected>⭐⭐⭐⭐⭐ (5) Excellent</option>
                                    <option value="4">⭐⭐⭐⭐ (4) Very Good</option>
                                    <option value="3">⭐⭐⭐ (3) Average</option>
                                    <option value="2">⭐⭐ (2) Poor</option>
                                    <option value="1">⭐ (1) Terrible</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Written Feedback</label>
                                <textarea class="form-control" name="content" rows="4" placeholder="Tell us what you loved, or what we can improve..." required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer border-top-0 pt-0">
                            <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-warning fw-bold px-4 text-dark">Submit Review</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                
                // --- 1. TAB SWITCHING LOGIC ---
                const sidebarButtons = document.querySelectorAll('.sidebar-btn');
                const dashboardSections = document.querySelectorAll('.dashboard-section');

                function activateTab(targetId) {
                    dashboardSections.forEach(section => section.style.display = 'none');
                    sidebarButtons.forEach(btn => btn.classList.remove('active'));

                    const targetSection = document.getElementById(targetId);
                    if (targetSection) {
                        targetSection.style.display = 'block';
                    }

                    const targetButton = document.querySelector(`.sidebar-btn[href="#${targetId}"]`);
                    if (targetButton) {
                        targetButton.classList.add('active');
                    }
                }

                sidebarButtons.forEach(button => {
                    button.addEventListener('click', function(event) {
                        event.preventDefault(); 
                        const targetId = this.getAttribute('href').substring(1);
                        history.pushState(null, null, '#' + targetId);
                        activateTab(targetId);
                    });
                });

                if (window.location.hash) {
                    const hashId = window.location.hash.substring(1);
                    activateTab(hashId);
                }
                
                window.activateTab = activateTab; // make global for onclicks

                // --- 2. MODAL & TECHNICIAN FEEDBACK LOGIC ---
                const viewApptRows = document.querySelectorAll('.view-appt-row');
                
                viewApptRows.forEach(row => {
                    row.addEventListener('click', function(event) {
                        if (event.target.closest('button') || event.target.closest('a')) {
                            return; 
                        }
                        // 1. Populate the data
                        const appId = this.getAttribute('data-appid');
                        document.getElementById('modal-appt-ref').innerText = "#APP-" + appId;
                        document.getElementById('modal-appt-datetime').innerText = this.getAttribute('data-date') + " at " + this.getAttribute('data-time');
                        document.getElementById('modal-appt-plate').innerText = this.getAttribute('data-plate');
                        document.getElementById('modal-appt-service').innerText = this.getAttribute('data-service');
                        document.getElementById('modal-appt-remarks').innerText = this.getAttribute('data-remarks');
                        
                        const status = this.getAttribute('data-status');
                        const statusBadge = document.getElementById('modal-appt-status');
                        statusBadge.innerText = status;
                        let badgeColor = 'primary';
                        if (status === 'Paid') badgeColor = 'success';
                        if (status === 'Completed') badgeColor = 'info';
                        if (status === 'In Progress') badgeColor = 'warning text-dark';
                        statusBadge.className = 'badge fs-6 mb-1 bg-' + badgeColor;
                        
                        const paymentSection = document.getElementById('modal-payment-section');
                        if (status === 'Paid') {
                            paymentSection.style.display = 'flex';
                            document.getElementById('modal-appt-price').innerText = parseFloat(this.getAttribute('data-price')).toFixed(2);
                            document.getElementById('modal-appt-method').innerText = this.getAttribute('data-method');
                        } else {
                            paymentSection.style.display = 'none';
                        }
                        
                        // 2. Technician Feedback Redirect
                        const feedbackBtn = document.getElementById('modal-view-feedback-btn');
                        const feedbackCard = document.getElementById('feedback-card-' + appId);
                        
                        if (feedbackCard) {
                            feedbackBtn.style.display = 'block';
                            feedbackBtn.onclick = function() {
                                bootstrap.Modal.getInstance(document.getElementById('viewApptDetailsModal')).hide();
                                history.pushState(null, null, '#feedback');
                                activateTab('feedback');
                                setTimeout(() => {
                                    feedbackCard.scrollIntoView({ behavior: 'smooth', block: 'center' });
                                    feedbackCard.style.boxShadow = "0 0 0 4px rgba(13, 110, 253, 0.5)"; 
                                    setTimeout(() => { feedbackCard.style.boxShadow = "none"; }, 2000);
                                }, 350); 
                            };
                        } else {
                            feedbackBtn.style.display = 'none';
                        }

                        // 3. Manually open the Modal!
                        const modalInstance = bootstrap.Modal.getOrCreateInstance(document.getElementById('viewApptDetailsModal'));
                        modalInstance.show();
                    });
                });

                // --- 3. TABLE FILTER LOGIC ---
                const searchInput = document.getElementById('historySearch');
                const dateInput = document.getElementById('historyDate');
                const clearDateBtn = document.getElementById('clearDateBtn');
                
                function filterHistoryTable() {
                    const searchTerm = searchInput.value.toLowerCase();
                    const filterDate = dateInput.value; 
                    const rows = document.querySelectorAll('#historyTable tbody tr.view-appt-row');

                    rows.forEach(row => {
                        const plate = row.getAttribute('data-plate').toLowerCase();
                        const service = row.getAttribute('data-service').toLowerCase();
                        const rowDate = row.getAttribute('data-filterdate'); 

                        const matchesSearch = plate.includes(searchTerm) || service.includes(searchTerm);
                        const matchesDate = filterDate === "" || rowDate === filterDate;

                        row.style.display = (matchesSearch && matchesDate) ? '' : 'none';
                    });
                }

                if(searchInput) searchInput.addEventListener('keyup', filterHistoryTable);
                if(dateInput) dateInput.addEventListener('change', filterHistoryTable);
                if(clearDateBtn) clearDateBtn.addEventListener('click', () => { 
                    dateInput.value = ''; 
                    filterHistoryTable(); 
                });
            });
            
            // --- 4. PRINT RECEIPT LOGIC ---
            window.printReceipt = function(receiptId, date, customerName, plateNo, serviceName, method, amount) {
                const width = 1200;
                const height = 800;
                const left = (screen.width / 2) - (width / 2);
                const top = (screen.height / 2) - (height / 2);
                const printWindow = window.open('', '_blank', 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
                
                const formattedAmount = isNaN(parseFloat(amount)) ? amount : "RM " + parseFloat(amount).toFixed(2);
                
                const html = `
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <title>Receipt #REC-` + receiptId + `</title>
                        <style>
                            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
                            :root { --primary: #0d6efd; --text-main: #2b2b2b; --text-muted: #6c757d; --border-color: #e9ecef; --bg-color: #f4f7f9; }
                            body { font-family: 'Inter', -apple-system, sans-serif; background-color: var(--bg-color); color: var(--text-main); display: flex; justify-content: center; padding: 40px 20px; margin: 0; }
                            .receipt-container { background: #ffffff; width: 100%; max-width: 420px; border-radius: 16px; box-shadow: 0 15px 35px rgba(0,0,0,0.08); overflow: hidden; }
                            .receipt-header { background: var(--primary); color: #ffffff; text-align: center; padding: 35px 20px 25px; }
                            .receipt-header h2 { margin: 0 0 8px; font-size: 26px; font-weight: 700; letter-spacing: 1px; }
                            .receipt-header p { margin: 0; font-size: 14px; opacity: 0.9; line-height: 1.5; }
                            .receipt-body { padding: 35px 30px; }
                            .info-row { display: flex; justify-content: space-between; margin-bottom: 14px; font-size: 15px; }
                            .info-row .label { color: var(--text-muted); }
                            .info-row .value { font-weight: 600; text-align: right; }
                            .divider { border-top: 2px dashed var(--border-color); margin: 25px 0; }
                            .total-row { display: flex; justify-content: space-between; align-items: center; margin-top: 25px; }
                            .total-row .label { font-size: 18px; font-weight: 600; color: var(--text-muted); }
                            .total-row .value { font-size: 24px; font-weight: 700; color: var(--primary); }
                            .receipt-footer { text-align: center; padding: 25px; background: #f8f9fa; font-size: 14px; color: var(--text-muted); border-top: 1px solid var(--border-color); }
                            @media print {
                                body { background: white; padding: 0; display: block; }
                                .receipt-container { box-shadow: none; max-width: 100%; border-radius: 0; margin: 0 auto; }
                                .receipt-header { background: transparent; color: black; border-bottom: 3px solid black; padding-top: 0;}
                                .total-row .value { color: black; }
                            }
                        </style>
                    </head>
                    <body>
                        <div class="receipt-container">
                            <div class="receipt-header">
                                <h2>APU CARE</h2>
                                <p>Automotive Service Centre<br>Kuala Lumpur, Malaysia</p>
                            </div>
                            <div class="receipt-body">
                                <div class="info-row"><span class="label">Receipt No</span><span class="value">#REC-` + receiptId + `</span></div>
                                <div class="info-row"><span class="label">Date</span><span class="value">` + date + `</span></div>
                                <div class="info-row"><span class="label">Customer</span><span class="value">` + customerName + `</span></div>
                                <div class="info-row"><span class="label">Vehicle Plate</span><span class="value">` + plateNo + `</span></div>
                                <div class="divider"></div>
                                <div class="info-row"><span class="label">Service Performed</span><span class="value">` + serviceName + `</span></div>
                                <div class="info-row"><span class="label">Payment Method</span><span class="value">` + method + `</span></div>
                                <div class="divider"></div>
                                <div class="total-row"><span class="label">TOTAL</span><span class="value">` + formattedAmount + `</span></div>
                            </div>
                            <div class="receipt-footer">
                                <strong>Thank you for choosing us!</strong><br>
                                Keep this receipt for your records.
                            </div>
                        </div>
                        <script>
                            window.onload = function() { setTimeout(function() { window.print(); }, 300); }
                        <\/script>
                    </body>
                    </html>
                `;
                printWindow.document.write(html);
                printWindow.document.close();
            };
        </script>
        
        <c:if test="${not empty sessionScope.popupMessage}">
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        icon: '${sessionScope.popupType}', 
                        title: '${sessionScope.popupType == "error" ? "Error!" : "Success!"}',
                        text: '${sessionScope.popupMessage}',
                        confirmButtonColor: '#0d6efd',
                        timer: ${sessionScope.popupType == "success" ? 3000 : 0}, 
                        timerProgressBar: ${sessionScope.popupType == "success"}
                    });
                });
            </script>
            <c:remove var="popupMessage" scope="session" />
            <c:remove var="popupType" scope="session" />
        </c:if>
        
    </body>
</html