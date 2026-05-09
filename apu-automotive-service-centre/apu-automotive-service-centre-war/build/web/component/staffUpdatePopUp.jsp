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
            <div class="modal-content border-0 shadow"> 
                <div class="modal-header bg-primary text-white py-4"> <h6 class="modal-title mb-0"><i class="fa-solid fa-user-pen me-2"></i> Edit Staff Profile</h6>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <form action="UpdateStaffServlet" method="POST">
                    <div class="modal-body p-3"> <input type="hidden" name="staffId" id="edit-staff-id">

                        <div class="row g-2 mb-2 pb-2 border-bottom">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted mb-1">System Role (Locked)</label>
                                <input type="text" id="edit-staff-role-display" class="form-control form-control-sm bg-light text-muted" readonly>
                                <input type="hidden" id="edit-staff-role" name="role">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted mb-1">Account Status</label>
                                <select name="isActive" id="edit-staff-active" class="form-select form-select-sm border-primary" required>
                                    <option value="true">Active (Access Granted)</option>
                                    <option value="false">Deactivated (Access Denied)</option>
                                </select>
                            </div>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted mb-1">Full Name</label>
                                <input type="text" name="fullName" id="edit-staff-name" class="form-control form-control-sm" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted mb-1">Username</label>
                                <input type="text" name="username" id="edit-staff-username" class="form-control form-control-sm" required>
                            </div>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted mb-1">Email Address</label>
                                <input type="email" name="email" id="edit-staff-email" class="form-control form-control-sm" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted mb-1">Phone Number</label>
                                <input type="text" name="phoneNumber" id="edit-staff-phone" class="form-control form-control-sm" placeholder="0123456789" pattern="01[0-9]{8,9}" maxlength="11" inputmode="numeric" title="Enter a valid Malaysian phone number starting with 01." oninput="this.value = formatMalaysianPhone(this.value)" required>
                            </div>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted mb-1">IC Number</label>
                                <input type="text" name="icNumber" id="edit-staff-ic" class="form-control form-control-sm" placeholder="YYMMDD-XX-XXXX" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" maxlength="14" inputmode="numeric" title="Enter a valid Malaysian IC number in the format YYMMDD-XX-XXXX." oninput="this.value = formatMalaysianIc(this.value)" required>
                            </div>
                            
                            <div class="col-md-6">
                                <div id="edit-manager-fields" style="display: none;">
                                    <label class="form-label fw-bold small text-muted mb-1">Office Location</label>
                                    <input type="text" name="officeLocation" id="edit-staff-office" class="form-control form-control-sm">
                                </div>
                                <div id="edit-supermanager-fields" style="display: none;">
                                    <label class="form-label fw-bold small text-danger mb-1">Master Clearance Level</label>
                                    <input type="text" name="masterClearance" id="edit-staff-clearance" class="form-control form-control-sm border-danger" placeholder="e.g., Level 1">
                                </div>
                                <div id="edit-technician-fields" style="display: none;">
                                    <label class="form-label fw-bold small text-muted mb-1">Technical Specialization</label>
                                    <input type="text" name="specialization" id="edit-staff-spec" class="form-control form-control-sm">
                                </div>
                                <div id="edit-counter-fields" style="display: none;">
                                    <label class="form-label fw-bold small text-muted mb-1">Shift Type</label>
                                    <select name="shiftType" id="edit-staff-shift" class="form-select form-select-sm">
                                        <option value="Morning (8AM - 4PM)">Morning (8AM - 4PM)</option>
                                        <option value="Evening (3PM - 11PM)">Evening (3PM - 11PM)</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="mb-1">
                            <label class="form-label fw-bold small text-muted mb-1">Home Address</label>
                            <input type="text" name="address" id="edit-staff-address" class="form-control form-control-sm">
                        </div>

                    </div>
                    <div class="modal-footer py-2 border-0">
                        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-sm btn-primary px-4 fw-bold">Update Staff Record</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            //find all the "Edit" buttons in the data table
            const editButtons = document.querySelectorAll('.edit-staff-btn');

            editButtons.forEach(button => {
                button.addEventListener('click', function() {
                    
                    //read data attributes from the clicked button
                    const id = this.getAttribute('data-id');
                    const role = this.getAttribute('data-role');
                    const name = this.getAttribute('data-name');
                    const email = this.getAttribute('data-email');
                    const username = this.getAttribute('data-username');
                    const ic = this.getAttribute('data-ic');
                    const phone = this.getAttribute('data-phone');
                    const address = this.getAttribute('data-address');
                    const isActive = this.getAttribute('data-active');

                    // fill the text box
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

                    document.getElementById('edit-manager-fields').style.display = 'none';
                    document.getElementById('edit-supermanager-fields').style.display = 'none';
                    document.getElementById('edit-technician-fields').style.display = 'none';
                    document.getElementById('edit-counter-fields').style.display = 'none';

                    // show correct field block based on role
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

        function formatMalaysianIc(value) {
            const digits = value.replace(/\D/g, '').slice(0, 12);

            if (digits.length <= 6) {
                return digits;
            }

            if (digits.length <= 8) {
                return digits.slice(0, 6) + '-' + digits.slice(6);
            }

            return digits.slice(0, 6) + '-' + digits.slice(6, 8) + '-' + digits.slice(8);
        }

        function formatMalaysianPhone(value) {
            return value.replace(/\D/g, '').slice(0, 11);
        }
    </script>
</html>
