<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="editCustomerPopUp" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 border-0 shadow">
            
            <div class="modal-header border-bottom-0 pb-0">
                <h5 class="modal-title fw-bold"><i class="fa-solid fa-user-pen text-primary me-2"></i>Edit Customer Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <form action="EditCustomerServlet" method="POST">
                <div class="modal-body">
                    <input type="hidden" id="edit-userId" name="userId">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Full Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="edit-fullName" name="fullName" required>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Email <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="edit-email" name="email" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Phone Number <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="edit-phone" name="phoneNumber" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Username (Read-Only)</label>
                            <input type="text" class="form-control bg-light" id="edit-username" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small text-warning">Loyalty Points</label>
                            <input type="number" class="form-control" id="edit-points" name="loyaltyPoints" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Home Address</label>
                        <textarea class="form-control" id="edit-address" name="address" rows="2"></textarea>
                    </div>
                </div>
                
                <div class="modal-footer border-top-0 pt-0">
                    <button type="button" class="btn btn-light fw-bold" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary fw-bold">Save Changes</button>
                </div>
            </form>
            
        </div>
    </div>
</div>