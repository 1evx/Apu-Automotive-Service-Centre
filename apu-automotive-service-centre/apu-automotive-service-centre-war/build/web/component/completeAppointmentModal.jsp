<%-- 
    Document   : completeAppointmentModal.jsp
    Created on : 4 Apr 2026, 8:09:21 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="completeAppointmentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 border-0 shadow">
            
            <div class="modal-header border-bottom-0 pb-0">
                <h5 class="modal-title fw-bold text-success"><i class="fa-solid fa-clipboard-check me-2"></i>Complete Job</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <form action="UpdateTaskStatusServlet" method="POST">
                <div class="modal-body">
                    <input type="hidden" id="complete-apptId" name="appointmentId">
                    <input type="hidden" name="newStatus" value="Completed">
                    
                    <div class="alert alert-success bg-success bg-opacity-10 border-success border-opacity-25 rounded-3 mb-3">
                        <i class="fa-solid fa-circle-info me-2"></i> Please provide a brief service report.
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold small">Technician Feedback / Notes <span class="text-danger">*</span></label>
                        <textarea class="form-control" name="technicianRemarks" rows="3" placeholder="e.g., Changed brake pads, checked tire pressure..." required></textarea>
                    </div>
                </div>
                
                <div class="modal-footer border-top-0 pt-0">
                    <button type="button" class="btn btn-light fw-bold" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success fw-bold">Submit & Complete</button>
                </div>
            </form>
            
        </div>
    </div>
</div>