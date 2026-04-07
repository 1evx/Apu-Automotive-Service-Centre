<%-- 
    Document   : staffUpdatePopUp
    Created on : Apr 1, 2026
    Author     : TPY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="modal fade" id="editStaffModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content border-0 pt-4 shadow">

                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title"><i class="fa-solid fa-user-pen me-2"></i> Edit Staff Profile</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <form action="UpdateStaffServlet" method="POST">
                    <div class="modal-body p-4">
                        <input type="hidden" name="staffId" id="edit-staff-id">

                        <div class="row border-bottom pb-3 mb-3">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">System Role (Locked)</label>
                                <input type="text" id="edit-staff-role-display" class="form-control bg-light text-muted" readonly>
                                <input type="hidden" id="edit-staff-role" name="role">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">Account Status</label>
                                <select name="isActive" id="edit-staff-active" class="form-select border-primary" required>
                                    <option value="true">Active (Access Granted)</option>
                                    <option value="false">Deactivated (Access Denied)</option>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">Full Name</label>
                                <input type="text" name="fullName" id="edit-staff-name" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">Username</label>
                                <input type="text" name="username" id="edit-staff-username" class="form-control" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">Email Address</label>
                            <input type="email" name="email" id="edit-staff-email" class="form-control" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">IC / Passport No.</label>
                                <input type="text" name="icNumber" id="edit-staff-ic" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold small text-muted">Phone Number</label>
                                <input type="text" name="phoneNumber" id="edit-staff-phone" class="form-control">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-muted">Home Address</label>
                            <textarea name="address" id="edit-staff-address" class="form-control" rows="2"></textarea>
                        </div>

                        <div id="edit-manager-fields" style="display: none;">
                            <div class="mb-0">
                                <label class="form-label fw-bold small text-muted">Office Location</label>
                                <input type="text" name="officeLocation" id="edit-staff-office" class="form-control">
                            </div>
                        </div>

                        <div id="edit-supermanager-fields" style="display: none;">
                            <div class="mb-0">
                                <label class="form-label fw-bold small text-danger">Master Clearance Level</label>
                                <input type="text" name="masterClearance" id="edit-staff-clearance" class="form-control border-danger" placeholder="e.g., Level 1">
                            </div>
                        </div>

                        <div id="edit-technician-fields" style="display: none;">
                            <div class="mb-0">
                                <label class="form-label fw-bold small text-muted">Technical Specialization</label>
                                <input type="text" name="specialization" id="edit-staff-spec" class="form-control">
                            </div>
                        </div>
                        
                        <div id="edit-counter-fields" style="display: none;">
                            <div class="mb-0">
                                <label class="form-label fw-bold small text-muted">Shift Type</label>
                                <select name="shiftType" id="edit-staff-shift" class="form-select">
                                    <option value="Morning (8AM - 4PM)">Morning (8AM - 4PM)</option>
                                    <option value="Evening (3PM - 11PM)">Evening (3PM - 11PM)</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer border-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary px-4 fw-bold">Update Staff Record</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Find all the "Edit" buttons in the data table
            const editButtons = document.querySelectorAll('.edit-staff-btn');

            editButtons.forEach(button => {
                button.addEventListener('click', function() {
                    
                    // 1. Read data attributes from the clicked button
                    const id = this.getAttribute('data-id');
                    const role = this.getAttribute('data-role');
                    const name = this.getAttribute('data-name');
                    const email = this.getAttribute('data-email');
                    const username = this.getAttribute('data-username');
                    const ic = this.getAttribute('data-ic');
                    const phone = this.getAttribute('data-phone');
                    const address = this.getAttribute('data-address');
                    const isActive = this.getAttribute('data-active');

                    // 2. Fill the modal's standard text boxes
                    document.getElementById('edit-staff-id').value = id;
                    document.getElementById('edit-staff-role-display').value = role;
                    document.getElementById('edit-staff-role').value = role;
                    document.getElementById('edit-staff-name').value = name;
                    document.getElementById('edit-staff-email').value = email;
                    document.getElementById('edit-staff-username').value = username;
                    document.getElementById('edit-staff-ic').value = ic;
                    document.getElementById('edit-staff-phone').value = phone;
                    document.getElementById('edit-staff-address').value = address;
                    
                    if (isActive !== null) {
                        document.getElementById('edit-staff-active').value = isActive;
                    }

                    // 3. Reset UI: Hide all dynamic fields
                    document.getElementById('edit-manager-fields').style.display = 'none';
                    document.getElementById('edit-supermanager-fields').style.display = 'none';
                    document.getElementById('edit-technician-fields').style.display = 'none';
                    document.getElementById('edit-counter-fields').style.display = 'none';

                    // 4. Show only the correct field block based on the staff's role
                    if (role === 'Manager') {
                        document.getElementById('edit-manager-fields').style.display = 'block';
                    } else if (role === 'SuperManager' || role === 'SUPER_MANAGER') {
                        document.getElementById('edit-supermanager-fields').style.display = 'block';
                    } else if (role === 'Technician') {
                        document.getElementById('edit-technician-fields').style.display = 'block';
                    } else if (role === 'CounterStaff') {
                        document.getElementById('edit-counter-fields').style.display = 'block';
                    }
                });
            });
        });
    </script>
</html>