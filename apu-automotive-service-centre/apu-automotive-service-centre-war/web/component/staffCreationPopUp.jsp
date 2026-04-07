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
            <div class="modal-dialog modal-dialog-centered modal-lg"> <div class="modal-content border-0 shadow">

                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="registerStaffModalLabel"><i class="fa-solid fa-user-plus me-2"></i> Register New Staff</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form action="RegisterStaffServlet" method="POST">
                        <div class="modal-body p-4">
                            
                            <div class="mb-4 pb-3 border-bottom">
                                <label class="form-label fw-bold small text-primary text-uppercase">1. Assign System Role</label>
                                <select name="role" id="create-staff-role" class="form-select border-primary" required onchange="toggleRoleFields()">
                                    <option value="" disabled selected>Select a role...</option>
                                    <option value="Manager">Manager</option>
                                    <option value="CounterStaff">Counter Staff</option>
                                    <option value="Technician">Technician</option>
                                </select>
                            </div>

                            <label class="form-label fw-bold small text-primary text-uppercase">2. General Information</label>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label fw-bold small text-muted">Full Name</label>
                                    <input type="text" name="fullName" class="form-control" placeholder="e.g., John Doe" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label fw-bold small text-muted">Username</label>
                                    <input type="text" name="username" class="form-control" placeholder="e.g., johndoe99" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label fw-bold small text-muted">Email Address</label>
                                    <input type="email" name="email" class="form-control" placeholder="employee@apucare.com" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label fw-bold small text-muted">IC / Passport No.</label>
                                    <input type="text" name="icNumber" class="form-control" placeholder="Without dashes (-)" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label fw-bold small text-muted">Phone Number</label>
                                    <input type="text" name="phoneNumber" class="form-control" placeholder="e.g., 0123456789">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label fw-bold small text-muted">Temporary Password</label>
                                    <input type="password" name="password" class="form-control" placeholder="Initial password" required>
                                </div>
                            </div>

                            <div class="mb-4 pb-3 border-bottom">
                                <label class="form-label fw-bold small text-muted">Home Address</label>
                                <textarea name="address" class="form-control" rows="2" placeholder="Full residential address..."></textarea>
                            </div>

                            <div id="dynamic-role-section" style="display: none;">
                                <label class="form-label fw-bold small text-primary text-uppercase">3. Role-Specific Details</label>

                                <div id="manager-fields" style="display: none;">
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small text-muted">Office Location</label>
                                        <input type="text" name="officeLocation" id="edit-staff-office" class="form-control" placeholder="e.g., HQ - Block A">
                                    </div>
                                </div>

                                <div id="technician-fields" style="display: none;">
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small text-muted">Technical Specialization</label>
                                        <input type="text" name="specialization" id="edit-staff-spec" class="form-control" placeholder="e.g., Engine Diagnostics">
                                    </div>
                                </div>

                                <div id="counter-fields" style="display: none;">
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small text-muted">Shift Type</label>
                                        <select name="shiftType" id="edit-staff-shift" class="form-select">
                                            <option value="Morning (8AM - 4PM)">Morning (8AM - 4PM)</option>
                                            <option value="Evening (3PM - 11PM)">Evening (3PM - 11PM)</option>
                                        </select>
                                    </div>
                                </div>
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

        <script>
            function toggleRoleFields() {
                const role = document.getElementById('create-staff-role').value; // Or 'edit-staff-role' in the update popup
                const dynamicSection = document.getElementById('dynamic-role-section');
                const managerFields = document.getElementById('manager-fields');
                const techFields = document.getElementById('technician-fields');
                const counterFields = document.getElementById('counter-fields'); // NEW

                // Hide all by default
                managerFields.style.display = 'none';
                techFields.style.display = 'none';
                counterFields.style.display = 'none'; // NEW

                if (role === 'Manager') {
                    dynamicSection.style.display = 'block';
                    managerFields.style.display = 'block';
                } else if (role === 'Technician') {
                    dynamicSection.style.display = 'block';
                    techFields.style.display = 'block';
                } else if (role === 'CounterStaff') { // NEW
                    dynamicSection.style.display = 'block';
                    counterFields.style.display = 'block';
                } else {
                    dynamicSection.style.display = 'none';
                }
            }
        </script>
    </body>
</html>
