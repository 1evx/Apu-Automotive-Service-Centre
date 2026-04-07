<%-- 
    Document   : counterStaff_dashboard.jsp
    Created on : 4 Apr 2026, 9:36:45 am
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.SystemUser"%>
<%@page import="model.CounterStaff"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="gramentheme">
        <meta name="description" content="APU Automotive Service Centre">
        <title>APU CARE - Counter Staff</title>
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

        <button id="back-top" class="back-to-top">
            <i class="fa-regular fa-arrow-up"></i>
        </button>

        <jsp:include page="component/offcanvas.jsp" />
        <jsp:include page="component/dashboardNavbar.jsp" />
        <jsp:include page="component/search.jsp" />

        <div class="shop-section section-padding fix">
            <div class="shop-wrapper style1">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-xl-9 col-lg-8 order-1 order-md-2 wow fadeInUp" data-wow-delay=".5s">
                            
                            <div id="edit-profile" class="dashboard-section">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">                      
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-user-pen fa-fw me-2"></i> My Profile</h4>
                                    </div>
                                    <div class="card-body p-4">
                                        <form action="UpdateProfileServlet" method="POST">
                                            <input type="hidden" name="userId" value="${sessionScope.currentUser.userId}">

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
                                                    <label class="form-label fw-bold small text-muted"><i class="fa-solid fa-phone me-1"></i> Phone Number</label>
                                                    <input type="text" name="phoneNumber" class="form-control" value="${sessionScope.currentUser.phoneNumber}" placeholder="e.g., 012-3456789">
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
                            
                            <div id="manage-customers" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 d-flex flex-wrap justify-content-between align-items-center border-bottom gap-3">                      
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-users me-2"></i> Customer Directory</h4>
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="input-group shadow-sm" style="width: 400px;">
                                                <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                                                <input type="text" class="form-control border-start-0 ps-1" id="searchCustomer" placeholder="Search customers..." onkeyup="filterTable('searchCustomer', 'customerTbody')">
                                            </div>
                                            <button class="btn btn-primary fw-bold" data-bs-toggle="modal" data-bs-target="#registerCustomerPopUp">
                                                <i class="fa-solid fa-user-plus me-2"></i> Register
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
                                                <tbody id="customerTbody">
                                                    <c:choose>
                                                        <c:when test="${empty requestScope.customerList}">
                                                            <tr>
                                                                <td colspan="4" class="text-center py-5 text-muted">
                                                                    <i class="fa-solid fa-users-slash fa-2x mb-3 opacity-50"></i>
                                                                    <p class="mb-0">No customers registered yet.</p>
                                                                </td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${requestScope.customerList}" var="cust">
                                                                <tr>
                                                                    <td class="ps-4">
                                                                        <div class="d-flex align-items-center">
                                                                            <div class="bg-light rounded-circle p-3 px-4 me-3 text-primary">
                                                                                <i class="fa-solid fa-user"></i>
                                                                            </div>
                                                                            <div>
                                                                                <h6 class="mb-0 fw-bold">${cust.fullName}</h6>
                                                                                <small class="text-muted">@${cust.username}</small>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div><i class="fa-solid fa-envelope text-muted me-2"></i>${cust.email}</div>
                                                                        <div><i class="fa-solid fa-phone text-muted me-2"></i>${cust.phoneNumber}</div>
                                                                    </td>
                                                                    <td>
                                                                        <span class="badge bg-warning text-dark px-3 py-2 rounded-pill">
                                                                            <i class="fa-solid fa-star me-1"></i>${cust.loyaltyPoints} pts
                                                                        </span>
                                                                    </td>
                                                                    <td class="text-end pe-4">
                                                                        <div class="d-flex justify-content-end gap-2">
                                                                            <button class="btn btn-sm btn-outline-primary edit-btn" 
                                                                                    data-bs-toggle="modal" 
                                                                                    data-bs-target="#editCustomerPopUp"
                                                                                    data-id="${cust.userId}"
                                                                                    data-fullname="${cust.fullName}"
                                                                                    data-email="${cust.email}"
                                                                                    data-phone="${cust.phoneNumber}"
                                                                                    data-username="${cust.username}"
                                                                                    data-address="${cust.address}"
                                                                                    data-points="${cust.loyaltyPoints}"
                                                                                    title="Edit Customer">
                                                                                <i class="fa-solid fa-pen-to-square"></i>
                                                                            </button>

                                                                            <form action="DeleteCustomerServlet" method="POST" onsubmit="return confirm('Are you sure you want to completely delete ${cust.fullName}? This action cannot be undone.');">
                                                                                <input type="hidden" name="userId" value="${cust.userId}">
                                                                                <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete Customer">
                                                                                    <i class="fa-solid fa-trash-can"></i>
                                                                                </button>
                                                                            </form>
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

                            <div id="manage-appointments" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 d-flex flex-wrap justify-content-between align-items-center border-bottom gap-3">                      
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-calendar-check me-2"></i> Service Appointments</h4>
                                        <div class="d-flex align-items-center gap-3">

                                            <div class="input-group shadow-sm" style="width: 400px;">
                                                <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                                                <input type="text" class="form-control border-start-0 ps-1" id="searchAppointment" placeholder="Search..." onkeyup="filterTable('searchAppointment', 'appointmentTbody', 'filterAppointmentStatus')">
                                            </div>
                                            
                                            <select class="form-select shadow-sm" id="filterAppointmentStatus" style="width: 150px;" onchange="filterTable('searchAppointment', 'appointmentTbody', 'filterAppointmentStatus')">
                                                <option value="">All Status</option>
                                                <option value="Scheduled">Scheduled</option>
                                                <option value="In Progress">In Progress</option>
                                                <option value="Completed">Completed</option>
                                                <option value="Cancelled">Cancelled</option>
                                                <option value="Paid">Paid</option>
                                            </select>
                                            <button class="btn btn-primary fw-bold" data-bs-toggle="modal" data-bs-target="#bookAppointmentModal">
                                                <i class="fa-solid fa-plus me-2"></i> Book
                                            </button>
                                        </div>                                      
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="ps-4 py-3">Date & Time</th>
                                                        <th class="py-3">Customer & Car</th>
                                                        <th class="py-3">Service</th>
                                                        <th class="py-3">Technician</th>
                                                        <th class="py-3">Status</th>
                                                        <th class="text-end pe-4 py-3">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="appointmentTbody">
                                                    <c:choose>
                                                        <c:when test="${empty requestScope.appointmentList}">
                                                            <tr><td colspan="6" class="text-center py-5 text-muted">No appointments found.</td></tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${requestScope.appointmentList}" var="appt">
                                                                <tr data-status="${appt.status}">
                                                                    <td class="ps-4">
                                                                        <div class="fw-bold"><fmt:formatDate value="${appt.appointmentDate}" pattern="dd MMM yyyy" /></div>
                                                                        <small class="text-muted">${appt.appointmentTime}</small>
                                                                    </td>
                                                                    <td>
                                                                        <div class="fw-bold">${appt.customer.fullName}</div>
                                                                        <small class="text-muted text-uppercase border rounded px-1">${appt.carPlateNumber}</small>
                                                                    </td>
                                                                    <td>${appt.serviceType.name}</td>
                                                                    <td>${appt.technician.fullName}</td>
                                                                    <td>
                                                                        <span class="badge bg-${appt.status == 'Scheduled' ? 'warning text-dark' : (appt.status == 'Completed' ? 'success' : (appt.status == 'Cancelled' ? 'danger' : 'primary'))}">
                                                                            ${appt.status}
                                                                        </span>
                                                                    </td>
                                                                    <td class="text-end pe-4">
                                                                        <div class="d-flex justify-content-end gap-2">
                                                                            <c:if test="${appt.status == 'Scheduled' || appt.status == 'Cancelled'}">
                                                                                <button class="btn btn-sm btn-outline-primary edit-appt-btn" 
                                                                                        data-bs-toggle="modal" 
                                                                                        data-bs-target="#editAppointmentModal"
                                                                                        data-id="${appt.id}"
                                                                                        data-service="${appt.serviceType.id}"
                                                                                        data-technician="${appt.technician.userId}"
                                                                                        data-date="<fmt:formatDate value='${appt.appointmentDate}' pattern='yyyy-MM-dd' />"
                                                                                        data-time="${appt.appointmentTime}"
                                                                                        data-plate="${appt.carPlateNumber}"
                                                                                        data-remarks="${appt.remarks}"
                                                                                        data-status="${appt.status}"
                                                                                        title="Edit Appointment">
                                                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                                                </button>
                                                                            </c:if>

                                                                            <c:if test="${appt.status == 'Completed'}">
                                                                                <button class="btn btn-sm btn-success checkout-btn" 
                                                                                        data-bs-toggle="modal" 
                                                                                        data-bs-target="#checkoutAppointmentModal"
                                                                                        data-apptid="${appt.id}"
                                                                                        data-customer="${appt.customer.fullName}"
                                                                                        data-service="${appt.serviceType.name}"
                                                                                        data-price="${appt.serviceType.price}"
                                                                                        title="Process Payment">
                                                                                    <i class="fa-solid fa-cash-register"></i> Checkout
                                                                                </button>
                                                                            </c:if>
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

                            <div id="manage-payments" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 d-flex flex-wrap justify-content-between align-items-center border-bottom gap-3">                      
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-file-invoice-dollar me-2"></i> Payments & Billing</h4>
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="input-group shadow-sm" style="width: 400px;">
                                                <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                                                <input type="text" class="form-control border-start-0 ps-1" id="searchPayment" placeholder="Search payments..." onkeyup="filterTable('searchPayment', 'paymentTbody')">
                                            </div>
                                        </div>                                      
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
                                                <tbody id="paymentTbody">
                                                    <c:choose>
                                                        <c:when test="${empty requestScope.paymentList}">
                                                            <tr><td colspan="4" class="text-center py-5 text-muted">No payment records found.</td></tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${requestScope.paymentList}" var="pay">
                                                                <tr>
                                                                    <td class="ps-4 fw-bold">#REC-${pay.id}</td>
                                                                    <td>Appointment #${pay.appointment.id} - ${pay.appointment.carPlateNumber}</td>
                                                                    <td class="fw-bold text-success">RM ${pay.amount}</td>
                                                                    <td class="text-end pe-4">
                                                                        <button class="btn btn-sm btn-primary" onclick="printReceipt(
                                                                            '${pay.id}', 
                                                                            '<fmt:formatDate value='${pay.paymentDate}' pattern='dd MMM yyyy, hh:mm a' />', 
                                                                            '${pay.appointment.customer.fullName}', 
                                                                            '${pay.appointment.carPlateNumber}', 
                                                                            '${pay.appointment.serviceType.name}', 
                                                                            '${pay.method}',
                                                                            '${pay.amount}'
                                                                        )">
                                                                            <i class="fa-solid fa-print me-1"></i> Print Receipt
                                                                        </button>
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
                            
                        </div>
                        
                        <div class="col-xl-3 col-lg-4 order-2 order-md-1 wow fadeInUp" data-wow-delay=".3s">
                            <div class="main-sidebar">
                                <div class="single-sidebar-widget">
                                    <div class="dishes-card style2 wow fadeInUp" data-wow-delay="0.2s">
                                        <div class="dishes-thumb">
                                            <img src="static/img/dishes/dishes2_1.png" alt="thumb">
                                            <div class="circle-shape"><img class="cir36" src="static/img/food-items/circleShape.png" alt="shape"></div>
                                        </div>
                                        <div class="dishes-content">
                                            <a href="#edit-profile">
                                                <h3>${sessionScope.currentUser.fullName}</h3>
                                            </a>
                                            <div class="text mb-4">Counter Staff | ${sessionScope.currentUser.email}</div>
                                            
                                            <a href="#edit-profile" class="theme-btn style6 sidebar-btn active">
                                                <i class="fa-solid fa-user-pen fa-fw"></i> My Profile
                                            </a>
                                            <a href="#manage-customers" class="theme-btn style6 sidebar-btn">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                            
        <jsp:include page="component/registerCustomerPopUp.jsp" />
        <jsp:include page="component/editCustomerPopUp.jsp" />
        <jsp:include page="component/editAppointmentModal.jsp" />
        <jsp:include page="component/bookAppointmentModal.jsp" />
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <c:if test="${not empty sessionScope.popupMessage}">
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    Swal.fire({
                        icon: '${sessionScope.popupType}', // 'success' or 'error'
                        title: '${sessionScope.popupType == "error" ? "Action Failed!" : "Success!"}',
                        text: '${sessionScope.popupMessage}',
                        confirmButtonColor: '#0d6efd', // Matches Bootstrap Primary Blue
                        timer: ${sessionScope.popupType == "success" ? 3000 : 0}, // Auto-close successes after 3s
                        timerProgressBar: ${sessionScope.popupType == "success"}
                    });
                });
            </script>
            <c:remove var="popupMessage" scope="session" />
            <c:remove var="popupType" scope="session" />
        </c:if>
            
        <jsp:include page="component/checkoutAppointmentModal.jsp" />
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
        
        <script>
            document.addEventListener("DOMContentLoaded", function() {
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

                // Populate Edit Customer Modal automatically when clicked!
                const editButtons = document.querySelectorAll('.edit-btn');
                editButtons.forEach(btn => {
                    btn.addEventListener('click', function() {
                        document.getElementById('edit-userId').value = this.getAttribute('data-id');
                        document.getElementById('edit-fullName').value = this.getAttribute('data-fullname');
                        document.getElementById('edit-email').value = this.getAttribute('data-email');
                        document.getElementById('edit-phone').value = this.getAttribute('data-phone');
                        document.getElementById('edit-username').value = this.getAttribute('data-username');
                        document.getElementById('edit-address').value = this.getAttribute('data-address');
                        document.getElementById('edit-points').value = this.getAttribute('data-points');
                    });
                });

                // Real-time Table Search Filter
                window.filterTable = function(inputId, tbodyId, dropdownId = null) {
                    const searchText = document.getElementById(inputId).value.toLowerCase();
                    
                    // If a dropdown was passed in, get its value. Otherwise, just use "" (empty string)
                    const statusFilter = dropdownId ? document.getElementById(dropdownId).value.toLowerCase() : "";
                    
                    const tbody = document.getElementById(tbodyId);
                    const rows = tbody.getElementsByTagName('tr');

                    for (let i = 0; i < rows.length; i++) {
                        // Skip filtering if it's an empty/loading state row
                        if (rows[i].cells.length === 1) continue; 
                        
                        const rowText = rows[i].innerText.toLowerCase();
                        
                        // Grab the data-status attribute from the <tr> (if it exists)
                        const rowStatus = rows[i].getAttribute('data-status') ? rows[i].getAttribute('data-status').toLowerCase() : "";

                        // 1. Does the row match the text typed in the search box?
                        const matchesSearch = rowText.includes(searchText);
                        
                        // 2. Does the row match the dropdown selection? (If dropdown is "All Status", matchesStatus is true)
                        const matchesStatus = statusFilter === "" || rowStatus === statusFilter;

                        // Only show the row if it passes BOTH filters!
                        if (matchesSearch && matchesStatus) {
                            rows[i].style.display = '';
                        } else {
                            rows[i].style.display = 'none';
                        }
                    }
                };
                
                const checkoutBtns = document.querySelectorAll('.checkout-btn');
                checkoutBtns.forEach(btn => {
                    btn.addEventListener('click', function() {
                        document.getElementById('checkout-apptId').value = this.getAttribute('data-apptid');
                        document.getElementById('checkout-customerName').innerText = this.getAttribute('data-customer');
                        document.getElementById('checkout-serviceName').innerText = this.getAttribute('data-service');

                        const price = parseFloat(this.getAttribute('data-price')).toFixed(2);
                        document.getElementById('checkout-priceDisplay').innerText = "RM " + price;
                        document.getElementById('checkout-priceInput').value = price;
                    });
                });
                
                const editApptBtns = document.querySelectorAll('.edit-appt-btn');
                editApptBtns.forEach(btn => {
                    btn.addEventListener('click', function() {
                        document.getElementById('editAppt-id').value = this.getAttribute('data-id');
                        document.getElementById('editAppt-service').value = this.getAttribute('data-service');
                        document.getElementById('editAppt-technician').value = this.getAttribute('data-technician');
                        document.getElementById('editAppt-plate').value = this.getAttribute('data-plate');
                        document.getElementById('editAppt-remarks').value = this.getAttribute('data-remarks');
                        document.getElementById('editAppt-status').value = this.getAttribute('data-status');

                        // 1. Set the Date FIRST (because the time generator needs to read it!)
                        document.getElementById('editAppt-date').value = this.getAttribute('data-date');

                        // 2. THE FIX: Grab the time, then run the generator function to build the options!
                        const existingTime = this.getAttribute('data-time');
                        if (typeof window.updateEditTimeSlots === "function") {
                            window.updateEditTimeSlots(existingTime);
                        }
                    });
                });
            });
            function printReceipt(receiptId, date, customerName, plateNo, serviceName, method, amount) {
                // Open a larger, centered popup window
                const width = 1200;
                const height = 800;
                const left = (screen.width / 2) - (width / 2);
                const top = (screen.height / 2) - (height / 2);
                const printWindow = window.open('', '_blank', 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
                
                const formattedAmount = parseFloat(amount).toFixed(2);
                
                // Build the beautiful, modern HTML receipt
                const html = `
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <title>Receipt #REC-` + receiptId + `</title>
                        <style>
                            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
                            
                            :root {
                                --primary: #0d6efd; /* Bootstrap Blue */
                                --text-main: #2b2b2b;
                                --text-muted: #6c757d;
                                --border-color: #e9ecef;
                                --bg-color: #f4f7f9;
                            }
                            
                            body {
                                font-family: 'Inter', -apple-system, sans-serif;
                                background-color: var(--bg-color);
                                color: var(--text-main);
                                display: flex;
                                justify-content: center;
                                padding: 40px 20px;
                                margin: 0;
                            }
                            
                            .receipt-container {
                                background: #ffffff;
                                width: 100%;
                                max-width: 420px;
                                border-radius: 16px;
                                box-shadow: 0 15px 35px rgba(0,0,0,0.08);
                                overflow: hidden;
                            }
                            
                            .receipt-header {
                                background: var(--primary);
                                color: #ffffff;
                                text-align: center;
                                padding: 35px 20px 25px;
                            }
                            
                            .receipt-header h2 { margin: 0 0 8px; font-size: 26px; font-weight: 700; letter-spacing: 1px; }
                            .receipt-header p { margin: 0; font-size: 14px; opacity: 0.9; line-height: 1.5; }
                            
                            .receipt-body { padding: 35px 30px; }
                            
                            .info-row { display: flex; justify-content: space-between; margin-bottom: 14px; font-size: 15px; }
                            .info-row .label { color: var(--text-muted); }
                            .info-row .value { font-weight: 600; text-align: right; }
                            
                            .divider { border-top: 2px dashed var(--border-color); margin: 25px 0; }
                            
                            .total-row { display: flex; justify-content: space-between; align-items: center; margin-top: 25px; }
                            .total-row .label { font-size: 18px; font-weight: 600; color: var(--text-muted); }
                            .total-row .value { font-size: 32px; font-weight: 700; color: var(--primary); }
                            
                            .receipt-footer { 
                                text-align: center; 
                                padding: 25px; 
                                background: #f8f9fa; 
                                font-size: 14px; 
                                color: var(--text-muted); 
                                border-top: 1px solid var(--border-color); 
                            }
                            
                            /* --- PRINT STYLES --- */
                            /* These rules strip away the background colors and shadows so it prints perfectly on a real printer! */
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
                                <div class="info-row">
                                    <span class="label">Receipt No</span>
                                    <span class="value">#REC-` + receiptId + `</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Date & Time</span>
                                    <span class="value">` + date + `</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Customer</span>
                                    <span class="value">` + customerName + `</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Vehicle Plate</span>
                                    <span class="value">` + plateNo + `</span>
                                </div>
                                
                                <div class="divider"></div>
                                
                                <div class="info-row">
                                    <span class="label">Service Performed</span>
                                    <span class="value">` + serviceName + `</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Payment Method</span>
                                    <span class="value">` + method + `</span>
                                </div>
                                
                                <div class="divider"></div>
                                
                                <div class="total-row">
                                    <span class="label">TOTAL DUE</span>
                                    <span class="value">RM ` + formattedAmount + `</span>
                                </div>
                            </div>
                            
                            <div class="receipt-footer">
                                <strong>Thank you for your business!</strong><br>
                                Drive safely and see you next time.
                            </div>
                        </div>
                        
                        <script>
                            // Wait a fraction of a second to ensure the Google Font loads before printing
                            window.onload = function() { 
                                setTimeout(function() {
                                    window.print(); 
                                }, 300);
                            }
                        <\/script>
                    </body>
                    </html>
                `;
                
                // Write the HTML to the popup
                printWindow.document.write(html);
                printWindow.document.close();
            }
        </script>
    </body>
</html>