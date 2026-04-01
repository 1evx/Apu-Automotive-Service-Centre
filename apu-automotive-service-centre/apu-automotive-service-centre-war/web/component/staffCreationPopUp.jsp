<%-- 
    Document   : staffCreationPopUp
    Created on : Apr 1, 2026, 8:50:50 PM
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="modal fade" id="registerStaffModal" tabindex="-1" aria-labelledby="registerStaffModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow">

                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="registerStaffModalLabel"><i class="fa-solid fa-user-plus me-2"></i> Register New Staff</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form action="RegisterStaffServlet" method="POST">
                        <div class="modal-body p-4">

                            <div class="mb-3">
                                <label class="form-label fw-bold small text-muted">Assign System Role</label>
                                <select name="role" class="form-select" required>
                                    <option value="" disabled selected>Select a role...</option>
                                    <option value="Manager">Manager</option>
                                    <option value="CounterStaff">Counter Staff</option>
                                    <option value="Technician">Technician</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold small text-muted">Full Name</label>
                                <input type="text" name="fullName" class="form-control" placeholder="e.g., John Doe" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold small text-muted">Email Address</label>
                                <input type="email" name="email" class="form-control" placeholder="employee@apucare.com" required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-bold small text-muted">Temporary Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Create an initial password" required>
                            </div>

                        </div>

                        <div class="modal-footer bg-light border-0">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary px-4 fw-bold">Create Account</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
