<%-- 
    Document   : serviceCreationPopUp
    Created on : Apr 2, 2026, 3:37:08 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="modal fade" id="addServiceModal" tabindex="-1" aria-labelledby="addServiceModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow">

                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="addServiceModalLabel"><i class="fa-solid fa-tags me-2"></i> Add New Service</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <form action="AddServiceServlet" method="POST">
                    <div class="modal-body p-4">

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">Service Name</label>
                            <input type="text" name="serviceName" class="form-control" placeholder="e.g., Aircon Gas Refill" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">Description (Optional)</label>
                            <textarea name="description" class="form-control" rows="2" placeholder="Brief details about this service..."></textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">Price (RM)</label>
                                <input type="number" name="price" step="0.01" min="0" class="form-control" placeholder="0.00" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">Duration (Hours)</label>
                                <input type="number" name="durationHours" min="1" class="form-control" placeholder="1" required>
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer bg-light border-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary px-4 fw-bold">Create Service</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</html>
