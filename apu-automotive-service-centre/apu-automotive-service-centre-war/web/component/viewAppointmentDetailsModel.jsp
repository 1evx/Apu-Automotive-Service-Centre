<%-- 
    Document   : viewAppointmentDetailsModel
    Created on : 5 Apr 2026, 2:11:52 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
