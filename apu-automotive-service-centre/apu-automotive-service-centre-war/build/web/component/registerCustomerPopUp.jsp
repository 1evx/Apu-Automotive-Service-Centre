<%-- 
    Document   : registerCustomerPopUp.jsp
    Created on : 4 Apr 2026, 11:46:45 am
    Author     : Asus
--%>

<%-- 
    Document   : registerCustomerModal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="registerCustomerPopUp" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 border-0 shadow">
            
            <div class="modal-header border-bottom-0 pb-0">
                <h5 class="modal-title fw-bold"><i class="fa-solid fa-user-plus text-primary me-2"></i>Register New Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <form action="RegisterCustomerServlet" method="POST">
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Full Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="fullName" required>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Email <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Phone Number <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="phoneNumber" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">IC Number / Passport <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="icNumber" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold small">Username <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Home Address</label>
                        <textarea class="form-control" name="address" rows="2"></textarea>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small">Temporary Password <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" name="password" required>
                    </div>
                </div>
                
                <div class="modal-footer border-top-0 pt-0">
                    <button type="button" class="btn btn-light fw-bold" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary fw-bold">Register Customer</button>
                </div>
            </form>
            
        </div>
    </div>
</div>
