<%-- 
    Document   : checkoutAppointmentModal
    Created on : 4 Apr 2026, 4:52:06 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="checkoutAppointmentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 border-0 shadow">
            
            <div class="modal-header border-bottom-0 pb-0">
                <h5 class="modal-title fw-bold"><i class="fa-solid fa-cash-register text-success me-2"></i>Process Payment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
            <form action="ProcessPaymentServlet" method="POST">
                <div class="modal-body">
                    <input type="hidden" id="checkout-apptId" name="appointmentId">
                    
                    <div class="alert alert-light border border-success border-opacity-25 rounded-3 mb-4">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Customer:</span>
                            <span class="fw-bold" id="checkout-customerName"></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Service:</span>
                            <span class="fw-bold" id="checkout-serviceName"></span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between fs-5">
                            <span class="fw-bold text-dark">Total Due:</span>
                            <span class="fw-bold text-success" id="checkout-priceDisplay"></span>
                            <input type="hidden" id="checkout-priceInput" name="amountPaid">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold small">Payment Method <span class="text-danger">*</span></label>
                        <select class="form-select" name="paymentMethod" required>
                            <option value="Cash">Cash</option>
                            <option value="Credit Card">Credit/Debit Card</option>
                            <option value="E-Wallet">E-Wallet (TNG, GrabPay)</option>
                        </select>
                    </div>
                </div>
                
                <div class="modal-footer border-top-0 pt-0">
                    <button type="button" class="btn btn-light fw-bold" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success fw-bold"><i class="fa-solid fa-check me-2"></i>Confirm Payment</button>
                </div>
            </form>
            
        </div>
    </div>
</div>