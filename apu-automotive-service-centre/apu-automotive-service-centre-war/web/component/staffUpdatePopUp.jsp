<%-- 
    Document   : staffUpatePopUp
    Created on : Apr 1, 2026, 9:33:42 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="modal fade" id="editStaffModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow">

                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title"><i class="fa-solid fa-user-pen me-2"></i> Edit Staff Profile</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <form action="UpdateStaffServlet" method="POST">
                    <div class="modal-body p-4">

                        <input type="hidden" name="staffId" id="edit-staff-id">

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">System Role</label>
                            <select name="role" id="edit-staff-role" class="form-select" required>
                                <option value="Manager">Manager</option>
                                <option value="CounterStaff">Counter Staff</option>
                                <option value="Technician">Technician</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">Full Name</label>
                            <input type="text" name="fullName" id="edit-staff-name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">Email Address</label>
                            <input type="email" name="email" id="edit-staff-email" class="form-control" required>
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
