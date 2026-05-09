/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import utility.IcNumberValidator;
import utility.PhoneNumberValidator;
/**
 *
 * @author TPY
 */
@WebServlet(name = "UpdateStaffServlet", urlPatterns = {"/UpdateStaffServlet"})
public class UpdateStaffServlet extends HttpServlet {

    @EJB
    private SystemUserFacade SystemUserFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser) session.getAttribute("currentUser");
        
        if (currentUser == null || (!(currentUser instanceof Manager) && !(currentUser instanceof SuperManager))) {
            session.setAttribute("popupMessage", "Security Alert: Only authorized management can update staff.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 2. Grab general form data
            Long staffId = Long.parseLong(request.getParameter("staffId"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String icNumber = IcNumberValidator.normalizeMalaysianIc(request.getParameter("icNumber"));
            String phoneNumber = PhoneNumberValidator.normalizeMalaysianPhoneNumber(request.getParameter("phoneNumber"));
            String address = request.getParameter("address");
            boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

            if (!PhoneNumberValidator.isValidMalaysianPhoneNumber(phoneNumber)) {
                session.setAttribute("popupMessage", "Staff update failed. Please enter a valid Malaysian phone number starting with 01.");
                session.setAttribute("popupType", "error");
                response.sendRedirect("ManagerDashboardServlet#manage-staff");
                return;
            }

            if (!IcNumberValidator.isValidMalaysianIc(icNumber)) {
                session.setAttribute("popupMessage", "Staff update failed. Please enter a valid Malaysian IC number in the format YYMMDD-XX-XXXX.");
                session.setAttribute("popupType", "error");
                response.sendRedirect("ManagerDashboardServlet#manage-staff");
                return;
            }

            SystemUser staffToUpdate = SystemUserFacade.find(staffId);

            if (staffToUpdate != null) {
                
                // ---------------------------------------------------------
                // 3. CRITICAL SECURITY CHECK (Privilege Escalation Prevention)
                // If the target is a SuperManager, but the user clicking "Save" is NOT a SuperManager... KICK THEM OUT!
                // ---------------------------------------------------------
                if (staffToUpdate instanceof SuperManager && !(currentUser instanceof SuperManager)) {
                    session.setAttribute("popupMessage", "CRITICAL SECURITY ALERT: You do not have clearance to modify a Super Manager account.");
                    session.setAttribute("popupType", "error");
                    response.sendRedirect("ManagerDashboardServlet#manage-staff");
                    return; // STOP EXECUTION IMMEDIATELY!
                }

                // 4. Update General Fields
                staffToUpdate.setFullName(fullName);
                staffToUpdate.setEmail(email);
                staffToUpdate.setUsername(username);
                staffToUpdate.setIcNumber(icNumber);
                staffToUpdate.setPhoneNumber(phoneNumber);
                staffToUpdate.setAddress(address);
                staffToUpdate.setIsActive(isActive);

                // 5. Update Role-Specific Fields Safely
                if (staffToUpdate instanceof SuperManager) { // ADDED SUPER MANAGER LOGIC
                    String clearance = request.getParameter("masterClearance");
                    if (clearance != null && !clearance.trim().isEmpty()) {
                        ((SuperManager) staffToUpdate).setMasterClearance(clearance);
                    }
                } else if (staffToUpdate instanceof Manager) {
                    ((Manager) staffToUpdate).setOfficeLocation(request.getParameter("officeLocation"));
                } else if (staffToUpdate instanceof Technician) {
                    ((Technician) staffToUpdate).setSpecialization(request.getParameter("specialization"));
                } else if (staffToUpdate instanceof CounterStaff) {
                    ((CounterStaff) staffToUpdate).setShiftType(request.getParameter("shiftType"));
                }

                // 6. Save to Database
                SystemUserFacade.edit(staffToUpdate);

                // Check if they just updated themselves, and refresh their session if they did!
                if (currentUser.getUserId().equals(staffToUpdate.getUserId())) {
                    session.setAttribute("currentUser", staffToUpdate);
                }

                session.setAttribute("popupMessage", "Staff record updated successfully!");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Update Error: Staff member not found.");
                session.setAttribute("popupType", "error");
            }
            
            response.sendRedirect("ManagerDashboardServlet#manage-staff");
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while trying to update the profile. The email, username, phone number, or IC number may already be in use.");
            session.setAttribute("popupType", "error");
            response.sendRedirect("ManagerDashboardServlet#manage-staff");
        }
    }
}
