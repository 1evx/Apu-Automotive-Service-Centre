<%-- 
    Document   : technician_dashboard
    Created on : Mar 21, 2026, 10:51:12 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.SystemUser"%>
<%@page import="model.Technician"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APU CARE - Technician Dashboard</title>
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

        <div class="shop-section section-padding fix">
            <div class="shop-wrapper style1">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-xl-9 col-lg-8 order-1 order-md-2 wow fadeInUp" data-wow-delay=".5s">
                            
                            <div id="dashboard-home" class="dashboard-section">
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-list" role="tabpanel">
                                        
                                        <h4 class="mb-4"><i class="fa-solid fa-clipboard-list text-primary me-2"></i> My Active Tasks</h4>
                                        
                                        <div class="row">
                                            <c:set var="activeTaskCount" value="0" />
                                            
                                            <c:forEach items="${requestScope.myTasks}" var="task">
                                                <c:if test="${task.status == 'Scheduled' || task.status == 'In Progress'}">
                                                    <c:set var="activeTaskCount" value="${activeTaskCount + 1}" />
                                                    
                                                    <div class="col-md-6 col-lg-12 mb-4">
                                                        <div class="card shadow-sm border-0 rounded-4 h-100">
                                                            <div class="card-body p-4 d-flex flex-column flex-lg-row justify-content-between align-items-lg-center gap-3">
                                                                
                                                                <div>
                                                                    <div class="d-flex align-items-center gap-2 mb-2">
                                                                        <span class="badge bg-${task.status == 'Scheduled' ? 'primary' : 'warning text-dark'} fs-6">
                                                                            ${task.status}
                                                                        </span>
                                                                        <span class="text-muted fw-bold"><i class="fa-regular fa-clock me-1"></i> <fmt:formatDate value="${task.appointmentDate}" pattern="dd MMM yyyy" /> at ${task.appointmentTime}</span>
                                                                    </div>
                                                                    
                                                                    <h5 class="fw-bold mb-1 text-uppercase">${task.carPlateNumber} - <span class="text-dark">${task.serviceType.name}</span></h5>
                                                                    <div class="text-muted small mb-2"><i class="fa-solid fa-user me-1"></i> Customer: ${task.customer.fullName}</div>
                                                                    
                                                                    <c:if test="${not empty task.remarks}">
                                                                        <div class="bg-light p-2 rounded-3 small text-danger border border-danger border-opacity-25">
                                                                            <i class="fa-solid fa-circle-exclamation me-1"></i> <strong>Note:</strong> ${task.remarks}
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                                
                                                                <div class="text-lg-end">
                                                                    <c:choose>
                                                                        <c:when test="${task.status == 'Scheduled'}">
                                                                            <form action="UpdateTaskStatusServlet" method="POST">
                                                                                <input type="hidden" name="appointmentId" value="${task.id}">
                                                                                <input type="hidden" name="newStatus" value="In Progress">
                                                                                <button type="submit" class="btn btn-primary px-4 py-2 fw-bold w-100 shadow-sm">
                                                                                    <i class="fa-solid fa-play me-2"></i> Start Job
                                                                                </button>
                                                                            </form>
                                                                        </c:when>
                                                                        <c:when test="${task.status == 'In Progress'}">
                                                                            <button type="button" class="btn btn-success px-4 py-2 fw-bold w-100 shadow-sm complete-job-btn"
                                                                                    data-bs-toggle="modal" 
                                                                                    data-bs-target="#completeAppointmentModal"
                                                                                    data-apptid="${task.id}">
                                                                                <i class="fa-solid fa-check-double me-2"></i> Complete Job
                                                                            </button>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            
                                            <c:if test="${activeTaskCount == 0}">
                                                <div class="col-12 text-center py-5">
                                                    <i class="fa-solid fa-mug-hot fa-3x text-muted opacity-50 mb-3"></i>
                                                    <h5 class="text-muted">No active tasks right now!</h5>
                                                    <p class="text-muted small">Take a break, you've earned it.</p>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                            
                            <div id="task-history" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 d-flex flex-wrap justify-content-between align-items-center border-bottom gap-3">
                                        <h4 class="widget-title mb-0"><i class="fa-solid fa-clock-rotate-left me-2"></i> Task History</h4>
                                        <div class="d-flex align-items-center gap-3">
                                            
                                            <input type="date" class="form-control shadow-sm" id="historyDateFilter" onchange="filterHistoryTable()" style="width: 160px;" title="Filter by Date">
                                            
                                            <div class="input-group shadow-sm" style="width: 400px;">
                                                <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                                                <input type="text" class="form-control border-start-0 ps-1" id="historySearchBox" placeholder="Search car, customer..." onkeyup="filterHistoryTable()">
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle mb-0">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="ps-4 py-3">Date Completed</th>
                                                        <th class="py-3">Car Plate & Service</th>
                                                        <th class="py-3">Customer</th>
                                                        <th class="py-3">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set var="historyCount" value="0" />
                                                    
                                                    <c:forEach items="${requestScope.myTasks}" var="task">
                                                        <c:if test="${task.status == 'Completed' || task.status == 'Paid'}">
                                                            <c:set var="historyCount" value="${historyCount + 1}" />
                                                            
                                                            <tr class="view-task-row" style="cursor: pointer;"
                                                                data-bs-toggle="modal" 
                                                                data-bs-target="#viewTaskDetailsModal"
                                                                data-appid="${task.id}"
                                                                data-date="<fmt:formatDate value='${task.appointmentDate}' pattern='yyyy-MM-dd' />"
                                                                data-ref="#APP-${task.id}"
                                                                data-fulldate="<fmt:formatDate value='${task.appointmentDate}' pattern='dd MMM yyyy' /> at ${task.appointmentTime}"
                                                                data-status="${task.status}"
                                                                data-customer="${task.customer.fullName}"
                                                                data-phone="${task.customer.phoneNumber}"
                                                                data-email="${task.customer.email}"
                                                                data-plate="${task.carPlateNumber}"
                                                                data-service="${task.serviceType.name}"
                                                                data-remarks="${not empty task.remarks ? task.remarks : 'No additional notes or feedback recorded.'}">
                                                                
                                                                <td class="ps-4">
                                                                    <div class="fw-bold"><fmt:formatDate value="${task.appointmentDate}" pattern="dd MMM yyyy" /></div>
                                                                    <small class="text-muted">${task.appointmentTime}</small>
                                                                </td>
                                                                <td>
                                                                    <div class="fw-bold text-uppercase">${task.carPlateNumber}</div>
                                                                    <small class="text-muted">${task.serviceType.name}</small>
                                                                </td>
                                                                <td>${task.customer.fullName}</td>
                                                                <td>
                                                                    <span class="badge bg-${task.status == 'Paid' ? 'success' : 'info'}">${task.status}</span>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                    
                                                    <c:if test="${historyCount == 0}">
                                                        <tr><td colspan="4" class="text-center py-5 text-muted">You have no completed tasks yet.</td></tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="edit-profile" class="dashboard-section" style="display: none;">
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

                                            <h5 class="mt-4 mb-3 text-primary"><i class="fa-solid fa-wrench me-2"></i>Technician Settings</h5>
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Specialization</label>
                                                    <input type="text" class="form-control" name="specialization" value="${sessionScope.currentUser.specialization}" required>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label fw-bold">Current Availability</label>
                                                    <select class="form-select" name="isAvailable">
                                                        <option value="true" ${sessionScope.currentUser.isAvailable ? 'selected' : ''}>Available for Jobs</option>
                                                        <option value="false" ${!sessionScope.currentUser.isAvailable ? 'selected' : ''}>Currently Busy / Unavailable</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="text-end mt-4 border-top pt-3">
                                                <button type="submit" class="btn btn-primary fw-bold px-4 py-2">Save Profile Updates</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                                                    
                             <div id="comment" class="dashboard-section" style="display: none;">
                                <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
                                    <div class="card-header bg-white p-4 border-bottom">
                                        <h4 class="widget-title mb-0"><i class="fa-regular fa-comments me-2"></i> Customer Feedback</h4>
                                        <p class="text-muted small mb-0 mt-1">See what customers are saying about your service.</p>
                                    </div>
                                    
                                    <div class="card-body p-4 bg-light">
                                        <div class="card-body p-4 bg-light">
                                            <c:choose>

                                                <c:when test="${empty requestScope.myComments}">
                                                    <div class="text-center py-5 text-muted">
                                                        <i class="fa-regular fa-comment-dots fa-3x mb-3 opacity-25"></i>
                                                        <h5>No feedback received yet.</h5>
                                                        <p class="small">When customers review your completed jobs, they will appear here!</p>
                                                    </div>
                                                </c:when>

                                                <c:otherwise>
                                                    <c:forEach items="${requestScope.myComments}" var="comment">

                                                        <div class="card mb-3 border-0 shadow-sm" id="comment-card-${comment.appointment.id}">
                                                            <div class="card-body p-4">
                                                                <div class="d-flex justify-content-between align-items-center mb-3">

                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="bg-primary bg-opacity-10 text-primary rounded-circle p-3 d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                                                                            <i class="fa-solid fa-user"></i>
                                                                        </div>
                                                                        <div>
                                                                            <h6 class="fw-bold mb-0">${comment.appointment.customer.fullName}</h6>
                                                                            <div class="text-muted small">Appointment #APP-${comment.appointment.id} &bull; <fmt:formatDate value="${comment.commentDate}" pattern="dd MMM yyyy" /></div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="text-warning">
                                                                        <c:forEach begin="1" end="5" var="i">
                                                                            <c:choose>
                                                                                <c:when test="${i <= comment.rating}">
                                                                                    <i class="fa-solid fa-star"></i> </c:when>
                                                                                <c:otherwise>
                                                                                    <i class="fa-regular fa-star"></i> </c:otherwise>
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
                                            <div class="text mb-4">Technician | ${sessionScope.currentUser.email}</div>
                                            
                                            <a href="#dashboard-home" class="theme-btn style6 sidebar-btn active">
                                                <i class="fa-solid fa-wrench fa-fw"></i> My Tasks
                                            </a>
                                            <a href="#task-history" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-clock-rotate-left fa-fw"></i> Task History
                                            </a>
                                            <a href="#edit-profile" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-solid fa-user-pen fa-fw"></i> Edit Profile
                                            </a>
                                            <a href="#comment" class="theme-btn style6 sidebar-btn">
                                                <i class="fa-regular fa-comments fa-fw"></i> Comment
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
        
        <jsp:include page="component/completeAppointmentModal.jsp" />
        <jsp:include page="component/viewTaskDetailsModal.jsp" />

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const sidebarButtons = document.querySelectorAll('.sidebar-btn');
                const dashboardSections = document.querySelectorAll('.dashboard-section');

                // --- TAB SWITCHING LOGIC ---
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

                // --- MODAL POPULATION LOGIC ---
                const completeBtns = document.querySelectorAll('.complete-job-btn');
                completeBtns.forEach(btn => {
                    btn.addEventListener('click', function() {
                        document.getElementById('complete-apptId').value = this.getAttribute('data-apptid');
                    });
                });
                
                // --- TASK HISTORY FILTER LOGIC ---
                window.filterHistoryTable = function() {
                    const searchText = document.getElementById('historySearchBox').value.toLowerCase();
                    const dateFilter = document.getElementById('historyDateFilter').value; // Format is automatically YYYY-MM-DD
                    
                    // Grab all rows inside the Task History table body specifically
                    const tbody = document.querySelector('#task-history tbody');
                    const rows = tbody.getElementsByTagName('tr');

                    for (let i = 0; i < rows.length; i++) {
                        // Skip the empty message row if the table is empty
                        if (rows[i].cells.length === 1) continue; 
                        
                        const rowText = rows[i].innerText.toLowerCase();
                        const rowDate = rows[i].getAttribute('data-date');

                        // 1. Check Text Search
                        const matchesSearch = rowText.includes(searchText);
                        
                        // 2. Check Date Filter (If date picker is empty, ignore it)
                        const matchesDate = (dateFilter === "") || (rowDate === dateFilter);

                        // Only show row if it passes BOTH filters
                        if (matchesSearch && matchesDate) {
                            rows[i].style.display = '';
                        } else {
                            rows[i].style.display = 'none';
                        }
                    }
                };
                
                const viewTaskRows = document.querySelectorAll('.view-task-row');
                viewTaskRows.forEach(row => {
                    row.addEventListener('click', function() {
                        
                        const appId = this.getAttribute('data-appid');
                        
                        // Populate Header & Details
                        document.getElementById('detail-ref').innerText = this.getAttribute('data-ref');
                        document.getElementById('detail-datetime').innerText = this.getAttribute('data-fulldate');
                        document.getElementById('detail-customer').innerText = this.getAttribute('data-customer');
                        document.getElementById('detail-phone').innerText = this.getAttribute('data-phone');
                        document.getElementById('detail-email').innerText = this.getAttribute('data-email');
                        document.getElementById('detail-plate').innerText = this.getAttribute('data-plate');
                        document.getElementById('detail-service').innerText = this.getAttribute('data-service');
                        document.getElementById('detail-remarks').innerText = this.getAttribute('data-remarks');
                        
                        const status = this.getAttribute('data-status');
                        const statusBadge = document.getElementById('detail-status');
                        statusBadge.innerText = status;
                        statusBadge.className = 'badge fs-6 mb-1 bg-' + (status === 'Paid' ? 'success' : 'info');
                        
                        // --- SMART REDIRECT LOGIC ---
                        const commentBtn = document.getElementById('detail-view-comment-btn');
                        const commentCard = document.getElementById('comment-card-' + appId);
                        
                        if (commentCard) {
                            // The customer left a comment! Show the button.
                            commentBtn.style.display = 'block';
                            
                            commentBtn.onclick = function() {
                                // 1. Close the popup modal
                                const modalElement = document.getElementById('viewTaskDetailsModal');
                                const modalInstance = bootstrap.Modal.getInstance(modalElement);
                                modalInstance.hide();
                                
                                // 2. Switch the dashboard to the Feedback tab
                                history.pushState(null, null, '#comment');
                                activateTab('comment');
                                
                                // 3. Wait for the tab to switch, then scroll to the specific comment
                                setTimeout(() => {
                                    commentCard.scrollIntoView({ behavior: 'smooth', block: 'center' });
                                    
                                    // Make it glow so the technician knows which one to read!
                                    commentCard.style.transition = "box-shadow 0.5s ease";
                                    commentCard.style.boxShadow = "0 0 0 4px rgba(13, 110, 253, 0.5)"; // Bootstrap primary glow
                                    
                                    // Remove the glow after 2 seconds
                                    setTimeout(() => {
                                        commentCard.style.boxShadow = "none";
                                    }, 2000);
                                }, 350); 
                            };
                        } else {
                            // No comment found for this specific task, keep button hidden
                            commentBtn.style.display = 'none';
                        }
                    });
                });
            });
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
</html>