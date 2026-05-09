<%-- 
    Document   : register_staff
    Created on : 19 Apr 2026, 4:26:36 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register New Staff | APU Automotive</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="shortcut icon" href="static/img/favicon.png">
        <link rel="stylesheet" href="static/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/all.min.css">
        <link rel="stylesheet" href="static/css/animate.css">
        <link rel="stylesheet" href="static/css/magnific-popup.css">
        <link rel="stylesheet" href="static/css/meanmenu.css">
        <link rel="stylesheet" href="static/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="static/css/nice-select.css">
        <link rel="stylesheet" href="static/css/main.css">

        <style>
            .nav-pills .nav-link.active { background-color: #0d6efd; color: white; border-radius: 8px; }
            .nav-pills .nav-link { color: #6c757d; border: 1px solid #dee2e6; margin-right: 8px; transition: 0.3s; }
            .nav-pills .nav-link:hover { background-color: #f8f9fa; }
            .chart-container { position: relative; height: 300px; width: 100%; }
            @media print { .main-sidebar, .back-to-top, .dashboardNavbar, .card-header, .btn-print-hide, .nav-pills { display: none !important; } }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body class="bg-light">
        
        <div class="container mt-5 mb-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    
                    <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
                        
                        <div class="card-header bg-primary text-white p-4">
                            <h4 class="mb-0"><i class="fa-solid fa-user-plus me-2"></i> Register New Staff</h4>
                            <p class="mb-0 small text-white-50 mt-1">Fill in the details below to provision a new employee account.</p>
                        </div>

                        <div class="card-body p-5">
                            <form action="RegisterStaffServlet" method="POST">
                                
                                <div class="mb-4 pb-4 border-bottom">
                                    <label class="form-label fw-bold small text-primary text-uppercase">1. Assign System Role</label>
                                    <select name="role" id="create-staff-role" class="form-select form-select-lg border-primary" required onchange="toggleRoleFields()">
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
                                        <label class="form-label fw-bold small text-muted">IC Number</label>
                                        <input type="text" name="icNumber" class="form-control" placeholder="YYMMDD-XX-XXXX" pattern="[0-9]{6}-[0-9]{2}-[0-9]{4}" maxlength="14" inputmode="numeric" title="Enter a valid Malaysian IC number in the format YYMMDD-XX-XXXX." oninput="this.value = formatMalaysianIc(this.value)" required>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold small text-muted">Phone Number</label>
                                        <input type="text" name="phoneNumber" class="form-control" placeholder="e.g., 0123456789" pattern="01[0-9]{8,9}" maxlength="11" inputmode="numeric" title="Enter a valid Malaysian phone number starting with 01." oninput="this.value = formatMalaysianPhone(this.value)" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-bold small text-muted">Temporary Password</label>
                                        <input type="password" name="password" class="form-control" placeholder="Initial password" required>
                                    </div>
                                </div>

                                <div class="mb-4 pb-4 border-bottom">
                                    <label class="form-label fw-bold small text-muted">Home Address</label>
                                    <textarea name="address" class="form-control" rows="3" placeholder="Full residential address..."></textarea>
                                </div>

                                <div id="dynamic-role-section" style="display: none;" class="mb-4">
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

                                <div class="d-flex justify-content-end gap-3 mt-5 pt-3 border-top">
                                    <a href="ManagerDashboardServlet#manage-staff" class="btn btn-light px-4 border">Cancel</a>
                                    <button type="submit" class="btn btn-primary px-5 fw-bold">Create Account</button>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function toggleRoleFields() {
                const role = document.getElementById('create-staff-role').value; 
                const dynamicSection = document.getElementById('dynamic-role-section');
                const managerFields = document.getElementById('manager-fields');
                const techFields = document.getElementById('technician-fields');
                const counterFields = document.getElementById('counter-fields'); 

                //hide all by default
                managerFields.style.display = 'none';
                techFields.style.display = 'none';
                counterFields.style.display = 'none'; 

                if (role === 'Manager') {
                    dynamicSection.style.display = 'block';
                    managerFields.style.display = 'block';
                } else if (role === 'Technician') {
                    dynamicSection.style.display = 'block';
                    techFields.style.display = 'block';
                } else if (role === 'CounterStaff') { 
                    dynamicSection.style.display = 'block';
                    counterFields.style.display = 'block';
                } else {
                    dynamicSection.style.display = 'none';
                }
            }

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
    </body>
</html>
