package controller;

import auth.AuthRoles;
import auth.AuthSupport;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CounterStaff;
import model.Technician; 
import model.Customer;
import model.Manager;
import model.SystemUser;
import model.SystemUserFacade;
import model.SuperManager;
import utility.IcNumberValidator;
import utility.PhoneNumberValidator;

@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {

    @EJB
    private SystemUserFacade systemUserFacade; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        SystemUser currentUser = AuthSupport.getCurrentUser(request);
        
        // Security Check
        if (currentUser == null) {
            AuthSupport.redirectToLogin(request, response, AuthSupport.SESSION_EXPIRED_MESSAGE);
            return;
        }

        try {
            // 1. Grab general data from the HTML form
            Long userId = Long.parseLong(request.getParameter("userId"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phoneNumber = PhoneNumberValidator.normalizeMalaysianPhoneNumber(request.getParameter("phoneNumber")); 
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String icNumber = IcNumberValidator.normalizeMalaysianIc(request.getParameter("icNumber"));
            String redirectTarget = AuthSupport.getDashboardRedirectForRole(AuthRoles.fromUser(currentUser));

            if (!PhoneNumberValidator.isValidMalaysianPhoneNumber(phoneNumber)) {
                session.setAttribute("popupMessage", "Update failed. Please enter a valid Malaysian phone number starting with 01.");
                session.setAttribute("popupType", "error");
                response.sendRedirect(redirectTarget);
                return;
            }

            if (!IcNumberValidator.isValidMalaysianIc(icNumber)) {
                session.setAttribute("popupMessage", "Update failed. Please enter a valid Malaysian IC number in the format YYMMDD-XX-XXXX.");
                session.setAttribute("popupType", "error");
                response.sendRedirect(redirectTarget);
                return;
            }

            // 2. Find the fresh user object in the database
            SystemUser userToUpdate = systemUserFacade.find(userId);
            
            if (userToUpdate != null) {
                // 3. Update the standard fields that everyone shares
                userToUpdate.setFullName(fullName);
                userToUpdate.setIcNumber(icNumber);
                userToUpdate.setPhoneNumber(phoneNumber);
                userToUpdate.setAddress(address); 
                
                // Null-check safety measure for the email
                if (email != null && !email.trim().isEmpty()) {
                    userToUpdate.setEmail(email);
                }

                // 4. ROLE-SPECIFIC UPDATES
                if (userToUpdate instanceof SuperManager) {
                    SuperManager superMgr = (SuperManager) userToUpdate;
                    // If you add an input for masterClearance in your JSP later, it will save here
                    if (request.getParameter("masterClearance") != null && !request.getParameter("masterClearance").trim().isEmpty()) {
                        superMgr.setMasterClearance(request.getParameter("masterClearance"));
                    }
                }
                else if (userToUpdate instanceof Manager) {
                    Manager mgr = (Manager) userToUpdate;
                    if (request.getParameter("officeLocation") != null) {
                        mgr.setOfficeLocation(request.getParameter("officeLocation"));
                    }
                } else if (userToUpdate instanceof CounterStaff) {
                    CounterStaff staff = (CounterStaff) userToUpdate;
                    if (request.getParameter("shiftType") != null) {
                        staff.setShiftType(request.getParameter("shiftType")); 
                    }
                } 
                else if (userToUpdate instanceof Technician) {
                    Technician tech = (Technician) userToUpdate;
                    if (request.getParameter("specialization") != null) {
                        tech.setSpecialization(request.getParameter("specialization"));
                    }
                    if (request.getParameter("isAvailable") != null) {
                        boolean available = Boolean.parseBoolean(request.getParameter("isAvailable"));
                        tech.setIsAvailable(available);
                    }
                }

                // 5. Only update the password if they typed something new
                if (password != null && !password.trim().isEmpty()) {
                    userToUpdate.setPasswordHash(password); 
                }

                // 6. Save to Database
                systemUserFacade.edit(userToUpdate);

                session.setAttribute("popupMessage", "Your profile has been successfully updated!");
                session.setAttribute("popupType", "success");
            } else {
                session.setAttribute("popupMessage", "Update Error: User record not found.");
                session.setAttribute("popupType", "error");
            }
            
            // 8. Redirect back to the exact dashboard they came from
            response.sendRedirect(redirectTarget);

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("popupMessage", "An error occurred while updating your profile. The email, phone number, or IC number may already be in use.");
            session.setAttribute("popupType", "error");
            
            response.sendRedirect(AuthSupport.getDashboardRedirectForRole(AuthRoles.fromUser(currentUser)));
        }
    }
}
