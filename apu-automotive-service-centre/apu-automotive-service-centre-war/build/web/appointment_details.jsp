<%-- 
    Document   : appointment_details.jsp
    Created on : 5 Apr 2026, 8:48:23 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Appointment #${selectedApp.id} | APU CARE</title>
    <link rel="shortcut icon" href="static/img/favicon.png">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/all.min.css">
    
    <style>
        body { background-color: #f4f6f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .detail-label { font-size: 0.75rem; text-transform: uppercase; letter-spacing: 1px; color: #6c757d; font-weight: 700; margin-bottom: 2px; }
        .detail-value { font-size: 1.05rem; color: #212529; font-weight: 500; margin-bottom: 1.5rem; }
        .section-icon { width: 40px; height: 40px; display: inline-flex; align-items: center; justify-content: center; border-radius: 10px; margin-right: 15px; }
        .star-rating i { color: #dee2e6; font-size: 1.5rem; }
        .star-rating i.active { color: #ffc107; }
        @media print { .btn-print-hide { display: none !important; } .card { box-shadow: none !important; border: 1px solid #ddd !important; } body { background-color: white; } }
    </style>
</head>
<body>

<div class="container py-5 max-w-1000">
    <div class="d-flex justify-content-between align-items-center mb-4 btn-print-hide">
        <a href="ManagerDashboardServlet#view-appointment" class="btn btn-outline-secondary fw-bold shadow-sm rounded-pill px-4 py-2">
            <i class="fa-solid fa-arrow-left me-2"></i> Back to Dashboard
        </a>
        <button class="btn btn-primary fw-bold shadow-sm rounded-pill px-4 py-2" onclick="window.print()">
            <i class="fa-solid fa-print me-2"></i> Print Invoice
        </button>
    </div>

    <div class="row g-4">
        <div class="col-lg-8">
            
            <div class="card border-0 shadow-sm rounded-4 mb-4">
                <div class="card-header bg-white p-4 border-bottom d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <div class="section-icon bg-primary bg-opacity-10 text-primary fs-4">
                            <i class="fa-solid fa-file-invoice"></i>
                        </div>
                        <h4 class="mb-0 fw-bold">Job Reference: #${selectedApp.id}</h4>
                    </div>
                    <c:choose>
                        <c:when test="${selectedApp.status == 'Completed'}"><span class="badge bg-success fs-6 px-3 py-2 rounded-pill">Completed</span></c:when>
                        <c:when test="${selectedApp.status == 'Paid'}"><span class="badge bg-success fs-6 px-3 py-2 rounded-pill">Paid</span></c:when>
                        <c:when test="${selectedApp.status == 'Pending'}"><span class="badge bg-warning text-dark fs-6 px-3 py-2 rounded-pill">Pending</span></c:when>
                        <c:when test="${selectedApp.status == 'In Progress'}"><span class="badge bg-info text-dark fs-6 px-3 py-2 rounded-pill">In Progress</span></c:when>
                        <c:when test="${selectedApp.status == 'Cancelled'}"><span class="badge bg-danger fs-6 px-3 py-2 rounded-pill">Cancelled</span></c:when>
                        <c:otherwise><span class="badge bg-secondary fs-6 px-3 py-2 rounded-pill">${selectedApp.status}</span></c:otherwise>
                    </c:choose>
                </div>
                
                <div class="card-body p-4">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="detail-label"><i class="fa-regular fa-calendar me-1"></i> Appointment Date</div>
                            <div class="detail-value"><fmt:formatDate value="${selectedApp.appointmentDate}" pattern="EEEE, dd MMMM yyyy"/></div>
                        </div>
                        <div class="col-md-6">
                            <div class="detail-label"><i class="fa-regular fa-clock me-1"></i> Time Slot</div>
                            <div class="detail-value">${selectedApp.appointmentTime}</div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="detail-label"><i class="fa-solid fa-user me-1"></i> Customer Name</div>
                            <div class="detail-value">${selectedApp.customer.fullName}</div>
                        </div>
                        <div class="col-md-6">
                            <div class="detail-label"><i class="fa-solid fa-car me-1"></i> Vehicle Plate Number</div>
                            <div class="detail-value fw-bold text-primary px-2 py-1 bg-light d-inline-block rounded border border-primary-subtle">${selectedApp.carPlateNumber}</div>
                        </div>
                        
                        <div class="col-md-12">
                            <div class="detail-label"><i class="fa-solid fa-wrench me-1"></i> Assigned Technician</div>
                            <div class="detail-value">
                                <c:choose>
                                    <c:when test="${not empty selectedApp.technician}">${selectedApp.technician.fullName}</c:when>
                                    <c:otherwise><span class="text-danger fst-italic">No Technician Assigned Yet</span></c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <div class="col-12 mt-2">
                            <div class="detail-label"><i class="fa-solid fa-comment-dots me-1"></i> Initial Booking Remarks</div>
                            <div class="p-3 bg-light rounded-3 border text-muted fst-italic">
                                <c:choose>
                                    <c:when test="${not empty selectedApp.remarks}">"${selectedApp.remarks}"</c:when>
                                    <c:otherwise>No special remarks provided during booking.</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="card border-0 shadow-sm rounded-4 mb-4">
                <div class="card-header bg-white p-4 border-bottom d-flex align-items-center">
                    <div class="section-icon bg-warning bg-opacity-10 text-warning fs-4">
                        <i class="fa-solid fa-clipboard-list"></i>
                    </div>
                    <h5 class="mb-0 fw-bold">Internal Technician Report</h5>
                </div>
                <div class="card-body p-4">
                    <c:choose>
                        <c:when test="${not empty appFeedback}">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <span class="detail-label">Report Category</span>
                                    <span class="badge bg-dark ms-2">${appFeedback.feedbackType}</span>
                                </div>
                                <div class="text-end">
                                    <span class="detail-label">Submitted On</span><br>
                                    <small class="fw-bold"><fmt:formatDate value="${appFeedback.submissionDate}" pattern="dd MMM yyyy, HH:mm"/></small>
                                </div>
                            </div>
                            <div class="detail-label">Technician Notes</div>
                            <div class="p-3 bg-warning bg-opacity-10 rounded-3 border border-warning-subtle text-dark">
                                ${appFeedback.comments}
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-4 text-muted">
                                <i class="fa-solid fa-folder-open fs-1 mb-3 opacity-50"></i>
                                <h6>No Report Submitted</h6>
                                <p class="small">The technician has not filed a post-job report yet.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>

        <div class="col-lg-4">
            
            <div class="card border-0 shadow-sm rounded-4 mb-4">
                <div class="card-header bg-dark text-white p-4 rounded-top-4">
                    <h5 class="mb-0 fw-bold"><i class="fa-solid fa-tag me-2"></i> Service Pricing</h5>
                </div>
                <div class="card-body p-4 bg-white">
                    <div class="detail-label">Selected Service</div>
                    <h5 class="fw-bold text-dark mb-3">${selectedApp.serviceType.name}</h5>
                    
                    <div class="detail-label">Est. Duration</div>
                    <p class="mb-4"><i class="fa-regular fa-hourglass-half me-1"></i> ${selectedApp.serviceType.durationHours} Hours</p>
                    
                    <hr class="text-muted">
                    
                    <div class="d-flex justify-content-between align-items-end mt-3">
                        <span class="detail-label mb-0 fs-6">Grand Total</span>
                        <span class="fs-3 fw-bold text-success">RM <fmt:formatNumber value="${selectedApp.serviceType.price}" pattern="#,##0.00"/></span>
                    </div>
                </div>
            </div>
            
            <div class="card border-0 shadow-sm rounded-4 mb-4 overflow-hidden">
                <div class="card-body p-0">
                    <div class="bg-primary text-white p-4 text-center">
                        <h5 class="fw-bold mb-1"><i class="fa-solid fa-star-half-stroke me-2"></i> Customer Satisfaction</h5>
                        <p class="small opacity-75 mb-0">Post-service evaluation</p>
                    </div>
                    
                    <div class="p-4 bg-white text-center">
                        <c:choose>
                            <c:when test="${not empty appComment}">
                                <div class="star-rating mb-3">
                                    <c:forEach begin="1" end="5" var="i">
                                        <i class="fa-solid fa-star ${i <= appComment.rating ? 'active' : ''}"></i>
                                    </c:forEach>
                                </div>
                                <h1 class="display-5 fw-bold text-dark mb-1">${appComment.rating} / 5</h1>
                                <p class="text-muted small mb-4">Reviewed on <fmt:formatDate value="${appComment.commentDate}" pattern="dd MMM yyyy"/></p>
                                
                                <div class="p-3 bg-light rounded-3 text-start border position-relative">
                                    <i class="fa-solid fa-quote-left text-muted opacity-25 fs-1 position-absolute top-0 start-0 ms-2 mt-2"></i>
                                    <p class="fst-italic text-dark mb-0 position-relative z-1" style="padding-left: 20px;">"${appComment.content}"</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="py-4">
                                    <div class="star-rating mb-2">
                                        <i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i>
                                    </div>
                                    <h5 class="text-muted fw-bold">Awaiting Feedback</h5>
                                    <p class="small text-muted mb-0">The customer has not reviewed this service.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="static/js/bootstrap.bundle.min.js"></script>
</body>
</html>
