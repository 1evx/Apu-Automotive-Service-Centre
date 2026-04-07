<%-- 
    Document   : editAppointmentModal
    Created on : 4 Apr 2026, 5:20:21 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editAppointmentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 border-0 shadow">
            
            <div class="modal-header border-bottom-0 pb-0">
                <h5 class="modal-title fw-bold"><i class="fa-solid fa-calendar-pen text-primary me-2"></i>Edit Appointment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <form action="EditAppointmentServlet" method="POST">
                <div class="modal-body">
                    <input type="hidden" id="editAppt-id" name="appointmentId">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Service</label>
                        <select class="form-select" id="editAppt-service" name="serviceId" required>
                            <c:forEach items="${requestScope.serviceList}" var="svc">
                                <option value="${svc.id}">${svc.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Technician</label>
                            <select class="form-select" id="editAppt-technician" name="technicianId" required>
                                <c:forEach items="${requestScope.technicianList}" var="tech">
                                    <option value="${tech.userId}">${tech.fullName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Car Plate Number</label>
                            <input type="text" class="form-control" id="editAppt-plate" name="carPlateNumber" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Date</label>
                            <input type="date" class="form-control" id="editAppt-date" name="appointmentDate" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Time Slot</label>
                            <select class="form-select" id="editAppt-time" name="appointmentTime" required>
                                <option value="" disabled selected>-- Select Time --</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Status</label>
                            <select class="form-select text-primary fw-bold" id="editAppt-status" name="status" required>
                                <option value="Scheduled">Scheduled</option>
                                <option value="Cancelled">Cancelled</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Remarks</label>
                            <textarea class="form-control" id="editAppt-remarks" name="remarks" rows="1"></textarea>
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer border-top-0 pt-0">
                    <button type="button" class="btn btn-light fw-bold" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary fw-bold">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const dateInput = document.getElementById("editAppt-date");
        const timeDropdown = document.getElementById("editAppt-time");

        // We attach this function directly to the window object so you can call it 
        // from your main dashboard script when opening the edit modal!
        window.updateEditTimeSlots = function(preserveExistingTime = null) {
            // Clear old time slots
            timeDropdown.innerHTML = '<option value="" disabled selected>-- Select Time --</option>';
            
            const selectedDateStr = dateInput.value;
            if (!selectedDateStr) return;

            let startHour = 8;  // 8 AM
            const endHour = 20; // 11 PM

            const rightNow = new Date();
            let yyyy = rightNow.getFullYear();
            let mm = String(rightNow.getMonth() + 1).padStart(2, '0');
            let dd = String(rightNow.getDate()).padStart(2, '0');
            const exactTodayStr = yyyy + "-" + mm + "-" + dd;

            // If the date picked is exactly today, check the clock
            if (selectedDateStr === exactTodayStr) {
                let currentHour = rightNow.getHours();
                if (currentHour >= 8) {
                    startHour = currentHour + 1;
                }
            }

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
                
                let timeStr = formattedHour + ":00 " + ampm;

                let option = document.createElement("option");
                option.value = timeStr;
                option.text = timeStr;
                
                // THE TRICK: If an existing time was passed in, auto-select it!
                if (preserveExistingTime === timeStr) {
                    option.selected = true;
                }
                
                timeDropdown.appendChild(option);
            }
        };

        // Listen for the manager changing the date manually
        dateInput.addEventListener("change", function() {
            window.updateEditTimeSlots(); // Don't preserve time if they pick a new date
        });
    });
</script>