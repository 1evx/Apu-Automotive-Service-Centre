<%-- 
    Document   : serviceUpdatePopUp
    Created on : Apr 2, 2026, 3:37:59 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="modal fade" id="editServiceModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow">

                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title"><i class="fa-solid fa-pen-to-square me-2"></i> Edit Service Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <form action="UpdateServiceServlet" method="POST">
                    <div class="modal-body p-4">

                        <input type="hidden" name="serviceTypeId" id="edit-service-id">

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">Service Name</label>
                            <input type="text" name="serviceName" id="edit-service-name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">Description</label>
                            <textarea name="description" id="edit-service-description" class="form-control" rows="2"></textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">Price (RM)</label>
                                <input type="number" name="price" id="edit-service-price" step="0.01" min="0" class="form-control" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">Duration (Hours)</label>
                                <input type="number" name="durationHours" id="edit-service-duration" min="1" class="form-control" required>
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer bg-light border-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary px-4 fw-bold">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</html>
