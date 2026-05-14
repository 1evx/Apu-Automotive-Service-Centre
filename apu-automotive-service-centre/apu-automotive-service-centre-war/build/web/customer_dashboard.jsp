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
        <title>APU ASC - Customer Dashboard</title>
        
        <link rel="shortcut icon" href="static/img/favicon.png">
        
        <link rel="stylesheet" href="static/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/all.min.css">
        <link rel="stylesheet" href="static/css/animate.css">
        <link rel="stylesheet" href="static/css/magnific-popup.css">
        <link rel="stylesheet" href="static/css/meanmenu.css">
        <link rel="stylesheet" href="static/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="static/css/nice-select.css">
        <link rel="stylesheet" href="static/css/main.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
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
                <input type="hidden" name="userId" value="${currentUser.userId}">

                                            <h5 class="mb-3 text-primary"><i class="fa-solid fa-address-card me-2"></i>General Information</h5>
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Full Name</label>
                            <input type="text" class="form-control" name="fullName" value="${currentUser.fullName}" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Username</label>
                            <input type="text" class="form-control bg-light" name="username" value="${currentUser.username}" readonly>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Email Address</label>
                            <input type="email" class="form-control bg-light" name="email" value="${currentUser.email}" readonly>
                                                    <small class="text-muted">Contact an admin to change your email.</small>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">IC Number</label>
                            <input type="text" class="form-control" name="icNumber" value="${currentUser.icNumber}" placeholder="YYMMDD-XX-XXXX" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" maxlength="14" inputmode="numeric" title="Enter a valid Malaysian IC number in the format YYMMDD-XX-XXXX." oninput="this.value = formatMalaysianIc(this.value)" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Phone Number</label>
                            <input type="text" class="form-control" name="phoneNumber" value="${currentUser.phoneNumber}" placeholder="0123456789" pattern="01[0-9]{8,9}" maxlength="11" inputmode="numeric" title="Enter a valid Malaysian phone number starting with 01." oninput="this.value = formatMalaysianPhone(this.value)" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold text-danger"><i class="fa-solid fa-lock me-1"></i> Update Password (Optional)</label>
                                                    <input type="password" class="form-control border-danger border-opacity-25" name="password" placeholder="Leave blank to keep current">
                                                </div>
                                                <div class="col-md-12 mb-3 mt-2">
                                                    <label class="form-label fw-bold">Home Address</label>
                            <textarea class="form-control" name="address" rows="2" placeholder="Enter your full address...">${currentUser.address}</textarea>
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
                                                            '${currentUser.fullName}', 
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
                                                                                   <a href="#comment" onclick="viewSpecificReview(event, '${appt.id}')" class="btn btn-sm btn-primary border-opacity-50" style="font-size: 0.75rem;">
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
                                        <h4 class="widget-title mb-0"><i class="fa-regular fa-comments me-2"></i> Technician Feedbacks</h4>
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
                                            <img src="static/img/profile/customerIcon.png" alt="thumb">
                                            <div class="circle-shape"><img class="cir36" src="static/img/profile/circleShape.png" alt="shape"></div>
                                        </div>
                                        <div class="dishes-content text-center">
                    <h3 class="mb-1">${currentUser.fullName}</h3>
                    <div class="text-muted small mb-3">${currentUser.email}</div>
                                                <div class="mb-4">
                                                    <span class="badge bg-warning text-dark fs-6 rounded-pill px-3 py-2 shadow-sm">
                                <i class="fa-solid fa-crown text-danger me-1"></i> ${currentUser.loyaltyPoints} Reward Pts
                                                    </span>
                                                </div>
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

        <jsp:include page="component/viewAppointmentDetailsModal.jsp" />

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
                
                //tab switch
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
                
                window.activateTab = activateTab;

                //modal and technicin feedback logic
                const viewApptRows = document.querySelectorAll('.view-appt-row');
                
                viewApptRows.forEach(row => {
                    row.addEventListener('click', function(event) {
                        if (event.target.closest('button') || event.target.closest('a')) {
                            return; 
                        }

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
                        
                        //technician Feedback Redirect
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

                                    feedbackCard.classList.remove('pulse-highlight'); 

                                    void feedbackCard.offsetWidth; 

                                    feedbackCard.classList.add('pulse-highlight');

                                    setTimeout(() => { 
                                        feedbackCard.classList.remove('pulse-highlight'); 
                                    }, 2500);

                                }, 350); 
                            };
                        } else {
                            feedbackBtn.style.display = 'none';
                        }
                      

                        const modalInstance = bootstrap.Modal.getOrCreateInstance(document.getElementById('viewApptDetailsModal'));
                        modalInstance.show();
                    });
                });

                // table logic filter
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
                

                window.viewSpecificReview = function(event, appId) {
                    if (event) {
                        event.preventDefault(); 
                        event.stopPropagation(); 
                    }

                    history.pushState(null, null, '#comment');
                    activateTab('comment');

                    setTimeout(() => {
                        const reviewCard = document.getElementById('comment-card-' + appId);

                        if (reviewCard) {
                            reviewCard.scrollIntoView({ behavior: 'smooth', block: 'center' });

                            reviewCard.classList.remove('pulse-highlight'); 

                            void reviewCard.offsetWidth; 

                            reviewCard.classList.add('pulse-highlight');

                            setTimeout(() => { 
                                reviewCard.classList.remove('pulse-highlight'); 
                            }, 2500);
                        }
                    }, 350); //
                }
            });

            function formatMalaysianIc(value) {
                const digits = value.replace(/\D/g, '').slice(0, 12);

                if (digits.length <= 6) {
                    return digits;
                }

                if (digits.length <= 8) {
                    return digits.slice(0, 6) + '-' + digits.slice(6);
                }

                return digits.slice(0, 6) + '-' + digits.slice(6, 8) + '-' + digits.slice(8);
            }

            function formatMalaysianPhone(value) {
                return value.replace(/\D/g, '').slice(0, 11);
            }
            
            //print logic receipt
            window.printReceipt = function(receiptId, date, customerName, plateNo, serviceName, method, amount) {
            const formattedAmount = isNaN(parseFloat(amount)) ? amount : "RM " + parseFloat(amount).toFixed(2);

            const receiptElement = document.createElement('div');

            // 1. UPDATED CSS: Swapped fixed widths for 100%, adjusted padding to fit Landscape A5
            receiptElement.innerHTML = `
                <style>
                    .formal-receipt { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; width: 100%; padding: 10px 20px; color: #000; background: #fff; box-sizing: border-box; page-break-inside: avoid; }
                    .header-section { display: flex; justify-content: space-between; border-bottom: 2px solid #000; padding-bottom: 15px; margin-bottom: 15px; }
                    .company-info h1 { margin: 0 0 5px 0; font-size: 24px; text-transform: uppercase; letter-spacing: 1px; }
                    .company-info p { margin: 3px 0; font-size: 12px; color: #333; }
                    .receipt-title { text-align: right; }
                    .receipt-title h2 { margin: 0; font-size: 22px; color: #000; letter-spacing: 2px; }
                    .receipt-title .r-no { font-size: 14px; font-weight: bold; margin-top: 8px; color: #444; }
                    .meta-section { display: flex; justify-content: space-between; margin-bottom: 20px; font-size: 13px; line-height: 1.5; }
                    .meta-box { width: 48%; }
                    .meta-box strong { display: inline-block; width: 120px; }
                    .items-table { width: 100%; border-collapse: collapse; margin-bottom: 15px; }
                    .items-table th { border-top: 2px solid #000; border-bottom: 2px solid #000; padding: 10px; text-align: left; font-size: 12px; text-transform: uppercase; }
                    .items-table td { border-bottom: 1px solid #ddd; padding: 12px 10px; font-size: 13px; }
                    .items-table .amount-col { text-align: right; }
                    .totals-section { display: flex; justify-content: flex-end; margin-bottom: 25px; }
                    .totals-box { width: 40%; }
                    .total-line { display: flex; justify-content: space-between; padding: 6px 10px; font-size: 13px; }
                    .grand-total { font-weight: bold; font-size: 16px; border-top: 2px solid #000; border-bottom: 2px solid #000; padding: 10px; margin-top: 5px; }
                    .signature-area { display: flex; justify-content: space-between; margin-top: 35px; margin-bottom: 15px; }
                    .sig-line { width: 200px; border-top: 1px solid #000; text-align: center; padding-top: 5px; font-size: 12px; }
                    .footer-section { text-align: center; font-size: 10px; color: #666; border-top: 1px solid #ddd; padding-top: 10px; }
                </style>

                <div class="formal-receipt">
                    <div class="header-section">
                        <div class="company-info">
                            <h1>APU CARE</h1>
                            <p><strong>Automotive Service Centre</strong></p>
                            <p>123 Technology Park Malaysia, Bukit Jalil</p>
                            <p>57000 Kuala Lumpur, Malaysia</p>
                            <p>Tel: +603-1234 5678 | Co. Reg: 202601000000</p>
                        </div>
                        <div class="receipt-title">
                            <h2>OFFICIAL RECEIPT</h2>
                            <div class="r-no">Receipt No: #REC-` + receiptId + `</div>
                        </div>
                    </div>

                    <div class="meta-section">
                        <div class="meta-box">
                            <div><strong>Billed To:</strong> ` + customerName + `</div>
                            <div><strong>Vehicle Plate:</strong> ` + plateNo + `</div>
                        </div>
                        <div class="meta-box">
                            <div><strong>Date:</strong> ` + date + `</div>
                            <div><strong>Payment Method:</strong> ` + method + `</div>
                        </div>
                    </div>

                    <table class="items-table">
                        <thead>
                            <tr>
                                <th style="width: 10%;">No.</th>
                                <th style="width: 60%;">Description of Service</th>
                                <th class="amount-col" style="width: 30%;">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>` + serviceName + `</td>
                                <td class="amount-col">` + formattedAmount + `</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="totals-section">
                        <div class="totals-box">
                            <div class="total-line">
                                <span>Subtotal</span>
                                <span>` + formattedAmount + `</span>
                            </div>
                            <div class="total-line grand-total">
                                <span>TOTAL PAID</span>
                                <span>` + formattedAmount + `</span>
                            </div>
                        </div>
                    </div>

                    <div class="signature-area">
                        <div class="sig-line">Customer Signature</div>
                        <div class="sig-line">Authorized Signatory</div>
                    </div>

                    <div class="footer-section">
                        <p><strong>Thank you for choosing APU Automotive Service Centre!</strong></p>
                        <p>This is a computer-generated document. No physical signature is required for validity.</p>
                    </div>
                </div>
            `;

            // 2. UPDATED PDF CONFIG: Changed to A5 Landscape and shrunk the margins
            const pdfOptions = {
                margin:       0.2, // Tighter margin so nothing gets cut off
                filename:     'APU_Care_Receipt_REC-' + receiptId + '.pdf',
                image:        { type: 'jpeg', quality: 1.0 },
                html2canvas:  { scale: 2, useCORS: true },
                jsPDF:        { unit: 'in', format: 'a4', orientation: 'landscape' } // The magic fix!
            };

            html2pdf().set(pdfOptions).from(receiptElement).save();
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
