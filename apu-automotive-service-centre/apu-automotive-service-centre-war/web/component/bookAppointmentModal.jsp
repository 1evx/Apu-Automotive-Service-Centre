<%-- 
    Document   : bookAppointmentModal
    Created on : 4 Apr 2026, 3:51:29 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="bookAppointmentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 border-0 shadow">
            
            <div class="modal-header border-bottom-0 pb-0">
                <h5 class="modal-title fw-bold"><i class="fa-solid fa-calendar-plus text-primary me-2"></i>Book Appointment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <form action="BookAppointmentServlet" method="POST">
                <div class="modal-body">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Select Customer <span class="text-danger">*</span></label>
                        <select class="form-select" name="customerId" required>
                            <option value="" disabled selected>-- Choose Customer --</option>
                            <c:forEach items="${requestScope.customerList}" var="cust">
                                <option value="${cust.userId}">${cust.fullName} (${cust.phoneNumber})</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Required Service <span class="text-danger">*</span></label>
                        <select class="form-select" name="serviceId" required>
                            <option value="" disabled selected>-- Choose Service --</option>
                            <c:forEach items="${requestScope.serviceList}" var="svc">
                                <option value="${svc.id}">${svc.name} (RM ${svc.price})</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Assign Technician <span class="text-danger">*</span></label>
                            <select class="form-select" name="technicianId" required>
                                <option value="" disabled selected>-- Choose Technician --</option>
                                <c:forEach items="${requestScope.technicianList}" var="tech">
                                    <option value="${tech.userId}">${tech.fullName} - ${tech.specialization}</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Car Plate Number <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="carPlateNumber" placeholder="e.g., WVD 1234" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Date (Next 5 Days) <span class="text-danger">*</span></label>
                            <select class="form-select" id="appointmentDateDropdown" name="appointmentDate" required>
                                <option value="" disabled selected>-- Select Date --</option>
                                </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Time Slot <span class="text-danger">*</span></label>
                            <select class="form-select" id="appointmentTimeDropdown" name="appointmentTime" required>
                                <option value="" disabled selected>-- Select Time --</option>
                                </select>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Remarks / Symptoms</label>
                        <textarea class="form-control" name="remarks" rows="2" placeholder="e.g., Engine making a weird noise..."></textarea>
                    </div>
                    
                </div>
                
                <div class="modal-footer border-top-0 pt-0">
                    <button type="button" class="btn btn-light fw-bold" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary fw-bold">Confirm Booking</button>
                </div>
            </form>
            
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const dateDropdown = document.getElementById("appointmentDateDropdown");
        const timeDropdown = document.getElementById("appointmentTimeDropdown");
        
        // 1. POPULATE THE NEXT 5 DAYS
        const todayDate = new Date();
        for(let i = 0; i < 5; i++) {
            let nextDate = new Date(todayDate);
            nextDate.setDate(todayDate.getDate() + i);
            
            // Format for the database (YYYY-MM-DD)
            let yyyy = nextDate.getFullYear();
            let mm = String(nextDate.getMonth() + 1).padStart(2, '0');
            let dd = String(nextDate.getDate()).padStart(2, '0');
            let valueDate = yyyy + "-" + mm + "-" + dd; 
            
            // Format for the user to read
            let displayDate = nextDate.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });
            if (i === 0) displayDate = "Today (" + displayDate + ")";
            
            let option = document.createElement("option");
            option.value = valueDate;
            option.text = displayDate;
            dateDropdown.appendChild(option);
        }

        // 2. POPULATE THE TIMES DYNAMICALLY WHEN DATE CHANGES
        function updateTimeSlots() {
            // Clear old time slots
            timeDropdown.innerHTML = '<option value="" disabled selected>-- Select Time --</option>';
            
            const selectedDateStr = dateDropdown.value;
            if (!selectedDateStr) return;

            // ALWAYS reset to default opening and closing times for ANY day
            let startHour = 8;  // 8 AM
            const endHour = 20; // 11 PM

            // Get a fresh Date object for RIGHT NOW
            const rightNow = new Date();
            let yyyy = rightNow.getFullYear();
            let mm = String(rightNow.getMonth() + 1).padStart(2, '0');
            let dd = String(rightNow.getDate()).padStart(2, '0');
            const exactTodayStr = yyyy + "-" + mm + "-" + dd;

            // THE FIX: ONLY change the start time if the date picked is literally TODAY
            if (selectedDateStr === exactTodayStr) {
                let currentHour = rightNow.getHours();
                
                // If it is past 8 AM today, push the start time to the next available hour
                if (currentHour >= 8) {
                    startHour = currentHour + 1;
                }
            }

            // If we are booking for today, and it is already past closing time
            if (startHour > endHour) {
                let option = document.createElement("option");
                option.text = "Closed for today";
                option.value = "";
                option.disabled = true;
                timeDropdown.appendChild(option);
                return; 
            }

            // Build the time strings (e.g., 08:00 AM)
            for (let hour = startHour; hour <= endHour; hour++) {
                let displayHour = hour % 12 || 12; 
                let ampm = hour < 12 ? 'AM' : 'PM';
                let formattedHour = displayHour < 10 ? '0' + displayHour : displayHour;
                
                // Safe string building for JSP
                let timeStr = formattedHour + ":00 " + ampm;

                let option = document.createElement("option");
                option.value = timeStr;
                option.text = timeStr;
                timeDropdown.appendChild(option);
            }
        }

        // 3. LISTEN FOR DATE CHANGES
        dateDropdown.addEventListener("change", updateTimeSlots);
        
        // 4. TRIGGER ON LOAD (Just in case the browser pre-selects a date)
        if (dateDropdown.value !== "") {
            updateTimeSlots();
        }
    });
</script>