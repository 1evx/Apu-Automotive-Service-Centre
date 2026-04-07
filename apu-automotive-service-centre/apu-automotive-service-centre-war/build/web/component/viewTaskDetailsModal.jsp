<%-- 
    Document   : viewTaskDetailsModal
    Created on : 5 Apr 2026, 12:27:16 am
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="viewTaskDetailsModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content rounded-4 border-0 shadow">
            
            <div class="modal-header border-bottom-0 pb-0">
                <h5 class="modal-title fw-bold"><i class="fa-solid fa-circle-info text-primary me-2"></i>Task Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <div class="modal-body p-4">
                <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
                    <div>
                        <h6 class="text-muted mb-1">Appointment Ref</h6>
                        <h4 class="fw-bold mb-0 text-dark" id="detail-ref"></h4>
                    </div>
                    <div class="text-end">
                        <span class="badge fs-6 mb-1" id="detail-status"></span>
                        <div class="text-muted small" id="detail-datetime"></div>
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6 mb-4 mb-md-0">
                        <h6 class="fw-bold text-primary mb-3"><i class="fa-solid fa-user me-2"></i>Customer Details</h6>
                        <div class="mb-2"><span class="text-muted d-inline-block" style="width: 80px;">Name:</span> <span class="fw-bold text-dark" id="detail-customer"></span></div>
                        <div class="mb-2"><span class="text-muted d-inline-block" style="width: 80px;">Phone:</span> <span class="fw-bold text-dark" id="detail-phone"></span></div>
                        <div class="mb-2"><span class="text-muted d-inline-block" style="width: 80px;">Email:</span> <span class="text-dark" id="detail-email"></span></div>
                    </div>
                    <div class="col-md-6">
                        <h6 class="fw-bold text-primary mb-3"><i class="fa-solid fa-car me-2"></i>Vehicle & Service</h6>
                        <div class="mb-2"><span class="text-muted d-inline-block" style="width: 80px;">Plate No:</span> <span class="fw-bold text-dark text-uppercase border rounded px-1" id="detail-plate"></span></div>
                        <div class="mb-2"><span class="text-muted d-inline-block" style="width: 80px;">Service:</span> <span class="fw-bold text-dark" id="detail-service"></span></div>
                    </div>
                </div>

                <div class="bg-light rounded-3 p-3 border">
                    <h6 class="fw-bold text-dark mb-2"><i class="fa-solid fa-clipboard-list me-2"></i>Notes & Feedback</h6>
                    <p class="mb-0 text-muted" id="detail-remarks" style="white-space: pre-wrap;"></p>
                </div>
            </div>
            
            <div class="modal-footer border-top-0 pt-0 justify-content-between">
                <button type="button" class="btn btn-outline-primary fw-bold" id="detail-view-comment-btn" style="display: none;">
                    <i class="fa-solid fa-star me-2"></i>View Customer Rating
                </button>
                <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Close</button>
            </div>
            
        </div>
    </div>
</div>
