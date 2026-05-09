<%-- 
    Document   : book_appointment
    Created on : 19 Apr 2026, 8:43:38 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="gramentheme">
        <meta name="description" content="APU Automotive Service Centre">
        <title>APU ASC - Book Appointment</title>
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
    <body class="bg-light">
        <jsp:include page="component/preloader.jsp" />
        <div class="mouse-cursor cursor-outer"></div>
        <div class="mouse-cursor cursor-inner"></div>

        <button id="back-top" class="back-to-top">
            <i class="fa-regular fa-arrow-up"></i>
        </button>

        <jsp:include page="component/offcanvas.jsp" />
        <jsp:include page="component/dashboardNavbar.jsp" />
        <div class="container mt-5 mb-5" style="max-width: 900px;">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold mb-0"><i class="fa-solid fa-calendar-plus text-primary me-2"></i> Book New Appointment</h3>
                <a href="CounterStaffDashboardServlet#manage-appointments" class="btn btn-outline-secondary btn-sm"><i class="fa-solid fa-arrow-left me-1"></i> Back to Dashboard</a>
            </div>

            <div class="card border-0 shadow-sm rounded-4 mb-4" id="step1-card">
                <div class="card-header bg-white p-4 border-bottom">
                    <h5 class="mb-0 text-primary fw-bold">Step 1: Find Customer</h5>
                </div>
                <div class="card-body p-4">
                    <div class="input-group input-group-lg shadow-sm mb-3">
                        <span class="input-group-text bg-white text-muted border-end-0"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <input type="text" id="customerSearch" class="form-control border-start-0 ps-0" placeholder="Search by name, phone number, or IC..." onkeyup="filterCustomers()">
                    </div>
                    
                    <div class="list-group" id="customerList" style="max-height: 250px; overflow-y: auto;">
                        <c:choose>
                            <c:when test="${empty requestScope.customerList}">
                                <div class="text-center text-muted p-3">No customers found in database.</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${requestScope.customerList}" var="cust">
                                    <button type="button" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center cust-item" 
                                        data-search="${cust.fullName} ${cust.phoneNumber} ${cust.icNumber}"
                                        onclick="selectCustomer('${cust.userId}', '${cust.fullName}', '${cust.phoneNumber}')">
                                        <div>
                                            <div class="fw-bold fs-5">${cust.fullName}</div>
                                            <small class="text-muted"><i class="fa-solid fa-phone me-1"></i> ${cust.phoneNumber} &nbsp;|&nbsp; <i class="fa-solid fa-id-card me-1"></i> ${cust.icNumber}</small>
                                        </div>
                                        <span class="btn btn-sm btn-primary rounded-pill px-3">Select</span>
                                    </button>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <div class="card border-0 shadow-sm rounded-4" id="step2-card" style="display: none; opacity: 0; transition: opacity 0.5s;">
                <div class="card-header bg-primary text-white p-4 border-bottom d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold">Step 2: Appointment Details</h5>
                    <button type="button" class="btn btn-sm btn-light text-primary fw-bold" onclick="resetSearch()">Change Customer</button>
                </div>
                
                <form action="BookAppointmentServlet" method="POST">
                    <div class="card-body p-5">
                        
                        <input type="hidden" id="selectedCustomerId" name="customerId" required>

                        <div class="alert alert-primary bg-primary bg-opacity-10 border-primary border-opacity-25 mb-4 rounded-3 d-flex align-items-center">
                            <i class="fa-solid fa-user-check fs-2 text-primary me-3"></i>
                            <div>
                                <span class="d-block small text-muted text-uppercase fw-bold">Booking For</span>
                                <span class="fs-5 fw-bold text-dark" id="displayCustomerName"></span>
                                <span class="ms-2 badge bg-white text-primary border" id="displayCustomerPhone"></span>
                            </div>
                        </div>

                        <div class="row g-4 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted">Required Service <span class="text-danger">*</span></label>
                                <select class="form-select form-select-lg" name="serviceId" required>
                                    <option value="" disabled selected>-- Choose Service --</option>
                                    <c:forEach items="${requestScope.serviceList}" var="svc">
                                        <option value="${svc.id}">${svc.name} (RM ${svc.price})</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted">Assign Technician <span class="text-danger">*</span></label>
                                <select class="form-select form-select-lg" name="technicianId" required>
                                    <option value="" disabled selected>-- Choose Technician --</option>
                                    <c:forEach items="${requestScope.technicianList}" var="tech">
                                        <option value="${tech.userId}">${tech.fullName} - ${tech.specialization}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row g-4 mb-4">
                            <div class="col-md-4">
                                <label class="form-label fw-bold small text-muted">Car Plate Number <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-lg text-uppercase" name="carPlateNumber" placeholder="e.g., WVD 1234" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-bold small text-muted">Date (Next 5 Days) <span class="text-danger">*</span></label>
                                <select class="form-select form-select-lg" id="appointmentDateDropdown" name="appointmentDate" required>
                                    <option value="" disabled selected>-- Select Date --</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-bold small text-muted">Time Slot <span class="text-danger">*</span></label>
                                <select class="form-select form-select-lg" id="appointmentTimeDropdown" name="appointmentTime" required>
                                    <option value="" disabled selected>-- Select Time --</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold small text-muted">Remarks / Symptoms</label>
                            <textarea class="form-control" name="remarks" rows="3" placeholder="Describe the issue, e.g., Engine making a weird noise, Aircon not cold..."></textarea>
                        </div>
                        
                    </div>
                    
                    <div class="card-footer bg-light p-4 text-end border-top-0 rounded-bottom-4">
                        <button type="submit" class="btn btn-primary btn-lg px-5 fw-bold"><i class="fa-solid fa-check-circle me-2"></i> Confirm Booking</button>
                    </div>
                </form>
            </div>

        </div>
        
        <script src="static/js/jquery-3.7.1.min.js"></script>
        <script src="static/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/main.js"></script>

        <script>
            // search
            function filterCustomers() {
                const input = document.getElementById('customerSearch').value.toLowerCase();
                const items = document.querySelectorAll('.cust-item');
                
                items.forEach(item => {
                    const searchData = item.getAttribute('data-search').toLowerCase();
                    if (searchData.includes(input)) {
                        item.classList.remove('d-none');
                        item.classList.add('d-flex');
                    } else {
                        item.classList.remove('d-flex');
                        item.classList.add('d-none');
                    }
                });
            }

            function selectCustomer(id, name, phone) {
                document.getElementById('selectedCustomerId').value = id;
                document.getElementById('displayCustomerName').innerText = name;
                document.getElementById('displayCustomerPhone').innerText = phone;
                
                document.getElementById('step1-card').style.display = 'none';
                const step2 = document.getElementById('step2-card');
                step2.style.display = 'block';
                setTimeout(() => { step2.style.opacity = '1'; }, 50);
            }

            function resetSearch() {
                document.getElementById('step1-card').style.display = 'block';
                document.getElementById('step2-card').style.opacity = '0';
                setTimeout(() => { document.getElementById('step2-card').style.display = 'none'; }, 300);
                
                document.getElementById('customerSearch').value = '';
                filterCustomers(); 
            }

            //date time logic
            document.addEventListener("DOMContentLoaded", function() {
                const dateDropdown = document.getElementById("appointmentDateDropdown");
                const timeDropdown = document.getElementById("appointmentTimeDropdown");
                
                const todayDate = new Date();
                let validDaysFound = 0;
                let daysOffset = 0;

                //loop until we find 5 VALID working days (Skipping Sundays)
                while (validDaysFound < 5) {
                    let nextDate = new Date(todayDate);
                    nextDate.setDate(todayDate.getDate() + daysOffset);
                    
                    // getDay() returns 0 for Sunday. If it is NOT Sunday, add it to the list.
                    if (nextDate.getDay() !== 0) {
                        let yyyy = nextDate.getFullYear();
                        let mm = String(nextDate.getMonth() + 1).padStart(2, '0');
                        let dd = String(nextDate.getDate()).padStart(2, '0');
                        let valueDate = yyyy + "-" + mm + "-" + dd; 
                        
                        let displayDate = nextDate.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });
                        if (daysOffset === 0) displayDate = "Today (" + displayDate + ")";
                        
                        let option = document.createElement("option");
                        option.value = valueDate;
                        option.text = displayDate;

                        option.setAttribute("data-day", nextDate.getDay()); 
                        
                        dateDropdown.appendChild(option);
                        validDaysFound++;
                    }
                    daysOffset++;
                }

                function updateTimeSlots() {
                    timeDropdown.innerHTML = '<option value="" disabled selected>-- Select Time --</option>';
                    
                    const selectedOption = dateDropdown.options[dateDropdown.selectedIndex];
                    if (!selectedOption.value) return;

                    const selectedDateStr = selectedOption.value;
                    const selectedDayOfWeek = parseInt(selectedOption.getAttribute("data-day"));

                    //set strict operating hours based on the day
                    let startHour = 9; 
                    
                    // If Saturday, last slot is 12:00 PM. Otherwise, last slot is 5:00 PM.
                    let endHour = (selectedDayOfWeek === 6) ? 12 : 17; 

                    // don't let them book a time in the past
                    const rightNow = new Date();
                    let yyyy = rightNow.getFullYear();
                    let mm = String(rightNow.getMonth() + 1).padStart(2, '0');
                    let dd = String(rightNow.getDate()).padStart(2, '0');
                    const exactTodayStr = yyyy + "-" + mm + "-" + dd;

                    if (selectedDateStr === exactTodayStr) {
                        let currentHour = rightNow.getHours();
                        if (currentHour >= 9) {
                            startHour = currentHour + 1;
                        }
                    }

                    // if they are trying to book today, but it's already past closing time
                    if (startHour > endHour) {
                        let option = document.createElement("option");
                        option.text = "No slots available today";
                        option.value = "";
                        option.disabled = true;
                        timeDropdown.appendChild(option);
                        return; 
                    }

                    //generate the slots!
                    for (let hour = startHour; hour <= endHour; hour++) {
                        let displayHour = hour % 12 || 12; 
                        let ampm = hour < 12 ? 'AM' : 'PM';
                        let formattedHour = displayHour < 10 ? '0' + displayHour : displayHour;
                        let timeStr = formattedHour + ":00 " + ampm;

                        let option = document.createElement("option");
                        option.value = timeStr;
                        option.text = timeStr;
                        timeDropdown.appendChild(option);
                    }
                }

                dateDropdown.addEventListener("change", updateTimeSlots);
                if (dateDropdown.value !== "") updateTimeSlots();
            });
        </script>
    </body>
</html>
